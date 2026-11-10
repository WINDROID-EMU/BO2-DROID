package org.wiiucoop.bo2android;

import android.app.ActivityManager;
import android.content.Context;
import android.content.pm.FeatureInfo;
import android.content.pm.PackageManager;
import android.opengl.EGL14;
import android.opengl.EGLConfig;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLSurface;
import android.opengl.GLES20;
import android.os.Build;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Locale;

/* loaded from: classes3.dex */
public final class T6DeviceInfo {
    public static final String UNAVAILABLE = "Indisponível";

    public static final class Info {
        public final String cpu;
        public final String gpu;
        public final String ram;
        public final String vulkan;

        Info(String cpu, String gpu, String ram, String vulkan) {
            this.cpu = cpu;
            this.gpu = gpu;
            this.ram = ram;
            this.vulkan = vulkan;
        }
    }

    private T6DeviceInfo() {
    }

    public static String orUnavailable(String value) {
        if (value == null) {
            return UNAVAILABLE;
        }
        String trimmed = value.trim();
        return trimmed.isEmpty() ? UNAVAILABLE : trimmed;
    }

    public static String formatRam(long totalBytes) {
        if (totalBytes <= 0) {
            return UNAVAILABLE;
        }
        if (totalBytes < 1073741824) {
            return String.format(Locale.US, "%.0f MB", Double.valueOf(totalBytes / 1048576.0d));
        }
        return String.format(Locale.US, "%.1f GB", Double.valueOf(totalBytes / 1.073741824E9d));
    }

    public static String describeVulkan(String supported, String hostUsed) {
        String level = supported == null ? "" : supported.trim();
        String used = hostUsed != null ? hostUsed.trim() : "";
        if (level.isEmpty() && used.isEmpty()) {
            return UNAVAILABLE;
        }
        if (level.isEmpty()) {
            return "host usou " + used;
        }
        if (used.isEmpty()) {
            return level;
        }
        return level + " (host usou " + used + ")";
    }

    public static Info read(Context context) {
        return new Info(cpuModel(), gpuRenderer(), ram(context), vulkan(context));
    }

    static String cpuModel() {
        if (Build.VERSION.SDK_INT >= 31) {
            String model = Build.SOC_MODEL;
            String maker = Build.SOC_MANUFACTURER;
            if (model != null && !model.trim().isEmpty()) {
                if (maker != null && !maker.trim().isEmpty() && !model.toLowerCase(Locale.US).contains(maker.toLowerCase(Locale.US))) {
                    return maker.trim() + " " + model.trim();
                }
                return model.trim();
            }
        }
        return cpuInfoLine();
    }

    static String cpuInfoLine() {
        try {
            BufferedReader reader = new BufferedReader(new FileReader("/proc/cpuinfo"));
            try {
                String hardware = "";
                while (true) {
                    String line = reader.readLine();
                    if (line == null) {
                        return hardware;
                    }
                    int separator = line.indexOf(58);
                    if (separator > 0) {
                        String key = line.substring(0, separator).trim();
                        String value = line.substring(separator + 1).trim();
                        if ("Hardware".equalsIgnoreCase(key)) {
                            return value;
                        }
                        if ("model name".equalsIgnoreCase(key) && hardware.isEmpty()) {
                            hardware = value;
                        }
                    }
                }
            } finally {
                reader.close();
            }
        } catch (IOException e) {
            return "";
        }
    }

    static String ram(Context context) {
        try {
            ActivityManager manager = (ActivityManager) context.getSystemService("activity");
            if (manager == null) {
                return UNAVAILABLE;
            }
            ActivityManager.MemoryInfo memory = new ActivityManager.MemoryInfo();
            manager.getMemoryInfo(memory);
            return formatRam(memory.totalMem);
        } catch (RuntimeException e) {
            return UNAVAILABLE;
        }
    }

    static String vulkan(Context context) {
        return describeVulkan(supportedVulkan(context), hostUsedVulkan(context));
    }

    static String supportedVulkan(Context context) {
        try {
            PackageManager manager = context.getPackageManager();
            FeatureInfo[] features = manager.getSystemAvailableFeatures();
            if (features == null) {
                return "";
            }
            for (FeatureInfo feature : features) {
                if (feature != null && "android.hardware.vulkan.version".equals(feature.name)) {
                    return versionName(feature.version);
                }
            }
            return "";
        } catch (RuntimeException e) {
            return "";
        }
    }

    static String hostUsedVulkan(Context context) {
        T6RunStatus status = T6RunStatus.load(new File(context.getFilesDir(), T6RunStatus.FILE_NAME));
        return status.exists() ? status.vulkanApi : "";
    }

    static String versionName(int packed) {
        if (packed <= 0) {
            return "";
        }
        int major = (packed >> 22) & 127;
        int minor = (packed >> 12) & 1023;
        return major + "." + minor;
    }

