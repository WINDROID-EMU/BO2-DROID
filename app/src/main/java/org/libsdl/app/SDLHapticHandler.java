package org.libsdl.app;

import android.os.Vibrator;
import java.util.ArrayList;
import java.util.Iterator;

/* compiled from: SDLControllerManager.java */
/* loaded from: classes2.dex */
class SDLHapticHandler {
    private final ArrayList<SDLHaptic> mHaptics = new ArrayList<>();

    /* compiled from: SDLControllerManager.java */
    static class SDLHaptic {
        int device_id;
        String name;
        Vibrator vib;

        SDLHaptic() {
        }
    }

    SDLHapticHandler() {
    }

    void run(int device_id, float intensity, int length) {
        SDLHaptic haptic = getHaptic(device_id);
        if (haptic != null) {
            haptic.vib.vibrate(length);
        }
    }

    void rumble(int device_id, float low_frequency_intensity, float high_frequency_intensity, int length) {
    }

    void stop(int device_id) {
        SDLHaptic haptic = getHaptic(device_id);
        if (haptic != null) {
            haptic.vib.cancel();
        }
    }

    synchronized void detectHapticDevices() {
        boolean hasVibratorService = false;
        Vibrator vib = (Vibrator) SDL.getContext().getSystemService("vibrator");
        if (vib != null && (hasVibratorService = vib.hasVibrator())) {
            SDLHaptic haptic = getHaptic(999999);
            if (haptic == null) {
                SDLHaptic haptic2 = new SDLHaptic();
                haptic2.device_id = 999999;
                haptic2.name = "VIBRATOR_SERVICE";
                haptic2.vib = vib;
                this.mHaptics.add(haptic2);
                SDLControllerManager.nativeAddHaptic(haptic2.device_id, haptic2.name);
            }
        }
        ArrayList<Integer> removedDevices = null;
        Iterator<SDLHaptic> it = this.mHaptics.iterator();
        while (it.hasNext()) {
            SDLHaptic haptic3 = it.next();
            int device_id = haptic3.device_id;
            if (device_id != 999999 || !hasVibratorService) {
                if (removedDevices == null) {
                    removedDevices = new ArrayList<>();
                }
                removedDevices.add(Integer.valueOf(device_id));
            }
        }
        if (removedDevices != null) {
            Iterator<Integer> it2 = removedDevices.iterator();
            while (it2.hasNext()) {
                int device_id2 = it2.next().intValue();
                SDLControllerManager.nativeRemoveHaptic(device_id2);
                int i = 0;
                while (true) {
                    if (i >= this.mHaptics.size()) {
                        break;
                    }
                    if (this.mHaptics.get(i).device_id != device_id2) {
                        i++;
                    } else {
                        this.mHaptics.remove(i);
                        break;
                    }
                }
            }
        }
    }

    protected synchronized SDLHaptic getHaptic(int device_id) {
        Iterator<SDLHaptic> it = this.mHaptics.iterator();
        while (it.hasNext()) {
            SDLHaptic haptic = it.next();
            if (haptic.device_id == device_id) {
                return haptic;
            }
        }
        return null;
    }
}
