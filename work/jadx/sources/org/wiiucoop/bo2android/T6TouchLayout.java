package org.wiiucoop.bo2android;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

/* loaded from: classes3.dex */
public final class T6TouchLayout {
    public static final int A = 4096;
    public static final long ADS_FIRE_AIM_HOLD_MS = 300;
    public static final long ADS_FIRE_DELAY_MS = 120;
    public static final long ADS_FIRE_MIN_PRESS_MS = 100;
    public static final long ADS_FIRE_RELEASE_GAP_MS = 70;
    public static final int AIM = 1;
    public static final int B = 8192;
    public static final int BACK = 32;
    public static final int CONSOLE = 262144;
    public static final float DEFAULT_DEADZONE = 0.12f;
    public static final int DPAD_DOWN = 2;
    public static final int DPAD_LEFT = 4;
    public static final int DPAD_RIGHT = 8;
    public static final int DPAD_UP = 1;
    public static final int FIRE = 2;
    public static final int LEFT_SHOULDER = 256;
    public static final int LEFT_THUMB = 64;
    public static final int LEFT_TRIGGER = 65536;
    public static final float MAX_DEADZONE = 0.6f;
    public static final float MAX_SENSITIVITY = 3.0f;
    public static final float MAX_SIZE = 0.9f;
    public static final float MIN_SENSITIVITY = 0.2f;
    public static final float MIN_SIZE = 0.06f;
    public static final int PLACE_ITEM = 1048576;
    public static final String PROFILE_CODM = "codm";
    public static final String PROFILE_X360 = "x360";
    public static final int PRONE = 2097152;
    public static final int RIGHT_SHOULDER = 512;
    public static final int RIGHT_THUMB = 128;
    public static final int RIGHT_TRIGGER = 131072;
    public static final int SCOREBOARD = 524288;
    public static final int START = 16;
    public static final int X = 16384;
    public static final int Y = 32768;
    public final List<Control> controls;
    public final String profile;

    public enum Kind {
        BUTTON,
        STICK_LEFT
    }

    public static final class Control {
        public final int binding;
        public final String id;
        public final Kind kind;
        public final String label;
        public float size;
        public final String sprite;
        public float x;
        public float y;
        public float opacity = 0.75f;
        public boolean enabled = true;
        public float sensitivity = 1.0f;
        public float deadzone = 0.12f;

        Control(String id, Kind kind, String sprite, String label, int binding, float x, float y, float size) {
            this.id = id;
            this.kind = kind;
            this.sprite = sprite;
            this.label = label;
            this.binding = binding;
            this.x = x;
            this.y = y;
            this.size = size;
        }

        Control copy() {
            Control c = new Control(this.id, this.kind, this.sprite, this.label, this.binding, this.x, this.y, this.size);
            c.opacity = this.opacity;
            c.enabled = this.enabled;
            c.sensitivity = this.sensitivity;
            c.deadzone = this.deadzone;
            return c;
        }
    }

    private T6TouchLayout(String profile, List<Control> controls) {
        this.profile = profile;
        this.controls = controls;
    }

    public T6TouchLayout copy() {
        List<Control> list = new ArrayList<>();
        for (Control c : this.controls) {
            list.add(c.copy());
        }
        return new T6TouchLayout(this.profile, list);
    }

    public static boolean aimsWhileHeld(Control c) {
        return c != null && c.kind == Kind.BUTTON && c.binding == 131072 && ("shoot".equals(c.id) || "hipfire".equals(c.id));
    }

    public Control find(String id) {
        for (Control c : this.controls) {
            if (c.id.equals(id)) {
                return c;
            }
        }
        return null;
    }

    private static Control b(String id, String sprite, String label, int binding, float x, float y, float size) {
        return new Control(id, Kind.BUTTON, sprite, label, binding, x, y, size);
    }

