package org.wiiucoop.bo2android;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.hardware.display.DisplayManager;
import android.os.Build;
import android.util.TypedValue;
import android.view.Display;
import android.view.InputDevice;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import java.io.File;
import java.util.Locale;

/* loaded from: classes3.dex */
public final class T6Ui {
    public static final int ASPECT_BASE_HEIGHT = 720;
    public static final String ASPECT_RESOLUTION = "aspect";
    public static final String DEFAULT_LANGUAGE = "en-US";
    public static final String DEFAULT_THEME = "orange";
    public static final String DISCORD_URL = "https://discord.gg/hGkAYecRg";
    public static final String KEY_LANGUAGE = "language";
    public static final String KEY_RESOLUTION = "resolution";
    public static final String KEY_SHOW_FPS = "show_fps";
    public static final String KEY_THEME = "theme";
    public static final String KEY_TOUCH_ADS_FIRE = "touch_ads_fire";
    public static final String KEY_TOUCH_AIM_DRAG = "touch_aim_drag";
    public static final String KEY_TOUCH_MODE = "touch_mode";
    public static final String KEY_TOUCH_PROFILE = "touch_profile";
    public static final String KEY_TOUCH_SPRINT_THRESHOLD = "touch_sprint_threshold";
    public static final String KEY_TOUCH_STICK_SPRINT = "touch_stick_sprint";
    public static final String KEY_TOUCH_SURFACE = "touch_surface";
    public static final String NATIVE_RESOLUTION = "native";
    public static final String OFFICIAL_APK_URL = "https://github.com/SoldadoGhost/T6Requiem-APK/releases";
    public static final String PREFS = "t6_ui";
    static final int PREFS_MODE = 4;
    public static final String THEME_BLUE = "blue";
    public static final String THEME_ORANGE = "orange";
    public static final String THEME_RED = "red";
    public static final String DEFAULT_RESOLUTION = "1280x720";
    public static final String[] RESOLUTIONS = {"960x540", DEFAULT_RESOLUTION, "1600x900", "1920x1080"};

    private T6Ui() {
    }

    public static boolean debugOverlayEnabled(Context context) {
        return new File(context.getFilesDir(), "debug_overlay").exists();
    }

    public static String theme(Context context) {
        return normalizeTheme(getString(context, KEY_THEME, null));
    }

    public static String normalizeTheme(String saved) {
        return (THEME_BLUE.equals(saved) || THEME_RED.equals(saved) || "orange".equals(saved)) ? saved : "orange";
    }

    public static void applyTheme(Activity activity) {
        int palette;
        String theme = theme(activity);
        if (THEME_BLUE.equals(theme)) {
            palette = R.style.T6PaletteBlue;
        } else {
            palette = THEME_RED.equals(theme) ? R.style.T6PaletteRed : R.style.T6PaletteOrange;
        }
        activity.getTheme().applyStyle(palette, true);
    }

    public static int themeColor(Context context, int attr) {
        TypedValue value = new TypedValue();
        context.getTheme().resolveAttribute(attr, value, true);
        return value.data;
    }

    public static String nativeResolution(Context context) {
        try {
            Display display = ((DisplayManager) context.getSystemService("display")).getDisplay(0);
            if (display == null) {
                return null;
            }
            Display.Mode mode = display.getMode();
            int w = Math.max(mode.getPhysicalWidth(), mode.getPhysicalHeight());
            int h = Math.min(mode.getPhysicalWidth(), mode.getPhysicalHeight());
            if (w <= 0 || h <= 0) {
                return null;
            }
            return w + "x" + h;
        } catch (RuntimeException e) {
            return null;
        }
    }

    public static int[] aspectResolution(Context context) throws NumberFormatException {
        int w;
        int[] d = parseSize(nativeResolution(context));
        if (d == null || d[0] * 9 <= d[1] * 16 || (w = Math.round(((d[0] * 720.0f) / d[1]) / 8.0f) * 8) <= 0 || w > d[0]) {
            return null;
        }
        return new int[]{w, ASPECT_BASE_HEIGHT};
    }

    public static String displayAspectLabel(Context context) throws NumberFormatException {
        int[] d = parseSize(nativeResolution(context));
        if (d == null) {
            return null;
        }
        double ninths = (d[0] * 9.0d) / d[1];
        long tenths = Math.round(10.0d * ninths);
        return (tenths % 10 == 0 ? String.valueOf(tenths / 10) : (tenths / 10) + "," + (tenths % 10)) + ":9";
    }

    static int[] parseSize(String size) throws NumberFormatException {
        int x;
        if (size == null || (x = size.indexOf(120)) <= 0) {
            return null;
        }
        try {
            int w = Integer.parseInt(size.substring(0, x));
            int h = Integer.parseInt(size.substring(x + 1));
            if (w <= 0 || h <= 0) {
                return null;
            }
            return new int[]{w, h};
        } catch (NumberFormatException e) {
            return null;
        }
    }

    public static String resolvedResolution(Context context) throws NumberFormatException {
        String saved = getString(context, KEY_RESOLUTION, DEFAULT_RESOLUTION);
        if (ASPECT_RESOLUTION.equals(saved)) {
            int[] a = aspectResolution(context);
            return a != null ? a[0] + "x" + a[1] : DEFAULT_RESOLUTION;
        }
        if (!NATIVE_RESOLUTION.equals(saved)) {
            return saved;
        }
        String n = nativeResolution(context);
        return n != null ? n : DEFAULT_RESOLUTION;
    }

