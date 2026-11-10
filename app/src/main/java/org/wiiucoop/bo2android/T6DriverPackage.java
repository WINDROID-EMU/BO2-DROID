package org.wiiucoop.bo2android;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipFile;
import java.util.zip.ZipInputStream;

/* loaded from: classes3.dex */
public final class T6DriverPackage {
    public static final int MAX_ENTRIES = 64;
    public static final long MAX_LIBRARY_BYTES = 134217728;
    public static final long MAX_META_BYTES = 16384;
    public static final long MAX_TOTAL_BYTES = 268435456;
    public static final long MAX_ZIP_BYTES = 67108864;

    public static final class Meta {
        public int schemaVersion = -1;
        public String name = "";
        public String description = "";
        public String author = "";
        public String vendor = "";
        public String driverVersion = "";
        public String libraryName = "";
        public int minApi = 0;
    }

    public enum Problem {
        CANNOT_READ,
        TOO_LARGE,
        BAD_ENTRIES,
        NOT_A_DRIVER,
        NEEDS_NEWER_ANDROID,
        BAD_LIBRARY,
        INSTALL_FAILED,
        CORRUPT
    }

    public static final class Result {
        public final String id;
        public final String librarySha256;
        public final Meta meta;
        public final boolean ok;
        public final Problem problem;
        public final String reason;
        public final String zipSha256;

        private Result(boolean ok, String reason, String id, Meta meta, String librarySha256, String zipSha256) {
            this(ok, reason, id, meta, librarySha256, zipSha256, (Problem) null);
        }

        private Result(boolean ok, String reason, String id, Meta meta, String librarySha256, String zipSha256, Problem problem) {
            this.problem = problem;
            this.ok = ok;
            this.reason = reason;
            this.id = id;
            this.meta = meta;
            this.librarySha256 = librarySha256;
            this.zipSha256 = zipSha256;
        }

        static Result fail(Problem problem, String reason) {
            return new Result(false, reason, (String) null, (Meta) null, (String) null, (String) null, problem);
        }
    }

    private T6DriverPackage() {
    }

    public static Result refused(Problem problem, String reason) {
        return Result.fail(problem, reason);
    }

    public static Result importZip(File zip, File driversDir, int deviceApi) {
        return importZip(zip, driversDir, deviceApi, zip.getName());
    }

