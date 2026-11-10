package org.wiiucoop.bo2android;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.SystemClock;
import android.util.Log;
import android.util.SparseArray;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import org.wiiucoop.bo2android.T6TouchLayout;

/* loaded from: classes3.dex */
public final class T6TouchOverlay extends View {
    public static final int CAMERA_CANCEL = 3;
    public static final int CAMERA_DOWN = 0;
    public static final int CAMERA_MOVE = 1;
    public static final int CAMERA_UP = 2;
    public static final int VK_TAB = 9;
    private boolean adsFire;
    private final T6TouchLayout.AdsFire adsFireState;
    private boolean aimDrag;
    private int cameraOwner;
    private CameraSink cameraSink;
    private CommandListener commandListener;
    private ConsoleListener consoleListener;
    private boolean editMode;
    private final SparseArray<Finger> fingers;
    private KeyListener keyListener;
    private boolean lastActive;
    private int lastButtons;
    private int lastLt;
    private int lastLx;
    private int lastLy;
    private int lastRt;
    private int lastRx;
    private int lastRy;
    private T6TouchLayout layout;
    private boolean padActive;
    private final Paint paint;
    private final RectF rect;
    private T6TouchLayout.Control selected;
    private SelectionListener selectionListener;
    private PadSink sink;
    private float sprintThreshold;
    private boolean sprinting;
    private final Map<String, Bitmap> sprites;
    private boolean stickSprint;
    private final Paint stroke;
    private final Paint text;
    private final float touchSlop;

    public interface CameraSink {
        void onCamera(int i, int i2, float f, float f2);
    }

    public interface CommandListener {
        void onCommand(String str);
    }

    public interface ConsoleListener {
        void onConsole();
    }

    public interface KeyListener {
        void onKey(int i, boolean z);
    }

    public interface PadSink {
        void onPad(boolean z, int i, int i2, int i3, int i4, int i5, int i6, int i7);
    }

    public interface SelectionListener {
        void onSelected(T6TouchLayout.Control control);
    }

    public void setCommandListener(CommandListener listener) {
        this.commandListener = listener;
    }

    private static final class Finger {
        boolean aiming;
        T6TouchLayout.Control control;
        long downTime;
        float downX;
        float downY;
        float lastX;
        float lastY;
        boolean moved;
        float x;
        float y;

        private Finger() {
        }
    }

    public T6TouchOverlay(Context context) {
        super(context);
        this.aimDrag = true;
        this.sprintThreshold = 0.85f;
        this.adsFireState = new T6TouchLayout.AdsFire();
        this.sprites = new HashMap();
        this.paint = new Paint(3);
        this.stroke = new Paint(1);
        this.text = new Paint(1);
        this.rect = new RectF();
        this.fingers = new SparseArray<>();
        this.cameraOwner = -1;
        this.touchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
        this.stroke.setStyle(Paint.Style.STROKE);
        this.text.setTextAlign(Paint.Align.CENTER);
        this.text.setFakeBoldText(true);
        this.text.setColor(-1378309);
    }

    public void setLayout(T6TouchLayout layout) {
        releaseAll();
        this.layout = layout;
        this.selected = null;
        invalidate();
    }

    public T6TouchLayout getLayout() {
        return this.layout;
    }

    public void setEditMode(boolean edit) {
        this.editMode = edit;
        invalidate();
    }

    public void setPadSink(PadSink sink) {
        this.sink = sink;
    }

    public void setConsoleListener(ConsoleListener listener) {
        this.consoleListener = listener;
    }

    public void setSelectionListener(SelectionListener listener) {
        this.selectionListener = listener;
    }

    public void setCameraSink(CameraSink sink) {
        this.cameraSink = sink;
    }

    public void setKeyListener(KeyListener listener) {
        this.keyListener = listener;
    }

    public void setOptions(boolean aimDrag, boolean stickSprint, float sprintThreshold, boolean adsFire) {
        this.aimDrag = aimDrag;
        this.stickSprint = stickSprint;
        this.sprintThreshold = T6TouchLayout.clamp(sprintThreshold, 0.5f, 1.0f);
        this.adsFire = adsFire;
        if (!stickSprint) {
            this.sprinting = false;
        }
        publish();
    }

