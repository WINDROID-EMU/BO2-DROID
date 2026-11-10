package org.wiiucoop.bo2android;

/* loaded from: classes3.dex */
public final class T6Native {
    private static final String LIBRARY = "libt6host.so";
    private static String loadFailure;
    private static boolean loaded;

    private static native int nativeClientState();

    private static native int nativeConnectedPads();

    private static native boolean nativeEngineRuntimeAvailable(String str);

    private static native String nativeEngineRuntimeReason(String str);

    private static native String nativeHostBuild();

    private static native boolean nativeSendKey(int i);

    private static native boolean nativeSendKeyState(int i, boolean z);

    private static native String nativeSessionState();

    private static native void nativeSetNetwork(long j);

    private static native void nativeSetTextInput(boolean z);

    private static native void nativeSetTouchPad(boolean z, int i, int i2, int i3, int i4, int i5, int i6, int i7);

    private static native String nativeSubmitDvar(String str, String str2);

    private static native void nativeTouch(int i, int i2, float f, float f2);

    static {
        loadFailure = "";
        try {
            System.loadLibrary("t6host");
            loaded = true;
        } catch (RuntimeException | UnsatisfiedLinkError e) {
            loaded = false;
            loadFailure = describe(e);
        }
    }

    private T6Native() {
    }

    public static void setNetwork(long handle) {
        if (!loaded) {
            return;
        }
        try {
            nativeSetNetwork(handle);
        } catch (LinkageError e) {
        } catch (RuntimeException e2) {
        }
    }

    public static boolean isLibraryLoaded() {
        return loaded;
    }

    public static boolean isEngineRuntimeAvailable(String mode) {
        if (!loaded) {
            return false;
        }
        try {
            return nativeEngineRuntimeAvailable(modeOrNone(mode));
        } catch (LinkageError | RuntimeException e) {
            return false;
        }
    }

    public static String engineRuntimeReason(String mode) {
        if (!loaded) {
            return "libt6host.so não pôde ser carregada neste aparelho" + (loadFailure.isEmpty() ? "." : ": " + loadFailure);
        }
        try {
            String reason = nativeEngineRuntimeReason(modeOrNone(mode));
            return reason == null ? "" : reason;
        } catch (LinkageError e) {
            return "A libt6host.so foi carregada, mas esta build não exporta nativeEngineRuntimeReason: " + describe(e);
        } catch (RuntimeException e2) {
            return "O host nativo falhou ao responder sobre o runtime do motor: " + describe(e2);
        }
    }

    public static String sessionState() {
        if (!loaded) {
            return "";
        }
        try {
            String answer = nativeSessionState();
            return answer == null ? "" : answer;
        } catch (LinkageError | RuntimeException e) {
            return "";
        }
    }

    public static String submitDvar(String name, String value) {
        if (!loaded) {
            return "";
        }
        try {
            String answer = nativeSubmitDvar(name, value);
            return answer == null ? "" : answer;
        } catch (LinkageError | RuntimeException e) {
            return "";
        }
    }

    public static boolean setTextInput(boolean on) {
        if (!loaded) {
            return false;
        }
        try {
            nativeSetTextInput(on);
            return true;
        } catch (LinkageError | RuntimeException e) {
            return false;
        }
    }

    public static boolean sendKey(int virtualKey) {
        if (!loaded) {
            return false;
        }
        try {
            return nativeSendKey(virtualKey);
        } catch (LinkageError | RuntimeException e) {
            return false;
        }
    }

    public static boolean sendKeyState(int virtualKey, boolean down) {
        if (!loaded) {
            return false;
        }
        try {
            return nativeSendKeyState(virtualKey, down);
        } catch (LinkageError | RuntimeException e) {
            return false;
        }
    }

    public static void setTouchPad(boolean active, int buttons, int leftTrigger, int rightTrigger, int lx, int ly, int rx, int ry) {
        if (!loaded) {
            return;
        }
        try {
            nativeSetTouchPad(active, buttons, leftTrigger, rightTrigger, lx, ly, rx, ry);
        } catch (LinkageError e) {
        } catch (RuntimeException e2) {
        }
    }

    public static int connectedPads() {
        if (!loaded) {
            return -1;
        }
        try {
            return nativeConnectedPads();
        } catch (LinkageError | RuntimeException e) {
            return -1;
        }
    }

    public static void touch(int action, int finger, float nx, float ny) {
        if (!loaded) {
            return;
        }
        try {
            nativeTouch(action, finger, nx, ny);
        } catch (LinkageError e) {
        } catch (RuntimeException e2) {
        }
    }

    public static int clientState() {
        if (!loaded) {
            return -1;
        }
        try {
            return nativeClientState();
        } catch (LinkageError | RuntimeException e) {
            return -1;
        }
    }

    public static boolean inGameplay(int clientState) {
        return clientState >= 0 && (clientState & 127) == 10 && (clientState & T6TouchLayout.RIGHT_THUMB) != 0;
    }

    public static boolean consoleOpen(int clientState) {
        return clientState >= 0 && ((clientState >> 8) & 1) != 0;
    }

    public static String hostBuildSummary() {
        if (!loaded) {
            return "libt6host.so ausente" + (loadFailure.isEmpty() ? "." : ": " + loadFailure);
        }
        try {
            String summary = nativeHostBuild();
            return summary == null ? "" : summary;
        } catch (LinkageError e) {
            return "libt6host.so sem nativeHostBuild nesta build: " + describe(e);
        } catch (RuntimeException e2) {
            return "Host nativo sem resumo de compilação: " + describe(e2);
        }
    }

    private static String modeOrNone(String mode) {
        return mode == null ? "" : mode;
    }

    private static String describe(Throwable error) {
        String message = error.getMessage();
        return (message == null || message.isEmpty()) ? error.toString() : message;
    }
}
