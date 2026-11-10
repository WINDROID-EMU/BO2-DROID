package org.libsdl.app;

import android.view.MotionEvent;

/* compiled from: SDLControllerManager.java */
/* loaded from: classes2.dex */
class SDLGenericMotionListener_API24 extends SDLGenericMotionListener_API14 {
    private boolean mRelativeModeEnabled;

    SDLGenericMotionListener_API24() {
    }

    @Override // org.libsdl.app.SDLGenericMotionListener_API14
    boolean supportsRelativeMouse() {
        return true;
    }

    @Override // org.libsdl.app.SDLGenericMotionListener_API14
    boolean inRelativeMode() {
        return this.mRelativeModeEnabled;
    }

    @Override // org.libsdl.app.SDLGenericMotionListener_API14
    boolean setRelativeMouseEnabled(boolean enabled) {
        this.mRelativeModeEnabled = enabled;
        return true;
    }

    @Override // org.libsdl.app.SDLGenericMotionListener_API14
    float getEventX(MotionEvent event, int pointerIndex) {
        if (this.mRelativeModeEnabled && event.getToolType(pointerIndex) == 3) {
            return event.getAxisValue(27, pointerIndex);
        }
        return event.getX(pointerIndex);
    }

    @Override // org.libsdl.app.SDLGenericMotionListener_API14
    float getEventY(MotionEvent event, int pointerIndex) {
        if (this.mRelativeModeEnabled && event.getToolType(pointerIndex) == 3) {
            return event.getAxisValue(28, pointerIndex);
        }
        return event.getY(pointerIndex);
    }
}