    private boolean holdsKey(T6TouchLayout.Control c) {
        return (c == null || c.kind != T6TouchLayout.Kind.BUTTON || (c.binding & T6TouchLayout.SCOREBOARD) == 0) ? false : true;
    }

    private boolean isAdsFire(T6TouchLayout.Control c) {
        return this.adsFire && c != null && "hipfire".equals(c.id);
    }

    private void scheduleAdsFire(long now) {
        long next = this.adsFireState.nextChange(now);
        if (next > 0) {
            postDelayed(new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchOverlay$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    T6TouchOverlay.this.publish();
                }
            }, (next - now) + 2);
        }
    }

    private boolean otherFingerOn(T6TouchLayout.Control c, int exceptId) {
        for (int i = 0; i < this.fingers.size(); i++) {
            if (this.fingers.keyAt(i) != exceptId && this.fingers.valueAt(i).control == c) {
                return true;
            }
        }
        return false;
    }

    private boolean aimHeldBy(int exceptId) {
        T6TouchLayout.Control c;
        for (int i = 0; i < this.fingers.size(); i++) {
            if (this.fingers.keyAt(i) != exceptId && (c = this.fingers.valueAt(i).control) != null && c.kind == T6TouchLayout.Kind.BUTTON && ((c.binding & 65536) != 0 || isAdsFire(c))) {
                return true;
            }
        }
        return false;
    }

    private boolean turnsCamera(T6TouchLayout.Control c) {
        if (T6TouchLayout.aimsWhileHeld(c)) {
            return true;
        }
        return this.aimDrag && c != null && c.kind == T6TouchLayout.Kind.BUTTON && c.binding == 65536;
    }

    public T6TouchLayout.Control getSelected() {
        return this.selected;
    }

    public void setPadActive(boolean active) {
        this.padActive = active;
        if (!active) {
            releaseAll();
        }
        publish();
    }

    public void releaseAll() {
        for (int i = 0; i < this.fingers.size(); i++) {
            Finger f = this.fingers.valueAt(i);
            if ((f.control == null || f.aiming) && this.cameraSink != null) {
                this.cameraSink.onCamera(3, this.fingers.keyAt(i), 0.0f, 0.0f);
            }
            if (holdsKey(f.control) && this.keyListener != null) {
                this.keyListener.onKey(9, false);
            }
        }
        this.sprinting = false;
        this.cameraOwner = -1;
        this.adsFireState.cancel();
        if (this.fingers.size() > 0) {
            Log.i("t6android", "touch: all gestures ended (" + this.fingers.size() + " pointer(s))");
        }
        this.fingers.clear();
        publish();
        invalidate();
    }

    private static String describe(T6TouchLayout.Control c) {
        return c == null ? "camera" : c.kind == T6TouchLayout.Kind.STICK_LEFT ? "stick" : "button " + c.id;
    }

    private float cx(T6TouchLayout.Control c) {
        return c.x * getWidth();
    }

    private float cy(T6TouchLayout.Control c) {
        return c.y * getHeight();
    }

    private float radius(T6TouchLayout.Control c) {
        return c.size * getHeight() * 0.5f;
    }

    private boolean hits(T6TouchLayout.Control c, float x, float y, float slack) {
        float dx = x - cx(c);
        float dy = y - cy(c);
        float r = radius(c) * slack;
        return (dx * dx) + (dy * dy) <= r * r;
    }

    private T6TouchLayout.Control hitTest(float x, float y, boolean includeDisabled) {
        if (this.layout == null) {
            return null;
        }
        T6TouchLayout.Kind[] order = {T6TouchLayout.Kind.BUTTON, T6TouchLayout.Kind.STICK_LEFT};
        int length = order.length;
        for (int i = 0; i < length; i++) {
            T6TouchLayout.Kind kind = order[i];
            for (int i2 = this.layout.controls.size() - 1; i2 >= 0; i2--) {
                T6TouchLayout.Control c = this.layout.controls.get(i2);
                if (c.kind == kind && (c.enabled || includeDisabled)) {
                    if (hits(c, x, y, kind == T6TouchLayout.Kind.BUTTON ? 1.0f : 1.15f)) {
                        return c;
                    }
                }
            }
        }
        return null;
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent e) {
        if (this.layout == null) {
            return false;
        }
        return this.editMode ? onEditTouch(e) : onPlayTouch(e);
    }

    /* JADX WARN: Multi-variable type inference failed */
    private boolean onPlayTouch(MotionEvent motionEvent) {
        if (!this.padActive) {
            return false;
        }
        int actionMasked = motionEvent.getActionMasked();
        int actionIndex = motionEvent.getActionIndex();
        switch (actionMasked) {
            case 0:
            case T6TouchLayout.AdsFire.MAX_QUEUED /* 5 */:
                float x = motionEvent.getX(actionIndex);
                float y = motionEvent.getY(actionIndex);
                int pointerId = motionEvent.getPointerId(actionIndex);
                T6TouchLayout.Control controlHitTest = hitTest(x, y, false);
                Finger finger = new Finger();
                finger.control = controlHitTest;
                finger.x = x;
                finger.lastX = x;
                finger.downX = x;
                finger.y = y;
                finger.lastY = y;
                finger.downY = y;
                finger.downTime = SystemClock.uptimeMillis();
                this.fingers.put(pointerId, finger);
                Log.i("t6android", "touch: pointer " + pointerId + " down -> " + describe(controlHitTest) + " (" + this.fingers.size() + " active)");
                if (controlHitTest == null) {
                    Finger finger2 = this.cameraOwner >= 0 ? this.fingers.get(this.cameraOwner) : null;
                    if (finger2 != null && finger2.aiming && this.cameraSink != null) {
                        this.cameraSink.onCamera(3, this.cameraOwner, 0.0f, 0.0f);
                        finger2.aiming = false;
                        Log.i("t6android", "touch: pointer " + pointerId + " takes the camera from aiming pointer " + this.cameraOwner);
                        this.cameraOwner = -1;
                    }
                    if (this.cameraOwner < 0) {
                        this.cameraOwner = pointerId;
                    }
                    if (this.cameraSink != null && getWidth() > 0 && getHeight() > 0) {
                        this.cameraSink.onCamera(0, pointerId, x / getWidth(), y / getHeight());
                        break;
                    }
                } else if ((controlHitTest.binding & T6TouchLayout.CONSOLE) != 0 && this.consoleListener != null) {
                    this.consoleListener.onConsole();
                    break;
                } else if ((controlHitTest.binding & T6TouchLayout.PLACE_ITEM) != 0 && this.commandListener != null) {
                    this.commandListener.onCommand("t6r_placeitem");
                    break;
                } else if ((controlHitTest.binding & T6TouchLayout.PRONE) != 0 && this.commandListener != null) {
                    this.commandListener.onCommand("toggleprone");
                    break;
                } else if (holdsKey(controlHitTest) && this.keyListener != null) {
                    this.keyListener.onKey(9, true);
                    break;
                } else if (isAdsFire(controlHitTest)) {
                    long jUptimeMillis = SystemClock.uptimeMillis();
                    this.adsFireState.down(jUptimeMillis, aimHeldBy(pointerId));
                    scheduleAdsFire(jUptimeMillis);
                    Log.i("t6android", "touch: aim and fire down, triggers " + this.adsFireState.triggers(jUptimeMillis) + ", next change in " + (this.adsFireState.nextChange(jUptimeMillis) - jUptimeMillis) + " ms");
                    break;
                }
                break;
            case 1:
            case 6:
                int pointerId2 = motionEvent.getPointerId(actionIndex);
                Finger finger3 = this.fingers.get(pointerId2);
                if (finger3 != null) {
                    if ((finger3.control == null || finger3.aiming) && this.cameraSink != null && getWidth() > 0) {
                        this.cameraSink.onCamera(2, pointerId2, motionEvent.getX(actionIndex) / getWidth(), motionEvent.getY(actionIndex) / getHeight());
                    }
                    if (holdsKey(finger3.control) && this.keyListener != null) {
                        this.keyListener.onKey(9, false);
                    }
                    Log.i("t6android", "touch: pointer " + pointerId2 + " up (" + describe(finger3.control) + ")");
                    if (isAdsFire(finger3.control) && !otherFingerOn(finger3.control, pointerId2)) {
                        long jUptimeMillis2 = SystemClock.uptimeMillis();
                        this.adsFireState.up(jUptimeMillis2);
                        scheduleAdsFire(jUptimeMillis2);
                    }
                }
                if (pointerId2 == this.cameraOwner) {
                    this.cameraOwner = -1;
                }
                this.fingers.remove(pointerId2);
                break;
            case 2:
                for (int i = 0; i < motionEvent.getPointerCount(); i++) {
                    int pointerId3 = motionEvent.getPointerId(i);
                    Finger finger4 = this.fingers.get(pointerId3);
                    if (finger4 != null) {
                        finger4.x = motionEvent.getX(i);
                        finger4.y = motionEvent.getY(i);
                        if (!finger4.moved && Math.hypot(finger4.x - finger4.downX, finger4.y - finger4.downY) > this.touchSlop) {
                            finger4.moved = true;
                        }
                        if (finger4.moved && !finger4.aiming && this.cameraOwner < 0 && turnsCamera(finger4.control) && this.cameraSink != null && getWidth() > 0) {
                            finger4.aiming = true;
                            this.cameraOwner = pointerId3;
                            this.cameraSink.onCamera(0, pointerId3, finger4.lastX / getWidth(), finger4.lastY / getHeight());
                        }
                        if ((finger4.control == null || finger4.aiming) && this.cameraSink != null && ((finger4.x != finger4.lastX || finger4.y != finger4.lastY) && getWidth() > 0)) {
                            this.cameraSink.onCamera(1, pointerId3, finger4.x / getWidth(), finger4.y / getHeight());
                        }
                        finger4.lastX = finger4.x;
                        finger4.lastY = finger4.y;
                    }
                }
                break;
            case 3:
                releaseAll();
                return true;
        }
        publish();
        invalidate();
        return true;
    }

    private boolean onEditTouch(MotionEvent e) {
        switch (e.getActionMasked()) {
            case 0:
                this.selected = hitTest(e.getX(), e.getY(), true);
                if (this.selectionListener != null) {
                    this.selectionListener.onSelected(this.selected);
                }
                Finger f = new Finger();
                f.lastX = e.getX();
                f.lastY = e.getY();
                this.fingers.put(0, f);
                break;
            case 1:
            default:
                this.fingers.clear();
                break;
            case 2:
                Finger f2 = this.fingers.get(0);
                if (f2 != null && this.selected != null && getWidth() > 0 && getHeight() > 0) {
                    this.selected.x = T6TouchLayout.clamp(this.selected.x + ((e.getX() - f2.lastX) / getWidth()), 0.0f, 1.0f);
                    this.selected.y = T6TouchLayout.clamp(this.selected.y + ((e.getY() - f2.lastY) / getHeight()), 0.0f, 1.0f);
                    f2.lastX = e.getX();
                    f2.lastY = e.getY();
                    break;
                }
                break;
        }
        invalidate();
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00d2  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00d9  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00e3  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00ea  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void publish() {
        /*
            Method dump skipped, instructions count: 474
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.wiiucoop.bo2android.T6TouchOverlay.publish():void");
    }

    private Bitmap sprite(String name) {
        if (name.isEmpty()) {
            return null;
        }
        if (this.sprites.containsKey(name)) {
            return this.sprites.get(name);
        }
        int id = getResources().getIdentifier("touch_" + name.toLowerCase(Locale.ROOT), "drawable", getContext().getPackageName());
        Bitmap bitmap = id != 0 ? BitmapFactory.decodeResource(getResources(), id) : null;
        this.sprites.put(name, bitmap);
        return bitmap;
    }

    private boolean pressed(T6TouchLayout.Control c) {
        for (int i = 0; i < this.fingers.size(); i++) {
            if (this.fingers.valueAt(i).control == c) {
                return true;
            }
        }
        return false;
    }

    private Finger fingerOn(T6TouchLayout.Control c) {
        for (int i = 0; i < this.fingers.size(); i++) {
            if (this.fingers.valueAt(i).control == c) {
                return this.fingers.valueAt(i);
            }
        }
        return null;
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        float x;
        float y;
        float x2;
        float y2;
        Finger f;
        Bitmap knob;
        if (this.layout == null) {
            return;
        }
        for (T6TouchLayout.Control c : this.layout.controls) {
            if (c.enabled || this.editMode) {
                float alpha = c.enabled ? c.opacity : 0.2f;
                float alpha2 = (this.editMode || !pressed(c)) ? alpha : Math.min(1.0f, 0.25f + alpha);
                float r = radius(c);
                float x3 = cx(c);
                float y3 = cy(c);
                this.paint.setAlpha(Math.round(alpha2 * 255.0f));
                Bitmap bmp = sprite(c.sprite);
                if (bmp != null) {
                    this.rect.set(x3 - r, y3 - r, x3 + r, y3 + r);
                    canvas.drawBitmap(bmp, (Rect) null, this.rect, this.paint);
                } else {
                    this.stroke.setColor(-1378309);
                    this.stroke.setAlpha(Math.round(alpha2 * 255.0f));
                    this.stroke.setStrokeWidth(Math.max(2.0f, 0.08f * r));
                    canvas.drawCircle(x3, y3, 0.92f * r, this.stroke);
                    this.text.setTextSize((c.label.length() > 2 ? 0.45f : 0.8f) * r);
                    this.text.setAlpha(Math.round(255.0f * alpha2));
                    canvas.drawText(c.label, x3, y3 - ((this.text.descent() + this.text.ascent()) / 2.0f), this.text);
                }
                if (c.kind == T6TouchLayout.Kind.STICK_LEFT) {
                    Bitmap knob2 = sprite("analog_midle_ball");
                    float kx = x3;
                    float ky = y3;
                    if (!this.editMode) {
                        f = fingerOn(c);
                    } else {
                        f = null;
                    }
                    if (f == null) {
                        knob = knob2;
                        x = x3;
                        y = y3;
                    } else {
                        float dx = f.x - x3;
                        float dy = f.y - y3;
                        knob = knob2;
                        x = x3;
                        y = y3;
                        float len = (float) Math.hypot(dx, dy);
                        if (len > r) {
                            dx = (dx / len) * r;
                            dy = (dy / len) * r;
                        }
                        kx += dx;
                        ky += dy;
                    }
                    float kr = 0.45f * r;
                    if (knob != null) {
                        this.rect.set(kx - kr, ky - kr, kx + kr, ky + kr);
                        canvas.drawBitmap(knob, (Rect) null, this.rect, this.paint);
                    }
                } else {
                    x = x3;
                    y = y3;
                }
                if (!this.editMode || c != this.selected) {
                    x2 = x;
                    y2 = y;
                } else {
                    this.stroke.setColor(-11541505);
                    this.stroke.setAlpha(255);
                    this.stroke.setStrokeWidth(4.0f);
                    x2 = x;
                    y2 = y;
                    canvas.drawCircle(x2, y2, 6.0f + r, this.stroke);
                }
                if (this.editMode && !c.enabled) {
                    this.stroke.setColor(-1943990);
                    this.stroke.setAlpha(200);
                    this.stroke.setStrokeWidth(4.0f);
                    canvas.drawLine(x2 - (r * 0.6f), y2 - (r * 0.6f), (r * 0.6f) + x2, y2 + (0.6f * r), this.stroke);
                }
            }
        }
    }

    @Override // android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.padActive && this.sink != null) {
            this.sink.onPad(false, 0, 0, 0, 0, 0, 0, 0);
        }
        for (int i = 0; i < this.fingers.size(); i++) {
            if (holdsKey(this.fingers.valueAt(i).control) && this.keyListener != null) {
                this.keyListener.onKey(9, false);
            }
        }
    }
}
