package org.wiiucoop.bo2android;

import android.net.Uri;
import android.os.SystemClock;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;
import java.util.Properties;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import org.json.JSONException;
import org.json.JSONObject;
import org.wiiucoop.bo2android.T6GuestImage;
import org.wiiucoop.bo2android.T6KennelPackage;

/* loaded from: classes3.dex */
final class T6Updater {
    private static final int DOWNLOAD_ATTEMPTS = 8;
    private static final String GATEWAY = "https://t6requiem-update.soldadoghostzm.workers.dev/v1/public";
    static final String SOURCE_MANIFEST = "guest_images.update.properties";
    private static final long STALL_BYTES_PER_SECOND = 262144;
    private static final long STALL_GRACE_MS = 3000;
    private static final long STALL_WINDOW_MS = 4000;
    private final File cacheDir;
    private final File filesDir;
    private final int installedApkCode;

    /* JADX INFO: Access modifiers changed from: private */
    interface Bytes {
        void on(long j, long j2);
    }

    interface Progress {
        void onProgress(String str, long j, long j2);
    }

    private enum Result {
        DONE,
        STALLED
    }

    static final class Component {
        final String asset;
        final int code;
        final int minApkCode;
        final String sha256;
        final String tag;
        final String version;

        Component(JSONObject o) {
            this.version = o.optString("version", "");
            this.code = o.optInt("code", 0);
            this.tag = o.optString("tag", "");
            this.asset = o.optString("asset", "");
            this.sha256 = o.optString("sha256", "").toLowerCase();
            this.minApkCode = o.optInt("minApkCode", 0);
        }
    }

    static final class Check {
        Component apk;
        Component source;
        String sourceCurrent = "";

        Check() {
        }

        boolean any() {
            return (this.apk == null && this.source == null) ? false : true;
        }
    }

    T6Updater(File filesDir, File cacheDir, int installedApkCode) {
        this.filesDir = filesDir;
        this.cacheDir = cacheDir;
        this.installedApkCode = installedApkCode;
    }

    String kennelManifestText() throws IOException {
        return new String(download("https://t6requiem-update.soldadoghostzm.workers.dev/v1/public/kennel/kennel.json", null, null), StandardCharsets.UTF_8);
    }

    File downloadKennel(T6KennelPackage.Manifest m, Progress progress) throws Throwable {
        File zip = new File(this.cacheDir, m.asset);
        if (zip.isFile() && zip.length() == m.size && m.sha256.equals(sha256(zip))) {
            return zip;
        }
        downloadTo("https://t6requiem-update.soldadoghostzm.workers.dev/v1/public/kennel/asset/" + Uri.encode(m.asset), zip, m.sha256, progress, m.asset);
        if (zip.length() != m.size) {
            zip.delete();
            throw new IOException(m.asset + ": tamanho não confere");
        }
        return zip;
    }

    static boolean configured() {
        return !BuildConfig.T6_UPDATE_URL.isEmpty();
    }

    Check check() throws IOException {
        JSONObject manifest = json(new String(download(assetUrl("latest", "version.json"), null, null), StandardCharsets.UTF_8));
        Check result = new Check();
        result.sourceCurrent = installedSourceVersion();
        try {
            if (manifest.has("apk")) {
                Component apk = new Component(manifest.getJSONObject("apk"));
                if (apk.code > this.installedApkCode) {
                    result.apk = apk;
                }
            }
            if (manifest.has("source")) {
                Component source = new Component(manifest.getJSONObject("source"));
                boolean apkReady = source.minApkCode <= this.installedApkCode;
                if (T6SourceState.offerRemote(source.code, source.minApkCode, this.installedApkCode, installedSourceCode())) {
                    result.source = source;
                }
                if (!apkReady && result.apk == null) {
                    throw new IOException("a source " + source.version + " exige um launcher mais novo");
                }
            }
            return result;
        } catch (JSONException e) {
            throw new IOException("version.json inválido: " + e.getMessage());
        }
    }

