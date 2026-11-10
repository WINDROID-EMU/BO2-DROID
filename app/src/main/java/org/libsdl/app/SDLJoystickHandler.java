package org.libsdl.app;

import android.graphics.Color;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.hardware.lights.Light;
import android.hardware.lights.LightState;
import android.hardware.lights.LightsManager;
import android.hardware.lights.LightsRequest;
import android.os.Build;
import android.os.VibratorManager;
import android.view.InputDevice;
import android.view.MotionEvent;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.wiiucoop.bo2android.T6TouchLayout;

/* compiled from: SDLControllerManager.java */
/* loaded from: classes2.dex */
class SDLJoystickHandler {
    private final ArrayList<SDLJoystick> mJoysticks = new ArrayList<>();

    /* compiled from: SDLControllerManager.java */
    static class SDLJoystick {
        Sensor accelerometerSensor;
        ArrayList<InputDevice.MotionRange> axes;
        String desc;
        int device_id;
        Sensor gyroscopeSensor;
        ArrayList<InputDevice.MotionRange> hats;
        ArrayList<Light> lights;
        LightsManager.LightsSession lightsSession;
        String name;
        SDLJoySensorListener sensorListener;
        SensorManager sensorManager;

        SDLJoystick() {
        }
    }

    /* compiled from: SDLControllerManager.java */
    static class RangeComparator implements Comparator<InputDevice.MotionRange> {
        RangeComparator() {
        }

        @Override // java.util.Comparator
        public int compare(InputDevice.MotionRange arg0, InputDevice.MotionRange arg1) {
            int arg0Axis = arg0.getAxis();
            int arg1Axis = arg1.getAxis();
            if (arg0Axis == 22) {
                arg0Axis = 23;
            } else if (arg0Axis == 23) {
                arg0Axis = 22;
            }
            if (arg1Axis == 22) {
                arg1Axis = 23;
            } else if (arg1Axis == 23) {
                arg1Axis = 22;
            }
            if (arg0Axis == 11) {
                arg0Axis = 13;
            } else if (arg0Axis > 11 && arg0Axis < 14) {
                arg0Axis--;
            }
            if (arg1Axis == 11) {
                arg1Axis = 13;
            } else if (arg1Axis > 11 && arg1Axis < 14) {
                arg1Axis--;
            }
            return arg0Axis - arg1Axis;
        }
    }

    SDLJoystickHandler() {
    }

    synchronized void detectDevices() {
        int[] deviceIds = InputDevice.getDeviceIds();
        for (int device_id : deviceIds) {
            if (SDLControllerManager.isDeviceSDLJoystick(device_id)) {
                deviceAdded(device_id);
            }
        }
    }

