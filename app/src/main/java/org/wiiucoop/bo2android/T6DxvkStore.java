package org.wiiucoop.bo2android;

import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.AssetManager;
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
import java.util.Enumeration;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipFile;

/* loaded from: classes3.dex */
public final class T6DxvkStore {
    public static final String BUILTIN = "builtin";
    public static final String BUILTIN_VERSION = "2.6.0";
    static final String BUNDLED_ASSETS = "dxvk/legacy-1.9.2/";
    public static final String BUNDLED_ID = "dxvk-1.9.2-legacy";
    public static final String BUNDLED_VERSION = "1.9.2";
    public static final String D3D11 = "libdxvk_d3d11.so";
    public static final String DXGI = "libdxvk_dxgi.so";
    static final int MAX_ENTRIES = 64;
    static final long MAX_LIBRARY_BYTES = 134217728;
    static final long MAX_ZIP_BYTES = 67108864;
    static final String UPSTREAM3_ASSETS = "dxvk/upstream-3.1.1/";
    public static final String UPSTREAM3_ID = "dxvk-3.1.1";
    public static final String UPSTREAM3_VERSION = "3.1.1";
    private static final Pattern VERSION = Pattern.compile("DXVK v?([0-9]+\\.[0-9]+(?:\\.[0-9]+)?(?:[-+][A-Za-z0-9._-]{1,24})?)");
    private long apkStamp;
    private final File filesDir;

    static boolean isApkSet(String id) {
        return BUNDLED_ID.equals(id) || UPSTREAM3_ID.equals(id);
    }

    public static final class Entry {
        public final String id;
        public final String sourceName;
        public final String version;

        Entry(String id, String version, String sourceName) {
            this.id = id;
            this.version = version;
            this.sourceName = sourceName;
        }

        public String label() {
            return "DXVK " + (this.version.isEmpty() ? "?" : this.version) + " (" + this.id + ")";
        }
    }

    public static final class Result {
        public final String id;
        public final boolean ok;
        public final String reason;
        public final String version;

        Result(boolean ok, String reason, String id, String version) {
            this.ok = ok;
            this.reason = reason;
            this.id = id;
            this.version = version;
        }

        static Result fail(String reason) {
            return new Result(false, reason, "", "");
        }
    }

    public T6DxvkStore(File filesDir) {
        this.filesDir = filesDir;
    }

    public T6DxvkStore withApkStamp(long stamp) {
        this.apkStamp = stamp;
        return this;
    }

