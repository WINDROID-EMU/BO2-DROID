package org.wiiucoop.bo2android;

import android.content.SharedPreferences;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
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

    static Manifest parse(String json) throws JSONException, IOException {
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
                        in.close();
                        cache.edit().putString(key, stamp + sha2).apply();
                        sha = sha2;
                    } finally {
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

    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Removed duplicated region for block: B:126:0x023e A[LOOP:4: B:124:0x0238->B:126:0x023e, LOOP_END] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static void install(java.io.File r17, java.io.File r18, org.wiiucoop.bo2android.T6KennelPackage.Manifest r19) throws java.lang.Throwable {
        /*
            Method dump skipped, instructions count: 585
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.wiiucoop.bo2android.T6KennelPackage.install(java.io.File, java.io.File, org.wiiucoop.bo2android.T6KennelPackage$Manifest):void");
    }

    private static String copyHashing(InputStream in, OutputStream out, long limit) throws NoSuchAlgorithmException, IOException {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] buf = new byte[65536];
            long total = 0;
            while (true) {
                try {
                    int n = in.read(buf);
                    if (n > 0) {
                        total += n;
                        if (total > limit) {
                            throw new IOException("entrada maior que o manifesto");
                        }
                        md.update(buf, 0, n);
                        try {
                            out.write(buf, 0, n);
                        } catch (NoSuchAlgorithmException e) {
                            e = e;
                            throw new IOException(e);
                        }
                    } else {
                        StringBuilder sb = new StringBuilder();
                        for (byte b : md.digest()) {
                            sb.append(String.format(Locale.ROOT, "%02x", Byte.valueOf(b)));
                        }
                        return sb.toString();
                    }
                } catch (NoSuchAlgorithmException e2) {
                    e = e2;
                    throw new IOException(e);
                }
            }
        } catch (NoSuchAlgorithmException e3) {
            e = e3;
        }
    }
}