    public static Result importZip(File zip, File driversDir, int deviceApi, String sourceName) {
        if (!zip.isFile()) {
            return Result.fail(Problem.CANNOT_READ, "arquivo não encontrado");
        }
        if (zip.length() > MAX_ZIP_BYTES) {
            return Result.fail(Problem.TOO_LARGE, "ZIP maior que 64 MB");
        }
        try {
            ZipFile file = new ZipFile(zip);
            try {
                Set<String> names = new HashSet<>();
                Enumeration<? extends ZipEntry> entries = file.entries();
                ZipEntry metaEntry = null;
                long total = 0;
                int count = 0;
                while (entries.hasMoreElements()) {
                    ZipEntry entry = entries.nextElement();
                    count++;
                    if (count > 64) {
                        return Result.fail(Problem.BAD_ENTRIES, "mais de 64 entradas no ZIP");
                    }
                    String name = entry.getName();
                    String why = unsafeName(name);
                    if (why != null) {
                        return Result.fail(Problem.BAD_ENTRIES, "entrada recusada '" + name + "': " + why);
                    }
                    if (!names.add(name)) {
                        return Result.fail(Problem.BAD_ENTRIES, "entrada duplicada '" + name + "'");
                    }
                    if (entry.getSize() > 0) {
                        total += entry.getSize();
                    }
                    if (total > MAX_TOTAL_BYTES) {
                        return Result.fail(Problem.TOO_LARGE, "conteúdo descompactado maior que 256 MB");
                    }
                    if (name.equals("meta.json")) {
                        metaEntry = entry;
                    }
                }
                if (metaEntry == null) {
                    return Result.fail(Problem.NOT_A_DRIVER, "meta.json ausente na raiz (não é um pacote AdrenoTools)");
                }
                String dup = duplicateLocalEntry(zip);
                if (dup != null) {
                    return Result.fail(Problem.BAD_ENTRIES, "entrada duplicada '" + dup + "'");
                }
                if (metaEntry.getSize() > MAX_META_BYTES) {
                    return Result.fail(Problem.NOT_A_DRIVER, "meta.json grande demais");
                }
                String metaText = new String(readAll(file.getInputStream(metaEntry), MAX_META_BYTES), StandardCharsets.UTF_8);
                Meta meta = parseMeta(metaText);
                if (meta.schemaVersion != 1) {
                    return Result.fail(Problem.NOT_A_DRIVER, "schemaVersion " + meta.schemaVersion + " não suportado (esperado 1)");
                }
                if (!safeLibraryName(meta.libraryName)) {
                    return Result.fail(Problem.NOT_A_DRIVER, "libraryName ausente ou inválido em meta.json");
                }
                if (meta.minApi > deviceApi) {
                    return Result.fail(Problem.NEEDS_NEWER_ANDROID, "o pacote exige Android API " + meta.minApi + " (aparelho: " + deviceApi + ")");
                }
                ZipEntry lib = file.getEntry(meta.libraryName);
                if (lib == null || lib.isDirectory()) {
                    return Result.fail(Problem.BAD_LIBRARY, "a biblioteca '" + meta.libraryName + "' não está no ZIP");
                }
                if (lib.getSize() > MAX_LIBRARY_BYTES) {
                    return Result.fail(Problem.TOO_LARGE, "biblioteca maior que 128 MB");
                }
                if (!driversDir.isDirectory() && !driversDir.mkdirs()) {
                    return Result.fail(Problem.INSTALL_FAILED, "não foi possível criar " + driversDir);
                }
                String id = driverId(meta, sha256(zip));
                File staging = new File(driversDir, ".staging-" + id);
                deleteTree(staging);
                if (!staging.mkdirs()) {
                    return Result.fail(Problem.INSTALL_FAILED, "não foi possível criar o diretório temporário");
                }
                File libOut = new File(staging, meta.libraryName);
                String libHash;
                try {
                    libHash = copyHashed(file.getInputStream(lib), libOut, MAX_LIBRARY_BYTES);
                } catch (IOException e) {
                    deleteTree(staging);
                    return Result.fail(Problem.INSTALL_FAILED, "falha ao extrair: " + e.getMessage());
                }
                String abi = elfProblem(libOut);
                if (abi != null) {
                    deleteTree(staging);
                    return Result.fail(Problem.BAD_LIBRARY, "biblioteca inválida: " + abi);
                }
                OutputStream out = new FileOutputStream(new File(staging, "meta.json"));
                try {
                    out.write(metaText.getBytes(StandardCharsets.UTF_8));
                } finally {
                    out.close();
                }
                String zipHash = sha256(zip);
                String record = "{\n  \"id\": \"" + id + "\",\n  \"librarySha256\": \"" + libHash + "\",\n  \"zipSha256\": \"" + zipHash + "\",\n  \"zipName\": \"" + jsonEscape(sourceName == null ? zip.getName() : sourceName) + "\",\n  \"importedAt\": " + System.currentTimeMillis() + "\n}\n";
                out = new FileOutputStream(new File(staging, "import.json"));
                try {
                    out.write(record.getBytes(StandardCharsets.UTF_8));
                } finally {
                    out.close();
                }
                File target = new File(driversDir, id);
                File old = new File(driversDir, ".old-" + id);
                deleteTree(old);
                if (target.exists() && !target.renameTo(old)) {
                    deleteTree(staging);
                    return Result.fail(Problem.INSTALL_FAILED, "não foi possível substituir a versão anterior");
                }
                if (staging.renameTo(target)) {
                    deleteTree(old);
                    return new Result(true, "", id, meta, libHash, zipHash);
                }
                if (old.exists()) {
                    old.renameTo(target);
                }
                deleteTree(staging);
                return Result.fail(Problem.INSTALL_FAILED, "não foi possível instalar o driver");
            } finally {
                file.close();
            }
        } catch (ZipException e) {
            return Result.fail(Problem.CORRUPT, "ZIP corrompido ou inválido: " + e.getMessage());
        } catch (IOException e) {
            return Result.fail(Problem.CORRUPT, "falha ao ler o ZIP: " + e.getMessage());
        }
    }

    static String unsafeName(String name) {
        if (name == null || name.isEmpty()) {
            return "nome vazio";
        }
        if (name.length() > 255) {
            return "nome longo demais";
        }
        if (name.startsWith("/") || name.startsWith("\\") || name.matches("^[A-Za-z]:.*")) {
            return "caminho absoluto";
        }
        if (name.contains("\\")) {
            return "barra invertida";
        }
        if (name.contains("\u0000")) {
            return "caractere nulo";
        }
        for (String part : name.split("/")) {
            if (part.equals("..")) {
                return "travessia de diretório (..)";
            }
        }
        return null;
    }

    static boolean safeLibraryName(String n) {
        return n != null && n.matches("[A-Za-z0-9._+-]{1,96}") && n.endsWith(".so") && !n.contains("..");
    }

