package org.wiiucoop.bo2android;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.Locale;

/* loaded from: classes3.dex */
public final class T6PlayerName {
    public static final int CLIENT_MAX_BYTES = 15;
    public static final int CLIENT_MIN_LENGTH = 4;
    public static final String CLIENT_PLACEHOLDER = "unknown soldier";
    public static final String FILE_NAME = "playername.txt";
    public static final String TRAILING_NEWLINE = "\n";

    public enum Outcome {
        SAVED,
        NO_FOLDER,
        EMPTY,
        TOO_SHORT,
        PLACEHOLDER,
        WRITE_FAILED,
        NOT_VERIFIED
    }

    public interface Store {
        String describe();

        boolean exists() throws IOException;

        InputStream openRead() throws IOException;

        OutputStream openWrite() throws IOException;

        boolean ready();
    }

    public static final class Result {
        public final String message;
        public final String name;
        public final Outcome outcome;
        public final boolean saved;

        Result(Outcome outcome, String name, String message) {
            this.outcome = outcome;
            this.saved = outcome == Outcome.SAVED;
            this.name = name;
            this.message = message == null ? "" : message;
        }
    }

    private T6PlayerName() {
    }

    public static String sanitize(String raw) {
        if (raw == null) {
            return "";
        }
        StringBuilder out = new StringBuilder(raw.length());
        boolean pendingSpace = false;
        int index = 0;
        while (index < raw.length()) {
            int codePoint = raw.codePointAt(index);
            index += Character.charCount(codePoint);
            if (codePoint == 13 || codePoint == 10 || codePoint == 9) {
                pendingSpace = out.length() > 0;
            } else if (!Character.isISOControl(codePoint) && codePoint != 34 && codePoint != 92 && codePoint != 59) {
                if (pendingSpace) {
                    out.append(' ');
                    pendingSpace = false;
                }
                out.appendCodePoint(codePoint);
            }
        }
        String text = out.toString().trim();
        return capToClientBuffer(text.replace((char) 160, ' ').trim());
    }

    private static String capToClientBuffer(String text) {
        if (text.getBytes(StandardCharsets.UTF_8).length <= 15) {
            return text;
        }
        int bytes = 0;
        int index = 0;
        while (index < text.length()) {
            int codePoint = text.codePointAt(index);
            int size = utf8Length(codePoint);
            if (bytes + size > 15) {
                break;
            }
            bytes += size;
            index += Character.charCount(codePoint);
        }
        return text.substring(0, index).trim();
    }

    private static int utf8Length(int codePoint) {
        if (codePoint < 128) {
            return 1;
        }
        if (codePoint < 2048) {
            return 2;
        }
        if (codePoint < 65536) {
            return 3;
        }
        return 4;
    }

    public static Outcome clientRejectionOutcome(String name) {
        if (countCodePoints(name) < 4) {
            return Outcome.TOO_SHORT;
        }
        if (name.toLowerCase(Locale.ROOT).contains(CLIENT_PLACEHOLDER)) {
            return Outcome.PLACEHOLDER;
        }
        return null;
    }

    public static String clientRejection(String name) {
        if (countCodePoints(name) < 4) {
            return "O cliente descarta nomes com menos de 4 caracteres; nada foi gravado.";
        }
        if (name.toLowerCase(Locale.ROOT).contains(CLIENT_PLACEHOLDER)) {
            return "O cliente trata \"Unknown Soldier\" como nome ausente; escolha outro nome.";
        }
        return "";
    }

    public static String load(Store store, String fallback) {
        if (store == null || !store.ready()) {
            return fallback == null ? "" : fallback;
        }
        try {
            if (!store.exists()) {
                return fallback == null ? "" : fallback;
            }
            String text = new String(readAll(store.openRead()), StandardCharsets.UTF_8);
            String name = sanitize(text);
            return name.isEmpty() ? fallback == null ? "" : fallback : name;
        } catch (IOException | SecurityException e) {
            return fallback == null ? "" : fallback;
        }
    }

    public static Result save(Store store, String raw) {
        String name = sanitize(raw);
        if (store == null || !store.ready()) {
            return new Result(Outcome.NO_FOLDER, name, "A pasta do jogo não está definida ou a permissão foi revogada; o nome não foi gravado.");
        }
        if (name.isEmpty()) {
            return new Result(Outcome.EMPTY, "", "O nome não pode ficar vazio; nada foi gravado.");
        }
        String rejection = clientRejection(name);
        if (!rejection.isEmpty()) {
            return new Result(clientRejectionOutcome(name), name, rejection);
        }
        try {
            byte[] bytes = (name + TRAILING_NEWLINE).getBytes(StandardCharsets.UTF_8);
            OutputStream out = store.openWrite();
            try {
                out.write(bytes);
                out.flush();
            } finally {
                if (out != null) {
                    out.close();
                }
            }
            try {
                InputStream in = store.openRead();
                try {
                    String stored = sanitize(new String(readAll(in), StandardCharsets.UTF_8));
                    if (!stored.equals(name)) {
                        return new Result(Outcome.NOT_VERIFIED, name, "O arquivo foi gravado, mas a leitura devolveu outro conteúdo; não foi considerado salvo.");
                    }
                    return new Result(Outcome.SAVED, name, "Nome salvo em playername.txt (" + store.describe() + ").");
                } finally {
                    if (in != null) {
                        in.close();
                    }
                }
            } catch (IOException | SecurityException e) {
                return new Result(Outcome.NOT_VERIFIED, name, "O arquivo foi criado mas não pôde ser lido de volta: " + e);
            }
        } catch (IOException | SecurityException e2) {
            return new Result(Outcome.WRITE_FAILED, name, "Não foi possível gravar playername.txt: " + e2);
        }
    }

    public static String engineNote() {
        return "O cliente lê este arquivo na pasta do jogo (CL_PlayerNameFile_NotRetail). O motor ainda não executa nesta compilação, então o nome não chega a uma partida.";
    }

    private static byte[] readAll(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[512];
        while (true) {
            int read = in.read(buffer);
            if (read > 0) {
                out.write(buffer, 0, read);
            } else {
                return out.toByteArray();
            }
        }
    }

    private static int countCodePoints(String text) {
        return text.codePointCount(0, text.length());
    }
}
