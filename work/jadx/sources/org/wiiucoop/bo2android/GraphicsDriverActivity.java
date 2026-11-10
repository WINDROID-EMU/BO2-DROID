package org.wiiucoop.bo2android;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;
import org.wiiucoop.bo2android.T6DriverPackage;
import org.wiiucoop.bo2android.T6DriverStore;

/* loaded from: classes3.dex */
public final class GraphicsDriverActivity extends Activity implements View.OnClickListener {
    private static final int REQUEST_IMPORT = 41;
    private static final String TAG = "t6android";
    private T6DriverStore store;

    @Override // android.app.Activity, android.view.ContextThemeWrapper, android.content.ContextWrapper
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(T6Ui.wrapLocale(base));
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        T6Ui.applyTheme(this);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_graphics_driver);
        this.store = new T6DriverStore(getFilesDir());
        findViewById(R.id.button_back).setOnClickListener(this);
        findViewById(R.id.button_driver_import).setOnClickListener(this);
        findViewById(R.id.button_driver_default).setOnClickListener(this);
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        T6Ui.applyImmersive(this);
        refresh();
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        int id = view.getId();
        if (id == R.id.button_back) {
            finish();
            return;
        }
        if (id == R.id.button_driver_import) {
            Intent pick = new Intent("android.intent.action.OPEN_DOCUMENT");
            pick.addCategory("android.intent.category.OPENABLE");
            pick.setType("*/*");
            pick.putExtra("android.intent.extra.MIME_TYPES", new String[]{"application/zip", "application/x-zip-compressed", "application/octet-stream"});
            startActivityForResult(pick, REQUEST_IMPORT);
            return;
        }
        if (id == R.id.button_driver_default) {
            choose(T6DriverStore.SYSTEM);
        }
    }

    @Override // android.app.Activity
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != REQUEST_IMPORT || resultCode != -1 || data == null || data.getData() == null) {
            return;
        }
        final Uri uri = data.getData();
        toast(getString(R.string.driver_importing));
        new Thread(new Runnable() { // from class: org.wiiucoop.bo2android.GraphicsDriverActivity$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() throws IOException {
                this.f$0.m7x4bd76abb(uri);
            }
        }, "t6-driver-import").start();
    }

    /* renamed from: lambda$onActivityResult$1$org-wiiucoop-bo2android-GraphicsDriverActivity, reason: not valid java name */
    /* synthetic */ void m7x4bd76abb(Uri uri) throws IOException {
        final T6DriverPackage.Result result = importFromUri(uri);
        runOnUiThread(new Runnable() { // from class: org.wiiucoop.bo2android.GraphicsDriverActivity$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m6x120cc8dc(result);
            }
        });
    }

    /* renamed from: lambda$onActivityResult$0$org-wiiucoop-bo2android-GraphicsDriverActivity, reason: not valid java name */
    /* synthetic */ void m6x120cc8dc(T6DriverPackage.Result result) {
        if (result.ok) {
            Log.i(TAG, "driver: imported " + result.id + " (" + result.meta.name + ", lib sha256 " + result.librarySha256 + ")");
            toast(getString(R.string.driver_imported, new Object[]{result.meta.name.isEmpty() ? result.id : result.meta.name}));
        } else {
            Log.i(TAG, "driver: import refused: " + result.reason);
            toast(getString(R.string.driver_import_refused, new Object[]{problemText(result.problem)}));
        }
        refresh();
    }

    private T6DriverPackage.Result importFromUri(Uri uri) throws IOException {
        File copy = new File(getCacheDir(), "driver-import.zip");
        try {
            InputStream in = getContentResolver().openInputStream(uri);
            try {
                OutputStream out = new FileOutputStream(copy);
                try {
                    if (in == null) {
                        T6DriverPackage.Result resultFailure = failure(T6DriverPackage.Problem.CANNOT_READ, "não foi possível abrir o documento");
                        out.close();
                        if (in != null) {
                            in.close();
                        }
                        return resultFailure;
                    }
                    byte[] buf = new byte[65536];
                    long total = 0;
                    while (true) {
                        int n = in.read(buf);
                        if (n <= 0) {
                            out.close();
                            if (in != null) {
                                in.close();
                            }
                            try {
                                return T6DriverPackage.importZip(copy, this.store.driversDir(), Build.VERSION.SDK_INT, displayName(uri));
                            } finally {
                                copy.delete();
                            }
                        }
                        total += n;
                        if (total > T6DriverPackage.MAX_ZIP_BYTES) {
                            T6DriverPackage.Result resultFailure2 = failure(T6DriverPackage.Problem.TOO_LARGE, "ZIP maior que 64 MB");
                            out.close();
                            if (in != null) {
                                in.close();
                            }
                            return resultFailure2;
                        }
                        out.write(buf, 0, n);
                    }
                } finally {
                }
            } catch (Throwable th) {
                if (in != null) {
                    try {
                        in.close();
                    } catch (Throwable th2) {
                        th.addSuppressed(th2);
                    }
                }
                throw th;
            }
        } catch (IOException | SecurityException e) {
            return failure(T6DriverPackage.Problem.CANNOT_READ, "falha ao ler o documento: " + e.getMessage());
        }
    }

    private String displayName(Uri uri) {
        try {
            Cursor c = getContentResolver().query(uri, new String[]{"_display_name"}, null, null, null);
            if (c != null) {
                try {
                    if (c.moveToFirst()) {
                        String string = c.getString(0);
                        if (c != null) {
                            c.close();
                        }
                        return string;
                    }
                } finally {
                }
            }
            if (c != null) {
                c.close();
                return "driver.zip";
            }
            return "driver.zip";
        } catch (RuntimeException e) {
            return "driver.zip";
        }
    }

    private static T6DriverPackage.Result failure(T6DriverPackage.Problem problem, String reason) {
        return T6DriverPackage.refused(problem, reason);
    }

    /* renamed from: org.wiiucoop.bo2android.GraphicsDriverActivity$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$org$wiiucoop$bo2android$T6DriverPackage$Problem = new int[T6DriverPackage.Problem.values().length];

        static {
            try {
                $SwitchMap$org$wiiucoop$bo2android$T6DriverPackage$Problem[T6DriverPackage.Problem.CANNOT_READ.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$org$wiiucoop$bo2android$T6DriverPackage$Problem[T6DriverPackage.Problem.TOO_LARGE.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$org$wiiucoop$bo2android$T6DriverPackage$Problem[T6DriverPackage.Problem.BAD_ENTRIES.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$org$wiiucoop$bo2android$T6DriverPackage$Problem[T6DriverPackage.Problem.NOT_A_DRIVER.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$org$wiiucoop$bo2android$T6DriverPackage$Problem[T6DriverPackage.Problem.NEEDS_NEWER_ANDROID.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$org$wiiucoop$bo2android$T6DriverPackage$Problem[T6DriverPackage.Problem.BAD_LIBRARY.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$org$wiiucoop$bo2android$T6DriverPackage$Problem[T6DriverPackage.Problem.INSTALL_FAILED.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
        }
    }

    private String problemText(T6DriverPackage.Problem problem) {
        if (problem == null) {
            return getString(R.string.driver_problem_corrupt);
        }
        switch (AnonymousClass1.$SwitchMap$org$wiiucoop$bo2android$T6DriverPackage$Problem[problem.ordinal()]) {
        }
        return getString(R.string.driver_problem_corrupt);
    }

    private void choose(String id) {
        if (this.store.select(id)) {
            Log.i(TAG, "driver: selected for the next start: " + id);
            toast(getString(R.string.driver_restart_needed));
        } else {
            toast(getString(R.string.driver_select_failed));
        }
        refresh();
    }

    private void refresh() {
        String last;
        String api;
        String selected = this.store.selected();
        Map<String, String> status = this.store.lastStatus();
        List<T6DriverStore.Entry> drivers = this.store.list();
        setText(R.id.text_driver_selected, getString(R.string.driver_selected_line, new Object[]{label(selected, drivers)}));
        String loaded = status.get("loaded");
        String device = status.get("device");
        String driverName = status.get("driver_name");
        if (loaded == null || device == null) {
            setText(R.id.text_driver_active, getString(R.string.driver_active_unknown));
        } else {
            if (!status.containsKey("api")) {
                api = "";
            } else {
                api = " · Vulkan " + status.get("api");
            }
            setText(R.id.text_driver_active, getString(R.string.driver_active_line, new Object[]{label(loaded, drivers), driverName + api}));
        }
        setText(R.id.text_driver_gpu, getString(R.string.driver_gpu_line, new Object[]{(device == null || device.isEmpty()) ? "—" : device}));
        String reason = status.get("reason");
        if (status.isEmpty()) {
            last = getString(R.string.driver_last_none);
        } else {
            last = (reason == null || reason.isEmpty()) ? getString(R.string.driver_last_ok) : getString(R.string.driver_last_fallback, new Object[]{reason});
        }
        if (!selected.equals(loaded == null ? T6DriverStore.SYSTEM : loaded)) {
            last = last + T6PlayerName.TRAILING_NEWLINE + getString(R.string.driver_restart_needed);
        }
        setText(R.id.text_driver_last, last);
        LinearLayout list = (LinearLayout) findViewById(R.id.list_drivers);
        list.removeAllViews();
        addRow(list, T6DriverStore.SYSTEM, getString(R.string.driver_system), getString(R.string.driver_system_desc), selected);
        for (T6DriverStore.Entry e : drivers) {
            String detail = e.meta.driverVersion + (e.meta.author.isEmpty() ? "" : " · " + e.meta.author) + (e.librarySha256.isEmpty() ? "" : "\nSHA-256 " + e.librarySha256.substring(0, 16) + "…");
            addRow(list, e.id, e.meta.name.isEmpty() ? e.id : e.meta.name, detail, selected);
        }
    }

    private void addRow(LinearLayout list, final String id, String title, String detail, String selected) {
        View row = getLayoutInflater().inflate(R.layout.view_driver_row, (ViewGroup) list, false);
        ((TextView) row.findViewById(R.id.text_driver_row_title)).setText(title);
        ((TextView) row.findViewById(R.id.text_driver_row_detail)).setText(detail);
        Button select = (Button) row.findViewById(R.id.button_driver_row_select);
        boolean isSelected = id.equals(selected);
        select.setText(isSelected ? R.string.driver_row_selected : R.string.driver_row_select);
        select.setEnabled(!isSelected);
        select.setOnClickListener(new View.OnClickListener() { // from class: org.wiiucoop.bo2android.GraphicsDriverActivity$$ExternalSyntheticLambda1
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m4lambda$addRow$2$orgwiiucoopbo2androidGraphicsDriverActivity(id, view);
            }
        });
        Button remove = (Button) row.findViewById(R.id.button_driver_row_remove);
        remove.setVisibility(T6DriverStore.SYSTEM.equals(id) ? 8 : 0);
        remove.setOnClickListener(new View.OnClickListener() { // from class: org.wiiucoop.bo2android.GraphicsDriverActivity$$ExternalSyntheticLambda2
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) throws IOException {
                this.f$0.m5lambda$addRow$3$orgwiiucoopbo2androidGraphicsDriverActivity(id, view);
            }
        });
        list.addView(row);
    }

    /* renamed from: lambda$addRow$2$org-wiiucoop-bo2android-GraphicsDriverActivity, reason: not valid java name */
    /* synthetic */ void m4lambda$addRow$2$orgwiiucoopbo2androidGraphicsDriverActivity(String id, View v) {
        choose(id);
    }

    /* renamed from: lambda$addRow$3$org-wiiucoop-bo2android-GraphicsDriverActivity, reason: not valid java name */
    /* synthetic */ void m5lambda$addRow$3$orgwiiucoopbo2androidGraphicsDriverActivity(String id, View v) throws IOException {
        this.store.remove(id);
        Log.i(TAG, "driver: removed " + id);
        refresh();
    }

    private String label(String id, List<T6DriverStore.Entry> drivers) {
        if (id == null || T6DriverStore.SYSTEM.equals(id)) {
            return getString(R.string.driver_system);
        }
        for (T6DriverStore.Entry e : drivers) {
            if (e.id.equals(id)) {
                return e.meta.name.isEmpty() ? e.id : e.meta.name;
            }
        }
        return id;
    }

    private void setText(int id, String text) {
        ((TextView) findViewById(id)).setText(text);
    }

    private void toast(String message) {
        Toast.makeText(this, message, 1).show();
    }
}