    static String duplicateLocalEntry(File zip) throws IOException {
        ZipEntry e;
        Set<String> seen = new HashSet<>();
        ZipInputStream in = new ZipInputStream(new FileInputStream(zip));
        int n = 0;
        do {
            try {
                e = in.getNextEntry();
                if (e != null) {
                    n++;
                    if (n > 64) {
                        in.close();
                        return null;
                    }
                } else {
                    in.close();
                    return null;
                }
            } catch (Throwable th) {
                try {
                    in.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
                throw th;
            }
        } while (seen.add(e.getName()));
        String name = e.getName();
        in.close();
        return name;
    }

    static String elfProblem(File lib) throws IOException {
        byte[] h = new byte[20];
        InputStream in = new FileInputStream(lib);
        try {
            if (in.read(h) != h.length) {
                in.close();
                return "arquivo curto demais";
            }
            in.close();
            if (h[0] != 127 || h[1] != 69 || h[2] != 76 || h[3] != 70) {
                return "não é ELF";
            }
            if (h[4] != 2) {
                return "não é ELF64";
            }
            if (h[5] != 1) {
                return "não é little-endian";
            }
            int type = (h[16] & 255) | ((h[17] & 255) << 8);
            int machine = (h[18] & 255) | ((h[19] & 255) << 8);
            if (type != 3) {
                return "não é biblioteca compartilhada (ET_DYN)";
            }
            if (machine != 183) {
                return "ABI incompatível (e_machine " + machine + ", esperado AArch64 = 183)";
            }
            return null;
        } catch (Throwable th) {
            try {
                in.close();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
            throw th;
        }
    }

    static Meta parseMeta(String json) {
        Meta m = new Meta();
        m.schemaVersion = intField(json, "schemaVersion", -1);
        m.minApi = intField(json, "minApi", 0);
        m.name = stringField(json, "name");
        m.description = stringField(json, "description");
        m.author = stringField(json, "author");
        m.vendor = stringField(json, "vendor");
        m.driverVersion = stringField(json, "driverVersion");
        m.libraryName = stringField(json, "libraryName");
        return m;
    }

    static String stringField(String json, String key) {
        Matcher m = Pattern.compile("\"" + Pattern.quote(key) + "\"\\s*:\\s*\"((?:[^\"\\\\]|\\\\.){0,512})\"").matcher(json);
        return m.find() ? m.group(1).replace("\\\"", "\"").replace("\\\\", "\\") : "";
    }

    static int intField(String json, String key, int fallback) {
        Matcher m = Pattern.compile("\"" + Pattern.quote(key) + "\"\\s*:\\s*\"?(-?\\d{1,9})\"?").matcher(json);
        return m.find() ? Integer.parseInt(m.group(1)) : fallback;
    }

    static String driverId(Meta meta, String zipSha256) {
        String base = (meta.name.isEmpty() ? meta.libraryName : meta.name).toLowerCase(Locale.ROOT).replaceAll("[^a-z0-9._-]+", "-").replaceAll("^[-.]+|[-.]+$", "");
        if (base.length() > 40) {
            base = base.substring(0, 40);
        }
        if (base.isEmpty()) {
            base = "driver";
        }
        return base + "-" + zipSha256.substring(0, 8);
    }

    static String copyHashed(InputStream in, File out, long limit) throws IOException {
        MessageDigest md = digest();
        long total = 0;
        try {
            OutputStream dst = new FileOutputStream(out);
            try {
                byte[] buf = new byte[65536];
                while (true) {
                    int n = in.read(buf);
                    if (n <= 0) {
                        return hex(md.digest());
                    }
                    total += n;
                    if (total > limit) {
                        throw new IOException("entrada maior que o limite");
                    }
                    md.update(buf, 0, n);
                    dst.write(buf, 0, n);
                }
            } finally {
                dst.close();
            }
        } finally {
            if (in != null) {
                in.close();
            }
        }
    }

    static String sha256(File f) throws IOException {
        MessageDigest md = digest();
        InputStream in = new FileInputStream(f);
        try {
            byte[] buf = new byte[65536];
            while (true) {
                int n = in.read(buf);
                if (n <= 0) {
                    return hex(md.digest());
                }
                md.update(buf, 0, n);
            }
        } finally {
            in.close();
        }
    }

    private static byte[] readAll(InputStream in, long limit) throws IOException {
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[4096];
            do {
                int n = in.read(buf);
                if (n <= 0) {
                    return out.toByteArray();
                }
                out.write(buf, 0, n);
            } while (out.size() <= limit);
            throw new IOException("meta.json grande demais");
        } finally {
            if (in != null) {
                in.close();
            }
        }
    }

    private static MessageDigest digest() {
        try {
            return MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException e) {
            throw new IllegalStateException(e);
        }
    }

    private static String hex(byte[] b) {
        StringBuilder s = new StringBuilder();
        for (byte x : b) {
            s.append(String.format("%02x", Integer.valueOf(x & 255)));
        }
        return s.toString();
    }

    private static String jsonEscape(String s) {
        return s.replace("\\", "\\\\").replace("\"", "\\\"");
    }

    static void deleteTree(File f) {
        if (f == null || !f.exists()) {
            return;
        }
        File[] children = f.listFiles();
        if (children != null) {
            for (File c : children) {
                deleteTree(c);
            }
        }
        f.delete();
    }
}
