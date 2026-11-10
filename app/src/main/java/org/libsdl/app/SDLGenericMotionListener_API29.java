package org.libsdl.app;

import android.view.InputDevice;

/* compiled from: SDLControllerManager.java */
/* loaded from: classes2.dex */
class SDLGenericMotionListener_API29 extends SDLGenericMotionListener_API26 {
    SDLGenericMotionListener_API29() {
    }

    @Override // org.libsdl.app.SDLGenericMotionListener_API14
    int getPenDeviceType(InputDevice penDevice) {
        if (penDevice == null) {
            return 0;
        }
        return penDevice.isExternal() ? 2 : 1;
    }
}
