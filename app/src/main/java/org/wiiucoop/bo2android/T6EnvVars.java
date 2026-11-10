package org.wiiucoop.bo2android;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/* loaded from: classes3.dex */
public final class T6EnvVars {
    public static final String APPLIED_FILE_NAME = "env_vars_applied.txt";
    public static final String FILE_NAME = "env_vars.cfg";
    public static final int MAX_NAME = 64;
    public static final int MAX_VALUE = 1024;
    public static final int MAX_VARS = 64;

    public enum Problem {
        OK,
        EMPTY_NAME,
        NAME_TOO_LONG,
        NAME_SYNTAX,
        LINKER,
        ANDROID_RUNTIME,
        DXVK_WSI,
        VALUE_TOO_LONG,
        VALUE_LINE_BREAK,
        DUPLICATE
    }

    public static final class Var {
        public boolean enabled;
        public String name;
        public String value;

        public Var(String name, String value, boolean enabled) {
            this.name = name;
            this.value = value;
            this.enabled = enabled;
        }

        public Var copy() {
            return new Var(this.name, this.value, this.enabled);
        }
    }

    private T6EnvVars() {
    }

    public static Problem nameProblem(String name) {
        if (name == null || name.isEmpty()) {
            return Problem.EMPTY_NAME;
        }
        if (name.length() > 64) {
            return Problem.NAME_TOO_LONG;
        }
        int i = 0;
        while (i < name.length()) {
            char c = name.charAt(i);
            boolean ok = (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || c == '_' || (i > 0 && c >= '0' && c <= '9');
            if (!ok) {
                return Problem.NAME_SYNTAX;
            }
            i++;
        }
        if (name.startsWith("LD_")) {
            return Problem.LINKER;
        }
        if (name.startsWith("ANDROID_") || name.equals("PATH") || name.contains("CLASSPATH") || name.equals("EXTERNAL_STORAGE")) {
            return Problem.ANDROID_RUNTIME;
        }
        return name.equals("DXVK_WSI_DRIVER") ? Problem.DXVK_WSI : Problem.OK;
    }

    public static Problem valueProblem(String value) {
        if (value == null) {
            return Problem.OK;
        }
        if (value.getBytes(StandardCharsets.UTF_8).length > 1024) {
            return Problem.VALUE_TOO_LONG;
        }
        if (value.indexOf(10) >= 0 || value.indexOf(13) >= 0 || value.indexOf(0) >= 0) {
            return Problem.VALUE_LINE_BREAK;
        }
        return Problem.OK;
    }

    public static Problem listProblem(List<Var> vars, int[] at) {
        for (int i = 0; i < vars.size(); i++) {
            Var v = vars.get(i);
            Problem p = nameProblem(v.name);
            if (p == Problem.OK) {
                p = valueProblem(v.value);
            }
            if (p == Problem.OK) {
                for (int j = 0; j < i; j++) {
                    if (vars.get(j).name.equals(v.name)) {
                        p = Problem.DUPLICATE;
                    }
                }
            }
            if (p != Problem.OK) {
                if (at != null && at.length > 0) {
                    at[0] = i;
                }
                return p;
            }
        }
        return Problem.OK;
    }

    public static List<Var> parse(String text) {
        List<Var> out = new ArrayList<>();
        if (text == null) {
            return out;
        }
        String[] strArrSplit = text.split(T6PlayerName.TRAILING_NEWLINE, -1);
        int length = strArrSplit.length;
        for (int i = 0; i < length; i++) {
            String line = strArrSplit[i];
            if (line.endsWith("\r")) {
                line = line.substring(0, line.length() - 1);
            }
            if (!line.isEmpty() && line.charAt(0) != '#') {
                char sw = line.charAt(0);
                int eq = line.indexOf(61);
                if ((sw == '+' || sw == '-') && eq >= 1) {
                    out.add(new Var(line.substring(1, eq), line.substring(eq + 1), sw == '+'));
                }
            }
        }
        return out;
    }

    public static String serialize(List<Var> vars) {
        StringBuilder sb = new StringBuilder("# Settings > Environment variables. +NAME=value is applied at the next game start, -NAME=value is not.\n");
        for (Var v : vars) {
            sb.append(v.enabled ? '+' : '-').append(v.name).append('=').append(v.value == null ? "" : v.value).append('\n');
        }
        return sb.toString();
    }

    public static List<Var> load(File filesDir) {
        File f = new File(filesDir, FILE_NAME);
        if (!f.exists()) {
            return new ArrayList();
        }
        try {
            return parse(new String(Files.readAllBytes(f.toPath()), StandardCharsets.UTF_8));
        } catch (IOException e) {
            return new ArrayList();
        }
    }

    public static void save(File filesDir, List<Var> vars) throws IOException {
        File f = new File(filesDir, FILE_NAME);
        File tmp = new File(filesDir, "env_vars.cfg.tmp");
        FileOutputStream out = new FileOutputStream(tmp);
        try {
            out.write(serialize(vars).getBytes(StandardCharsets.UTF_8));
            out.getFD().sync();
            out.close();
            if (!tmp.renameTo(f)) {
                tmp.delete();
                throw new IOException("could not replace " + f);
            }
        } catch (Throwable th) {
            try {
                out.close();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
            throw th;
        }
    }

    public static Map<String, String> effective(List<Var> vars) {
        Map<String, String> out = new LinkedHashMap<>();
        for (Var v : vars) {
            if (v.enabled && nameProblem(v.name) == Problem.OK && valueProblem(v.value) == Problem.OK && !out.containsKey(v.name)) {
                out.put(v.name, v.value == null ? "" : v.value);
            }
        }
        return out;
    }

    public static Map<String, String> applied(File filesDir) {
        File f = new File(filesDir, APPLIED_FILE_NAME);
        if (!f.exists()) {
            return null;
        }
        try {
            Map<String, String> out = new LinkedHashMap<>();
            for (Var v : parse(new String(Files.readAllBytes(f.toPath()), StandardCharsets.UTF_8))) {
                out.put(v.name, v.value);
            }
            return out;
        } catch (IOException e) {
            return null;
        }
    }

    public static boolean pendingRestart(boolean gameRunning, Map<String, String> applied, List<Var> saved) {
        if (!gameRunning) {
            return false;
        }
        Map<String, String> next = effective(saved);
        if (applied == null) {
            if (next.isEmpty()) {
                return false;
            }
        } else if (applied.equals(next)) {
            return false;
        }
        return true;
    }
}