    void deviceAdded(int device_id) {
        InputDevice joystickDevice = InputDevice.getDevice(device_id);
        if (joystickDevice == null) {
            return;
        }
        SDLJoystick joystick = getJoystick(device_id);
        if (joystick == null) {
            joystick = new SDLJoystick();
            joystick.device_id = device_id;
            joystick.name = joystickDevice.getName();
            joystick.desc = getJoystickDescriptor(joystickDevice);
            joystick.axes = new ArrayList<>();
            joystick.hats = new ArrayList<>();
            Set<Integer> axisStrsSet = new HashSet<>();
            joystick.lights = new ArrayList<>();
            List<InputDevice.MotionRange> ranges = joystickDevice.getMotionRanges();
            Collections.sort(ranges, new RangeComparator());
            for (InputDevice.MotionRange range : ranges) {
                if ((range.getSource() & 16) != 0 && axisStrsSet.add(Integer.valueOf(range.getAxis()))) {
                    if (range.getAxis() == 15 || range.getAxis() == 16) {
                        joystick.hats.add(range);
                    } else {
                        joystick.axes.add(range);
                    }
                }
            }
            if (Build.VERSION.SDK_INT >= 31) {
                LightsManager lightsManager = joystickDevice.getLightsManager();
                List<Light> lights = lightsManager.getLights();
                for (Light light : lights) {
                    if (light.hasRgbControl()) {
                        joystick.lights.add(light);
                    }
                }
                if (!joystick.lights.isEmpty()) {
                    joystick.lightsSession = lightsManager.openSession();
                }
                SensorManager sensorManager = joystickDevice.getSensorManager();
                if (sensorManager != null) {
                    joystick.sensorManager = sensorManager;
                    joystick.sensorListener = new SDLJoySensorListener(joystick.device_id);
                    joystick.accelerometerSensor = sensorManager.getDefaultSensor(1);
                    joystick.gyroscopeSensor = sensorManager.getDefaultSensor(4);
                }
            }
            this.mJoysticks.add(joystick);
        }
        boolean can_rumble = false;
        boolean has_rgb_led = false;
        boolean has_accelerometer = false;
        boolean has_gyroscope = false;
        if (Build.VERSION.SDK_INT >= 31) {
            VibratorManager vibratorManager = joystickDevice.getVibratorManager();
            int[] vibrators = vibratorManager.getVibratorIds();
            if (vibrators.length > 0) {
                can_rumble = true;
            }
            if (!joystick.lights.isEmpty()) {
                has_rgb_led = true;
            }
            if (joystick.accelerometerSensor != null) {
                has_accelerometer = true;
            }
            if (joystick.gyroscopeSensor != null) {
                has_gyroscope = true;
            }
        }
        SDLControllerManager.nativeAddJoystick(joystick.device_id, joystick.name, joystick.desc, getVendorId(joystickDevice), getProductId(joystickDevice), getButtonMask(joystickDevice), joystick.axes.size(), getAxisMask(joystick.axes), joystick.hats.size() / 2, can_rumble, has_rgb_led, has_accelerometer, has_gyroscope);
    }

    void deviceRemoved(int device_id) {
        for (int i = 0; i < this.mJoysticks.size(); i++) {
            if (this.mJoysticks.get(i).device_id == device_id) {
                SDLControllerManager.nativeRemoveJoystick(device_id);
                if (Build.VERSION.SDK_INT >= 31 && this.mJoysticks.get(i).lightsSession != null) {
                    try {
                        this.mJoysticks.get(i).lightsSession.close();
                    } catch (Exception e) {
                    }
                    this.mJoysticks.get(i).lightsSession = null;
                }
                this.mJoysticks.remove(i);
                return;
            }
        }
    }

    protected synchronized SDLJoystick getJoystick(int device_id) {
        Iterator<SDLJoystick> it = this.mJoysticks.iterator();
        while (it.hasNext()) {
            SDLJoystick joystick = it.next();
            if (joystick.device_id == device_id) {
                return joystick;
            }
        }
        return null;
    }

    boolean handleMotionEvent(MotionEvent event) {
        SDLJoystick joystick;
        int actionPointerIndex = event.getActionIndex();
        int action = event.getActionMasked();
        if (action == 2 && (joystick = getJoystick(event.getDeviceId())) != null) {
            for (int i = 0; i < joystick.axes.size(); i++) {
                InputDevice.MotionRange range = joystick.axes.get(i);
                float value = (((event.getAxisValue(range.getAxis(), actionPointerIndex) - range.getMin()) / range.getRange()) * 2.0f) - 1.0f;
                SDLControllerManager.onNativeJoy(joystick.device_id, i, value);
            }
            for (int i2 = 0; i2 < joystick.hats.size() / 2; i2++) {
                int hatX = Math.round(event.getAxisValue(joystick.hats.get(i2 * 2).getAxis(), actionPointerIndex));
                int hatY = Math.round(event.getAxisValue(joystick.hats.get((i2 * 2) + 1).getAxis(), actionPointerIndex));
                SDLControllerManager.onNativeHat(joystick.device_id, i2, hatX, hatY);
            }
        }
        return true;
    }

    String getJoystickDescriptor(InputDevice joystickDevice) {
        String desc = joystickDevice.getDescriptor();
        if (desc != null && !desc.isEmpty()) {
            return desc;
        }
        return joystickDevice.getName();
    }

