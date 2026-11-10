package org.wiiucoop.bo2android;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import org.wiiucoop.bo2android.T6Logs;

/* loaded from: classes3.dex */
public class LogsActivity extends Activity implements View.OnClickListener {
    private static final int COPY_LIMIT = 2000;
    private static final char[] LEVELS = {'V', 'D', 'I', 'W', 'E'};
    private static final long REFRESH_MS = 3000;
    private static final int REQUEST_EXPORT = 41;
    private static final int SNAPSHOT_LINES = 20000;
    private static final String TAG = "t6android";
    private LineAdapter adapter;
    private TextView countText;
    private boolean loading;
    private boolean paused;
    private boolean resumed;
    private EditText search;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private final T6Logs.Buffer buffer = new T6Logs.Buffer();
    private final List<T6Logs.Line> shown = new ArrayList();
    private final Runnable tick = new Runnable() { // from class: org.wiiucoop.bo2android.LogsActivity$$ExternalSyntheticLambda4
        @Override // java.lang.Runnable
        public final void run() {
            LogsActivity.this.refreshNow();
        }
    };
    private int category = -1;
    private int levelIndex = 0;
    private int exportCategory = -1;
    private String exportText = "";

    @Override // android.app.Activity, android.view.ContextThemeWrapper, android.content.ContextWrapper
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(T6Ui.wrapLocale(base));
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        T6Ui.applyTheme(this);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_logs);
        this.countText = (TextView) findViewById(R.id.text_logs_count);
        this.search = (EditText) findViewById(R.id.edit_logs_search);
        this.adapter = new LineAdapter();
        ((ListView) findViewById(R.id.list_logs)).setAdapter((ListAdapter) this.adapter);
        int[] buttons = {R.id.button_back, R.id.button_logs_cat_all, R.id.button_logs_cat_engine, R.id.button_logs_cat_graphics, R.id.button_logs_cat_host, R.id.button_logs_cat_audio, R.id.button_logs_level, R.id.button_logs_pause, R.id.button_logs_refresh, R.id.button_logs_copy, R.id.button_logs_clear, R.id.button_logs_export};
        for (int id : buttons) {
            findViewById(id).setOnClickListener(this);
        }
        this.search.addTextChangedListener(new TextWatcher() { // from class: org.wiiucoop.bo2android.LogsActivity.1
            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence s, int a, int b, int c) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence s, int a, int b, int c) {
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable s) {
                LogsActivity.this.applyFilter();
            }
        });
        updateToolbar();
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        T6Ui.applyImmersive(this);
        this.resumed = true;
        refreshNow();
    }

    @Override // android.app.Activity
    protected void onPause() {
        super.onPause();
        this.resumed = false;
        this.handler.removeCallbacks(this.tick);
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
            finish();
            return;
        }
        if (id == R.id.button_logs_cat_all) {
            setCategory(-1);
            return;
        }
        if (id == R.id.button_logs_cat_engine) {
            setCategory(0);
            return;
        }
        if (id == R.id.button_logs_cat_graphics) {
            setCategory(1);
            return;
        }
        if (id == R.id.button_logs_cat_host) {
            setCategory(2);
            return;
        }
        if (id == R.id.button_logs_cat_audio) {
            setCategory(3);
            return;
        }
        if (id == R.id.button_logs_level) {
            this.levelIndex = (this.levelIndex + 1) % LEVELS.length;
            updateToolbar();
            applyFilter();
            return;
        }
        if (id == R.id.button_logs_pause) {
            this.paused = !this.paused;
            updateToolbar();
            if (!this.paused) {
                refreshNow();
                return;
            }
            return;
        }
        if (id == R.id.button_logs_refresh) {
            refreshNow();
            return;
        }
        if (id == R.id.button_logs_copy) {
            copyShown();
            return;
        }
        if (id == R.id.button_logs_clear) {
            this.buffer.clear();
            applyFilter();
            toast(getString(R.string.logs_cleared));
        } else if (id == R.id.button_logs_export) {
            chooseExport();
        }
    }

    private void setCategory(int c) {
        this.category = c;
        updateToolbar();
        applyFilter();
    }

    private void updateToolbar() {
        int[] ids = {R.id.button_logs_cat_all, R.id.button_logs_cat_engine, R.id.button_logs_cat_graphics, R.id.button_logs_cat_host, R.id.button_logs_cat_audio};
        for (int i = 0; i < ids.length; i++) {
            ((Button) findViewById(ids[i])).setTextColor(T6Ui.themeColor(this, i + (-1) == this.category ? R.attr.t6c_accent_bright_ff : R.attr.t6c_text_dim_ff));
        }
        int i2 = R.id.button_logs_level;
        ((Button) findViewById(i2)).setText(getString(R.string.logs_level, new Object[]{String.valueOf(LEVELS[this.levelIndex])}));
        ((Button) findViewById(R.id.button_logs_pause)).setText(this.paused ? R.string.logs_resume : R.string.logs_pause);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void refreshNow() {
        this.handler.removeCallbacks(this.tick);
        if (this.loading) {
            return;
        }
        this.loading = true;
        new Thread(new Runnable() { // from class: org.wiiucoop.bo2android.LogsActivity$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                LogsActivity.this.m13lambda$refreshNow$1$orgwiiucoopbo2androidLogsActivity();
            }
        }, "t6-logs").start();
    }

    /* renamed from: lambda$refreshNow$1$org-wiiucoop-bo2android-LogsActivity, reason: not valid java name */
    /* synthetic */ void m13lambda$refreshNow$1$orgwiiucoopbo2androidLogsActivity() {
        final List<String> raw = readLogcat();
        runOnUiThread(new Runnable() { // from class: org.wiiucoop.bo2android.LogsActivity$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                LogsActivity.this.m12lambda$refreshNow$0$orgwiiucoopbo2androidLogsActivity(raw);
            }
        });
    }

    /* renamed from: lambda$refreshNow$0$org-wiiucoop-bo2android-LogsActivity, reason: not valid java name */
    /* synthetic */ void m12lambda$refreshNow$0$orgwiiucoopbo2androidLogsActivity(List raw) {
        this.loading = false;
        if (raw != null) {
            this.buffer.load(raw);
            applyFilter();
        }
        if (!this.resumed || this.paused) {
            return;
        }
        this.handler.postDelayed(this.tick, REFRESH_MS);
    }

    private static List<String> readLogcat() {
        List<String> lines = new ArrayList<>();
        Process process = null;
        try {
            try {
                Process process2 = new ProcessBuilder("logcat", "-d", "-v", "threadtime", "-t", String.valueOf(SNAPSHOT_LINES)).redirectErrorStream(true).start();
                BufferedReader reader = new BufferedReader(new InputStreamReader(process2.getInputStream(), StandardCharsets.UTF_8));
                while (true) {
                    try {
                        String line = reader.readLine();
                        if (line == null) {
                            break;
                        }
                        lines.add(line);
                    } catch (Throwable th) {
                        try {
                            reader.close();
                        } catch (Throwable th2) {
                            th.addSuppressed(th2);
                        }
                        throw th;
                    }
                }
                reader.close();
                if (process2 != null) {
                    process2.destroy();
                }
                return lines;
            } catch (Exception e) {
                Log.w(TAG, "logs: logcat could not be read: " + e);
                if (0 == 0) {
                    return null;
                }
                process.destroy();
                return null;
            }
        } catch (Throwable th3) {
            if (0 != 0) {
                process.destroy();
            }
            throw th3;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void applyFilter() {
        this.shown.clear();
        this.shown.addAll(this.buffer.filter(this.category, LEVELS[this.levelIndex], this.search.getText().toString()));
        this.adapter.notifyDataSetChanged();
        this.countText.setText(getString(R.string.logs_count, new Object[]{Integer.valueOf(this.shown.size())}));
    }

    private void copyShown() {
        StringBuilder sb = new StringBuilder();
        int from = Math.max(0, this.shown.size() - 2000);
        for (int i = from; i < this.shown.size(); i++) {
            sb.append(this.shown.get(i).format()).append('\n');
        }
        ClipboardManager clipboard = (ClipboardManager) getSystemService("clipboard");
        if (clipboard != null) {
            clipboard.setPrimaryClip(ClipData.newPlainText("T6 logs", sb.toString()));
        }
        toast(getString(R.string.logs_copied, new Object[]{Integer.valueOf(this.shown.size() - from)}));
    }

    private void chooseExport() {
        String current = categoryName(this.category);
        String[] items = {getString(R.string.logs_export_current, new Object[]{current}), getString(R.string.logs_export_all)};
        new AlertDialog.Builder(this).setTitle(R.string.logs_export).setItems(items, new DialogInterface.OnClickListener() { // from class: org.wiiucoop.bo2android.LogsActivity$$ExternalSyntheticLambda1
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                LogsActivity.this.m9lambda$chooseExport$2$orgwiiucoopbo2androidLogsActivity(dialogInterface, i);
            }
        }).setNegativeButton(R.string.action_cancel, (DialogInterface.OnClickListener) null).show();
    }

    /* renamed from: lambda$chooseExport$2$org-wiiucoop-bo2android-LogsActivity, reason: not valid java name */
    /* synthetic */ void m9lambda$chooseExport$2$orgwiiucoopbo2androidLogsActivity(DialogInterface dialog, int which) {
        startExport(which == 0 ? this.category : -1);
    }

    private void startExport(int c) {
        this.exportCategory = c;
        String stamp = new SimpleDateFormat("yyyyMMdd-HHmmss", Locale.ROOT).format(new Date());
        this.exportText = this.buffer.export(c, "T6Requiem logs; " + (c < 0 ? "all" : T6Logs.CATEGORY_IDS[c]) + "; exported " + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.ROOT).format(new Date()));
        Intent create = new Intent("android.intent.action.CREATE_DOCUMENT");
        create.addCategory("android.intent.category.OPENABLE");
        create.setType("text/plain");
        create.putExtra("android.intent.extra.TITLE", "t6-logs-" + (c >= 0 ? T6Logs.CATEGORY_IDS[c] : "all") + "-" + stamp + ".txt");
        try {
            startActivityForResult(create, REQUEST_EXPORT);
        } catch (RuntimeException e) {
            toast(getString(R.string.logs_export_failed, new Object[]{e.getMessage()}));
        }
    }

    @Override // android.app.Activity
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != REQUEST_EXPORT || resultCode != -1 || data == null || data.getData() == null) {
            return;
        }
        final Uri uri = data.getData();
        final String text = this.exportText;
        new Thread(new Runnable() { // from class: org.wiiucoop.bo2android.LogsActivity$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                LogsActivity.this.m11lambda$onActivityResult$4$orgwiiucoopbo2androidLogsActivity(uri, text);
            }
        }, "t6-logs-export").start();
    }

    /* renamed from: lambda$onActivityResult$4$org-wiiucoop-bo2android-LogsActivity, reason: not valid java name */
    /* synthetic */ void m11lambda$onActivityResult$4$orgwiiucoopbo2androidLogsActivity(Uri uri, final String text) {
        String error = null;
        try {
            OutputStream out = getContentResolver().openOutputStream(uri, "wt");
            if (out != null) {
                try {
                    out.write(text.getBytes(StandardCharsets.UTF_8));
                } finally {
                    out.close();
                }
            } else {
                throw new IOException("no output stream");
            }
        } catch (Exception e) {
            error = e.getMessage() == null ? e.toString() : e.getMessage();
        }
        final String failure = error;
        runOnUiThread(new Runnable() { // from class: org.wiiucoop.bo2android.LogsActivity$$ExternalSyntheticLambda5
            @Override // java.lang.Runnable
            public final void run() {
                LogsActivity.this.m10lambda$onActivityResult$3$orgwiiucoopbo2androidLogsActivity(failure, text);
            }
        });
    }

    /* renamed from: lambda$onActivityResult$3$org-wiiucoop-bo2android-LogsActivity, reason: not valid java name */
    /* synthetic */ void m10lambda$onActivityResult$3$orgwiiucoopbo2androidLogsActivity(String failure, String text) {
        if (failure == null) {
            Log.i(TAG, "logs: exported " + (this.exportCategory < 0 ? "all" : T6Logs.CATEGORY_IDS[this.exportCategory]) + " (" + text.length() + " chars)");
            toast(getString(R.string.logs_exported));
        } else {
            toast(getString(R.string.logs_export_failed, new Object[]{failure}));
        }
    }

    private String categoryName(int c) {
        switch (c) {
            case 0:
                return getString(R.string.logs_cat_engine);
            case 1:
                return getString(R.string.logs_cat_graphics);
            case 2:
                return getString(R.string.logs_cat_host);
            case 3:
                return getString(R.string.logs_cat_audio_net);
            default:
                return getString(R.string.logs_cat_all);
        }
    }

    private void toast(String text) {
        Toast.makeText(this, text, 0).show();
    }

    private final class LineAdapter extends BaseAdapter {
        private LineAdapter() {
        }

        @Override // android.widget.Adapter
        public int getCount() {
            return LogsActivity.this.shown.size();
        }

        @Override // android.widget.Adapter
        public Object getItem(int position) {
            return LogsActivity.this.shown.get(position);
        }

        @Override // android.widget.Adapter
        public long getItemId(int position) {
            return position;
        }

        @Override // android.widget.Adapter
        public View getView(int position, View convertView, ViewGroup parent) {
            int color;
            TextView view = convertView instanceof TextView ? (TextView) convertView : new TextView(LogsActivity.this);
            if (convertView == null) {
                view.setTypeface(Typeface.MONOSPACE);
                view.setTextSize(11.0f);
                view.setPadding(0, 2, 0, 2);
            }
            T6Logs.Line line = (T6Logs.Line) LogsActivity.this.shown.get(position);
            view.setText(line.format());
            if (line.level == 'E' || line.level == 'F') {
                color = LogsActivity.this.getColor(R.color.t6_danger);
            } else if (line.level == 'W') {
                color = LogsActivity.this.getColor(R.color.t6_warning);
            } else {
                color = T6Ui.themeColor(view.getContext(), line.level == 'I' ? R.attr.t6c_text_ff : R.attr.t6c_text_dim_ff);
            }
            view.setTextColor(color);
            return view;
        }
    }
}
