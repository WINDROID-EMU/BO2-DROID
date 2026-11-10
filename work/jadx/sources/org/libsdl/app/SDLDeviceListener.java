package org.libsdl.app;

import android.hardware.input.InputManager;

/* compiled from: SDLControllerManager.java */
/* loaded from: classes2.dex */
class SDLDeviceListener implements InputManager.InputDeviceListener {
    SDLDeviceListener() {
    }

    @Override // android.hardware.input.InputManager.InputDeviceListener
    public void onInputDeviceAdded(int deviceId) {
        if (SDLControllerManager.isDeviceSDLJoystick(deviceId)) {
            SDLControllerManager.mJoystickHandler.deviceAdded(deviceId);
        }
    }

    @Override // android.hardware.input.InputManager.InputDeviceListener
    public void onInputDeviceChanged(int deviceId) {
        if (SDLControllerManager.isDeviceSDLJoystick(deviceId)) {
            SDLControllerManager.mJoystickHandler.deviceAdded(deviceId);
        }
    }

    @Override // android.hardware.input.InputManager.InputDeviceListener
    public void onInputDeviceRemoved(int deviceId) {
        SDLControllerManager.mJoystickHandler.deviceRemoved(deviceId);
    }
}