    int installedSourceCode() throws IOException {
        Properties p = sourceManifest(this.filesDir);
        boolean verifies = false;
        int updateCode = p == null ? 0 : parseInt(p.getProperty("sourceCode"));
        if (updateCode > 0 && T6GuestImage.updateVerifies(this.filesDir)) {
            verifies = true;
        }
        return T6SourceState.installedCode(updateCode, verifies, 8);
    }

    String installedSourceVersion() throws IOException {
        Properties p = sourceManifest(this.filesDir);
        return (p == null || installedSourceCode() != parseInt(p.getProperty("sourceCode"))) ? "" : p.getProperty("sourceVersion", "");
    }

    static Properties sourceManifest(File filesDir) throws IOException {
        File f = new File(new File(filesDir, "guest"), SOURCE_MANIFEST);
        if (!f.isFile()) {
            return null;
        }
        Properties p = new Properties();
        try {
            InputStream in = new FileInputStream(f);
            try {
                p.load(in);
                in.close();
                return p;
            } finally {
            }
        } catch (IOException e) {
            return null;
        }
    }

    void installSource(Component source, Progress progress) throws Throwable {
        int i;
        File oldManifest = new File(this.cacheDir, "update-source.zip");
        downloadTo(assetUrl(source.tag, source.asset), oldManifest, source.sha256, progress, "source");
        File dir = new File(this.filesDir, "guest");
        File staging = new File(this.filesDir, "guest.update");
        deleteTree(staging);
        if (!staging.mkdirs()) {
            throw new IOException("não foi possível criar " + staging);
        }
        try {
            ZipInputStream in = new ZipInputStream(new FileInputStream(oldManifest));
            try {
                byte[] buf = new byte[65536];
                while (true) {
                    ZipEntry e = in.getNextEntry();
                    if (e == null) {
                        break;
                    }
                    if (!e.isDirectory()) {
                        String name = new File(e.getName()).getName();
                        OutputStream out = new FileOutputStream(new File(staging, name));
                        while (true) {
                            try {
                                int n = in.read(buf);
                                if (n <= 0) {
                                    break;
                                } else {
                                    out.write(buf, 0, n);
                                }
                            } catch (Throwable th) {
                                try {
                                    out.close();
                                    throw th;
                                } catch (Throwable th2) {
                                    th.addSuppressed(th2);
                                    throw th;
                                }
                            }
                        }
                        out.close();
                    }
                }
                in.close();
                oldManifest.delete();
                File images = new File(staging, "guest_images.properties");
                if (!images.isFile()) {
                    throw new IOException("o pacote não contém guest_images.properties");
                }
                InputStream in2 = new FileInputStream(images);
                try {
                    Map<String, T6GuestImage.Entry> entries = T6GuestImage.parseManifest(new String(readAll(in2), StandardCharsets.UTF_8));
                    in2.close();
                    for (Map.Entry<String, T6GuestImage.Entry> entry : entries.entrySet()) {
                        if (!T6GuestImage.matches(new File(staging, entry.getKey()), entry.getValue())) {
                            throw new IOException(entry.getKey() + " não confere com o manifesto do pacote");
                        }
                    }
                    if (!dir.isDirectory() && !dir.mkdirs()) {
                        throw new IOException("não foi possível criar " + dir);
                    }
                    oldManifest = new File(dir, SOURCE_MANIFEST);
                    if (oldManifest.exists() && !oldManifest.delete()) {
                        throw new IOException("não foi possível remover " + oldManifest);
                    }
                    for (File f : staging.listFiles()) {
                        File target = new File(dir, f.getName().equals("guest_images.properties") ? "guest_images.update.list" : f.getName());
                        if (!f.renameTo(target)) {
                            throw new IOException("não foi possível mover " + f.getName());
                        }
                    }
                    deleteTree(staging);
                    Properties p = new Properties();
                    p.setProperty("sourceVersion", source.version);
                    p.setProperty("sourceCode", Integer.toString(source.code));
                    p.setProperty("apkCode", Integer.toString(this.installedApkCode));
                    OutputStream out2 = new FileOutputStream(new File(dir, SOURCE_MANIFEST));
                    try {
                        p.store(out2, "T6Requiem source update");
                        out2.close();
                    } finally {
                    }
                } finally {
                }
            } finally {
            }
        } finally {
            oldManifest.delete();
        }
    }

