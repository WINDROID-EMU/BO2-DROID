package org.wiiucoop.bo2android;

import android.content.res.AssetManager;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

/* loaded from: classes3.dex */
final class T6GuestImage {
    static final String MANIFEST = "guest/guest_images.properties";

    static final class Entry {
        final String sha256;
        final long size;

        Entry(long size, String sha256) {
            this.size = size;
            this.sha256 = sha256;
        }
    }

    static final class Result {
        final String detail;
        final boolean ready;

        Result(boolean ready, String detail) {
            this.ready = ready;
            this.detail = detail;
        }
    }

    private T6GuestImage() {
    }

    static String fileName(String mode) {
        if (T6Config.MODE_MP.equals(mode)) {
            return "t6mp_guest.elf";
        }
        if (T6Config.MODE_ZM.equals(mode)) {
            return "t6zm_guest.elf";
        }
        return null;
    }

    static Map<String, Entry> parseManifest(String text) throws NumberFormatException {
        Map<String, Entry> entries = new HashMap<>();
        if (text == null) {
            return entries;
        }
        for (String raw : text.split(T6PlayerName.TRAILING_NEWLINE)) {
            String line = raw.trim();
            int equals = line.indexOf(61);
            int comma = line.indexOf(44, equals + 1);
            if (!line.isEmpty() && !line.startsWith("#") && equals > 0 && comma >= 0) {
                String sha = line.substring(comma + 1).trim().toLowerCase(Locale.ROOT);
                try {
                    long size = Long.parseLong(line.substring(equals + 1, comma).trim());
                    if (size > 0 && sha.matches("[0-9a-f]{64}")) {
                        entries.put(line.substring(0, equals).trim(), new Entry(size, sha));
                    }
                } catch (NumberFormatException e) {
                }
            }
        }
        return entries;
    }