    public static T6TouchLayout defaults(String profile) {
        List<Control> l = new ArrayList<>();
        if (PROFILE_X360.equals(profile)) {
            l.add(new Control("stick_left", Kind.STICK_LEFT, "analog", "LS", 0, 0.14f, 0.7f, 0.36f));
            l.add(b("a", "", "A", 4096, 0.88f, 0.7f, 0.14f));
            l.add(b("b", "", "B", 8192, 0.95f, 0.56f, 0.14f));
            l.add(b("x", "", "X", X, 0.81f, 0.56f, 0.14f));
            l.add(b("y", "", "Y", 32768, 0.88f, 0.42f, 0.14f));
            l.add(b("lt", "", "LT", 65536, 0.18f, 0.1f, 0.13f));
            l.add(b("lb", "", "LB", LEFT_SHOULDER, 0.18f, 0.28f, 0.13f));
            l.add(b("rt", "", "RT", RIGHT_TRIGGER, 0.94f, 0.12f, 0.13f));
            l.add(b("rb", "", "RB", 512, 0.94f, 0.28f, 0.13f));
            l.add(b("ls_click", "", "L3", 64, 0.27f, 0.88f, 0.11f));
            l.add(b("rs_click", "", "R3", RIGHT_THUMB, 0.53f, 0.9f, 0.11f));
            l.add(b("dpad_up", "", "↑", 1, 0.33f, 0.5f, 0.1f));
            l.add(b("dpad_down", "", "↓", 2, 0.33f, 0.7f, 0.1f));
            l.add(b("dpad_left", "", "←", 4, 0.28f, 0.6f, 0.1f));
            l.add(b("dpad_right", "", "→", 8, 0.38f, 0.6f, 0.1f));
            l.add(b("back", "", "BACK", SCOREBOARD, 0.42f, 0.08f, 0.1f));
            l.add(b("console", "OpenCMD", "CMD", CONSOLE, 0.5f, 0.08f, 0.1f));
            l.add(b("start", "settings", "START", 16, 0.58f, 0.08f, 0.1f));
            return new T6TouchLayout(PROFILE_X360, l);
        }
        l.add(new Control("move", Kind.STICK_LEFT, "analog", "", 0, 0.15f, 0.68f, 0.4f));
        l.add(b("shoot", "shoot", "", RIGHT_TRIGGER, 0.8f, 0.42f, 0.2f));
        l.add(b("hipfire", "hipfire", "", RIGHT_TRIGGER, 0.07f, 0.42f, 0.15f));
        l.add(b("ads", "ads", "", 65536, 0.94f, 0.4f, 0.15f));
        l.add(b("jump", "jump", "", 4096, 0.93f, 0.62f, 0.14f));
        l.add(b("crouch", "crouch", "", 8192, 0.86f, 0.8f, 0.14f));
        l.add(b("prone", "prone", "", PRONE, 0.95f, 0.85f, 0.14f));
        l.add(b("reload", "reload", "", X, 0.74f, 0.8f, 0.13f));
        l.add(b("interact", "Interact", "", X, 0.62f, 0.62f, 0.13f));
        l.add(b("change_weapon", "change_weapon", "", 32768, 0.62f, 0.88f, 0.13f));
        l.add(b("melee", "melee", "", RIGHT_THUMB, 0.8f, 0.22f, 0.13f));
        l.add(b("lethal", "letal", "", 512, 0.66f, 0.12f, 0.12f));
        l.add(b("tactical", "tatical", "", LEFT_SHOULDER, 0.54f, 0.12f, 0.12f));
        l.add(b("run", "run", "", 64, 0.15f, 0.3f, 0.14f));
        l.add(b("hold_breath", "hold_breathe", "", 64, 0.94f, 0.18f, 0.12f));
        l.add(b("special_item", "SpecialItem", "", PLACE_ITEM, 0.42f, 0.12f, 0.1f));
        l.add(b("console", "OpenCMD", "CMD", CONSOLE, 0.3f, 0.06f, 0.09f));
        l.add(b("pause", "settings", "", 16, 0.22f, 0.07f, 0.08f));
        return new T6TouchLayout(PROFILE_CODM, l);
    }

    public String serialize() {
        StringBuilder sb = new StringBuilder();
        sb.append("profile ").append(this.profile).append('\n');
        for (Control control : this.controls) {
            sb.append(String.format(Locale.ROOT, "%s %.4f %.4f %.4f %.3f %d %.3f %.3f\n", control.id, Float.valueOf(control.x), Float.valueOf(control.y), Float.valueOf(control.size), Float.valueOf(control.opacity), Integer.valueOf(control.enabled ? 1 : 0), Float.valueOf(control.sensitivity), Float.valueOf(control.deadzone)));
        }
        return sb.toString();
    }

    public static T6TouchLayout load(String profile, String saved) throws NumberFormatException {
        T6TouchLayout layout = defaults(profile);
        if (saved == null) {
            return layout;
        }
        String[] strArrSplit = saved.split(T6PlayerName.TRAILING_NEWLINE);
        int length = strArrSplit.length;
        char c = 0;
        int i = 0;
        while (i < length) {
            String line = strArrSplit[i];
            String[] f = line.trim().split("\\s+");
            if (f.length == 8) {
                Control c2 = layout.find((PROFILE_CODM.equals(profile) && "scoreboard".equals(f[c])) ? "console" : f[c]);
                if (c2 != null) {
                    try {
                        float x = Float.parseFloat(f[1]);
                        float y = Float.parseFloat(f[2]);
                        float size = Float.parseFloat(f[3]);
                        float opacity = Float.parseFloat(f[4]);
                        float sens = Float.parseFloat(f[6]);
                        float dead = Float.parseFloat(f[7]);
                        if (in(x, 0.0f, 1.0f) && in(y, 0.0f, 1.0f) && in(size, 0.06f, 0.9f) && in(opacity, 0.0f, 1.0f) && in(sens, 0.2f, 3.0f) && in(dead, 0.0f, 0.6f)) {
                            c2.x = x;
                            c2.y = y;
                            c2.size = size;
                            c2.opacity = opacity;
                            c2.enabled = T6EngineCommand.VALUE_ON.equals(f[5]);
                            c2.sensitivity = sens;
                            c2.deadzone = dead;
                        }
                    } catch (NumberFormatException e) {
                    }
                }
            }
            i++;
            c = 0;
        }
        return layout;
    }