    public static boolean getBool(Context context, String key, boolean fallback) {
        return context.getSharedPreferences(PREFS, 4).getBoolean(key, fallback);
    }

    public static void setBool(Context context, String key, boolean value) {
        context.getSharedPreferences(PREFS, 4).edit().putBoolean(key, value).apply();
    }

    public static String getString(Context context, String key, String fallback) {
        return context.getSharedPreferences(PREFS, 4).getString(key, fallback);
    }

    public static void setString(Context context, String key, String value) {
        context.getSharedPreferences(PREFS, 4).edit().putString(key, value).apply();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0048  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.String supportedLanguage(java.lang.String r5) {
        /*
            r0 = 0
            if (r5 != 0) goto L4
            return r0
        L4:
            int r1 = r5.hashCode()
            java.lang.String r2 = "id"
            java.lang.String r3 = "fr"
            java.lang.String r4 = "es"
            switch(r1) {
                case 3241: goto L3e;
                case 3246: goto L36;
                case 3276: goto L2e;
                case 3355: goto L26;
                case 3365: goto L1c;
                case 3588: goto L12;
                default: goto L11;
            }
        L11:
            goto L48
        L12:
            java.lang.String r1 = "pt"
            boolean r1 = r5.equals(r1)
            if (r1 == 0) goto L11
            r1 = 0
            goto L49
        L1c:
            java.lang.String r1 = "in"
            boolean r1 = r5.equals(r1)
            if (r1 == 0) goto L11
            r1 = 4
            goto L49
        L26:
            boolean r1 = r5.equals(r2)
            if (r1 == 0) goto L11
            r1 = 5
            goto L49
        L2e:
            boolean r1 = r5.equals(r3)
            if (r1 == 0) goto L11
            r1 = 3
            goto L49
        L36:
            boolean r1 = r5.equals(r4)
            if (r1 == 0) goto L11
            r1 = 2
            goto L49
        L3e:
            java.lang.String r1 = "en"
            boolean r1 = r5.equals(r1)
            if (r1 == 0) goto L11
            r1 = 1
            goto L49
        L48:
            r1 = -1
        L49:
            switch(r1) {
                case 0: goto L53;
                case 1: goto L50;
                case 2: goto L4f;
                case 3: goto L4e;
                case 4: goto L4d;
                case 5: goto L4d;
                default: goto L4c;
            }
        L4c:
            return r0
        L4d:
            return r2
        L4e:
            return r3
        L4f:
            return r4
        L50:
            java.lang.String r0 = "en-US"
            return r0
        L53:
            java.lang.String r0 = "pt-BR"
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: org.wiiucoop.bo2android.T6Ui.supportedLanguage(java.lang.String):java.lang.String");
    }

    public static Context wrapLocale(Context base) {
        String tag = getString(base, KEY_LANGUAGE, DEFAULT_LANGUAGE);
        if (T6DriverStore.SYSTEM.equals(tag)) {
            Locale device = base.getResources().getConfiguration().getLocales().get(0);
            tag = supportedLanguage(device.getLanguage());
            if (tag == null) {
                tag = DEFAULT_LANGUAGE;
            }
        }
        Locale locale = Locale.forLanguageTag(tag);
        Configuration config = new Configuration(base.getResources().getConfiguration());
        config.setLocale(locale);
        config.setLayoutDirection(locale);
        return base.createConfigurationContext(config);
    }

    public static String firstControllerName(Context context) {
        for (int id : InputDevice.getDeviceIds()) {
            InputDevice device = InputDevice.getDevice(id);
            if (device != null && !device.isVirtual()) {
                int sources = device.getSources();
                boolean external = true;
                boolean sticks = (sources & T6SessionMenu.SOURCE_JOYSTICK) == 16777232;
                boolean buttons = (sources & T6SessionMenu.SOURCE_GAMEPAD) == 1025;
                if (Build.VERSION.SDK_INT >= 29 && !device.isExternal()) {
                    external = false;
                }
                if (sticks || (buttons && external)) {
                    return device.getName();
                }
            }
        }
        return "";
    }

    public static T6TouchLayout loadTouchLayout(Context context, String profile) {
        return T6TouchLayout.load(profile, getString(context, "touch_layout_" + profile, null));
    }

    public static void saveTouchLayout(Context context, T6TouchLayout layout) {
        setString(context, "touch_layout_" + layout.profile, layout.serialize());
    }

    public static void resetTouchLayout(Context context, String profile) {
        context.getSharedPreferences(PREFS, 4).edit().remove("touch_layout_" + profile).apply();
    }

    public static String touchProfile(Context context) {
        return T6TouchLayout.PROFILE_X360.equals(getString(context, KEY_TOUCH_PROFILE, T6TouchLayout.PROFILE_CODM)) ? T6TouchLayout.PROFILE_X360 : T6TouchLayout.PROFILE_CODM;
    }

    public static boolean engineLaunchEnabled(Context context) {
        return true;
    }

    public static void applyImmersive(Activity activity) {
        if (activity == null) {
            return;
        }
        Window window = activity.getWindow();
        window.addFlags(T6TouchLayout.RIGHT_THUMB);
        if (Build.VERSION.SDK_INT >= 30) {
            window.setDecorFitsSystemWindows(false);
            WindowInsetsController controller = window.getInsetsController();
            if (controller != null) {
                controller.hide(WindowInsets.Type.systemBars());
                controller.setSystemBarsBehavior(2);
                return;
            }
            return;
        }
        window.getDecorView().setSystemUiVisibility(5894);
    }
}