    File downloadApk(Component apk, Progress progress) throws Throwable {
        File dir = new File(this.cacheDir, "updates");
        if (!dir.isDirectory() && !dir.mkdirs()) {
            throw new IOException("não foi possível criar " + dir);
        }
        File file = new File(dir, "launcher.apk");
        downloadTo(assetUrl(apk.tag, apk.asset), file, apk.sha256, progress, "launcher");
        return file;
    }

    private String assetUrl(String tag, String asset) {
        return "latest".equals(tag) ? "https://t6requiem-update.soldadoghostzm.workers.dev/v1/public/version.json" : "https://t6requiem-update.soldadoghostzm.workers.dev/v1/public/asset/" + Uri.encode(tag) + "/" + Uri.encode(asset);
    }

    /* JADX WARN: Removed duplicated region for block: B:52:0x01dc A[LOOP:1: B:14:0x006e->B:52:0x01dc, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:65:0x01e5 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void downloadTo(java.lang.String r27, final java.io.File r28, java.lang.String r29, final org.wiiucoop.bo2android.T6Updater.Progress r30, final java.lang.String r31) throws java.lang.Throwable {
        /*
            Method dump skipped, instructions count: 511
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.wiiucoop.bo2android.T6Updater.downloadTo(java.lang.String, java.io.File, java.lang.String, org.wiiucoop.bo2android.T6Updater$Progress, java.lang.String):void");
    }

    static /* synthetic */ boolean lambda$downloadTo$0(File file, File partial, File d, String n) {
        return n.startsWith(new StringBuilder().append(file.getName()).append(".").toString()) && n.endsWith(".partial") && !n.equals(partial.getName());
    }

