package org.libsdl.app;

import android.content.Context;
import android.graphics.Insets;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Build;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.PointerIcon;
import android.view.ScaleGestureDetector;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.view.WindowInsets;
import android.view.WindowManager;
import org.libsdl.app.SDLActivity;

/* loaded from: classes2.dex */
public class SDLSurface extends SurfaceView implements SurfaceHolder.Callback, View.OnApplyWindowInsetsListener, View.OnKeyListener, View.OnTouchListener, SensorEventListener, ScaleGestureDetector.OnScaleGestureListener {
    protected Display mDisplay;
    protected float mHeight;
    protected boolean mIsSurfaceReady;
    protected boolean mKeyboardVisible;
    protected SensorManager mSensorManager;
    protected float mWidth;
    private final ScaleGestureDetector scaleGestureDetector;

    protected SDLSurface(Context context) {
        super(context);
        getHolder().addCallback(this);
        this.scaleGestureDetector = new ScaleGestureDetector(context, this);
        setFocusable(true);
        setFocusableInTouchMode(true);
        requestFocus();
        setOnApplyWindowInsetsListener(this);
        setOnKeyListener(this);
        setOnTouchListener(this);
        this.mDisplay = ((WindowManager) context.getSystemService("window")).getDefaultDisplay();
        this.mSensorManager = (SensorManager) context.getSystemService("sensor");
        setOnGenericMotionListener(SDLActivity.getMotionListener());
        this.mWidth = 1.0f;
        this.mHeight = 1.0f;
        this.mIsSurfaceReady = false;
    }

    protected void handlePause() {
        enableSensor(1, false);
    }

    protected void handleResume() {
        setFocusable(true);
        setFocusableInTouchMode(true);
        requestFocus();
        setOnApplyWindowInsetsListener(this);
        setOnKeyListener(this);
        setOnTouchListener(this);
        enableSensor(1, true);
    }