    public static int[] fitSurface(int areaWidth, int areaHeight, int gameWidth, int gameHeight) {
        if (areaWidth <= 0 || areaHeight <= 0 || gameWidth <= 0 || gameHeight <= 0) {
            return new int[]{0, 0, Math.max(areaWidth, 0), Math.max(areaHeight, 0)};
        }
        int width = areaWidth;
        int height = Math.round((areaWidth * gameHeight) / gameWidth);
        if (height > areaHeight) {
            height = areaHeight;
            width = Math.round((areaHeight * gameWidth) / gameHeight);
        }
        return new int[]{(areaWidth - width) / 2, (areaHeight - height) / 2, width, height};
    }

    public static final class AdsFire {
        public static final int MAX_QUEUED = 5;
        private boolean held;
        private final ArrayList<long[]> pulses = new ArrayList<>();
        private long aimFrom = -1;
        private long aimUntil = -1;

        public void down(long now, boolean aimHeldElsewhere) {
            prune(now);
            boolean aiming = aimHeldElsewhere || (triggers(now) & 1) != 0;
            long at = aiming ? now : 120 + now;
            if (!this.pulses.isEmpty()) {
                long[] last = this.pulses.get(this.pulses.size() - 1);
                if (last[1] == Long.MAX_VALUE) {
                    last[1] = Math.max(now, last[0] + 100);
                }
                at = Math.max(at, last[1] + 70);
                int waiting = 0;
                Iterator<long[]> it = this.pulses.iterator();
                while (it.hasNext()) {
                    long[] p = it.next();
                    if (p[1] > now) {
                        waiting++;
                    }
                }
                if (waiting >= 5) {
                    this.held = true;
                    this.aimUntil = Long.MAX_VALUE;
                    return;
                }
            }
            if (this.aimFrom < 0 || (triggers(now) & 1) == 0) {
                this.aimFrom = now;
            }
            this.held = true;
            this.pulses.add(new long[]{at, Long.MAX_VALUE});
            this.aimUntil = Long.MAX_VALUE;
        }

        public void up(long now) {
            if (this.held) {
                this.held = false;
                long end = now;
                if (!this.pulses.isEmpty()) {
                    long[] last = this.pulses.get(this.pulses.size() - 1);
                    if (last[1] == Long.MAX_VALUE) {
                        last[1] = Math.max(now, last[0] + 100);
                    }
                    end = Math.max(end, last[1]);
                }
                this.aimUntil = 300 + end;
            }
        }

        public void cancel() {
            this.held = false;
            this.pulses.clear();
            this.aimUntil = -1L;
            this.aimFrom = -1L;
        }

        public boolean held() {
            return this.held;
        }

        public int triggers(long now) {
            if (this.aimFrom < 0 || now < this.aimFrom) {
                return 0;
            }
            int t = now < this.aimUntil ? 0 | 1 : 0;
            Iterator<long[]> it = this.pulses.iterator();
            while (it.hasNext()) {
                long[] p = it.next();
                if (now >= p[0] && now < p[1]) {
                    t |= 2;
                }
            }
            return t;
        }

        public long nextChange(long now) {
            long next = Long.MAX_VALUE;
            Iterator<long[]> it = this.pulses.iterator();
            while (it.hasNext()) {
                long[] p = it.next();
                if (p[0] > now && p[0] < next) {
                    next = p[0];
                }
                if (p[1] > now && p[1] < next) {
                    next = p[1];
                }
            }
            if (this.aimUntil > now && this.aimUntil < next) {
                next = this.aimUntil;
            }
            if (next == Long.MAX_VALUE) {
                return -1L;
            }
            return next;
        }

        private void prune(long now) {
            while (!this.pulses.isEmpty() && this.pulses.get(0)[1] <= now && this.pulses.size() > 1) {
                this.pulses.remove(0);
            }
        }
    }

    public float stickDeadzone() {
        for (Control c : this.controls) {
            if (c.kind == Kind.STICK_LEFT) {
                return clamp(c.deadzone, 0.0f, 0.6f);
            }
        }
        return 0.12f;
    }

    private static boolean in(float v, float lo, float hi) {
        return v >= lo && v <= hi && !Float.isNaN(v);
    }

    public static float clamp(float v, float lo, float hi) {
        return v < lo ? lo : v > hi ? hi : v;
    }

    public static int[] stickAxes(float dx, float dy, float deadzone, float sensitivity) {
        float len = (float) Math.sqrt((dx * dx) + (dy * dy));
        if (len <= deadzone || len == 0.0f) {
            return new int[]{0, 0};
        }
        float scaled = ((len - deadzone) / (1.0f - deadzone)) * sensitivity;
        if (scaled > 1.0f) {
            scaled = 1.0f;
        }
        float nx = (dx / len) * scaled;
        float ny = (dy / len) * scaled;
        return new int[]{Math.round(nx * 32767.0f), Math.round((-ny) * 32767.0f)};
    }
}