    static String gpuRenderer() {
        EGLDisplay display = EGL14.EGL_NO_DISPLAY;
        EGLContext eglContext = EGL14.EGL_NO_CONTEXT;
        EGLSurface surface = EGL14.EGL_NO_SURFACE;
        try {
            display = EGL14.eglGetDisplay(0);
            if (display == EGL14.EGL_NO_DISPLAY) {
                if (display != EGL14.EGL_NO_DISPLAY) {
                    EGL14.eglMakeCurrent(display, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT);
                    if (surface != EGL14.EGL_NO_SURFACE) {
                        EGL14.eglDestroySurface(display, surface);
                    }
                    if (eglContext != EGL14.EGL_NO_CONTEXT) {
                        EGL14.eglDestroyContext(display, eglContext);
                    }
                    EGL14.eglTerminate(display);
                }
                return "";
            }
            int[] version = new int[2];
            if (!EGL14.eglInitialize(display, version, 0, version, 1)) {
                if (display != EGL14.EGL_NO_DISPLAY) {
                    EGL14.eglMakeCurrent(display, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT);
                    if (surface != EGL14.EGL_NO_SURFACE) {
                        EGL14.eglDestroySurface(display, surface);
                    }
                    if (eglContext != EGL14.EGL_NO_CONTEXT) {
                        EGL14.eglDestroyContext(display, eglContext);
                    }
                    EGL14.eglTerminate(display);
                }
                return "";
            }
            int[] configAttributes = {12352, 4, 12339, 1, 12324, 8, 12323, 8, 12322, 8, 12344};
            EGLConfig[] configs = new EGLConfig[1];
            int[] count = new int[1];
            if (EGL14.eglChooseConfig(display, configAttributes, 0, configs, 0, 1, count, 0) && count[0] != 0) {
                int[] contextAttributes = {12440, 2, 12344};
                eglContext = EGL14.eglCreateContext(display, configs[0], EGL14.EGL_NO_CONTEXT, contextAttributes, 0);
                if (eglContext == EGL14.EGL_NO_CONTEXT) {
                    if (display != EGL14.EGL_NO_DISPLAY) {
                        EGL14.eglMakeCurrent(display, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT);
                        if (surface != EGL14.EGL_NO_SURFACE) {
                            EGL14.eglDestroySurface(display, surface);
                        }
                        if (eglContext != EGL14.EGL_NO_CONTEXT) {
                            EGL14.eglDestroyContext(display, eglContext);
                        }
                        EGL14.eglTerminate(display);
                    }
                    return "";
                }
                int[] surfaceAttributes = {12375, 1, 12374, 1, 12344};
                surface = EGL14.eglCreatePbufferSurface(display, configs[0], surfaceAttributes, 0);
                if (surface != EGL14.EGL_NO_SURFACE && EGL14.eglMakeCurrent(display, surface, surface, eglContext)) {
                    String renderer = GLES20.glGetString(7937);
                    String str = renderer != null ? renderer : "";
                    if (display != EGL14.EGL_NO_DISPLAY) {
                        EGL14.eglMakeCurrent(display, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT);
                        if (surface != EGL14.EGL_NO_SURFACE) {
                            EGL14.eglDestroySurface(display, surface);
                        }
                        if (eglContext != EGL14.EGL_NO_CONTEXT) {
                            EGL14.eglDestroyContext(display, eglContext);
                        }
                        EGL14.eglTerminate(display);
                    }
                    return str;
                }
                if (display != EGL14.EGL_NO_DISPLAY) {
                    EGL14.eglMakeCurrent(display, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT);
                    if (surface != EGL14.EGL_NO_SURFACE) {
                        EGL14.eglDestroySurface(display, surface);
                    }
                    if (eglContext != EGL14.EGL_NO_CONTEXT) {
                        EGL14.eglDestroyContext(display, eglContext);
                    }
                    EGL14.eglTerminate(display);
                }
                return "";
            }
            if (display != EGL14.EGL_NO_DISPLAY) {
                EGL14.eglMakeCurrent(display, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT);
                if (surface != EGL14.EGL_NO_SURFACE) {
                    EGL14.eglDestroySurface(display, surface);
                }
                if (eglContext != EGL14.EGL_NO_CONTEXT) {
                    EGL14.eglDestroyContext(display, eglContext);
                }
                EGL14.eglTerminate(display);
            }
            return "";
        } catch (RuntimeException e) {
            if (display != EGL14.EGL_NO_DISPLAY) {
                EGL14.eglMakeCurrent(display, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT);
                if (surface != EGL14.EGL_NO_SURFACE) {
                    EGL14.eglDestroySurface(display, surface);
                }
                if (eglContext != EGL14.EGL_NO_CONTEXT) {
                    EGL14.eglDestroyContext(display, eglContext);
                }
                EGL14.eglTerminate(display);
            }
            return "";
        } catch (Throwable th) {
            if (display != EGL14.EGL_NO_DISPLAY) {
                EGL14.eglMakeCurrent(display, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT);
                if (surface != EGL14.EGL_NO_SURFACE) {
                    EGL14.eglDestroySurface(display, surface);
                }
                if (eglContext != EGL14.EGL_NO_CONTEXT) {
                    EGL14.eglDestroyContext(display, eglContext);
                }
                EGL14.eglTerminate(display);
            }
            throw th;
        }
    }
}
