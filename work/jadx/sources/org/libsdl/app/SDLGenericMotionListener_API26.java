package org.libsdl.app;

import android.os.Build;
import android.view.MotionEvent;
import android.view.View;

/* compiled from: SDLControllerManager.java */
/* loaded from: classes2.dex */
class SDLGenericMotionListener_API26 extends SDLGenericMotionListener_API24 {
    private boolean mRelativeModeEnabled;

    SDLGenericMotionListener_API26() {
    }

    @Override // org.libsdl.app.SDLGenericMotionListener_API24, org.libsdl.app.SDLGenericMotionListener_API14
    boolean supportsRelativeMouse() {
        return !SDLActivity.isDeXMode() || Build.VERSION.SDK_INT >= 27;
    }

    @Override // org.libsdl.app.SDLGenericMotionListener_API24, org.libsdl.app.SDLGenericMotionListener_API14
    boolean inRelativeMode() {
        return this.mRelativeModeEnabled;
    }

    @Override // org.libsdl.app.SDLGenericMotionListener_API24, org.libsdl.app.SDLGenericMotionListener_API14
    boolean setRelativeMouseEnabled(boolean enabled) {
        if (!SDLActivity.isDeXMode() || Build.VERSION.SDK_INT >= 27) {
            View contentView = SDLActivity.getContentView();
            if (contentView != null) {
                if (enabled) {
                    contentView.requestPointerCapture();
                } else {
                    contentView.releasePointerCapture();
                }
            }
            this.mRelativeModeEnabled = enabled;
            return true;
        }
        return false;
    }

    @Override // org.libsdl.app.SDLGenericMotionListener_API14
    void reclaimRelativeMouseModeIfNeeded() {
        View contentView;
        if (this.mRelativeModeEnabled && !SDLActivity.isDeXMode() && (contentView = SDLActivity.getContentView()) != null) {
            contentView.requestPointerCapture();
        }
    }

    @Override // org.libsdl.app.SDLGenericMotionListener_API14
    boolean checkRelativeEvent(MotionEvent event) {
        return event.getSource() == 131076;
    }

    @Override // org.libsdl.app.SDLGenericMotionListener_API24, org.libsdl.app.SDLGenericMotionListener_API14
    float getEventX(MotionEvent event, int pointerIndex) {
        return event.getX(pointerIndex);
    }

    @Override // org.libsdl.app.SDLGenericMotionListener_API24, org.libsdl.app.SDLGenericMotionListener_API14
    float getEventY(MotionEvent event, int pointerIndex) {
        return event.getY(pointerIndex);
    }
}
