package org.wiiucoop.bo2android;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashMap;
import java.util.Map;

/* loaded from: classes3.dex */
public final class T6RunStatus {
    public static final String FILE_NAME = "t6_status.ini";
    public String mode = "";
    public String hostLifecycle = "";
    public String vulkanSurface = "";
    public String dxvkDevice = "";
    public String framesPresented = "";
    public String engineBoot = "";
    public String engineBootReason = "";
    public String guestStage = "";
    public String vulkanApi = "";
    public String finishedAt = "";

    public boolean exists() {
        return !this.finishedAt.isEmpty();
    }

    public boolean hostStarted() {
        return "ok".equals(this.hostLifecycle);
    }

    public boolean surfaceCreated() {
        return "ok".equals(this.vulkanSurface);
    }

    public boolean deviceCreated() {
        return "ok".equals(this.dxvkDevice);
    }

    public int frames() {
        try {
            return Integer.parseInt(this.framesPresented.trim());
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    public boolean engineBooted() {
        return "ok".equals(this.engineBoot);
    }

    public boolean engineBlocked() {
        return "blocked".equals(this.engineBoot);
    }

    public boolean hostProvenWorking() {
        return hostStarted() && surfaceCreated();
    }

    public static T6RunStatus load(File file) {
        if (file == null || !file.isFile()) {
            return new T6RunStatus();
        }
        try {
            InputStream in = new FileInputStream(file);
            try {
                byte[] buffer = new byte[(int) file.length()];
                int read = in.read(buffer);
                String text = read <= 0 ? "" : new String(buffer, 0, read, StandardCharsets.UTF_8);
                return parse(text);
            } finally {
                in.close();
            }
        } catch (IOException e) {
            return new T6RunStatus();
        }
    }

    public static T6RunStatus parse(String text) {
        int separator;
        T6RunStatus status = new T6RunStatus();
        if (text == null) {
            return status;
        }
        Map<String, String> values = new LinkedHashMap<>();
        for (String rawLine : text.split(T6PlayerName.TRAILING_NEWLINE)) {
            String line = rawLine.trim();
            if (!line.isEmpty() && !line.startsWith("#") && (separator = line.indexOf(61)) > 0) {
                values.put(line.substring(0, separator).trim(), line.substring(separator + 1).trim());
            }
        }
        status.mode = value(values, "mode");
        status.hostLifecycle = value(values, "host_lifecycle");
        status.vulkanSurface = value(values, "vulkan_surface");
        status.dxvkDevice = value(values, "dxvk_device");
        status.framesPresented = value(values, "frames_presented");
        status.engineBoot = value(values, "engine_boot");
        status.engineBootReason = value(values, "engine_boot_reason");
        status.vulkanApi = value(values, "vulkan_api");
        status.guestStage = value(values, "guest_stage");
        status.finishedAt = value(values, "finished_at");
        if (!T6Config.isKnownMode(status.mode)) {
            status.mode = "";
        }
        return status;
    }

    private static String value(Map<String, String> values, String key) {
        String found = values.get(key);
        return found == null ? "" : found;
    }
}
