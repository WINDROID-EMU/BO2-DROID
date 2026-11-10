package org.libsdl.app;

import android.os.Process;
import android.util.Log;

/* compiled from: SDLActivity.java */
/* loaded from: classes2.dex */
class SDLMain implements Runnable {
    SDLMain() {
    }

    @Override // java.lang.Runnable
    public void run() throws SecurityException, IllegalArgumentException {
        try {
            Process.setThreadPriority(-4);
        } catch (Exception e) {
            Log.v("SDL", "modify thread properties failed " + e.toString());
        }
        SDLActivity.nativeInitMainThread();
        SDLActivity.mSingleton.main();
        SDLActivity.nativeCleanupMainThread();
        if (SDLActivity.mSingleton != null && !SDLActivity.mSingleton.isFinishing()) {
            SDLActivity.mSDLThread = null;
            SDLActivity.mSDLMainFinished = true;
            SDLActivity.mSingleton.finish();
        }
    }
}
