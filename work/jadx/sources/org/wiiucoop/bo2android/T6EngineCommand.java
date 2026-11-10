package org.wiiucoop.bo2android;

/* loaded from: classes3.dex */
public final class T6EngineCommand {
    public static final String DVAR_FPS_OVERLAY = "cg_drawfps";
    public static final String VALUE_OFF = "0";
    public static final String VALUE_ON = "1";

    public static final class Result {
        public final boolean accepted;
        public final boolean answered;
        public final boolean applied;
        public final int pending;
        public final String reason;

        Result(boolean accepted, boolean applied, int pending, String reason, boolean answered) {
            this.accepted = accepted;
            this.applied = applied;
            this.pending = pending;
            this.reason = reason == null ? "" : reason;
            this.answered = answered;
        }

        public boolean isApplied() {
            return this.applied;
        }
    }

    private T6EngineCommand() {
    }

    public static Result setFpsOverlay(boolean enabled) {
        return requestDvar(DVAR_FPS_OVERLAY, enabled ? VALUE_ON : VALUE_OFF);
    }

    public static Result requestDvar(String name, String value) throws NumberFormatException {
        String str;
        String answer = T6Native.submitDvar(name, value);
        Result result = parse(answer);
        if (result.answered) {
            return result;
        }
        if (T6Native.isLibraryLoaded()) {
            str = "a libt6host.so não respondeu ao pedido; nada foi enviado ao motor";
        } else {
            str = "a libt6host.so não está carregada neste processo; nada foi enviado ao motor";
        }
        return new Result(false, false, 0, str, false);
    }

    public static Result parse(String text) throws NumberFormatException {
        if (text == null || text.trim().isEmpty()) {
            return new Result(false, false, 0, "", false);
        }
        boolean sawAccepted = false;
        boolean accepted = false;
        boolean applied = false;
        int pending = 0;
        String reason = "";
        String[] strArrSplit = text.split(T6PlayerName.TRAILING_NEWLINE);
        int length = strArrSplit.length;
        int i = 0;
        int i2 = 0;
        while (i2 < length) {
            String rawLine = strArrSplit[i2];
            String line = rawLine.trim();
            int separator = line.indexOf(61);
            if (separator > 0) {
                String key = line.substring(i, separator).trim();
                String value = line.substring(separator + 1).trim();
                if ("accepted".equals(key)) {
                    sawAccepted = true;
                    accepted = "true".equals(value);
                } else if ("applied".equals(key)) {
                    applied = "true".equals(value);
                } else if ("pending".equals(key)) {
                    pending = parseCount(value);
                } else if ("reason".equals(key)) {
                    reason = value;
                }
            }
            i2++;
            i = 0;
        }
        return new Result(accepted, applied && accepted, pending, reason, sawAccepted);
    }

    public static String describe(Result result, String name, String value) {
        StringBuilder text = new StringBuilder();
        text.append(name).append(' ').append(value).append(" — ");
        if (result.applied) {
            text.append("aplicado pelo motor");
        } else if (result.accepted) {
            text.append("NÃO aplicado ao motor (aguardando o motor)");
        } else {
            text.append("NÃO aplicado ao motor");
        }
        if (!result.reason.isEmpty()) {
            text.append(T6PlayerName.TRAILING_NEWLINE).append(result.reason);
        }
        return text.toString();
    }

    public static boolean queuedForEngine(Result result) {
        return result.accepted && !result.applied;
    }

    private static int parseCount(String value) throws NumberFormatException {
        try {
            int count = Integer.parseInt(value);
            if (count < 0) {
                return 0;
            }
            return count;
        } catch (NumberFormatException e) {
            return 0;
        }
    }
}
