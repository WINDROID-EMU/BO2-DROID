package org.wiiucoop.bo2android;

/* loaded from: classes3.dex */
public final class T6SessionState {
    public static final T6SessionState UNAVAILABLE = new T6SessionState(State.UNKNOWN, 0, false, false);
    public final boolean answered;
    public final boolean engineAttached;
    public final long frames;
    public final State state;

    public enum State {
        IDLE,
        RUNNING,
        FINISHED,
        UNKNOWN
    }

    private T6SessionState(State state, long frames, boolean engineAttached, boolean answered) {
        this.state = state;
        this.frames = frames;
        this.engineAttached = engineAttached;
        this.answered = answered;
    }

    public boolean isHostRunning() {
        return this.state == State.RUNNING;
    }

    public static T6SessionState read() {
        return parse(T6Native.sessionState());
    }

    public static T6SessionState parse(String text) throws NumberFormatException {
        if (text == null || text.trim().isEmpty()) {
            return UNAVAILABLE;
        }
        State state = State.UNKNOWN;
        long frames = 0;
        boolean engineAttached = false;
        boolean sawState = false;
        for (String rawLine : text.split(T6PlayerName.TRAILING_NEWLINE)) {
            String line = rawLine.trim();
            int separator = line.indexOf(61);
            if (separator > 0) {
                String key = line.substring(0, separator).trim();
                String value = line.substring(separator + 1).trim();
                if ("state".equals(key)) {
                    sawState = true;
                    state = stateOf(value);
                } else if ("frames".equals(key)) {
                    frames = parseFrames(value);
                } else if ("engine".equals(key)) {
                    engineAttached = "attached".equals(value);
                }
            }
        }
        return new T6SessionState(state, frames, engineAttached, sawState);
    }

    private static State stateOf(String value) {
        if ("running".equals(value)) {
            return State.RUNNING;
        }
        if ("idle".equals(value)) {
            return State.IDLE;
        }
        if ("finished".equals(value)) {
            return State.FINISHED;
        }
        return State.UNKNOWN;
    }

    private static long parseFrames(String value) throws NumberFormatException {
        try {
            long frames = Long.parseLong(value);
            if (frames < 0) {
                return 0L;
            }
            return frames;
        } catch (NumberFormatException e) {
            return 0L;
        }
    }
}
