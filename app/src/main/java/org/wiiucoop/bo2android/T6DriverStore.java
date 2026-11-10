package org.wiiucoop.bo2android;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.wiiucoop.bo2android.T6DriverPackage;

/* loaded from: classes3.dex */
public final class T6DriverStore {
    public static final String SYSTEM = "system";
    private final File filesDir;

    public static final class Entry {
        public final String id;
        public final String librarySha256;
        public final T6DriverPackage.Meta meta;

        Entry(String id, T6DriverPackage.Meta meta, String librarySha256) {
            this.id = id;
            this.meta = meta;
            this.librarySha256 = librarySha256;
        }
    }

    public T6DriverStore(File filesDir) {
        this.filesDir = filesDir;
    }

    public File driversDir() {
        return new File(this.filesDir, "vulkan_drivers");
    }

    public String selected() {
        String id = read(new File(this.filesDir, "vulkan_driver.cfg"), 128L).trim();
        return (id.isEmpty() || id.equals(SYSTEM) || find(id) == null) ? SYSTEM : id;
    }

    public boolean select(String id) {
        if (!SYSTEM.equals(id) && find(id) == null) {
            return false;
        }
        File cfg = new File(this.filesDir, "vulkan_driver.cfg");
        File tmp = new File(this.filesDir, "vulkan_driver.cfg.tmp");
        try {
            OutputStream out = new FileOutputStream(tmp);
            try {
                out.write((id + T6PlayerName.TRAILING_NEWLINE).getBytes(StandardCharsets.UTF_8));
            } finally {
                out.close();
            }
            try {
                Files.move(tmp.toPath(), cfg.toPath(), StandardCopyOption.REPLACE_EXISTING, StandardCopyOption.ATOMIC_MOVE);
                return true;
            } catch (IOException e) {
                return false;
            }
        } catch (IOException e2) {
            return false;
        }
    }

    public List<Entry> list() {
        Entry e;
        List<Entry> out = new ArrayList<>();
        File[] dirs = driversDir().listFiles();
        if (dirs == null) {
            return out;
        }
        Arrays.sort(dirs);
        for (File d : dirs) {
            if (d.isDirectory() && !d.getName().startsWith(".") && (e = load(d)) != null) {
                out.add(e);
            }
        }
        return out;
    }

    public Entry find(String id) {
        if (id == null || !id.matches("[A-Za-z0-9._-]{1,64}") || id.startsWith(".")) {
            return null;
        }
        File d = new File(driversDir(), id);
        if (d.isDirectory()) {
            return load(d);
        }
        return null;
    }

    public boolean remove(String id) {
        if (find(id) == null) {
            return false;
        }
        if (id.equals(read(new File(this.filesDir, "vulkan_driver.cfg"), 128L).trim())) {
            select(SYSTEM);
        }
        T6DriverPackage.deleteTree(new File(driversDir(), id));
        return true;
    }

    public Map<String, String> lastStatus() {
        Map<String, String> map = new LinkedHashMap<>();
        for (String line : read(new File(this.filesDir, "vulkan_driver_status.txt"), 8192L).split(T6PlayerName.TRAILING_NEWLINE)) {
            int eq = line.indexOf(61);
            if (eq > 0) {
                map.put(line.substring(0, eq).trim(), line.substring(eq + 1).trim());
            }
        }
        return map;
    }

    private Entry load(File dir) {
        String metaText = read(new File(dir, "meta.json"), T6DriverPackage.MAX_META_BYTES);
        if (metaText.isEmpty()) {
            return null;
        }
        T6DriverPackage.Meta meta = T6DriverPackage.parseMeta(metaText);
        if (!T6DriverPackage.safeLibraryName(meta.libraryName) || !new File(dir, meta.libraryName).isFile()) {
            return null;
        }
        String record = read(new File(dir, "import.json"), 4096L);
        return new Entry(dir.getName(), meta, T6DriverPackage.stringField(record, "librarySha256"));
    }

    private static String read(File f, long limit) {
        int r;
        if (!f.isFile() || f.length() > limit) {
            return "";
        }
        try {
            InputStream in = new FileInputStream(f);
            try {
                byte[] b = new byte[(int) f.length()];
                int n = 0;
                while (n < b.length && (r = in.read(b, n, b.length - n)) >= 0) {
                    n += r;
                }
                return new String(b, 0, n, StandardCharsets.UTF_8);
            } finally {
                in.close();
            }
        } catch (IOException e) {
            return "";
        }
    }
}