    int getProductId(InputDevice joystickDevice) {
        return joystickDevice.getProductId();
    }

    int getVendorId(InputDevice joystickDevice) {
        return joystickDevice.getVendorId();
    }

    int getAxisMask(List<InputDevice.MotionRange> ranges) {
        int axis_mask = 0;
        if (ranges.size() >= 2) {
            axis_mask = 0 | 3;
        }
        if (ranges.size() >= 4) {
            axis_mask |= 12;
        }
        if (ranges.size() >= 6) {
            axis_mask |= 48;
        }
        boolean have_z = false;
        boolean have_past_z_before_rz = false;
        for (InputDevice.MotionRange range : ranges) {
            int axis = range.getAxis();
            if (axis == 11) {
                have_z = true;
            } else if (axis > 11 && axis < 14) {
                have_past_z_before_rz = true;
            }
        }
        if (have_z && have_past_z_before_rz) {
            return axis_mask | 32768;
        }
        return axis_mask;
    }

    int getButtonMask(InputDevice joystickDevice) {
        int button_mask = 0;
        int[] keys = {96, 97, 99, 100, 4, 82, 110, 108, 106, 107, 102, 103, 19, 20, 21, 22, 109, 23, 104, 105, 98, 101, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203};
        int[] masks = {1, 2, 4, 8, 16, 64, 32, 64, T6TouchLayout.RIGHT_THUMB, T6TouchLayout.LEFT_SHOULDER, 512, 1024, 2048, 4096, 8192, T6TouchLayout.X, 16, 1, 32768, 65536, T6TouchLayout.RIGHT_TRIGGER, T6TouchLayout.CONSOLE, T6TouchLayout.PLACE_ITEM, T6TouchLayout.PRONE, 4194304, 8388608, 16777216, 33554432, 67108864, 134217728, 268435456, 536870912, 1073741824, Integer.MIN_VALUE, -1, -1, -1, -1};
        boolean[] has_keys = joystickDevice.hasKeys(keys);
        for (int i = 0; i < keys.length; i++) {
            if (has_keys[i]) {
                button_mask |= masks[i];
            }
        }
        return button_mask;
    }

    void setLED(int device_id, int red, int green, int blue) {
        SDLJoystick joystick;
        if (Build.VERSION.SDK_INT < 31 || (joystick = getJoystick(device_id)) == null || joystick.lights.isEmpty()) {
            return;
        }
        LightsRequest.Builder lightsRequest = new LightsRequest.Builder();
        LightState lightState = new LightState.Builder().setColor(Color.rgb(red, green, blue)).build();
        Iterator<Light> it = joystick.lights.iterator();
        while (it.hasNext()) {
            Light light = it.next();
            if (light.hasRgbControl()) {
                lightsRequest.addLight(light, lightState);
            }
        }
        joystick.lightsSession.requestLights(lightsRequest.build());
    }

    void setSensorsEnabled(int device_id, boolean enabled) {
        SDLJoystick joystick;
        if (Build.VERSION.SDK_INT < 31 || (joystick = getJoystick(device_id)) == null || joystick.sensorManager == null) {
            return;
        }
        if (enabled) {
            if (joystick.accelerometerSensor != null) {
                SDLSensorManager.registerListener(joystick.sensorManager, joystick.sensorListener, joystick.accelerometerSensor, 1);
            }
            if (joystick.gyroscopeSensor != null) {
                SDLSensorManager.registerListener(joystick.sensorManager, joystick.sensorListener, joystick.gyroscopeSensor, 1);
                return;
            }
            return;
        }
        if (joystick.accelerometerSensor != null) {
            SDLSensorManager.unregisterListener(joystick.sensorManager, joystick.sensorListener, joystick.accelerometerSensor);
        }
        if (joystick.gyroscopeSensor != null) {
            SDLSensorManager.unregisterListener(joystick.sensorManager, joystick.sensorListener, joystick.gyroscopeSensor);
        }
    }
}