    static /* synthetic */ void lambda$downloadTo$1(Progress progress, long[] lastReport, String what, long done, long total) {
        long now = SystemClock.elapsedRealtime();
        if (progress != null) {
            if (now - lastReport[0] >= 250 || done == total) {
                lastReport[0] = now;
                progress.onProgress(what, done, total);
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:49:0x0136, code lost:
    
        r22 = org.wiiucoop.bo2android.T6Updater.Result.STALLED;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x0138, code lost:
    
        r0.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x013b, code lost:
    
        if (r31 == null) goto L53;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x013d, code lost:
    
        r31.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x0140, code lost:
    
        r5.disconnect();
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x0143, code lost:
    
        return r22;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:129:0x01ab A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:136:? A[Catch: all -> 0x01b5, SYNTHETIC, TRY_LEAVE, TryCatch #6 {all -> 0x01b5, blocks: (B:52:0x013d, B:94:0x01b4, B:93:0x01b1, B:62:0x0159, B:68:0x0167, B:69:0x0189, B:70:0x018a, B:89:0x01ab), top: B:122:0x00d8, inners: #10 }] */
    /* JADX WARN: Type inference failed for: r31v0, types: [long] */
    /* JADX WARN: Type inference failed for: r31v3 */
    /* JADX WARN: Type inference failed for: r31v4 */
    /* JADX WARN: Type inference failed for: r31v5 */
    /* JADX WARN: Type inference failed for: r31v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private org.wiiucoop.bo2android.T6Updater.Result fetchInto(java.lang.String r29, java.io.File r30, long r31, org.wiiucoop.bo2android.T6Updater.Bytes r33) throws java.lang.Throwable {
        /*
            Method dump skipped, instructions count: 504
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.wiiucoop.bo2android.T6Updater.fetchInto(java.lang.String, java.io.File, long, org.wiiucoop.bo2android.T6Updater$Bytes):org.wiiucoop.bo2android.T6Updater$Result");
    }

    private static byte[] download(String url, OutputStream sink, Bytes bytes) throws Throwable {
        Throwable th;
        ByteArrayOutputStream memory = sink == null ? new ByteArrayOutputStream() : null;
        OutputStream out = sink == null ? memory : sink;
        String url2 = url;
        for (int hop = 0; hop < 5; hop++) {
            HttpURLConnection c = (HttpURLConnection) new URL(url2).openConnection();
            int i = 0;
            c.setInstanceFollowRedirects(false);
            c.setConnectTimeout(15000);
            c.setReadTimeout(30000);
            c.setRequestProperty("Accept-Encoding", "identity");
            if (url2.startsWith(GATEWAY) && !"".isEmpty()) {
                c.setRequestProperty("X-T6-Channel-Key", "");
            }
            int code = c.getResponseCode();
            if (code >= 300 && code < 400) {
                url2 = c.getHeaderField("Location");
                c.disconnect();
                if (url2 == null) {
                    throw new IOException("redirecionamento sem destino");
                }
            } else {
                if (code != 200) {
                    c.disconnect();
                    throw new IOException("HTTP " + code + (code == 404 ? " (canal, release ou chave inválida)" : ""));
                }
                long total = c.getContentLengthLong();
                try {
                    InputStream in = c.getInputStream();
                    try {
                        try {
                            byte[] buf = new byte[T6TouchLayout.CONSOLE];
                            long done = 0;
                            while (true) {
                                int n = in.read(buf);
                                if (n <= 0) {
                                    break;
                                }
                                out.write(buf, i, n);
                                int code2 = code;
                                done += n;
                                if (bytes != null) {
                                    try {
                                        bytes.on(done, total);
                                    } catch (Throwable th2) {
                                        th = th2;
                                        if (in == null) {
                                            throw th;
                                        }
                                        try {
                                            in.close();
                                            throw th;
                                        } catch (Throwable th3) {
                                            th.addSuppressed(th3);
                                            throw th;
                                        }
                                    }
                                }
                                i = 0;
                                code = code2;
                            }
                            if (in != null) {
                                in.close();
                            }
                            c.disconnect();
                            if (memory == null) {
                                return null;
                            }
                            return memory.toByteArray();
                        } catch (Throwable th4) {
                            th = th4;
                            c.disconnect();
                            throw th;
                        }
                    } catch (Throwable th5) {
                        th = th5;
                    }
                } catch (Throwable th6) {
                    th = th6;
                }
            }
        }
        throw new IOException("redirecionamentos demais");
    }

    private static JSONObject json(String text) throws IOException {
        try {
            return new JSONObject(text);
        } catch (JSONException e) {
            throw new IOException("JSON inválido: " + e.getMessage());
        }
    }

    private static int parseInt(String s) {
        if (s == null) {
            return 0;
        }
        try {
            return Integer.parseInt(s.trim());
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private static String sha256(File file) throws IOException {
        int i;
        try {
            InputStream in = new FileInputStream(file);
            try {
                MessageDigest d = MessageDigest.getInstance("SHA-256");
                byte[] buf = new byte[65536];
                while (true) {
                    int n = in.read(buf);
                    if (n <= 0) {
                        break;
                    }
                    d.update(buf, 0, n);
                }
                StringBuilder sb = new StringBuilder();
                for (byte b : d.digest()) {
                    sb.append(String.format("%02x", Byte.valueOf(b)));
                }
                String string = sb.toString();
                in.close();
                return string;
            } finally {
            }
        } catch (NoSuchAlgorithmException e) {
            throw new IOException(e);
        }
    }

    private static byte[] readAll(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buf = new byte[8192];
        while (true) {
            int n = in.read(buf);
            if (n <= 0) {
                return out.toByteArray();
            }
            out.write(buf, 0, n);
        }
    }

    private static void deleteTree(File f) {
        File[] children = f.listFiles();
        if (children != null) {
            for (File c : children) {
                deleteTree(c);
            }
        }
        f.delete();
    }
}
