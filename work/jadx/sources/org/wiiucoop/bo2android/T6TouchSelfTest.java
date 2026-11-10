package org.wiiucoop.bo2android;

import android.os.Handler;
import android.os.SystemClock;
import android.util.Log;
import android.view.MotionEvent;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.wiiucoop.bo2android.T6TouchLayout;

/* loaded from: classes3.dex */
final class T6TouchSelfTest {
    private static final String TAG = "t6android";
    private final Handler handler;
    private final ViewGroup root;
    private final long downTime = SystemClock.uptimeMillis();
    private final List<int[]> active = new ArrayList();

    private T6TouchSelfTest(ViewGroup root, Handler handler) {
        this.root = root;
        this.handler = handler;
    }

    static void run(ViewGroup root, Handler handler, T6TouchLayout layout) {
        if (root == null || layout == null || root.getWidth() <= 0) {
            return;
        }
        new T6TouchSelfTest(root, handler).schedule(layout);
    }

    private int px(float nx) {
        return Math.round(this.root.getWidth() * nx);
    }

    private int py(float ny) {
        return Math.round(this.root.getHeight() * ny);
    }

    private void schedule(T6TouchLayout layout) {
        int i;
        long t;
        T6TouchLayout.Control stick = null;
        T6TouchLayout.Control button = null;
        for (T6TouchLayout.Control c : layout.controls) {
            if (c.kind == T6TouchLayout.Kind.STICK_LEFT && stick == null) {
                stick = c;
            }
            if (c.kind == T6TouchLayout.Kind.BUTTON && (c.binding == 4096 || "jump".equals(c.id))) {
                if (button == null) {
                    button = c;
                }
            }
        }
        if (stick != null && button != null) {
            final int sx = px(stick.x);
            final int sy = py(stick.y);
            final int bx = px(button.x);
            final int by = py(button.y);
            final int cx = px(0.45f);
            final int cy = py(0.4f);
            at(300L, new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m55lambda$schedule$0$orgwiiucoopbo2androidT6TouchSelfTest(sx, sy);
                }
            });
            int i2 = 1;
            while (i2 <= 10) {
                final int k = i2;
                at((i2 * 40) + 300, new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda2
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m56lambda$schedule$1$orgwiiucoopbo2androidT6TouchSelfTest(sx, sy, k);
                    }
                });
                i2++;
                stick = stick;
            }
            at(300 + 500, new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda14
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m67lambda$schedule$2$orgwiiucoopbo2androidT6TouchSelfTest(cx, cy);
                }
            });
            int i3 = 1;
            while (i3 <= 15) {
                final int k2 = i3;
                final int cy2 = cy;
                at(300 + 520 + (i3 * 33), new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda16
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m78lambda$schedule$3$orgwiiucoopbo2androidT6TouchSelfTest(cx, k2, cy2);
                    }
                });
                i3++;
                cy = cy2;
            }
            final int cy3 = cy;
            at(1100 + 300, new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda17
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m80lambda$schedule$4$orgwiiucoopbo2androidT6TouchSelfTest(bx, by);
                }
            });
            for (int i4 = 1; i4 <= 10; i4++) {
                final int k3 = i4;
                at(300 + 1150 + (i4 * 33), new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda18
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m81lambda$schedule$5$orgwiiucoopbo2androidT6TouchSelfTest(cx, cy3, k3);
                    }
                });
            }
            at(1600 + 300, new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda19
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m82lambda$schedule$6$orgwiiucoopbo2androidT6TouchSelfTest();
                }
            });
            at(1800 + 300, new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda20
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m83lambda$schedule$7$orgwiiucoopbo2androidT6TouchSelfTest();
                }
            });
            at(300 + 2000, new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda21
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m84lambda$schedule$8$orgwiiucoopbo2androidT6TouchSelfTest();
                }
            });
            long t2 = 300 + 3000;
            at(t2, new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda23
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m85lambda$schedule$9$orgwiiucoopbo2androidT6TouchSelfTest(cx, cy3);
                }
            });
            int i5 = 1;
            while (true) {
                if (i5 > 8) {
                    break;
                }
                final int k4 = i5;
                at((i5 * 33) + t2, new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda11
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m57lambda$schedule$10$orgwiiucoopbo2androidT6TouchSelfTest(cx, k4, cy3);
                    }
                });
                i5++;
            }
            at(400 + t2, new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda22
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m58lambda$schedule$11$orgwiiucoopbo2androidT6TouchSelfTest(sx, sy);
                }
            });
            int i6 = 1;
            for (i = 8; i6 <= i; i = 8) {
                final int k5 = i6;
                long j = (i6 * 40) + 420 + t2;
                final int cy4 = cy3;
                int i7 = i6;
                final int i8 = sx;
                final int i9 = sy;
                at(j, new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda24
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m59lambda$schedule$12$orgwiiucoopbo2androidT6TouchSelfTest(i8, k5, i9, cx, cy4);
                    }
                });
                i6 = i7 + 1;
                sx = sx;
                t2 = t2;
                sy = sy;
                button = button;
                cy3 = cy4;
            }
            long t3 = t2;
            final int cy5 = cy3;
            final int sx2 = sx;
            final int sy2 = sy;
            at(t3 + 900, new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda25
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m60lambda$schedule$13$orgwiiucoopbo2androidT6TouchSelfTest();
                }
            });
            for (int i10 = 1; i10 <= 5; i10++) {
                final int k6 = i10;
                at(t3 + 920 + (i10 * 33), new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda26
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m61lambda$schedule$14$orgwiiucoopbo2androidT6TouchSelfTest(cx, k6, cy5);
                    }
                });
            }
            final int cy6 = cy5;
            at(t3 + 1200, new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda27
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m62lambda$schedule$15$orgwiiucoopbo2androidT6TouchSelfTest();
                }
            });
            T6TouchLayout.Control shoot = layout.find("shoot");
            T6TouchLayout.Control ads = layout.find("ads");
            if (shoot == null || ads == null) {
                StringBuilder ids = new StringBuilder();
                Iterator<T6TouchLayout.Control> it = layout.controls.iterator();
                while (it.hasNext()) {
                    ids.append(it.next().id).append(' ');
                }
                log("C: skipped (profile " + layout.profile + ": " + ((Object) ids) + ")");
            }
            if (shoot != null && ads != null) {
                final int fx = px(shoot.x);
                final int fy = py(shoot.y);
                final int fx2 = px(ads.x);
                final int ay = py(ads.y);
                long t4 = t3 + 2000;
                at(t4, new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda28
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m63lambda$schedule$16$orgwiiucoopbo2androidT6TouchSelfTest(fx, fy);
                    }
                });
                at(t4 + 500, new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda29
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m64lambda$schedule$17$orgwiiucoopbo2androidT6TouchSelfTest(cx, cy6);
                    }
                });
                int i11 = 1;
                while (i11 <= 10) {
                    final int k7 = i11;
                    at(t4 + 520 + (i11 * 33), new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda30
                        @Override // java.lang.Runnable
                        public final void run() {
                            this.f$0.m65lambda$schedule$18$orgwiiucoopbo2androidT6TouchSelfTest(cx, k7, cy6);
                        }
                    });
                    i11++;
                    ads = ads;
                }
                at(1000 + t4, new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda1
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m66lambda$schedule$19$orgwiiucoopbo2androidT6TouchSelfTest();
                    }
                });
                at(1300 + t4, new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda3
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m68lambda$schedule$20$orgwiiucoopbo2androidT6TouchSelfTest(bx, by);
                    }
                });
                at(1450 + t4, new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda4
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m69lambda$schedule$21$orgwiiucoopbo2androidT6TouchSelfTest();
                    }
                });
                at(1700 + t4, new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda5
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m70lambda$schedule$22$orgwiiucoopbo2androidT6TouchSelfTest(fx2, ay);
                    }
                });
                at(2300 + t4, new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda6
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m71lambda$schedule$23$orgwiiucoopbo2androidT6TouchSelfTest();
                    }
                });
                at(2500 + t4, new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda7
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m72lambda$schedule$24$orgwiiucoopbo2androidT6TouchSelfTest(sx2, sy2);
                    }
                });
                int i12 = 1;
                while (i12 <= 8) {
                    final int k8 = i12;
                    at(t4 + 2520 + (i12 * 40), new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda8
                        @Override // java.lang.Runnable
                        public final void run() {
                            this.f$0.m73lambda$schedule$25$orgwiiucoopbo2androidT6TouchSelfTest(sx2, sy2, k8);
                        }
                    });
                    i12++;
                    fx = fx;
                    cy6 = cy6;
                }
                final int fx3 = fx;
                at(t4 + 3000, new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda9
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m74lambda$schedule$26$orgwiiucoopbo2androidT6TouchSelfTest();
                    }
                });
                long j2 = 3300;
                at(t4 + 3300, new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda10
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m75lambda$schedule$27$orgwiiucoopbo2androidT6TouchSelfTest();
                    }
                });
                int i13 = 1;
                while (i13 <= 12) {
                    final int k9 = i13;
                    int ax = fx2;
                    at(t4 + j2 + (i13 * 33), new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda12
                        @Override // java.lang.Runnable
                        public final void run() {
                            this.f$0.m76lambda$schedule$28$orgwiiucoopbo2androidT6TouchSelfTest(fx3, k9, fy);
                        }
                    });
                    i13++;
                    fx2 = ax;
                    j2 = 3300;
                }
                at(t4 + 3900, new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda13
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m77lambda$schedule$29$orgwiiucoopbo2androidT6TouchSelfTest();
                    }
                });
                t = 3900 + t4;
            } else {
                t = t3;
            }
            at(1500 + t, new Runnable() { // from class: org.wiiucoop.bo2android.T6TouchSelfTest$$ExternalSyntheticLambda15
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m79lambda$schedule$30$orgwiiucoopbo2androidT6TouchSelfTest();
                }
            });
            return;
        }
        Log.i(TAG, "touch selftest: the layout has no stick or jump button; not run");
    }

    /* renamed from: lambda$schedule$0$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m55lambda$schedule$0$orgwiiucoopbo2androidT6TouchSelfTest(int sx, int sy) {
        log("A: stick down");
        down(0, sx, sy);
    }

    /* renamed from: lambda$schedule$1$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m56lambda$schedule$1$orgwiiucoopbo2androidT6TouchSelfTest(int sx, int sy, int k) {
        move(0, sx, sy - (k * 12));
    }

    /* renamed from: lambda$schedule$2$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m67lambda$schedule$2$orgwiiucoopbo2androidT6TouchSelfTest(int cx, int cy) {
        log("A: camera finger down while walking");
        down(1, cx, cy);
    }

    /* renamed from: lambda$schedule$3$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m78lambda$schedule$3$orgwiiucoopbo2androidT6TouchSelfTest(int cx, int k, int cy) {
        move(1, (k * 20) + cx, cy);
    }

    /* renamed from: lambda$schedule$4$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m80lambda$schedule$4$orgwiiucoopbo2androidT6TouchSelfTest(int bx, int by) {
        log("A: button held while walking and looking");
        down(2, bx, by);
    }

    /* renamed from: lambda$schedule$5$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m81lambda$schedule$5$orgwiiucoopbo2androidT6TouchSelfTest(int cx, int cy, int k) {
        move(1, cx + 300, (k * 12) + cy);
    }

    /* renamed from: lambda$schedule$6$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m82lambda$schedule$6$orgwiiucoopbo2androidT6TouchSelfTest() {
        log("A: camera lifts first");
        up(1);
    }

    /* renamed from: lambda$schedule$7$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m83lambda$schedule$7$orgwiiucoopbo2androidT6TouchSelfTest() {
        log("A: button lifts");
        up(2);
    }

    /* renamed from: lambda$schedule$8$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m84lambda$schedule$8$orgwiiucoopbo2androidT6TouchSelfTest() {
        log("A: stick lifts");
        up(0);
    }

    /* renamed from: lambda$schedule$9$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m85lambda$schedule$9$orgwiiucoopbo2androidT6TouchSelfTest(int cx, int cy) {
        log("B: camera finger down first");
        down(3, cx, cy);
    }

    /* renamed from: lambda$schedule$10$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m57lambda$schedule$10$orgwiiucoopbo2androidT6TouchSelfTest(int cx, int k, int cy) {
        move(3, cx - (k * 20), cy);
    }

    /* renamed from: lambda$schedule$11$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m58lambda$schedule$11$orgwiiucoopbo2androidT6TouchSelfTest(int sx, int sy) {
        log("B: stick down while looking");
        down(4, sx, sy);
    }

    /* renamed from: lambda$schedule$12$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m59lambda$schedule$12$orgwiiucoopbo2androidT6TouchSelfTest(int sx, int k, int sy, int cx, int cy) {
        move(4, (k * 12) + sx, sy);
        move(3, (cx - 160) - (k * 15), cy);
    }

    /* renamed from: lambda$schedule$13$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m60lambda$schedule$13$orgwiiucoopbo2androidT6TouchSelfTest() {
        log("B: stick lifts before the camera");
        up(4);
    }

    /* renamed from: lambda$schedule$14$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m61lambda$schedule$14$orgwiiucoopbo2androidT6TouchSelfTest(int cx, int k, int cy) {
        move(3, (cx - 280) - (k * 15), cy);
    }

    /* renamed from: lambda$schedule$15$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m62lambda$schedule$15$orgwiiucoopbo2androidT6TouchSelfTest() {
        log("B: camera lifts");
        up(3);
    }

    /* renamed from: lambda$schedule$16$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m63lambda$schedule$16$orgwiiucoopbo2androidT6TouchSelfTest(int fx, int fy) {
        log("C: fire held");
        down(5, fx, fy);
    }

    /* renamed from: lambda$schedule$17$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m64lambda$schedule$17$orgwiiucoopbo2androidT6TouchSelfTest(int cx, int cy) {
        log("C: camera drag while firing");
        down(6, cx, cy);
    }

    /* renamed from: lambda$schedule$18$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m65lambda$schedule$18$orgwiiucoopbo2androidT6TouchSelfTest(int cx, int k, int cy) {
        move(6, (k * 15) + cx, cy);
    }

    /* renamed from: lambda$schedule$19$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m66lambda$schedule$19$orgwiiucoopbo2androidT6TouchSelfTest() {
        log("C: camera lifts, fire still held");
        up(6);
    }

    /* renamed from: lambda$schedule$20$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m68lambda$schedule$20$orgwiiucoopbo2androidT6TouchSelfTest(int bx, int by) {
        log("C: jump tap while firing");
        down(7, bx, by);
    }

    /* renamed from: lambda$schedule$21$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m69lambda$schedule$21$orgwiiucoopbo2androidT6TouchSelfTest() {
        log("C: jump lifts");
        up(7);
    }

    /* renamed from: lambda$schedule$22$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m70lambda$schedule$22$orgwiiucoopbo2androidT6TouchSelfTest(int ax, int ay) {
        log("C: ads held while firing");
        down(8, ax, ay);
    }

    /* renamed from: lambda$schedule$23$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m71lambda$schedule$23$orgwiiucoopbo2androidT6TouchSelfTest() {
        log("C: ads lifts");
        up(8);
    }

    /* renamed from: lambda$schedule$24$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m72lambda$schedule$24$orgwiiucoopbo2androidT6TouchSelfTest(int sx, int sy) {
        log("C: walk while firing");
        down(9, sx, sy);
    }

    /* renamed from: lambda$schedule$25$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m73lambda$schedule$25$orgwiiucoopbo2androidT6TouchSelfTest(int sx, int sy, int k) {
        move(9, sx, sy - (k * 12));
    }

    /* renamed from: lambda$schedule$26$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m74lambda$schedule$26$orgwiiucoopbo2androidT6TouchSelfTest() {
        log("C: stick lifts, fire still held");
        up(9);
    }

    /* renamed from: lambda$schedule$27$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m75lambda$schedule$27$orgwiiucoopbo2androidT6TouchSelfTest() {
        log("C: fire finger drags (aims while firing)");
    }

    /* renamed from: lambda$schedule$28$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m76lambda$schedule$28$orgwiiucoopbo2androidT6TouchSelfTest(int fx, int k, int fy) {
        move(5, fx - (k * 18), fy);
    }

    /* renamed from: lambda$schedule$29$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m77lambda$schedule$29$orgwiiucoopbo2androidT6TouchSelfTest() {
        log("C: fire lifts");
        up(5);
    }

    /* renamed from: lambda$schedule$30$org-wiiucoop-bo2android-T6TouchSelfTest, reason: not valid java name */
    /* synthetic */ void m79lambda$schedule$30$orgwiiucoopbo2androidT6TouchSelfTest() {
        log("done");
    }

    private void at(long delay, Runnable r) {
        this.handler.postDelayed(r, delay);
    }

    private void log(String what) {
        Log.i(TAG, "touch selftest: " + what);
    }

    private int indexOf(int id) {
        for (int i = 0; i < this.active.size(); i++) {
            if (this.active.get(i)[0] == id) {
                return i;
            }
        }
        return -1;
    }

    private void down(int id, int x, int y) {
        this.active.add(new int[]{id, x, y});
        int action = this.active.size() == 1 ? 0 : ((this.active.size() - 1) << 8) | 5;
        dispatch(action);
    }

    private void move(int id, int x, int y) {
        int i = indexOf(id);
        if (i < 0) {
            return;
        }
        this.active.get(i)[1] = x;
        this.active.get(i)[2] = y;
        dispatch(2);
    }

    private void up(int id) {
        int i = indexOf(id);
        if (i < 0) {
            return;
        }
        int action = this.active.size() != 1 ? (i << 8) | 6 : 1;
        dispatch(action);
        this.active.remove(i);
    }

    private void dispatch(int action) {
        int n = this.active.size();
        MotionEvent.PointerProperties[] props = new MotionEvent.PointerProperties[n];
        MotionEvent.PointerCoords[] coords = new MotionEvent.PointerCoords[n];
        for (int i = 0; i < n; i++) {
            props[i] = new MotionEvent.PointerProperties();
            props[i].id = this.active.get(i)[0];
            props[i].toolType = 1;
            coords[i] = new MotionEvent.PointerCoords();
            coords[i].x = this.active.get(i)[1];
            coords[i].y = this.active.get(i)[2];
            coords[i].pressure = 1.0f;
            coords[i].size = 1.0f;
        }
        MotionEvent e = MotionEvent.obtain(this.downTime, SystemClock.uptimeMillis(), action, n, props, coords, 0, 0, 1.0f, 1.0f, 0, 0, 4098, 0);
        this.root.dispatchTouchEvent(e);
        e.recycle();
    }
}
