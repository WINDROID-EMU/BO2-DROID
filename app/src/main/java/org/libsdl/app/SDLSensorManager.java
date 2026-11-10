package org.libsdl.app;

import android.hardware.Sensor;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Handler;
import android.util.Log;
import java.util.ConcurrentModificationException;

/* loaded from: classes2.dex */
class SDLSensorManager {
    static final int RETRY_COUNT = 3;
    private static SDLSensorManager mManager = new SDLSensorManager();

    SDLSensorManager() {
    }

    public static void registerListener(SensorManager manager, SensorEventListener listener, Sensor sensor, int samplingPeriodUs) {
        mManager.RegisterListener(manager, listener, sensor, samplingPeriodUs);
    }

    public static void unregisterListener(SensorManager manager, SensorEventListener listener, Sensor sensor) {
        mManager.UnregisterListener(manager, listener, sensor);
    }

    private synchronized void RegisterListener(SensorManager manager, SensorEventListener listener, Sensor sensor, int samplingPeriodUs) {
        int retries = 0;
        boolean complete = false;
        while (!complete) {
            try {
                manager.registerListener(listener, sensor, samplingPeriodUs, (Handler) null);
                complete = true;
            } catch (ConcurrentModificationException e) {
                retries++;
                if (retries <= 3) {
                    try {
                        Thread.sleep(1L);
                    } catch (Exception e2) {
                    }
                } else {
                    Log.v("SDL", "Multiple ConcurrentModificationException caught while registering sensor listener, canceling operation");
                    complete = true;
                }
            }
        }
    }

    private synchronized void UnregisterListener(SensorManager manager, SensorEventListener listener, Sensor sensor) {
        int retries = 0;
        boolean complete = false;
        while (!complete) {
            try {
                manager.unregisterListener(listener, sensor);
                complete = true;
            } catch (ConcurrentModificationException e) {
                retries++;
                if (retries <= 3) {
                    try {
                        Thread.sleep(1L);
                    } catch (Exception e2) {
                    }
                } else {
                    Log.v("SDL", "Multiple ConcurrentModificationException caught while unregistering sensor listener, canceling operation");
                    complete = true;
                }
            }
        }
    }
}