    protected Surface getNativeSurface() {
        return getHolder().getSurface();
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceCreated(SurfaceHolder holder) {
        Log.v("SDL", "surfaceCreated()");
        SDLActivity.onNativeSurfaceCreated();
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceDestroyed(SurfaceHolder holder) {
        Log.v("SDL", "surfaceDestroyed()");
        SDLActivity.mNextNativeState = SDLActivity.NativeState.PAUSED;
        SDLActivity.handleNativeState();
        this.mIsSurfaceReady = false;
        SDLActivity.onNativeSurfaceDestroyed();
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
        int nDeviceWidth;
        int nDeviceHeight;
        float density;
        Log.v("SDL", "surfaceChanged()");
        if (SDLActivity.mSingleton != null) {
            this.mWidth = width;
            this.mHeight = height;
            int nDeviceWidth2 = width;
            int nDeviceHeight2 = height;
            try {
                DisplayMetrics realMetrics = new DisplayMetrics();
                this.mDisplay.getRealMetrics(realMetrics);
                nDeviceWidth2 = realMetrics.widthPixels;
                nDeviceHeight2 = realMetrics.heightPixels;
                float density2 = realMetrics.densityDpi / 160.0f;
                nDeviceWidth = nDeviceWidth2;
                nDeviceHeight = nDeviceHeight2;
                density = density2;
            } catch (Exception e) {
                nDeviceWidth = nDeviceWidth2;
                nDeviceHeight = nDeviceHeight2;
                density = 1.0f;
            }
            synchronized (SDLActivity.getContext()) {
                SDLActivity.getContext().notifyAll();
            }
            Log.v("SDL", "Window size: " + width + "x" + height);
            Log.v("SDL", "Device size: " + nDeviceWidth + "x" + nDeviceHeight);
            SDLActivity.nativeSetScreenResolution(width, height, nDeviceWidth, nDeviceHeight, density, this.mDisplay.getRefreshRate());
            SDLActivity.onNativeResize();
            boolean skip = false;
            int requestedOrientation = SDLActivity.mSingleton.getRequestedOrientation();
            if (requestedOrientation == 1 || requestedOrientation == 7) {
                if (this.mWidth > this.mHeight) {
                    skip = true;
                }
            } else if ((requestedOrientation == 0 || requestedOrientation == 6) && this.mWidth < this.mHeight) {
                skip = true;
            }
            if (skip) {
                double min = Math.min(this.mWidth, this.mHeight);
                double max = Math.max(this.mWidth, this.mHeight);
                if (max / min < 1.2d) {
                    Log.v("SDL", "Don't skip on such aspect-ratio. Could be a square resolution.");
                    skip = false;
                }
            }
            if (skip) {
                skip = false;
            }
            if (skip) {
                Log.v("SDL", "Skip .. Surface is not ready.");
                this.mIsSurfaceReady = false;
            } else {
                SDLActivity.onNativeSurfaceChanged();
                this.mIsSurfaceReady = true;
                SDLActivity.mNextNativeState = SDLActivity.NativeState.RESUMED;
                SDLActivity.handleNativeState();
            }
        }
    }

    @Override // android.view.View.OnApplyWindowInsetsListener
    public WindowInsets onApplyWindowInsets(View v, WindowInsets insets) {
        if (Build.VERSION.SDK_INT >= 30) {
            Insets combined = insets.getInsets(WindowInsets.Type.systemBars() | WindowInsets.Type.systemGestures() | WindowInsets.Type.mandatorySystemGestures() | WindowInsets.Type.tappableElement() | WindowInsets.Type.displayCutout());
            SDLActivity.onNativeInsetsChanged(combined.left, combined.right, combined.top, combined.bottom);
            if (insets.isVisible(WindowInsets.Type.ime())) {
                if (!this.mKeyboardVisible) {
                    this.mKeyboardVisible = true;
                    SDLActivity.onNativeScreenKeyboardShown();
                }
            } else if (this.mKeyboardVisible) {
                this.mKeyboardVisible = false;
                SDLActivity.onNativeScreenKeyboardHidden();
            }
        }
        return insets;
    }

    @Override // android.view.View.OnKeyListener
    public boolean onKey(View v, int keyCode, KeyEvent event) {
        return SDLActivity.handleKeyEvent(v, keyCode, event, null);
    }

    private float getNormalizedX(float x) {
        if (this.mWidth <= 1.0f) {
            return 0.5f;
        }
        return x / (this.mWidth - 1.0f);
    }

    private float getNormalizedY(float y) {
        if (this.mHeight <= 1.0f) {
            return 0.5f;
        }
        return y / (this.mHeight - 1.0f);
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View v, MotionEvent event) {
        int i;
        float p;
        int i2;
        int buttonState;
        int action;
        float p2;
        int touchDevId = event.getDeviceId();
        int pointerCount = event.getPointerCount();
        int action2 = event.getActionMasked();
        int i3 = 6;
        if (action2 != 6 && action2 != 5) {
            i = 0;
        } else {
            int i4 = event.getActionIndex();
            i = i4;
        }
        while (true) {
            int toolType = event.getToolType(i);
            if (toolType == 3) {
                int buttonState2 = event.getButtonState();
                SDLGenericMotionListener_API14 motionListener = SDLActivity.getMotionListener();
                float x = motionListener.getEventX(event, i);
                float y = motionListener.getEventY(event, i);
                boolean relative = motionListener.inRelativeMode();
                SDLActivity.onNativeMouse(buttonState2, action2, x, y, relative);
                i2 = i;
                buttonState = i3;
                action = action2;
            } else if (toolType == 2 || toolType == 4) {
                int pointerId = event.getPointerId(i);
                float x2 = event.getX(i);
                float y2 = event.getY(i);
                float p3 = event.getPressure(i);
                if (p3 <= 1.0f) {
                    p = p3;
                } else {
                    p = 1.0f;
                }
                int buttonState3 = (1 << (toolType == 2 ? 0 : 30)) | (event.getButtonState() >> 4);
                if ((4 & event.getButtonState()) != 0) {
                    buttonState3 |= 8;
                }
                int i5 = SDLActivity.getMotionListener().getPenDeviceType(event.getDevice());
                i2 = i;
                int i6 = buttonState3;
                buttonState = i3;
                action = action2;
                SDLActivity.onNativePen(pointerId, i5, i6, action2, x2, y2, p);
            } else {
                int pointerId2 = event.getPointerId(i);
                float x3 = getNormalizedX(event.getX(i));
                float y3 = getNormalizedY(event.getY(i));
                float p4 = event.getPressure(i);
                if (p4 <= 1.0f) {
                    p2 = p4;
                } else {
                    p2 = 1.0f;
                }
                SDLActivity.onNativeTouch(touchDevId, pointerId2, action2, x3, y3, p2);
                i2 = i;
                buttonState = i3;
                action = action2;
            }
            if (action == buttonState || action == 5) {
                break;
            }
            i = i2 + 1;
            if (i >= pointerCount) {
                break;
            }
            i3 = buttonState;
            action2 = action;
        }
        this.scaleGestureDetector.onTouchEvent(event);
        return true;
    }

    protected void enableSensor(int sensortype, boolean enabled) {
        if (enabled) {
            SDLSensorManager.registerListener(this.mSensorManager, this, this.mSensorManager.getDefaultSensor(sensortype), 1);
        } else {
            SDLSensorManager.unregisterListener(this.mSensorManager, this, this.mSensorManager.getDefaultSensor(sensortype));
        }
    }

    @Override // android.hardware.SensorEventListener
    public void onAccuracyChanged(Sensor sensor, int accuracy) {
    }

    @Override // android.hardware.SensorEventListener
    public void onSensorChanged(SensorEvent event) {
        int newRotation;
        if (event.sensor.getType() == 1) {
            switch (this.mDisplay.getRotation()) {
                case 1:
                    float f = -event.values[1];
                    float f2 = event.values[0];
                    newRotation = 90;
                    break;
                case 2:
                    float f3 = -event.values[0];
                    float f4 = -event.values[1];
                    newRotation = 180;
                    break;
                case 3:
                    float f5 = event.values[1];
                    float f6 = -event.values[0];
                    newRotation = 270;
                    break;
                default:
                    float f7 = event.values[0];
                    float f8 = event.values[1];
                    newRotation = 0;
                    break;
            }
            if (newRotation != SDLActivity.mCurrentRotation) {
                SDLActivity.mCurrentRotation = newRotation;
                SDLActivity.onNativeRotationChanged(newRotation);
            }
        }
    }

    @Override // android.view.View
    public PointerIcon onResolvePointerIcon(MotionEvent event, int pointerIndex) {
        try {
            return super.onResolvePointerIcon(event, pointerIndex);
        } catch (NullPointerException e) {
            return null;
        }
    }

    @Override // android.view.View
    public boolean onCapturedPointerEvent(MotionEvent event) {
        return SDLActivity.getMotionListener().onGenericMotion(this, event);
    }

    @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
    public boolean onScale(ScaleGestureDetector detector) {
        float scale = detector.getScaleFactor();
        float span_x = getNormalizedX(detector.getCurrentSpanX());
        float span_y = getNormalizedY(detector.getCurrentSpanY());
        float focus_x = getNormalizedX(detector.getFocusX());
        float focus_y = getNormalizedY(detector.getFocusY());
        SDLActivity.onNativePinchUpdate(scale, span_x, span_y, focus_x, focus_y);
        return true;
    }

    @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
    public boolean onScaleBegin(ScaleGestureDetector detector) {
        float span_x = getNormalizedX(detector.getCurrentSpanX());
        float span_y = getNormalizedY(detector.getCurrentSpanY());
        float focus_x = getNormalizedX(detector.getFocusX());
        float focus_y = getNormalizedY(detector.getFocusY());
        SDLActivity.onNativePinchStart(span_x, span_y, focus_x, focus_y);
        return true;
    }

    @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
    public void onScaleEnd(ScaleGestureDetector detector) {
        SDLActivity.onNativePinchEnd();
    }
}
