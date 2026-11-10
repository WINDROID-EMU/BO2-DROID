package org.wiiucoop.bo2android;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashMap;
import java.util.Map;

/* loaded from: classes3.dex */
public final class T6Config {
    public static final String DIR_FAIL = "FAIL";
    public static final String DIR_OK = "OK";
    public static final String DIR_WARN = "WARN";
    public static final String FILE_NAME = "t6_config.ini";
    public static final int FORMAT_VERSION = 1;
    public static final String MODE_MP = "mp";
    public static final String MODE_NONE = "";
    public static final String MODE_ZM = "zm";
    public boolean versionMismatch;
    public String version = "";
    public String mode = "";
    public String gameDirPath = "";
    public String gameDirUri = "";
    public String gameDirDisplay = "";
    public String gameDirState = "";
    public String gameDirDetail = "";
    public String updatedAt = "";

    public boolean hasFolder() {
        return (this.gameDirUri.isEmpty() && this.gameDirPath.isEmpty()) ? false : true;
    }

    public boolean hasMode() {
        return isKnownMode(this.mode);
    }

    public static boolean isKnownMode(String value) {
        return MODE_MP.equals(value) || MODE_ZM.equals(value);
    }

    public static String modeLabel(String value) {
        if (MODE_MP.equals(value)) {
            return "MULTIPLAYER";
        }
        if (MODE_ZM.equals(value)) {
            return "ZOMBIES";
        }
        return "nenhum";
    }

    public static String modeFromLabel(String label) {
        if ("MULTIPLAYER".equalsIgnoreCase(label)) {
            return MODE_MP;
        }
        if ("ZOMBIES".equalsIgnoreCase(label)) {
            return MODE_ZM;
        }
        return "";
    }

    public String format() {
        StringBuilder text = new StringBuilder();
        text.append("# T6 Rebuild Android configuration.\n");
        text.append("# Written by the menu activity, read by libt6host.so.\n");
        text.append("version=").append(1).append('\n');
        text.append("mode=").append(this.mode).append('\n');
        text.append("game_dir_path=").append(oneLine(this.gameDirPath)).append('\n');
        text.append("game_dir_uri=").append(oneLine(this.gameDirUri)).append('\n');
        text.append("game_dir_display=").append(oneLine(this.gameDirDisplay)).append('\n');
        text.append("game_dir_state=").append(oneLine(this.gameDirState)).append('\n');
        text.append("game_dir_detail=").append(oneLine(this.gameDirDetail)).append('\n');
        text.append("updated_at=").append(oneLine(this.updatedAt)).append('\n');
        return text.toString();
    }

    public static T6Config parse(String text) {
        int separator;
        T6Config config = new T6Config();
        if (text == null) {
            return config;
        }
        Map<String, String> values = new LinkedHashMap<>();
        boolean z = false;
        for (String rawLine : text.split(T6PlayerName.TRAILING_NEWLINE)) {
            String line = rawLine.trim();
            if (!line.isEmpty() && !line.startsWith("#") && (separator = line.indexOf(61)) > 0) {
                values.put(line.substring(0, separator).trim(), line.substring(separator + 1).trim());
            }
        }
        config.version = value(values, "version");
        config.mode = value(values, "mode");
        config.gameDirPath = value(values, "game_dir_path");
        config.gameDirUri = value(values, "game_dir_uri");
        config.gameDirDisplay = value(values, "game_dir_display");
        config.gameDirState = value(values, "game_dir_state");
        config.gameDirDetail = value(values, "game_dir_detail");
        config.updatedAt = value(values, "updated_at");
        if (!config.version.isEmpty() && !String.valueOf(1).equals(config.version)) {
            z = true;
        }
        config.versionMismatch = z;
        if (config.versionMismatch) {
            config.mode = "";
        }
        if (!isKnownMode(config.mode)) {
            config.mode = "";
        }
        return config;
    }

    public void save(File file) throws IOException {
        this.updatedAt = String.valueOf(System.currentTimeMillis());
        OutputStream out = new FileOutputStream(file);
        try {
            out.write(format().getBytes(StandardCharsets.UTF_8));
            out.close();
        } catch (Throwable th) {
            try {
                out.close();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
            throw th;
        }
    }

    public static T6Config load(File file) throws IOException {
        if (file == null || !file.isFile()) {
            return new T6Config();
        }
        try {
            InputStream in = new FileInputStream(file);
            try {
                byte[] buffer = new byte[(int) file.length()];
                int read = in.read(buffer);
                if (read <= 0) {
                    T6Config t6Config = new T6Config();
                    in.close();
                    return t6Config;
                }
                T6Config t6Config2 = parse(new String(buffer, 0, read, StandardCharsets.UTF_8));
                in.close();
                return t6Config2;
            } finally {
            }
        } catch (IOException e) {
            return new T6Config();
        }
    }

    private static String value(Map<String, String> values, String key) {
        String found = values.get(key);
        return found == null ? "" : found;
    }

    private static String oneLine(String text) {
        if (text == null) {
            return "";
        }
        return text.replace('\n', ' ').replace('\r', ' ');
    }
}
