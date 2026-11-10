package org.libsdl.app;

import android.os.Build;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.os.VibratorManager;
import android.view.InputDevice;
import org.libsdl.app.SDLHapticHandler;

/* compiled from: SDLControllerManager.java */
/* loaded from: classes2.dex */
class SDLHapticHandler_API31 extends SDLHapticHandler {
    SDLHapticHandler_API31() {
    }

    @Override // org.libsdl.app.SDLHapticHandler
    void run(int device_id, float intensity, int length) {
        SDLHapticHandler.SDLHaptic haptic = getHaptic(device_id);
        if (haptic != null) {
            vibrate(haptic.vib, intensity, length);
        }
    }

    @Override // org.libsdl.app.SDLHapticHandler
    void rumble(int device_id, float low_frequency_intensity, float high_frequency_intensity, int length) {
        InputDevice device = InputDevice.getDevice(device_id);
        if (device == null || Build.VERSION.SDK_INT < 31) {
            return;
        }
        VibratorManager manager = device.getVibratorManager();
        int[] vibrators = manager.getVibratorIds();
        if (vibrators.length >= 2) {
            vibrate(manager.getVibrator(vibrators[0]), low_frequency_intensity, length);
            vibrate(manager.getVibrator(vibrators[1]), high_frequency_intensity, length);
        } else if (vibrators.length == 1) {
            float intensity = (0.6f * low_frequency_intensity) + (0.4f * high_frequency_intensity);
            vibrate(manager.getVibrator(vibrators[0]), intensity, length);
        }
    }

    private void vibrate(Vibrator vibrator, float intensity, int length) {
        if (Build.VERSION.SDK_INT < 31) {
            return;
        }
        if (intensity == 0.0f) {
            vibrator.cancel();
            return;
        }
        int value = Math.round(255.0f * intensity);
        if (value > 255) {
            value = 255;
        }
        if (value < 1) {
            vibrator.cancel();
            return;
        }
        try {
            vibrator.vibrate(VibrationEffect.createOneShot(length, value));
        } catch (Exception e) {
            vibrator.vibrate(length);
        }
    }
}