    static boolean matches(File file, Entry entry) throws IOException {
        if (!file.isFile() || file.length() != entry.size) {
            return false;
        }
        InputStream in = new FileInputStream(file);
        try {
            boolean zEquals = entry.sha256.equals(sha256(in, null));
            in.close();
            return zEquals;
        } catch (Throwable th) {
            try {
                in.close();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
            throw th;
        }
    }

    /* JADX WARN: Unreachable blocks removed: 2, instructions: 2 */
    static Result install(AssetManager assets, File filesDir, String mode) throws IOException, NumberFormatException {
        String name = fileName(mode);
        boolean z = false;
        if (name == null) {
            return new Result(false, "nenhum cliente selecionado; nenhuma imagem guest copiada");
        }
        Result updated = installedUpdate(filesDir, name);
        if (updated != null) {
            return updated;
        }
        try {
            InputStream in = assets.open(MANIFEST);
            try {
                Map<String, Entry> manifest = parseManifest(new String(readAll(in), StandardCharsets.UTF_8));
                if (in != null) {
                    try {
                        in.close();
                    } catch (FileNotFoundException e) {
                        return new Result(z, "esta compilação não empacota imagens guest (sem -Pt6GuestLoadcheck)");
                    } catch (IOException e2) {
                        e = e2;
                        return new Result(false, "não foi possível ler guest/guest_images.properties: " + e.getMessage());
                    }
                }
                Entry entry = manifest.get(name);
                if (entry == null) {
                    return new Result(false, "guest/guest_images.properties não descreve " + name);
                }
                File dir = new File(filesDir, "guest");
                File target = new File(dir, name);
                File partial = new File(dir, name + ".partial");
                try {
                } catch (IOException e3) {
                    e = e3;
                }
                try {
                    if (matches(target, entry)) {
                        return new Result(true, target.getAbsolutePath() + " já corresponde ao APK (" + entry.size + " bytes, sha256=" + entry.sha256 + ")");
                    }
                    if (!dir.isDirectory() && !dir.mkdirs()) {
                        return new Result(false, "não foi possível criar " + dir.getAbsolutePath());
                    }
                    InputStream in2 = assets.open("guest/" + name);
                    try {
                        OutputStream out = new FileOutputStream(partial);
                        try {
                            String copied = sha256(in2, out);
                            out.close();
                            if (in2 != null) {
                                in2.close();
                            }
                            long length = partial.length();
                            if (length != entry.size || !entry.sha256.equals(copied)) {
                                String str = ")";
                                partial.delete();
                                return new Result(false, "a cópia de assets/guest/" + name + " não confere com o manifesto (" + length + " bytes, sha256=" + copied + str);
                            }
                            if (partial.renameTo(target)) {
                                return new Result(true, target.getAbsolutePath() + " copiada do APK e verificada (" + entry.size + " bytes, sha256=" + entry.sha256 + ")");
                            }
                            partial.delete();
                            return new Result(false, "não foi possível mover a imagem para " + target.getAbsolutePath());
                        } finally {
                        }
                    } finally {
                    }
                } catch (IOException e4) {
                    e = e4;
                    partial.delete();
                    return new Result(false, "falha ao copiar " + name + ": " + e.getMessage());
                }
            } catch (Throwable e5) {
                if (in == null) {
                    throw e5;
                }
                try {
                    in.close();
                    throw e5;
                } catch (Throwable th) {
                    try {
                        e5.addSuppressed(th);
                        throw e5;
                    } catch (FileNotFoundException e6) {
                        z = false;
                        return new Result(z, "esta compilação não empacota imagens guest (sem -Pt6GuestLoadcheck)");
                    } catch (IOException e7) {
                        e = e7;
                        return new Result(false, "não foi possível ler guest/guest_images.properties: " + e.getMessage());
                    }
                }
            }
        } catch (FileNotFoundException e8) {
            z = false;
        } catch (IOException e9) {
            e = e9;
            return new Result(false, "não foi possível ler guest/guest_images.properties: " + e.getMessage());
        }
    }

    static boolean updateVerifies(File filesDir) throws IOException {
        File dir = new File(filesDir, "guest");
        try {
            InputStream in = new FileInputStream(new File(dir, "guest_images.update.list"));
            try {
                Map<String, Entry> entries = parseManifest(new String(readAll(in), StandardCharsets.UTF_8));
                if (entries.isEmpty()) {
                    in.close();
                    return false;
                }
                for (Map.Entry<String, Entry> e : entries.entrySet()) {
                    if (!matches(new File(dir, e.getKey()), e.getValue())) {
                        in.close();
                        return false;
                    }
                }
                in.close();
                return true;
            } finally {
            }
        } catch (IOException e2) {
            return false;
        }
    }

    private static Result installedUpdate(File filesDir, String name) throws IOException, NumberFormatException {
        int updateCode;
        int i;
        InputStream in;
        Entry entry;
        File target;
        Properties update = T6Updater.sourceManifest(filesDir);
        boolean z = false;
        if (update == null) {
            i = 0;
        } else {
            try {
                i = Integer.parseInt(update.getProperty("sourceCode", T6EngineCommand.VALUE_OFF).trim());
            } catch (NumberFormatException e) {
                updateCode = 0;
            }
        }
        updateCode = i;
        if (updateCode > 0) {
            z = true;
        }
        if (!T6SourceState.useUpdate(updateCode, z, 8)) {
            return null;
        }
        File dir = new File(filesDir, "guest");
        try {
            in = new FileInputStream(new File(dir, "guest_images.update.list"));
            try {
                entry = parseManifest(new String(readAll(in), StandardCharsets.UTF_8)).get(name);
                target = new File(dir, name);
            } finally {
            }
        } catch (IOException e2) {
        }
        if (entry != null && matches(target, entry)) {
            Result result = new Result(true, target.getAbsolutePath() + " da source " + update.getProperty("sourceVersion") + " verificada (sha256=" + entry.sha256 + ")");
            in.close();
            return result;
        }
        in.close();
        return null;
    }

    private static String sha256(InputStream in, OutputStream copy) throws NoSuchAlgorithmException, IOException {
        int i;
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] buffer = new byte[65536];
            while (true) {
                int count = in.read(buffer);
                if (count <= 0) {
                    break;
                }
                digest.update(buffer, 0, count);
                if (copy != null) {
                    copy.write(buffer, 0, count);
                }
            }
            StringBuilder hex = new StringBuilder();
            for (byte b : digest.digest()) {
                hex.append(String.format(Locale.ROOT, "%02x", Byte.valueOf(b)));
            }
            return hex.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new IOException("SHA-256 indisponível", e);
        }
    }

    private static byte[] readAll(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        while (true) {
            int count = in.read(buffer);
            if (count > 0) {
                out.write(buffer, 0, count);
            } else {
                return out.toByteArray();
            }
        }
    }
}
