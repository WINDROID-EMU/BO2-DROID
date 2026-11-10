package org.wiiucoop.bo2android;

import android.content.SharedPreferences;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
final class T6KennelPackage {
    static final String PREF_VERSION = "kennel_version";

    enum State {
        MISSING,
        INCOMPLETE,
        OUTDATED,
        INSTALLED
    }

    T6KennelPackage() {
    }

    static final class Entry {
        final String path;
        final String sha256;
        final long size;

        Entry(String path, long size, String sha256) {
            this.path = path;
            this.size = size;
            this.sha256 = sha256;
        }
    }

    static final class Manifest {
        final String asset;
        final List<Entry> files;
        final String sha256;
        final long size;
        final int version;

        Manifest(int version, String asset, long size, String sha256, List<Entry> files) {
            this.version = version;
            this.asset = asset;
            this.size = size;
            this.sha256 = sha256;
            this.files = files;
        }
    }

    static Manifest parse(String json) throws IOException {
        try {
            JSONObject o = new JSONObject(json);
            JSONArray a = o.getJSONArray("files");
            List<Entry> files = new ArrayList<>();
            for (int i = 0; i < a.length(); i++) {
                JSONObject f = a.getJSONObject(i);
                String path = f.getString("path");
                if (!safePath(path)) {
                    throw new IOException("caminho inválido no manifesto: " + path);
                }
                files.add(new Entry(path, f.getLong("size"), f.getString("sha256").toLowerCase(Locale.ROOT)));
            }
            if (files.isEmpty()) {
                throw new IOException("manifesto sem arquivos");
            }
            return new Manifest(o.getInt("version"), o.getString("asset"), o.getLong("size"), o.getString("sha256").toLowerCase(Locale.ROOT), files);
        } catch (JSONException e) {
            throw new IOException("manifesto inválido: " + e.getMessage());
        }
    }

    static boolean safePath(String path) {
        if (path == null || path.isEmpty() || path.startsWith("/") || path.contains("\\") || path.contains(":")) {
            return false;
        }
        for (String part : path.split("/", -1)) {
            if (part.isEmpty() || part.equals(".") || part.equals("..")) {
                return false;
            }
        }
        return true;
    }

    static State state(File gameDir, int installedVersion, Manifest manifest) {
        boolean any = false;
        boolean all = true;
        for (Entry e : manifest.files) {
            File f = new File(gameDir, e.path);
            if (f.isFile() && f.length() == e.size) {
                any = true;
            } else {
                all = false;
            }
        }
        return (any || installedVersion >= 0) ? !all ? State.INCOMPLETE : installedVersion < manifest.version ? State.OUTDATED : State.INSTALLED : State.MISSING;
    }

    static boolean verify(File gameDir, Manifest manifest, SharedPreferences cache) throws IOException {
        String sha;
        for (Entry e : manifest.files) {
            File f = new File(gameDir, e.path);
            if (!f.isFile() || f.length() != e.size) {
                return false;
            }
            String key = "kennel_sha:" + e.path;
            String stamp = f.length() + ":" + f.lastModified() + ":";
            String cached = cache.getString(key, "");
            if (cached.startsWith(stamp)) {
                sha = cached.substring(stamp.length());
            } else {
                try {
                    InputStream in = new FileInputStream(f);
                    try {
                        String sha2 = copyHashing(in, new OutputStream() { // from class: org.wiiucoop.bo2android.T6KennelPackage.1
                            @Override // java.io.OutputStream
                            public void write(int b) {
                            }
                        }, Long.MAX_VALUE);
                        cache.edit().putString(key, stamp + sha2).apply();
                        sha = sha2;
                    } finally {
                        in.close();
                    }
                } catch (IOException e2) {
                    return false;
                }
            }
            if (!sha.equals(e.sha256)) {
                return false;
            }
        }
        return true;
    }

    /* Reconstruído do bytecode (o jadx não decompilou este método): extrai as
     * entradas do ZIP para `root`, conferindo caminho, tamanho e sha256 do
     * manifesto antes de cada rename, e apaga os temporários ao final. */
    static void install(File zipPath, File root, Manifest manifest) throws IOException {
        Map<String, Entry> expected = new HashMap<>();
        for (Entry entry : manifest.files) {
            expected.put(entry.path, entry);
        }
        List<File> temporaries = new ArrayList<>();
        ZipFile zip = new ZipFile(zipPath);
        try {
            Enumeration<? extends ZipEntry> entries = zip.entries();
            while (entries.hasMoreElements()) {
                ZipEntry ze = entries.nextElement();
                if (ze.isDirectory()) {
                    continue;
                }
                if (expected.containsKey(ze.getName())) {
                    continue;
                }
                throw new IOException("entrada inesperada no pacote: " + ze.getName());
            }
            String rootPath = root.getCanonicalPath() + File.separator;
            for (Entry entry : manifest.files) {
                ZipEntry ze = zip.getEntry(entry.path);
                if (ze == null) {
                    throw new IOException("arquivo ausente no pacote: " + entry.path);
                }
                File target = new File(root, entry.path);
                if (!target.getCanonicalPath().startsWith(rootPath)) {
                    throw new IOException("caminho fora da pasta do jogo: " + entry.path);
                }
                File parent = target.getParentFile();
                if (parent != null && !parent.isDirectory() && !parent.mkdirs()) {
                    throw new IOException("não foi possível criar " + parent);
                }
                File temp = new File(target.getPath() + ".kennel.tmp");
                temporaries.add(temp);
                InputStream in = zip.getInputStream(ze);
                try {
                    FileOutputStream out = new FileOutputStream(temp);
                    try {
                        String sha = copyHashing(in, out, entry.size);
                        if (temp.length() != entry.size || !sha.equals(entry.sha256)) {
                            throw new IOException(entry.path + ": tamanho ou sha256 não confere");
                        }
                    } finally {
                        out.close();
                    }
                } finally {
                    in.close();
                }
                if (target.exists() && !target.delete()) {
                    throw new IOException("não foi possível substituir " + target);
                }
                if (!temp.renameTo(target)) {
                    throw new IOException("não foi possível instalar " + target);
                }
            }
        } finally {
            zip.close();
            for (File temp : temporaries) {
                temp.delete();
            }
        }
    }

    /* Reconstruído: o jadx embaralhou os blocos try/catch do original. */
    private static String copyHashing(InputStream in, OutputStream out, long limit) throws IOException {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] buf = new byte[65536];
            long total = 0;
            while (true) {
                int n = in.read(buf);
                if (n <= 0) {
                    StringBuilder sb = new StringBuilder();
                    for (byte b : md.digest()) {
                        sb.append(String.format(Locale.ROOT, "%02x", Byte.valueOf(b)));
                    }
                    return sb.toString();
                }
                total += n;
                if (total > limit) {
                    throw new IOException("entrada maior que o manifesto");
                }
                md.update(buf, 0, n);
                out.write(buf, 0, n);
            }
        } catch (NoSuchAlgorithmException e) {
            throw new IOException(e);
        }
    }
}
