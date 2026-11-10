package org.libsdl.app;

import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;

/* compiled from: SDLControllerManager.java */
/* loaded from: classes2.dex */
class SDLJoySensorListener implements SensorEventListener {
    int device_id;

    public SDLJoySensorListener(int device_id) {
        this.device_id = device_id;
    }

    @Override // android.hardware.SensorEventListener
    public void onAccuracyChanged(Sensor sensor, int accuracy) {
    }

    @Override // android.hardware.SensorEventListener
    public void onSensorChanged(SensorEvent event) {
        SDLControllerManager.onNativeJoySensor(this.device_id, event.sensor.getType(), event.timestamp, event.values[0], event.values[1], event.values[2]);
    }
}