    public static long apkStamp(Context context) {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).lastUpdateTime;
        } catch (PackageManager.NameNotFoundException e) {
            return 0L;
        }
    }

    public File versionsDir() {
        return new File(this.filesDir, "dxvk_versions");
    }

    public String selected() {
        String id = read(new File(this.filesDir, "dxvk_version.cfg"), 128L).trim();
        return (id.isEmpty() || id.equals(BUILTIN) || find(id) == null) ? BUILTIN : id;
    }

    public boolean select(String id) {
        if (!BUILTIN.equals(id) && find(id) == null) {
            return false;
        }
        File cfg = new File(this.filesDir, "dxvk_version.cfg");
        File tmp = new File(this.filesDir, "dxvk_version.cfg.tmp");
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
        File[] dirs = versionsDir().listFiles();
        if (dirs == null) {
            return out;
        }
        Arrays.sort(dirs);
        for (File d : dirs) {
            if (d.isDirectory() && !d.getName().startsWith(".") && !isApkSet(d.getName()) && (e = load(d)) != null) {
                out.add(e);
            }
        }
        return out;
    }

    public Entry find(String id) {
        if (id == null || !id.matches("[A-Za-z0-9._-]{1,64}") || id.startsWith(".")) {
            return null;
        }
        File d = new File(versionsDir(), id);
        if (d.isDirectory()) {
            return load(d);
        }
        return null;
    }

    public boolean remove(String id) {
        if (isApkSet(id) || find(id) == null) {
            return false;
        }
        if (id.equals(read(new File(this.filesDir, "dxvk_version.cfg"), 128L).trim())) {
            select(BUILTIN);
        }
        T6DriverPackage.deleteTree(new File(versionsDir(), id));
        return true;
    }

    public String label(String id) {
        if (BUILTIN.equals(id)) {
            return "DXVK 2.6.0";
        }
        if (BUNDLED_ID.equals(id)) {
            return "DXVK 1.9.2";
        }
        if (UPSTREAM3_ID.equals(id)) {
            return "DXVK 3.1.1";
        }
        Entry e = find(id);
        return e == null ? id : e.label();
    }

    public Map<String, String> lastStatus() {
        Map<String, String> map = new LinkedHashMap<>();
        for (String line : read(new File(this.filesDir, "dxvk_status.txt"), 8192L).split(T6PlayerName.TRAILING_NEWLINE)) {
            int eq = line.indexOf(61);
            if (eq > 0) {
                map.put(line.substring(0, eq).trim(), line.substring(eq + 1).trim());
            }
        }
        return map;
    }

    public Result importZip(File zip, String sourceName) throws IOException {
        if (!zip.isFile()) {
            return Result.fail("arquivo não encontrado");
        }
        if (zip.length() > 67108864) {
            return Result.fail("ZIP maior que 64 MB");
        }
        try {
            ZipFile file = new ZipFile(zip);
            try {
                Set<String> names = new HashSet<>();
                Enumeration<? extends ZipEntry> entries = file.entries();
                boolean windowsDll = false;
                ZipEntry d3d11 = null;
                ZipEntry dxgi = null;
                int count = 0;
                while (entries.hasMoreElements()) {
                    ZipEntry entry = entries.nextElement();
                    count++;
                    if (count > 64) {
                        return Result.fail("mais de 64 entradas no ZIP");
                    }
                    String name = entry.getName();
                    String why = T6DriverPackage.unsafeName(name);
                    if (why != null) {
                        return Result.fail("entrada recusada '" + name + "': " + why);
                    }
                    if (!names.add(name)) {
                        return Result.fail("entrada duplicada '" + name + "'");
                    }
                    if (!entry.isDirectory()) {
                        String base = name.substring(name.lastIndexOf(47) + 1).toLowerCase(Locale.ROOT);
                        if (base.equals("dxgi.dll") || base.equals("d3d11.dll")) {
                            windowsDll = true;
                        }
                        if (base.equals(DXGI)) {
                            if (dxgi != null) {
                                return Result.fail("mais de um libdxvk_dxgi.so no ZIP");
                            }
                            dxgi = entry;
                        } else if (base.equals(D3D11)) {
                            if (d3d11 != null) {
                                return Result.fail("mais de um libdxvk_d3d11.so no ZIP");
                            }
                            d3d11 = entry;
                        }
                    }
                }
                if (dxgi == null || d3d11 == null) {
                    return Result.fail(windowsDll ? "o ZIP traz DLLs do Windows (dxgi.dll/d3d11.dll, para Wine); este jogo carrega só bibliotecas Android ARM64 nativas (libdxvk_dxgi.so + libdxvk_d3d11.so)" : "o ZIP precisa ter libdxvk_dxgi.so e libdxvk_d3d11.so");
                }
                if (!parent(dxgi.getName()).equals(parent(d3d11.getName()))) {
                    return Result.fail("libdxvk_dxgi.so e libdxvk_d3d11.so estão em pastas diferentes; precisam ser do mesmo build");
                }
                String dup = T6DriverPackage.duplicateLocalEntry(zip);
                if (dup != null) {
                    return Result.fail("entrada duplicada '" + dup + "'");
                }
                if (dxgi.getSize() > 134217728 || d3d11.getSize() > 134217728) {
                    return Result.fail("biblioteca maior que 128 MB");
                }
                File dir = versionsDir();
                if (!dir.isDirectory() && !dir.mkdirs()) {
                    return Result.fail("não foi possível criar " + dir);
                }
                String zipHash = T6DriverPackage.sha256(zip);
                File staging = new File(dir, ".staging-" + zipHash.substring(0, 12));
                T6DriverPackage.deleteTree(staging);
                if (!staging.mkdirs()) {
                    return Result.fail("não foi possível criar o diretório temporário");
                }
                File dxgiOut = new File(staging, DXGI);
                File d3d11Out = new File(staging, D3D11);
                String dxgiHash;
                String d3d11Hash;
                try {
                    dxgiHash = T6DriverPackage.copyHashed(file.getInputStream(dxgi), dxgiOut, 134217728L);
                    d3d11Hash = T6DriverPackage.copyHashed(file.getInputStream(d3d11), d3d11Out, 134217728L);
                } catch (IOException e) {
                    T6DriverPackage.deleteTree(staging);
                    return Result.fail("falha ao extrair: " + e.getMessage());
                }
                for (File lib : new File[]{dxgiOut, d3d11Out}) {
                    String problem = libraryProblem(lib);
                    if (problem != null) {
                        T6DriverPackage.deleteTree(staging);
                        return Result.fail(lib.getName() + ": " + problem);
                    }
                }
                if (!contains(dxgiOut, "CreateDXGIFactory1")) {
                    T6DriverPackage.deleteTree(staging);
                    return Result.fail("libdxvk_dxgi.so não exporta CreateDXGIFactory1");
                }
                if (!contains(d3d11Out, "D3D11CreateDeviceAndSwapChain")) {
                    T6DriverPackage.deleteTree(staging);
                    return Result.fail("libdxvk_d3d11.so não exporta D3D11CreateDeviceAndSwapChain");
                }
                String version = dxvkVersion(d3d11Out);
                String id = setId(version, zipHash);
                String record = "{\n  \"id\": \"" + id + "\",\n  \"version\": \"" + version + "\",\n  \"dxgiSha256\": \"" + dxgiHash + "\",\n  \"d3d11Sha256\": \"" + d3d11Hash + "\",\n  \"zipSha256\": \"" + zipHash + "\",\n  \"zipName\": \"" + escape(sourceName == null ? zip.getName() : sourceName) + "\",\n  \"importedAt\": " + System.currentTimeMillis() + "\n}\n";
                try {
                    FileOutputStream out = new FileOutputStream(new File(staging, "import.json"));
                    try {
                        out.write(record.getBytes(StandardCharsets.UTF_8));
                    } finally {
                        out.close();
                    }
                    File target = new File(dir, id);
                    File old = new File(dir, ".old-" + id);
                    T6DriverPackage.deleteTree(old);
                    if (target.exists() && !target.renameTo(old)) {
                        T6DriverPackage.deleteTree(staging);
                        return Result.fail("não foi possível substituir a versão anterior");
                    }
                    if (staging.renameTo(target)) {
                        T6DriverPackage.deleteTree(old);
                        return new Result(true, "", id, version);
                    }
                    if (old.exists()) {
                        old.renameTo(target);
                    }
                    T6DriverPackage.deleteTree(staging);
                    return Result.fail("não foi possível instalar o DXVK");
                } catch (IOException e) {
                    T6DriverPackage.deleteTree(staging);
                    return Result.fail("falha ao extrair: " + e.getMessage());
                }
            } finally {
                file.close();
            }
        } catch (ZipException e) {
            return Result.fail("ZIP corrompido ou inválido: " + e.getMessage());
        } catch (IOException e) {
            return Result.fail("falha ao ler o ZIP: " + e.getMessage());
        }
    }

    public String ensureBundled(AssetManager assets) {
        return ensureApkSet(assets, BUNDLED_ID, BUNDLED_VERSION, BUNDLED_ASSETS);
    }

    public String ensureUpstream3(AssetManager assets) {
        return ensureApkSet(assets, UPSTREAM3_ID, UPSTREAM3_VERSION, UPSTREAM3_ASSETS);
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x007f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private java.lang.String ensureApkSet(android.content.res.AssetManager r20, java.lang.String r21, java.lang.String r22, java.lang.String r23) {
        /*
            Method dump skipped, instructions count: 497
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.wiiucoop.bo2android.T6DxvkStore.ensureApkSet(android.content.res.AssetManager, java.lang.String, java.lang.String, java.lang.String):java.lang.String");
    }

    static String libraryProblem(File lib) throws IOException {
        byte[] h = new byte[2];
        InputStream in = new FileInputStream(lib);
        try {
            if (in.read(h) != 2) {
                in.close();
                return "arquivo curto demais";
            }
            in.close();
            if (h[0] == 77 && h[1] == 90) {
                return "é uma DLL do Windows (PE), que este processo Android não carrega";
            }
            String elf = T6DriverPackage.elfProblem(lib);
            if (elf == null) {
                return null;
            }
            return "biblioteca inválida: " + elf;
        } catch (Throwable th) {
            try {
                in.close();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
            throw th;
        }
    }

    static String dxvkVersion(File lib) throws IOException {
        String text = latin1(lib);
        Matcher m = VERSION.matcher(text);
        return m.find() ? m.group(1) : "";
    }

    static String setId(String version, String zipSha256) {
        String base = ("dxvk-" + (version.isEmpty() ? "unknown" : version)).toLowerCase(Locale.ROOT).replaceAll("[^a-z0-9._-]+", "-");
        if (base.length() > 40) {
            base = base.substring(0, 40);
        }
        return base + "-" + zipSha256.substring(0, 8);
    }

    private static boolean contains(File lib, String symbol) throws IOException {
        return latin1(lib).contains(symbol);
    }

    private static String latin1(File lib) throws IOException {
        int r;
        long n = lib.length();
        if (n > 134217728) {
            throw new IOException("biblioteca grande demais");
        }
        byte[] b = new byte[(int) n];
        InputStream in = new FileInputStream(lib);
        int off = 0;
        while (off < b.length && (r = in.read(b, off, b.length - off)) >= 0) {
            try {
                off += r;
            } catch (Throwable th) {
                try {
                    in.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
                throw th;
            }
        }
        in.close();
        return new String(b, StandardCharsets.ISO_8859_1);
    }

    private static String parent(String name) {
        int slash = name.lastIndexOf(47);
        return slash < 0 ? "" : name.substring(0, slash);
    }

    private static String escape(String s) {
        return s.replace("\\", "\\\\").replace("\"", "\\\"");
    }

    private Entry load(File dir) {
        if (!new File(dir, DXGI).isFile() || !new File(dir, D3D11).isFile()) {
            return null;
        }
        String record = read(new File(dir, "import.json"), 4096L);
        if (record.isEmpty()) {
            return null;
        }
        return new Entry(dir.getName(), T6DriverPackage.stringField(record, "version"), T6DriverPackage.stringField(record, "zipName"));
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
