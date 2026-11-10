package org.wiiucoop.bo2android;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Deque;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.wiiucoop.bo2android.T6Logs;

/* loaded from: classes3.dex */
public final class T6Logs {
    public static final int AUDIO_NET = 3;
    public static final int CATEGORY_COUNT = 4;
    public static final int ENGINE = 0;
    public static final int GRAPHICS = 1;
    public static final int HOST = 2;
    public static final int MAX_PER_CATEGORY = 4000;
    public static final String[] CATEGORY_IDS = {"engine", "graphics", "host", "audio-net"};
    private static final Pattern THREADTIME = Pattern.compile("^(\\d\\d-\\d\\d \\d\\d:\\d\\d:\\d\\d\\.\\d{3})\\s+\\d+\\s+\\d+\\s+([VDIWEF])\\s+(.*?)\\s*: (.*)$");
    private static final Pattern SECRET = Pattern.compile("(?i)\\b(token|password|passwd|secret|auth|authorization|cookie|session[_-]?key|api[_-]?key)(\\s*[=:]\\s*)(\\S+)");

    private T6Logs() {
    }

    public static final class Line {
        public final int category;
        public final char level;
        public final String message;
        public int repeats = 1;
        public final String tag;
        public final String time;

        Line(String time, char level, String tag, String message, int category) {
            this.time = time;
            this.level = level;
            this.tag = tag;
            this.message = message;
            this.category = category;
        }

        public String format() {
            String text = this.time + " [" + T6Logs.CATEGORY_IDS[this.category] + "/" + this.tag + "] " + this.level + ": " + this.message;
            return this.repeats > 1 ? text + " (x" + this.repeats + ")" : text;
        }
    }

    public static Line parse(String raw) {
        if (raw == null) {
            return null;
        }
        Matcher m = THREADTIME.matcher(raw);
        if (!m.matches()) {
            return null;
        }
        String tag = m.group(3).trim();
        String message = redact(m.group(4));
        return new Line(m.group(1), m.group(2).charAt(0), tag, message, categorize(tag, message));
    }

    private static boolean startsWithAny(String text, String... prefixes) {
        for (String p : prefixes) {
            if (text.startsWith(p)) {
                return true;
            }
        }
        return false;
    }

    public static int categorize(String tag, String message) {
        String t = tag.toLowerCase(Locale.ROOT);
        String m = message.toLowerCase(Locale.ROOT);
        if (t.equals("t6android")) {
            if (startsWithAny(m, "guest", "engine", "t6-milestone", "[messagebox]", "[keys]")) {
                return 0;
            }
            if (startsWithAny(m, "d3d", "dxvk", "vulkan", "vkshim", "vkdriver", "display:", "info:", "warn:", "err:")) {
                return 1;
            }
            return startsWithAny(m, "audio", "net", "sock", "[nx-host] net", "[nx-host] sock") ? 3 : 2;
        }
        if (startsWithAny(t, "adreno", "vulkan", "mesa", "turnip", "qdgralloc", "gralloc", "ahardwarebuffer", "graphicbuffer", "adrenotools", "dxvk")) {
            return 1;
        }
        if (t.equals("libc") && m.contains("mesa")) {
            return 1;
        }
        return startsWithAny(t, "audio", "aaudio", "sdlaudio", "oboe", "media") ? 3 : 2;
    }

    public static String redact(String message) {
        return SECRET.matcher(message).replaceAll("$1$2***");
    }

    public static boolean levelAtLeast(char level, char minimum) {
        return rank(level) >= rank(minimum);
    }

    private static int rank(char level) {
        return "VDIWEF".indexOf(level);
    }

    public static final class Buffer {
        private final List<Deque<Line>> lines = new ArrayList();
        private String cutoff = "";

        public Buffer() {
            for (int i = 0; i < 4; i++) {
                this.lines.add(new ArrayDeque());
            }
        }

        public void load(List<String> rawLines) {
            for (Deque<Line> d : this.lines) {
                d.clear();
            }
            for (String raw : rawLines) {
                add(T6Logs.parse(raw));
            }
        }

        public void add(Line line) {
            if (line == null) {
                return;
            }
            if (this.cutoff.isEmpty() || line.time.compareTo(this.cutoff) > 0) {
                Deque<Line> d = this.lines.get(line.category);
                Line last = d.peekLast();
                if (last != null && last.level == line.level && last.tag.equals(line.tag) && last.message.equals(line.message)) {
                    last.repeats++;
                    return;
                }
                d.addLast(line);
                while (d.size() > 4000) {
                    d.removeFirst();
                }
            }
        }

        public void clear() {
            String newest = this.cutoff;
            for (Deque<Line> d : this.lines) {
                Line last = d.peekLast();
                if (last != null && last.time.compareTo(newest) > 0) {
                    newest = last.time;
                }
                d.clear();
            }
            this.cutoff = newest;
        }

        public int size(int category) {
            return this.lines.get(category).size();
        }

        public List<Line> filter(int category, char minimumLevel, String search) {
            String needle = search == null ? "" : search.trim().toLowerCase(Locale.ROOT);
            List<Line> out = new ArrayList<>();
            for (int c = 0; c < 4; c++) {
                if (category < 0 || c == category) {
                    for (Line l : this.lines.get(c)) {
                        if (T6Logs.levelAtLeast(l.level, minimumLevel) && (needle.isEmpty() || l.message.toLowerCase(Locale.ROOT).contains(needle) || l.tag.toLowerCase(Locale.ROOT).contains(needle))) {
                            out.add(l);
                        }
                    }
                }
            }
            if (category < 0) {
                out.sort(new Comparator() { // from class: org.wiiucoop.bo2android.T6Logs$Buffer$$ExternalSyntheticLambda0
                    @Override // java.util.Comparator
                    public final int compare(Object obj, Object obj2) {
                        return ((T6Logs.Line) obj).time.compareTo(((T6Logs.Line) obj2).time);
                    }
                });
            }
            return out;
        }

        public String export(int category, String header) {
            StringBuilder sb = new StringBuilder();
            sb.append(header).append('\n');
            for (Line l : filter(category, 'V', "")) {
                sb.append(l.format()).append('\n');
            }
            return sb.toString();
        }
    }
}
