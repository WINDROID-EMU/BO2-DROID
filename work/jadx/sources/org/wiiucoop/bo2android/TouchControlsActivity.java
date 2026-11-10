package org.wiiucoop.bo2android;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.TextView;
import android.widget.Toast;
import java.util.Locale;
import org.wiiucoop.bo2android.T6TouchLayout;
import org.wiiucoop.bo2android.T6TouchOverlay;

/* loaded from: classes3.dex */
public final class TouchControlsActivity extends Activity implements View.OnClickListener {
    private static final String TAG = "t6android";
    private T6TouchLayout codm;
    private T6TouchOverlay overlay;
    private String profile;
    private T6TouchLayout x360;

    @Override // android.app.Activity, android.view.ContextThemeWrapper, android.content.ContextWrapper
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(T6Ui.wrapLocale(base));
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        T6Ui.applyTheme(this);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_touch_controls);
        this.profile = T6Ui.touchProfile(this);
        this.codm = T6Ui.loadTouchLayout(this, T6TouchLayout.PROFILE_CODM);
        this.x360 = T6Ui.loadTouchLayout(this, T6TouchLayout.PROFILE_X360);
        this.overlay = new T6TouchOverlay(this);
        this.overlay.setEditMode(true);
        this.overlay.setSelectionListener(new T6TouchOverlay.SelectionListener() { // from class: org.wiiucoop.bo2android.TouchControlsActivity$$ExternalSyntheticLambda0
            @Override // org.wiiucoop.bo2android.T6TouchOverlay.SelectionListener
            public final void onSelected(T6TouchLayout.Control control) {
                this.f$0.m86lambda$onCreate$0$orgwiiucoopbo2androidTouchControlsActivity(control);
            }
        });
        FrameLayout area = (FrameLayout) findViewById(R.id.controls_surface);
        area.addView(this.overlay, new FrameLayout.LayoutParams(0, 0));
        area.addOnLayoutChangeListener(new View.OnLayoutChangeListener() { // from class: org.wiiucoop.bo2android.TouchControlsActivity$$ExternalSyntheticLambda1
            @Override // android.view.View.OnLayoutChangeListener
            public final void onLayoutChange(View view, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
                this.f$0.m88lambda$onCreate$2$orgwiiucoopbo2androidTouchControlsActivity(view, i, i2, i3, i4, i5, i6, i7, i8);
            }
        });
        this.overlay.setLayout(current());
        int[] buttons = {R.id.button_back, R.id.button_controls_save, R.id.button_controls_profile, R.id.button_controls_restore, R.id.button_size_minus, R.id.button_size_plus, R.id.button_opacity_minus, R.id.button_opacity_plus, R.id.button_sensitivity_minus, R.id.button_sensitivity_plus, R.id.button_deadzone_minus, R.id.button_deadzone_plus, R.id.button_controls_enabled};
        for (int id : buttons) {
            findViewById(id).setOnClickListener(this);
        }
        refresh();
    }

    /* renamed from: lambda$onCreate$0$org-wiiucoop-bo2android-TouchControlsActivity, reason: not valid java name */
    /* synthetic */ void m86lambda$onCreate$0$orgwiiucoopbo2androidTouchControlsActivity(T6TouchLayout.Control control) {
        refresh();
    }

    /* renamed from: lambda$onCreate$1$org-wiiucoop-bo2android-TouchControlsActivity, reason: not valid java name */
    /* synthetic */ void m87lambda$onCreate$1$orgwiiucoopbo2androidTouchControlsActivity(int r, int l, int b, int t) throws NumberFormatException {
        fitOverlay(r - l, b - t);
    }

    /* renamed from: lambda$onCreate$2$org-wiiucoop-bo2android-TouchControlsActivity, reason: not valid java name */
    /* synthetic */ void m88lambda$onCreate$2$orgwiiucoopbo2androidTouchControlsActivity(View v, final int l, final int t, final int r, final int b, int ol, int ot, int or, int ob) {
        v.post(new Runnable() { // from class: org.wiiucoop.bo2android.TouchControlsActivity$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() throws NumberFormatException {
                this.f$0.m87lambda$onCreate$1$orgwiiucoopbo2androidTouchControlsActivity(r, l, b, t);
            }
        });
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        T6Ui.applyImmersive(this);
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onWindowFocusChanged(boolean hasFocus) {
        super.onWindowFocusChanged(hasFocus);
        if (hasFocus) {
            T6Ui.applyImmersive(this);
        }
    }

    private int[] gameSurface() throws NumberFormatException {
        String saved = T6Ui.getString(this, T6Ui.KEY_TOUCH_SURFACE, "");
        int x = saved.indexOf(120);
        if (x > 0) {
            try {
                int w = Integer.parseInt(saved.substring(0, x));
                int h = Integer.parseInt(saved.substring(x + 1));
                if (w > 0 && h > 0) {
                    return new int[]{Math.max(w, h), Math.min(w, h)};
                }
            } catch (NumberFormatException e) {
            }
        }
        DisplayMetrics m = new DisplayMetrics();
        getWindowManager().getDefaultDisplay().getRealMetrics(m);
        return new int[]{Math.max(m.widthPixels, m.heightPixels), Math.min(m.widthPixels, m.heightPixels)};
    }

    private void fitOverlay(int areaWidth, int areaHeight) throws NumberFormatException {
        int[] game = gameSurface();
        int[] r = T6TouchLayout.fitSurface(areaWidth, areaHeight, game[0], game[1]);
        FrameLayout.LayoutParams p = (FrameLayout.LayoutParams) this.overlay.getLayoutParams();
        if (p.leftMargin == r[0] && p.topMargin == r[1] && p.width == r[2] && p.height == r[3]) {
            return;
        }
        p.leftMargin = r[0];
        p.topMargin = r[1];
        p.width = r[2];
        p.height = r[3];
        this.overlay.setLayoutParams(p);
        Log.i(TAG, "controls editor: surface " + r[2] + "x" + r[3] + " at " + r[0] + "," + r[1] + " = the game surface " + game[0] + "x" + game[1] + " scaled");
    }

    private T6TouchLayout current() {
        return T6TouchLayout.PROFILE_X360.equals(this.profile) ? this.x360 : this.codm;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        int id = view.getId();
        T6TouchLayout.Control c = this.overlay.getSelected();
        if (id == R.id.button_back) {
            finish();
        } else if (id == R.id.button_controls_save) {
            T6Ui.saveTouchLayout(this, this.codm);
            T6Ui.saveTouchLayout(this, this.x360);
            T6Ui.setString(this, T6Ui.KEY_TOUCH_PROFILE, this.profile);
            Log.i(TAG, "controls: saved both profiles; in game: " + this.profile);
            Toast.makeText(this, R.string.controls_saved, 0).show();
            finish();
        } else {
            int i = R.id.button_controls_profile;
            String str = T6TouchLayout.PROFILE_X360;
            if (id == i) {
                if (T6TouchLayout.PROFILE_X360.equals(this.profile)) {
                    str = T6TouchLayout.PROFILE_CODM;
                }
                this.profile = str;
                this.overlay.setLayout(current());
            } else if (id == R.id.button_controls_restore) {
                T6TouchLayout fresh = T6TouchLayout.defaults(this.profile);
                if (T6TouchLayout.PROFILE_X360.equals(this.profile)) {
                    this.x360 = fresh;
                } else {
                    this.codm = fresh;
                }
                this.overlay.setLayout(fresh);
            } else if (c != null) {
                if (id == R.id.button_size_minus) {
                    c.size = T6TouchLayout.clamp(c.size - 0.01f, 0.06f, 0.9f);
                } else if (id == R.id.button_size_plus) {
                    c.size = T6TouchLayout.clamp(c.size + 0.01f, 0.06f, 0.9f);
                } else if (id == R.id.button_opacity_minus) {
                    c.opacity = T6TouchLayout.clamp(c.opacity - 0.05f, 0.0f, 1.0f);
                } else if (id == R.id.button_opacity_plus) {
                    c.opacity = T6TouchLayout.clamp(c.opacity + 0.05f, 0.0f, 1.0f);
                } else if (id == R.id.button_sensitivity_minus) {
                    c.sensitivity = T6TouchLayout.clamp(c.sensitivity - 0.1f, 0.2f, 3.0f);
                } else if (id == R.id.button_sensitivity_plus) {
                    c.sensitivity = T6TouchLayout.clamp(c.sensitivity + 0.1f, 0.2f, 3.0f);
                } else if (id == R.id.button_deadzone_minus) {
                    c.deadzone = T6TouchLayout.clamp(c.deadzone - 0.02f, 0.0f, 0.6f);
                } else if (id == R.id.button_deadzone_plus) {
                    c.deadzone = T6TouchLayout.clamp(c.deadzone + 0.02f, 0.0f, 0.6f);
                } else if (id == R.id.button_controls_enabled) {
                    c.enabled = !c.enabled;
                }
                this.overlay.invalidate();
            }
        }
        refresh();
    }

    private void refresh() {
        ((Button) findViewById(R.id.button_controls_profile)).setText(T6TouchLayout.PROFILE_X360.equals(this.profile) ? R.string.touch_profile_x360 : R.string.touch_profile_codm);
        T6TouchLayout.Control c = this.overlay.getSelected();
        boolean stick = (c == null || c.kind == T6TouchLayout.Kind.BUTTON) ? false : true;
        ((TextView) findViewById(R.id.text_controls_selected)).setText(c == null ? getString(R.string.controls_select_hint) : c.id);
        ((TextView) findViewById(R.id.text_controls_size)).setText(getString(R.string.controls_size, new Object[]{c == null ? "—" : String.format(Locale.ROOT, "%.0f%%", Float.valueOf(c.size * 100.0f))}));
        ((TextView) findViewById(R.id.text_controls_opacity)).setText(getString(R.string.controls_opacity, new Object[]{c == null ? "—" : String.format(Locale.ROOT, "%.0f%%", Float.valueOf(c.opacity * 100.0f))}));
        ((TextView) findViewById(R.id.text_controls_sensitivity)).setText(getString(R.string.controls_sensitivity, new Object[]{stick ? String.format(Locale.ROOT, "%.1fx", Float.valueOf(c.sensitivity)) : "—"}));
        ((TextView) findViewById(R.id.text_controls_deadzone)).setText(getString(R.string.controls_deadzone, new Object[]{stick ? String.format(Locale.ROOT, "%.0f%%", Float.valueOf(c.deadzone * 100.0f)) : "—"}));
        ((Button) findViewById(R.id.button_controls_enabled)).setText((c == null || c.enabled) ? R.string.controls_disable : R.string.controls_enable);
        int[] stickOnly = {R.id.button_sensitivity_minus, R.id.button_sensitivity_plus};
        for (int id : stickOnly) {
            findViewById(id).setEnabled(stick);
        }
        boolean dead = stick;
        findViewById(R.id.button_deadzone_minus).setEnabled(dead);
        findViewById(R.id.button_deadzone_plus).setEnabled(dead);
    }
}
