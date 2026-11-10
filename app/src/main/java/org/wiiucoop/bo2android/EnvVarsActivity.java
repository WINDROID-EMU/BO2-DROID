package org.wiiucoop.bo2android;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.wiiucoop.bo2android.T6EnvVars;
import org.wiiucoop.bo2android.T6TouchLayout;

/* loaded from: classes3.dex */
public final class EnvVarsActivity extends Activity implements View.OnClickListener {
    private static final String TAG = "t6android";
    private LinearLayout rows;
    private TextView status;
    private final List<T6EnvVars.Var> vars = new ArrayList();
    private List<T6EnvVars.Var> saved = new ArrayList();

    /* JADX INFO: Access modifiers changed from: private */
    interface OnText {
        void changed(String str);
    }

    @Override // android.app.Activity, android.view.ContextThemeWrapper, android.content.ContextWrapper
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(T6Ui.wrapLocale(base));
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        T6Ui.applyTheme(this);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_env_vars);
        this.rows = (LinearLayout) findViewById(R.id.env_rows);
        this.status = (TextView) findViewById(R.id.text_env_status);
        findViewById(R.id.button_back).setOnClickListener(this);
        findViewById(R.id.button_env_add).setOnClickListener(this);
        findViewById(R.id.button_env_save).setOnClickListener(this);
        this.saved = T6EnvVars.load(getFilesDir());
        for (T6EnvVars.Var v : this.saved) {
            this.vars.add(v.copy());
        }
        rebuildRows();
        refreshStatus();
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        refreshStatus();
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onWindowFocusChanged(boolean hasFocus) {
        super.onWindowFocusChanged(hasFocus);
        if (hasFocus) {
            T6Ui.applyImmersive(this);
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        int id = view.getId();
        if (id == R.id.button_back) {
            leave();
            return;
        }
        if (id == R.id.button_env_add) {
            this.vars.add(new T6EnvVars.Var("", "", true));
            rebuildRows();
            View last = this.rows.getChildAt(this.rows.getChildCount() - 1);
            if (last != null) {
                last.findViewById(R.id.edit_env_name).requestFocus();
                return;
            }
            return;
        }
        if (id == R.id.button_env_save) {
            save();
        }
    }

    @Override // android.app.Activity
    public void onBackPressed() {
        leave();
    }

    private void leave() {
        if (sameAsSaved()) {
            finish();
        } else {
            new AlertDialog.Builder(this).setMessage(R.string.env_leave_unsaved).setPositiveButton(R.string.env_save, new DialogInterface.OnClickListener() { // from class: org.wiiucoop.bo2android.EnvVarsActivity$$ExternalSyntheticLambda5
                @Override // android.content.DialogInterface.OnClickListener
                public final void onClick(DialogInterface dialogInterface, int i) {
                    EnvVarsActivity.this.m0lambda$leave$0$orgwiiucoopbo2androidEnvVarsActivity(dialogInterface, i);
                }
            }).setNegativeButton(R.string.env_discard, new DialogInterface.OnClickListener() { // from class: org.wiiucoop.bo2android.EnvVarsActivity$$ExternalSyntheticLambda6
                @Override // android.content.DialogInterface.OnClickListener
                public final void onClick(DialogInterface dialogInterface, int i) {
                    EnvVarsActivity.this.m1lambda$leave$1$orgwiiucoopbo2androidEnvVarsActivity(dialogInterface, i);
                }
            }).setNeutralButton(R.string.action_cancel, (DialogInterface.OnClickListener) null).show();
        }
    }

    /* renamed from: lambda$leave$0$org-wiiucoop-bo2android-EnvVarsActivity, reason: not valid java name */
    /* synthetic */ void m0lambda$leave$0$orgwiiucoopbo2androidEnvVarsActivity(DialogInterface d, int w) {
        save();
        if (sameAsSaved()) {
            finish();
        }
    }

    /* renamed from: lambda$leave$1$org-wiiucoop-bo2android-EnvVarsActivity, reason: not valid java name */
    /* synthetic */ void m1lambda$leave$1$orgwiiucoopbo2androidEnvVarsActivity(DialogInterface d, int w) {
        finish();
    }

    private void rebuildRows() {
        this.rows.removeAllViews();
        LayoutInflater inflater = LayoutInflater.from(this);
        Iterator<T6EnvVars.Var> it = this.vars.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            final T6EnvVars.Var v = it.next();
            View row = inflater.inflate(R.layout.view_env_row, (ViewGroup) this.rows, false);
            EditText name = (EditText) row.findViewById(R.id.edit_env_name);
            final EditText value = (EditText) row.findViewById(R.id.edit_env_value);
            Switch enabled = (Switch) row.findViewById(R.id.switch_env_enabled);
            Button remove = (Button) row.findViewById(R.id.button_env_remove);
            name.setText(v.name);
            value.setText(v.value);
            enabled.setChecked(v.enabled);
            name.addTextChangedListener(new Watcher(new OnText() { // from class: org.wiiucoop.bo2android.EnvVarsActivity$$ExternalSyntheticLambda0
                @Override // org.wiiucoop.bo2android.EnvVarsActivity.OnText
                public final void changed(String str) {
                    v.name = str.trim();
                }
            }));
            name.setOnEditorActionListener(new TextView.OnEditorActionListener() { // from class: org.wiiucoop.bo2android.EnvVarsActivity$$ExternalSyntheticLambda1
                @Override // android.widget.TextView.OnEditorActionListener
                public final boolean onEditorAction(TextView textView, int i, KeyEvent keyEvent) {
                    return EnvVarsActivity.lambda$rebuildRows$3(value, textView, i, keyEvent);
                }
            });
            value.addTextChangedListener(new Watcher(new OnText() { // from class: org.wiiucoop.bo2android.EnvVarsActivity$$ExternalSyntheticLambda2
                @Override // org.wiiucoop.bo2android.EnvVarsActivity.OnText
                public final void changed(String str) {
                    v.value = str;
                }
            }));
            enabled.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() { // from class: org.wiiucoop.bo2android.EnvVarsActivity$$ExternalSyntheticLambda3
                @Override // android.widget.CompoundButton.OnCheckedChangeListener
                public final void onCheckedChanged(CompoundButton compoundButton, boolean z) {
                    EnvVarsActivity.this.m2lambda$rebuildRows$5$orgwiiucoopbo2androidEnvVarsActivity(v, compoundButton, z);
                }
            });
            remove.setOnClickListener(new View.OnClickListener() { // from class: org.wiiucoop.bo2android.EnvVarsActivity$$ExternalSyntheticLambda4
                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    EnvVarsActivity.this.m3lambda$rebuildRows$6$orgwiiucoopbo2androidEnvVarsActivity(v, view);
                }
            });
            this.rows.addView(row);
        }
        findViewById(R.id.text_env_empty).setVisibility(this.vars.isEmpty() ? 0 : 8);
    }

    static /* synthetic */ boolean lambda$rebuildRows$3(EditText value, TextView tv, int action, KeyEvent event) {
        value.requestFocus();
        return true;
    }

    /* renamed from: lambda$rebuildRows$5$org-wiiucoop-bo2android-EnvVarsActivity, reason: not valid java name */
    /* synthetic */ void m2lambda$rebuildRows$5$orgwiiucoopbo2androidEnvVarsActivity(T6EnvVars.Var v, CompoundButton b, boolean checked) {
        v.enabled = checked;
        refreshStatus();
    }

    /* renamed from: lambda$rebuildRows$6$org-wiiucoop-bo2android-EnvVarsActivity, reason: not valid java name */
    /* synthetic */ void m3lambda$rebuildRows$6$orgwiiucoopbo2androidEnvVarsActivity(T6EnvVars.Var v, View x) {
        this.vars.remove(v);
        rebuildRows();
        refreshStatus();
    }

    private void save() {
        List<T6EnvVars.Var> list = new ArrayList<>();
        for (T6EnvVars.Var v : this.vars) {
            if (!v.name.isEmpty() || (v.value != null && !v.value.isEmpty())) {
                list.add(v.copy());
            }
        }
        int[] at = {0};
        T6EnvVars.Problem p = T6EnvVars.listProblem(list, at);
        if (p != T6EnvVars.Problem.OK) {
            String who = list.get(at[0]).name.isEmpty() ? "#" + (at[0] + 1) : list.get(at[0]).name;
            toast(getString(R.string.env_invalid, new Object[]{who, problemText(p)}));
            Log.i(TAG, "settings: env vars not saved: " + who + " " + p);
            return;
        }
        if (list.size() > 64) {
            toast(getString(R.string.env_too_many, new Object[]{64}));
            return;
        }
        try {
            T6EnvVars.save(getFilesDir(), list);
            this.saved = list;
            this.vars.clear();
            Iterator<T6EnvVars.Var> it = list.iterator();
            while (it.hasNext()) {
                this.vars.add(it.next().copy());
            }
            rebuildRows();
            Log.i(TAG, "settings: env vars saved: " + T6EnvVars.effective(list) + " (" + list.size() + " line(s))");
            toast(getString(gameRunning() ? R.string.env_saved_restart : R.string.env_saved));
            refreshStatus();
        } catch (IOException e) {
            toast(getString(R.string.env_save_failed, new Object[]{e.getMessage()}));
            Log.w(TAG, "settings: env vars not saved: " + e.getMessage());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void refreshStatus() {
        if (this.status == null) {
            return;
        }
        Map<String, String> next = T6EnvVars.effective(this.saved);
        StringBuilder sb = new StringBuilder();
        if (next.isEmpty()) {
            sb.append(getString(R.string.env_status_none));
        } else {
            sb.append(getString(R.string.env_status_next));
            for (Map.Entry<String, String> e : next.entrySet()) {
                sb.append(T6PlayerName.TRAILING_NEWLINE).append(e.getKey()).append('=').append(e.getValue());
            }
        }
        boolean running = gameRunning();
        if (T6EnvVars.pendingRestart(running, T6EnvVars.applied(getFilesDir()), this.saved)) {
            sb.append("\n\n").append(getString(R.string.env_status_restart));
        }
        if (!sameAsSaved()) {
            sb.append("\n\n").append(getString(R.string.env_status_unsaved));
        }
        this.status.setText(sb.toString());
    }

    private boolean sameAsSaved() {
        if (this.vars.size() != this.saved.size()) {
            return false;
        }
        for (int i = 0; i < this.vars.size(); i++) {
            T6EnvVars.Var a = this.vars.get(i);
            T6EnvVars.Var b = this.saved.get(i);
            if (!a.name.equals(b.name) || !String.valueOf(a.value).equals(String.valueOf(b.value)) || a.enabled != b.enabled) {
                return false;
            }
        }
        return true;
    }

    private boolean gameRunning() {
        ActivityManager am = (ActivityManager) getSystemService("activity");
        List<ActivityManager.RunningAppProcessInfo> list = am == null ? null : am.getRunningAppProcesses();
        if (list == null) {
            return false;
        }
        for (ActivityManager.RunningAppProcessInfo p : list) {
            if (p.processName != null && p.processName.endsWith(":game")) {
                return true;
            }
        }
        return false;
    }

    /* renamed from: org.wiiucoop.bo2android.EnvVarsActivity$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$org$wiiucoop$bo2android$T6EnvVars$Problem = new int[T6EnvVars.Problem.values().length];

        static {
            try {
                $SwitchMap$org$wiiucoop$bo2android$T6EnvVars$Problem[T6EnvVars.Problem.EMPTY_NAME.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$org$wiiucoop$bo2android$T6EnvVars$Problem[T6EnvVars.Problem.NAME_TOO_LONG.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$org$wiiucoop$bo2android$T6EnvVars$Problem[T6EnvVars.Problem.NAME_SYNTAX.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$org$wiiucoop$bo2android$T6EnvVars$Problem[T6EnvVars.Problem.LINKER.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$org$wiiucoop$bo2android$T6EnvVars$Problem[T6EnvVars.Problem.ANDROID_RUNTIME.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$org$wiiucoop$bo2android$T6EnvVars$Problem[T6EnvVars.Problem.DXVK_WSI.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$org$wiiucoop$bo2android$T6EnvVars$Problem[T6EnvVars.Problem.VALUE_TOO_LONG.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
            try {
                $SwitchMap$org$wiiucoop$bo2android$T6EnvVars$Problem[T6EnvVars.Problem.VALUE_LINE_BREAK.ordinal()] = 8;
            } catch (NoSuchFieldError e8) {
            }
            try {
                $SwitchMap$org$wiiucoop$bo2android$T6EnvVars$Problem[T6EnvVars.Problem.DUPLICATE.ordinal()] = 9;
            } catch (NoSuchFieldError e9) {
            }
        }
    }

    private String problemText(T6EnvVars.Problem p) {
        switch (AnonymousClass1.$SwitchMap$org$wiiucoop$bo2android$T6EnvVars$Problem[p.ordinal()]) {
            case 1:
                return getString(R.string.env_problem_empty);
            case 2:
                return getString(R.string.env_problem_name_long);
            case 3:
                return getString(R.string.env_problem_syntax);
            case 4:
                return getString(R.string.env_problem_linker);
            case T6TouchLayout.AdsFire.MAX_QUEUED /* 5 */:
                return getString(R.string.env_problem_android);
            case 6:
                return getString(R.string.env_problem_wsi);
            case 7:
                return getString(R.string.env_problem_value_long);
            case 8:
                return getString(R.string.env_problem_line_break);
            case T6TouchOverlay.VK_TAB /* 9 */:
                return getString(R.string.env_problem_duplicate);
            default:
                return "";
        }
    }

    private void toast(String message) {
        Toast.makeText(this, message, 1).show();
    }

    private final class Watcher implements TextWatcher {
        private final OnText target;

        Watcher(OnText target) {
            this.target = target;
        }

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence s, int start, int count, int after) {
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence s, int start, int before, int count) {
        }

        @Override // android.text.TextWatcher
        public void afterTextChanged(Editable s) {
            this.target.changed(s.toString());
            EnvVarsActivity.this.refreshStatus();
        }
    }
}
