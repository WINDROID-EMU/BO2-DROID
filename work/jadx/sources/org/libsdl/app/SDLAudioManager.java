package org.libsdl.app;

import android.content.Context;
import android.media.AudioDeviceCallback;
import android.media.AudioDeviceInfo;
import android.media.AudioManager;
import android.os.Process;
import android.util.Log;

/* loaded from: classes2.dex */
class SDLAudioManager {
    protected static final String TAG = "SDLAudio";
    private static AudioDeviceCallback mAudioDeviceCallback;
    protected static Context mContext;

    static native void nativeAddAudioDevice(boolean z, String str, int i);

    static native void nativeRemoveAudioDevice(boolean z, int i);

    static native void nativeSetupJNI();

    SDLAudioManager() {
    }

    static void initialize() {
        mAudioDeviceCallback = null;
        mAudioDeviceCallback = new AudioDeviceCallback() { // from class: org.libsdl.app.SDLAudioManager.1
            @Override // android.media.AudioDeviceCallback
            public void onAudioDevicesAdded(AudioDeviceInfo[] addedDevices) {
                for (AudioDeviceInfo deviceInfo : addedDevices) {
                    SDLAudioManager.nativeAddAudioDevice(deviceInfo.isSink(), deviceInfo.getProductName().toString(), deviceInfo.getId());
                }
            }

            @Override // android.media.AudioDeviceCallback
            public void onAudioDevicesRemoved(AudioDeviceInfo[] removedDevices) {
                for (AudioDeviceInfo deviceInfo : removedDevices) {
                    SDLAudioManager.nativeRemoveAudioDevice(deviceInfo.isSink(), deviceInfo.getId());
                }
            }
        };
    }

    static void setContext(Context context) {
        mContext = context;
    }

    static void release(Context context) {
    }

    private static AudioDeviceInfo getInputAudioDeviceInfo(int deviceId) {
        AudioManager audioManager = (AudioManager) mContext.getSystemService("audio");
        for (AudioDeviceInfo deviceInfo : audioManager.getDevices(1)) {
            if (deviceInfo.getId() == deviceId) {
                return deviceInfo;
            }
        }
        return null;
    }

    private static AudioDeviceInfo getPlaybackAudioDeviceInfo(int deviceId) {
        AudioManager audioManager = (AudioManager) mContext.getSystemService("audio");
        for (AudioDeviceInfo deviceInfo : audioManager.getDevices(2)) {
            if (deviceInfo.getId() == deviceId) {
                return deviceInfo;
            }
        }
        return null;
    }

    static void registerAudioDeviceCallback() {
        AudioManager audioManager = (AudioManager) mContext.getSystemService("audio");
        for (AudioDeviceInfo dev : audioManager.getDevices(2)) {
            if (dev.getType() != 18) {
                nativeAddAudioDevice(dev.isSink(), dev.getProductName().toString(), dev.getId());
            }
        }
        for (AudioDeviceInfo dev2 : audioManager.getDevices(1)) {
            nativeAddAudioDevice(dev2.isSink(), dev2.getProductName().toString(), dev2.getId());
        }
        audioManager.registerAudioDeviceCallback(mAudioDeviceCallback, null);
    }

    static void unregisterAudioDeviceCallback() {
        AudioManager audioManager = (AudioManager) mContext.getSystemService("audio");
        audioManager.unregisterAudioDeviceCallback(mAudioDeviceCallback);
    }

    static void audioSetThreadPriority(boolean recording, int device_id) throws SecurityException, IllegalArgumentException {
        try {
            if (recording) {
                Thread.currentThread().setName("SDLAudioC" + device_id);
            } else {
                Thread.currentThread().setName("SDLAudioP" + device_id);
            }
            Process.setThreadPriority(-16);
        } catch (Exception e) {
            Log.v(TAG, "modify thread properties failed " + e.toString());
        }
    }
}
