package org.wiiucoop.bo2android;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.hardware.input.InputManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import android.text.format.Formatter;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.OpenOption;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import org.json.JSONException;
import org.wiiucoop.bo2android.T6DeviceInfo;
import org.wiiucoop.bo2android.T6DriverStore;
import org.wiiucoop.bo2android.T6DxvkStore;
import org.wiiucoop.bo2android.T6FolderReader;
import org.wiiucoop.bo2android.T6GameData;
import org.wiiucoop.bo2android.T6KennelPackage;
import org.wiiucoop.bo2android.T6PlayerName;
import org.wiiucoop.bo2android.T6TouchLayout;
import org.wiiucoop.bo2android.T6Updater;

/* loaded from: classes3.dex */
public final class SettingsActivity extends Activity implements View.OnClickListener {
    private static final int REQUEST_PICK_TREE = 1001;
    private static final int REQUEST_READ_STORAGE = 1002;
    private static final String TAG = "t6android";
    private T6Config config;
    private T6DeviceInfo.Info deviceInfo;
    private TextView folderDetail;
    private TextView folderValue;
    private TextView footer;
    private Button grantButton;
    private InputManager inputManager;
    private volatile boolean kennelBusy;
    private TextView nameDetail;
    private TextView nameValue;
    private Button pickButton;
    private T6ConfigStore store;
    static final String[] LANGUAGE_TAGS = {T6DriverStore.SYSTEM, "pt-BR", T6Ui.DEFAULT_LANGUAGE, "es", "fr", "id"};
    static final int[] LANGUAGE_NAMES = {R.string.language_system, R.string.language_pt_br, R.string.language_en_us, R.string.language_es, R.string.language_fr, R.string.language_id};
    static final String[] THEMES = {"orange", T6Ui.THEME_BLUE, T6Ui.THEME_RED};
    static final int[] THEME_NAMES = {R.string.theme_orange, R.string.theme_blue, R.string.theme_red};
    private static final String[] TOUCH_MODES = {"auto", "on", "off"};
    private static final int[] TOUCH_MODE_NAMES = {R.string.touch_mode_auto, R.string.touch_mode_on, R.string.touch_mode_off};
    private static final String[] TU_FLAGS = {"noconform", "sysmem", "gmem", "nolrz", "noubwc", "flushall", "syncdraw", "forcebin", "nobin"};
    private String playerName = "";
    private final InputManager.InputDeviceListener controllerListener = new InputManager.InputDeviceListener() { // from class: org.wiiucoop.bo2android.SettingsActivity.1
        @Override // android.hardware.input.InputManager.InputDeviceListener
        public void onInputDeviceAdded(int deviceId) {
            SettingsActivity.this.refreshOptionsSection();
        }

        @Override // android.hardware.input.InputManager.InputDeviceListener
        public void onInputDeviceRemoved(int deviceId) {
            SettingsActivity.this.refreshOptionsSection();
        }

        @Override // android.hardware.input.InputManager.InputDeviceListener
        public void onInputDeviceChanged(int deviceId) {
            SettingsActivity.this.refreshOptionsSection();
        }
    };

    @Override // android.app.Activity, android.view.ContextThemeWrapper, android.content.ContextWrapper
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(T6Ui.wrapLocale(base));
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) throws NumberFormatException, IOException {
        T6Ui.applyTheme(this);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_settings);
        this.store = new T6ConfigStore(new File(getFilesDir(), T6Config.FILE_NAME));
        this.config = this.store.load();
        this.folderValue = (TextView) findViewById(R.id.text_folder_value);
        this.folderDetail = (TextView) findViewById(R.id.text_folder_detail);
        this.pickButton = (Button) findViewById(R.id.button_pick_folder);
        this.grantButton = (Button) findViewById(R.id.button_grant_access);
        this.nameValue = (TextView) findViewById(R.id.text_player_name_value);
        this.nameDetail = (TextView) findViewById(R.id.text_player_name_detail);
        this.footer = (TextView) findViewById(R.id.text_footer);
        this.deviceInfo = T6DeviceInfo.read(this);
        findViewById(R.id.row_player_name).post(new Runnable() { // from class: org.wiiucoop.bo2android.SettingsActivity$$ExternalSyntheticLambda6
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m53lambda$onCreate$0$orgwiiucoopbo2androidSettingsActivity();
            }
        });
        findViewById(R.id.button_back).setOnClickListener(this);
        this.pickButton.setOnClickListener(this);
        this.grantButton.setOnClickListener(this);
        findViewById(R.id.row_player_name).setOnClickListener(this);
        findViewById(R.id.row_driver).setOnClickListener(this);
        findViewById(R.id.row_dxvk).setOnClickListener(this);
        findViewById(R.id.row_tu_debug).setOnClickListener(this);
        findViewById(R.id.row_env_vars).setOnClickListener(this);
        findViewById(R.id.row_kennel).setOnClickListener(this);
        findViewById(R.id.row_controls).setOnClickListener(this);
        findViewById(R.id.row_touch_mode).setOnClickListener(this);
        findViewById(R.id.row_theme).setOnClickListener(this);
        findViewById(R.id.button_discord).setOnClickListener(this);
        findViewById(R.id.row_language).setOnClickListener(this);
        findViewById(R.id.row_resolution).setOnClickListener(this);
        bindSwitch(R.id.switch_show_fps, T6Ui.KEY_SHOW_FPS);
        bindSwitch(R.id.switch_touch_aim_drag, T6Ui.KEY_TOUCH_AIM_DRAG, true);
        bindSwitch(R.id.switch_touch_stick_sprint, T6Ui.KEY_TOUCH_STICK_SPRINT, true);
        bindSwitch(R.id.switch_touch_ads_fire, T6Ui.KEY_TOUCH_ADS_FIRE, false);
        bindSprintThreshold();
        this.inputManager = (InputManager) getSystemService("input");
        refresh();
    }

    /* renamed from: lambda$onCreate$0$org-wiiucoop-bo2android-SettingsActivity, reason: not valid java name */
    /* synthetic */ void m53lambda$onCreate$0$orgwiiucoopbo2androidSettingsActivity() {
        logRowGeometry(R.id.row_player_name, "row_player_name");
    }

    @Override // android.app.Activity
    protected void onPause() {
        super.onPause();
        if (this.inputManager != null) {
            this.inputManager.unregisterInputDeviceListener(this.controllerListener);
        }
    }

    private void bindSwitch(int id, String key) {
        bindSwitch(id, key, false);
    }

    private void bindSprintThreshold() throws NumberFormatException {
        int value;
        SeekBar seek = (SeekBar) findViewById(R.id.seek_touch_sprint_threshold);
        final TextView label = (TextView) findViewById(R.id.text_touch_sprint_threshold);
        try {
            value = Integer.parseInt(T6Ui.getString(this, T6Ui.KEY_TOUCH_SPRINT_THRESHOLD, "85"));
        } catch (NumberFormatException e) {
            value = 85;
        }
        int value2 = Math.max(50, Math.min(100, value));
        seek.setProgress(value2 - 50);
        label.setText(getString(R.string.settings_touch_sprint_threshold_value, new Object[]{Integer.valueOf(value2)}));
        seek.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() { // from class: org.wiiucoop.bo2android.SettingsActivity.2
            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) {
                int v = progress + 50;
                label.setText(SettingsActivity.this.getString(R.string.settings_touch_sprint_threshold_value, new Object[]{Integer.valueOf(v)}));
                if (fromUser) {
                    T6Ui.setString(SettingsActivity.this, T6Ui.KEY_TOUCH_SPRINT_THRESHOLD, Integer.toString(v));
                }
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStartTrackingTouch(SeekBar bar) {
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStopTrackingTouch(SeekBar bar) {
                Log.i(SettingsActivity.TAG, "settings: touch_sprint_threshold=" + (bar.getProgress() + 50));
            }
        });
    }

    private void bindSwitch(int id, final String key, boolean fallback) {
        Switch toggle = (Switch) findViewById(id);
        toggle.setChecked(T6Ui.getBool(this, key, fallback));
        toggle.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() { // from class: org.wiiucoop.bo2android.SettingsActivity$$ExternalSyntheticLambda12
            @Override // android.widget.CompoundButton.OnCheckedChangeListener
            public final void onCheckedChanged(CompoundButton compoundButton, boolean z) {
                this.f$0.m41lambda$bindSwitch$1$orgwiiucoopbo2androidSettingsActivity(key, compoundButton, z);
            }
        });
    }

    /* renamed from: lambda$bindSwitch$1$org-wiiucoop-bo2android-SettingsActivity, reason: not valid java name */
    /* synthetic */ void m41lambda$bindSwitch$1$orgwiiucoopbo2androidSettingsActivity(String key, CompoundButton button, boolean checked) {
        T6Ui.setBool(this, key, checked);
        Log.i(TAG, "settings: " + key + "=" + checked);
    }

    private static int indexOf(String[] values, String value) {
        int i = find(values, value);
        if (i < 0) {
            return 0;
        }
        return i;
    }

    private static int find(String[] values, String value) {
        for (int i = 0; i < values.length; i++) {
            if (values[i].equals(value)) {
                return i;
            }
        }
        return -1;
    }

    private void chooseLanguage() {
        String[] names = new String[LANGUAGE_TAGS.length];
        for (int i = 0; i < names.length; i++) {
            names[i] = getString(LANGUAGE_NAMES[i]);
        }
        final int current = indexOf(LANGUAGE_TAGS, T6Ui.getString(this, T6Ui.KEY_LANGUAGE, T6Ui.DEFAULT_LANGUAGE));
        new AlertDialog.Builder(this).setTitle(R.string.settings_language_label).setSingleChoiceItems(names, current, new DialogInterface.OnClickListener() { // from class: org.wiiucoop.bo2android.SettingsActivity$$ExternalSyntheticLambda9
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i2) {
                this.f$0.m44lambda$chooseLanguage$2$orgwiiucoopbo2androidSettingsActivity(current, dialogInterface, i2);
            }
        }).setNegativeButton(R.string.action_cancel, (DialogInterface.OnClickListener) null).show();
    }

    /* renamed from: lambda$chooseLanguage$2$org-wiiucoop-bo2android-SettingsActivity, reason: not valid java name */
    /* synthetic */ void m44lambda$chooseLanguage$2$orgwiiucoopbo2androidSettingsActivity(int current, DialogInterface dialog, int which) {
        dialog.dismiss();
        if (which == current) {
            return;
        }
        T6Ui.setString(this, T6Ui.KEY_LANGUAGE, LANGUAGE_TAGS[which]);
        Log.i(TAG, "settings: language=" + LANGUAGE_TAGS[which]);
        recreate();
    }

    private File tuDebugFile() {
        return new File(getFilesDir(), "vulkan_driver_options.cfg");
    }

    private String readTuDebug() {
        File f = tuDebugFile();
        if (!f.exists()) {
            return null;
        }
        try {
            String text = new String(Files.readAllBytes(f.toPath()), StandardCharsets.UTF_8).trim();
            if (text.startsWith("TU_DEBUG=")) {
                return text.substring(9);
            }
            return null;
        } catch (IOException e) {
            return null;
        }
    }

    private void writeTuDebug(String flags) throws IOException {
        File f = tuDebugFile();
        if (flags == null) {
            if (f.exists() && !f.delete()) {
                Log.w(TAG, "settings: could not remove " + f);
            }
            Log.i(TAG, "settings: TU_DEBUG automatic");
            return;
        }
        try {
            FileOutputStream out = new FileOutputStream(f);
            try {
                out.write(("TU_DEBUG=" + flags + T6PlayerName.TRAILING_NEWLINE).getBytes(StandardCharsets.UTF_8));
                Log.i(TAG, "settings: TU_DEBUG=" + flags);
                out.close();
            } finally {
            }
        } catch (IOException e) {
            Log.w(TAG, "settings: TU_DEBUG not saved: " + e.getMessage());
        }
    }

    private String tuDebugLabel(String flags) {
        return flags == null ? getString(R.string.settings_tu_debug_auto) : flags.isEmpty() ? getString(R.string.settings_tu_debug_none) : flags;
    }

    private void chooseTuDebug() {
        String current = readTuDebug();
        final boolean[] checked = new boolean[TU_FLAGS.length];
        if (current != null) {
            for (String f : current.split(",")) {
                int i = find(TU_FLAGS, f.trim());
                if (i >= 0) {
                    checked[i] = true;
                }
            }
        }
        new AlertDialog.Builder(this).setTitle(R.string.settings_tu_debug_label).setMultiChoiceItems(TU_FLAGS, checked, new DialogInterface.OnMultiChoiceClickListener() { // from class: org.wiiucoop.bo2android.SettingsActivity$$ExternalSyntheticLambda3
            @Override // android.content.DialogInterface.OnMultiChoiceClickListener
            public final void onClick(DialogInterface dialogInterface, int i2, boolean z) {
                SettingsActivity.lambda$chooseTuDebug$3(checked, dialogInterface, i2, z);
            }
        }).setPositiveButton(R.string.settings_tu_debug_save, new DialogInterface.OnClickListener() { // from class: org.wiiucoop.bo2android.SettingsActivity$$ExternalSyntheticLambda4
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i2) throws IOException {
                this.f$0.m47lambda$chooseTuDebug$4$orgwiiucoopbo2androidSettingsActivity(checked, dialogInterface, i2);
            }
        }).setNeutralButton(R.string.settings_tu_debug_auto, new DialogInterface.OnClickListener() { // from class: org.wiiucoop.bo2android.SettingsActivity$$ExternalSyntheticLambda5
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i2) throws IOException {
                this.f$0.m48lambda$chooseTuDebug$5$orgwiiucoopbo2androidSettingsActivity(dialogInterface, i2);
            }
        }).setNegativeButton(R.string.action_cancel, (DialogInterface.OnClickListener) null).show();
    }

    static /* synthetic */ void lambda$chooseTuDebug$3(boolean[] checked, DialogInterface dialog, int which, boolean isChecked) {
        checked[which] = isChecked;
    }

    /* renamed from: lambda$chooseTuDebug$4$org-wiiucoop-bo2android-SettingsActivity, reason: not valid java name */
    /* synthetic */ void m47lambda$chooseTuDebug$4$orgwiiucoopbo2androidSettingsActivity(boolean[] checked, DialogInterface dialog, int w) throws IOException {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < TU_FLAGS.length; i++) {
            if (checked[i]) {
                if (sb.length() > 0) {
                    sb.append(',');
                }
                sb.append(TU_FLAGS[i]);
            }
        }
        writeTuDebug(sb.toString());
        refreshOptionsSection();
    }

    /* renamed from: lambda$chooseTuDebug$5$org-wiiucoop-bo2android-SettingsActivity, reason: not valid java name */
    /* synthetic */ void m48lambda$chooseTuDebug$5$orgwiiucoopbo2androidSettingsActivity(DialogInterface dialog, int w) throws IOException {
        writeTuDebug(null);
        refreshOptionsSection();
    }

    private void chooseResolution() throws NumberFormatException {
        String current = T6Ui.getString(this, T6Ui.KEY_RESOLUTION, T6Ui.DEFAULT_RESOLUTION);
        String nativeSize = T6Ui.nativeResolution(this);
        int[] aspect = T6Ui.aspectResolution(this);
        String aspectSize = aspect == null ? null : aspect[0] + "x" + aspect[1];
        boolean addAspect = (aspectSize == null || find(T6Ui.RESOLUTIONS, aspectSize) >= 0 || aspectSize.equals(nativeSize)) ? false : true;
        boolean addNative = nativeSize != null && find(T6Ui.RESOLUTIONS, nativeSize) < 0;
        final String[] values = new String[T6Ui.RESOLUTIONS.length + (addAspect ? 1 : 0) + (addNative ? 1 : 0)];
        String[] labels = new String[values.length];
        int n = 0;
        int i = 0;
        while (i < T6Ui.RESOLUTIONS.length) {
            values[n] = T6Ui.RESOLUTIONS[i];
            labels[n] = T6Ui.RESOLUTIONS[i].replace("x", " × ");
            i++;
            n++;
        }
        if (addAspect) {
            values[n] = T6Ui.ASPECT_RESOLUTION;
            labels[n] = getString(R.string.settings_resolution_aspect, new Object[]{T6Ui.displayAspectLabel(this), aspectSize.replace("x", " × ")});
            n++;
        }
        if (addNative) {
            values[n] = T6Ui.NATIVE_RESOLUTION;
            int i2 = n + 1;
            labels[n] = getString(R.string.settings_resolution_native, new Object[]{nativeSize.replace("x", " × ")});
        }
        int checked = find(values, current);
        if (checked < 0 && T6Ui.NATIVE_RESOLUTION.equals(current)) {
            checked = find(values, nativeSize);
        }
        Log.i(TAG, "settings: native display " + nativeSize + " (" + T6Ui.displayAspectLabel(this) + "), phone-aspect size " + aspectSize + ", saved resolution " + current);
        new AlertDialog.Builder(this).setTitle(R.string.settings_resolution_label).setSingleChoiceItems(labels, checked, new DialogInterface.OnClickListener() { // from class: org.wiiucoop.bo2android.SettingsActivity$$ExternalSyntheticLambda13
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i3) {
                this.f$0.m45x15869b4e(values, dialogInterface, i3);
            }
        }).setNegativeButton(R.string.action_cancel, (DialogInterface.OnClickListener) null).show();
    }

    /* renamed from: lambda$chooseResolution$6$org-wiiucoop-bo2android-SettingsActivity, reason: not valid java name */
    /* synthetic */ void m45x15869b4e(String[] values, DialogInterface dialog, int which) {
        dialog.dismiss();
        T6Ui.setString(this, T6Ui.KEY_RESOLUTION, values[which]);
        Log.i(TAG, "settings: resolution=" + values[which]);
        refreshOptionsSection();
    }

    private void chooseTheme() {
        String[] names = new String[THEMES.length];
        for (int i = 0; i < names.length; i++) {
            names[i] = getString(THEME_NAMES[i]);
        }
        final int current = indexOf(THEMES, T6Ui.theme(this));
        new AlertDialog.Builder(this).setTitle(R.string.settings_theme_label).setSingleChoiceItems(names, current, new DialogInterface.OnClickListener() { // from class: org.wiiucoop.bo2android.SettingsActivity$$ExternalSyntheticLambda11
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i2) {
                this.f$0.m46lambda$chooseTheme$7$orgwiiucoopbo2androidSettingsActivity(current, dialogInterface, i2);
            }
        }).setNegativeButton(R.string.action_cancel, (DialogInterface.OnClickListener) null).show();
    }

    /* renamed from: lambda$chooseTheme$7$org-wiiucoop-bo2android-SettingsActivity, reason: not valid java name */
    /* synthetic */ void m46lambda$chooseTheme$7$orgwiiucoopbo2androidSettingsActivity(int current, DialogInterface dialog, int which) {
        dialog.dismiss();
        if (which == current) {
            return;
        }
        T6Ui.setString(this, T6Ui.KEY_THEME, THEMES[which]);
        Log.i(TAG, "settings: theme=" + THEMES[which]);
        recreate();
    }

    private void openDiscord() {
        try {
            startActivity(new Intent("android.intent.action.VIEW", Uri.parse(T6Ui.DISCORD_URL)));
            Log.i(TAG, "settings: Discord opened");
        } catch (ActivityNotFoundException e) {
            Toast.makeText(this, R.string.discord_unavailable, 1).show();
        }
    }

    private void cycleTouchMode() {
        int next = (indexOf(TOUCH_MODES, T6Ui.getString(this, T6Ui.KEY_TOUCH_MODE, "auto")) + 1) % TOUCH_MODES.length;
        T6Ui.setString(this, T6Ui.KEY_TOUCH_MODE, TOUCH_MODES[next]);
        Log.i(TAG, "settings: touch_mode=" + TOUCH_MODES[next]);
        refreshOptionsSection();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void refreshOptionsSection() {
        String string;
        String string2;
        String strLabel;
        String string3;
        String string4;
        String pad = T6Ui.firstControllerName(this);
        TextView textView = (TextView) findViewById(R.id.text_controller_value);
        if (pad.isEmpty()) {
            string = getString(R.string.settings_controller_none);
        } else {
            string = getString(R.string.settings_controller_connected, new Object[]{pad});
        }
        textView.setText(string);
        ((TextView) findViewById(R.id.text_touch_mode_value)).setText(TOUCH_MODE_NAMES[indexOf(TOUCH_MODES, T6Ui.getString(this, T6Ui.KEY_TOUCH_MODE, "auto"))]);
        ((TextView) findViewById(R.id.text_theme_value)).setText(THEME_NAMES[indexOf(THEMES, T6Ui.theme(this))]);
        ((TextView) findViewById(R.id.text_language_value)).setText(LANGUAGE_NAMES[indexOf(LANGUAGE_TAGS, T6Ui.getString(this, T6Ui.KEY_LANGUAGE, T6Ui.DEFAULT_LANGUAGE))]);
        T6DriverStore drivers = new T6DriverStore(getFilesDir());
        String selectedDriver = drivers.selected();
        T6DriverStore.Entry entry = drivers.find(selectedDriver);
        TextView textView2 = (TextView) findViewById(R.id.text_driver_value);
        if (entry == null) {
            string2 = getString(R.string.settings_driver_value);
        } else {
            string2 = entry.meta.name.isEmpty() ? entry.id : entry.meta.name;
        }
        textView2.setText(string2);
        T6DxvkStore dxvk = new T6DxvkStore(getFilesDir());
        String selectedDxvk = dxvk.selected();
        TextView textView3 = (TextView) findViewById(R.id.text_dxvk_value);
        if (T6DxvkStore.BUILTIN.equals(selectedDxvk)) {
            strLabel = getString(R.string.settings_dxvk_builtin, new Object[]{T6DxvkStore.BUILTIN_VERSION});
        } else if (T6DxvkStore.BUNDLED_ID.equals(selectedDxvk)) {
            strLabel = getString(R.string.settings_dxvk_bundled, new Object[]{T6DxvkStore.BUNDLED_VERSION});
        } else if (T6DxvkStore.UPSTREAM3_ID.equals(selectedDxvk)) {
            strLabel = getString(R.string.settings_dxvk_upstream3, new Object[]{T6DxvkStore.UPSTREAM3_VERSION});
        } else {
            strLabel = dxvk.label(selectedDxvk);
        }
        textView3.setText(strLabel);
        ((TextView) findViewById(R.id.text_tu_debug_value)).setText(tuDebugLabel(readTuDebug()));
        Map<String, String> env = T6EnvVars.effective(T6EnvVars.load(getFilesDir()));
        TextView textView4 = (TextView) findViewById(R.id.text_env_vars_value);
        if (env.isEmpty()) {
            string3 = getString(R.string.settings_env_none);
        } else {
            string3 = getString(R.string.settings_env_count, new Object[]{Integer.valueOf(env.size()), TextUtils.join(", ", env.keySet())});
        }
        textView4.setText(string3);
        String resolution = T6Ui.getString(this, T6Ui.KEY_RESOLUTION, T6Ui.DEFAULT_RESOLUTION);
        String resolved = T6Ui.resolvedResolution(this).replace("x", " × ");
        TextView textView5 = (TextView) findViewById(R.id.text_resolution_value);
        if (T6Ui.NATIVE_RESOLUTION.equals(resolution)) {
            string4 = getString(R.string.settings_resolution_native, new Object[]{resolved});
        } else if (T6Ui.ASPECT_RESOLUTION.equals(resolution) && T6Ui.aspectResolution(this) != null) {
            string4 = getString(R.string.settings_resolution_aspect, new Object[]{T6Ui.displayAspectLabel(this), resolved});
        } else {
            string4 = resolved;
        }
        textView5.setText(string4);
        String profile = T6Ui.getString(this, T6Ui.KEY_TOUCH_PROFILE, T6TouchLayout.PROFILE_CODM);
        ((TextView) findViewById(R.id.text_controls_value)).setText(T6TouchLayout.PROFILE_X360.equals(profile) ? R.string.touch_profile_x360 : R.string.touch_profile_codm);
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onWindowFocusChanged(boolean hasFocus) {
        super.onWindowFocusChanged(hasFocus);
        if (hasFocus) {
            T6Ui.applyImmersive(this);
        }
    }

    @Override // android.app.Activity
    protected void onResume() throws JSONException, IOException {
        super.onResume();
        refreshKennelRow();
        this.config = this.store.load();
        revalidateStoredFolder();
        this.playerName = readStoredName();
        if (this.inputManager != null) {
            this.inputManager.registerInputDeviceListener(this.controllerListener, null);
        }
        refresh();
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) throws IOException, NumberFormatException {
        int id = view.getId();
        if (id == R.id.button_back) {
            finish();
            return;
        }
        if (id == R.id.button_pick_folder) {
            pickFolder();
            return;
        }
        if (id == R.id.button_grant_access) {
            requestAllFilesAccess();
            return;
        }
        if (id == R.id.row_player_name) {
            editPlayerName();
            return;
        }
        if (id == R.id.row_tu_debug) {
            chooseTuDebug();
            return;
        }
        if (id == R.id.row_env_vars) {
            startActivity(new Intent(this, (Class<?>) EnvVarsActivity.class));
            return;
        }
        if (id == R.id.row_kennel) {
            kennelCheckAndInstall();
            return;
        }
        if (id == R.id.row_driver) {
            startActivity(new Intent(this, (Class<?>) GraphicsDriverActivity.class));
            return;
        }
        if (id == R.id.row_dxvk) {
            chooseDxvk();
            return;
        }
        if (id == R.id.row_controls) {
            startActivity(new Intent(this, (Class<?>) TouchControlsActivity.class));
            return;
        }
        if (id == R.id.row_touch_mode) {
            cycleTouchMode();
            return;
        }
        if (id == R.id.row_theme) {
            chooseTheme();
            return;
        }
        if (id == R.id.button_discord) {
            openDiscord();
        } else if (id == R.id.row_language) {
            chooseLanguage();
        } else if (id == R.id.row_resolution) {
            chooseResolution();
        }
    }

    private String readStoredName() {
        T6SafStore store = T6SafStore.forTree(this, this.config.gameDirUri, this.config.gameDirDisplay);
        return T6PlayerName.load(store, "");
    }

    private void editPlayerName() {
        final EditText input = new EditText(this);
        input.setSingleLine(true);
        input.setText(this.playerName);
        input.setHint(R.string.player_name_hint);
        input.setInputType(8193);
        input.setSelectAllOnFocus(true);
        float density = getResources().getDisplayMetrics().density;
        int padding = (int) (16.0f * density);
        FrameLayout holder = new FrameLayout(this);
        holder.setPadding(padding, padding / 2, padding, 0);
        holder.addView(input, new FrameLayout.LayoutParams(-1, -2));
        new AlertDialog.Builder(this).setTitle(R.string.label_player_name).setView(holder).setPositiveButton(R.string.action_save, new DialogInterface.OnClickListener() { // from class: org.wiiucoop.bo2android.SettingsActivity$$ExternalSyntheticLambda15
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) throws IOException {
                this.f$0.m49lambda$editPlayerName$8$orgwiiucoopbo2androidSettingsActivity(input, dialogInterface, i);
            }
        }).setNegativeButton(R.string.action_cancel, (DialogInterface.OnClickListener) null).show();
    }

    /* renamed from: lambda$editPlayerName$8$org-wiiucoop-bo2android-SettingsActivity, reason: not valid java name */
    /* synthetic */ void m49lambda$editPlayerName$8$orgwiiucoopbo2androidSettingsActivity(EditText input, DialogInterface dialog, int which) throws IOException {
        savePlayerName(input.getText().toString());
    }

    private void savePlayerName(String raw) throws IOException {
        T6SafStore store = T6SafStore.forTree(this, this.config.gameDirUri, this.config.gameDirDisplay);
        T6PlayerName.Result result = T6PlayerName.save(store, raw);
        Log.i(TAG, "playername: " + result.message);
        toast(playerNameText(result.outcome));
        this.playerName = readStoredName();
        refresh();
    }

    private void pickFolder() {
        Intent intent = new Intent("android.intent.action.OPEN_DOCUMENT_TREE");
        intent.addFlags(193);
        Uri previous = T6TreeAccess.parse(this.config.gameDirUri);
        if (previous != null) {
            intent.putExtra("android.provider.extra.INITIAL_URI", previous);
        }
        try {
            startActivityForResult(intent, REQUEST_PICK_TREE);
        } catch (ActivityNotFoundException e) {
            toast(getString(R.string.settings_no_folder_picker));
        }
    }

    private void chooseDxvk() {
        String bundledProblem;
        final T6DxvkStore store = new T6DxvkStore(getFilesDir()).withApkStamp(T6DxvkStore.apkStamp(this));
        String bundledProblem2 = store.ensureBundled(getAssets());
        if (bundledProblem2 != null) {
            Log.w(TAG, "settings: dxvk dxvk-1.9.2-legacy: " + bundledProblem2);
        }
        String upstreamProblem = store.ensureUpstream3(getAssets());
        if (upstreamProblem != null) {
            Log.w(TAG, "settings: dxvk dxvk-3.1.1: " + upstreamProblem);
        }
        List<T6DxvkStore.Entry> entries = store.list();
        final String current = store.selected();
        List<String> idList = new ArrayList<>();
        List<String> labelList = new ArrayList<>();
        idList.add(T6DxvkStore.BUILTIN);
        labelList.add(getString(R.string.settings_dxvk_builtin, new Object[]{T6DxvkStore.BUILTIN_VERSION}));
        if (bundledProblem2 == null) {
            idList.add(T6DxvkStore.BUNDLED_ID);
            labelList.add(getString(R.string.settings_dxvk_bundled, new Object[]{T6DxvkStore.BUNDLED_VERSION}));
        }
        if (upstreamProblem == null) {
            idList.add(T6DxvkStore.UPSTREAM3_ID);
            labelList.add(getString(R.string.settings_dxvk_upstream3, new Object[]{T6DxvkStore.UPSTREAM3_VERSION}));
        }
        final String[] ids = (String[]) idList.toArray(new String[0]);
        String[] labels = (String[]) labelList.toArray(new String[0]);
        Map<String, String> status = store.lastStatus();
        if (status.isEmpty()) {
            bundledProblem = null;
        } else {
            bundledProblem = getString(R.string.settings_dxvk_last, new Object[]{status.get("loaded") + " (" + status.get("stage") + ")" + ((!status.containsKey("reason") || status.get("reason").isEmpty()) ? "" : " — " + status.get("reason"))});
        }
        Log.i(TAG, "settings: dxvk selected=" + current + ", installed=" + entries.size() + ", last=" + status);
        AlertDialog.Builder dialog = new AlertDialog.Builder(this).setTitle(bundledProblem == null ? getString(R.string.settings_dxvk_label) : getString(R.string.settings_dxvk_label) + T6PlayerName.TRAILING_NEWLINE + bundledProblem).setSingleChoiceItems(labels, find(ids, current), new DialogInterface.OnClickListener() { // from class: org.wiiucoop.bo2android.SettingsActivity$$ExternalSyntheticLambda1
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                this.f$0.m43lambda$chooseDxvk$9$orgwiiucoopbo2androidSettingsActivity(store, ids, current, dialogInterface, i);
            }
        }).setNegativeButton(R.string.action_cancel, (DialogInterface.OnClickListener) null);
        if (!T6DxvkStore.BUILTIN.equals(current) && !T6DxvkStore.isApkSet(current)) {
            dialog.setNeutralButton(R.string.settings_dxvk_remove, new DialogInterface.OnClickListener() { // from class: org.wiiucoop.bo2android.SettingsActivity$$ExternalSyntheticLambda2
                @Override // android.content.DialogInterface.OnClickListener
                public final void onClick(DialogInterface dialogInterface, int i) throws IOException {
                    this.f$0.m42lambda$chooseDxvk$10$orgwiiucoopbo2androidSettingsActivity(store, current, dialogInterface, i);
                }
            });
        }
        dialog.show();
    }

    /* renamed from: lambda$chooseDxvk$9$org-wiiucoop-bo2android-SettingsActivity, reason: not valid java name */
    /* synthetic */ void m43lambda$chooseDxvk$9$orgwiiucoopbo2androidSettingsActivity(T6DxvkStore store, String[] ids, String current, DialogInterface d, int which) {
        d.dismiss();
        if (store.select(ids[which])) {
            Log.i(TAG, "settings: dxvk selected for the next start: " + ids[which]);
            if (!ids[which].equals(current)) {
                toast(getString(R.string.settings_dxvk_restart));
            }
        }
        refreshOptionsSection();
    }

    /* renamed from: lambda$chooseDxvk$10$org-wiiucoop-bo2android-SettingsActivity, reason: not valid java name */
    /* synthetic */ void m42lambda$chooseDxvk$10$orgwiiucoopbo2androidSettingsActivity(T6DxvkStore store, String current, DialogInterface d, int which) throws IOException {
        store.remove(current);
        Log.i(TAG, "settings: dxvk removed " + current + "; the next start uses the APK's DXVK");
        toast(getString(R.string.settings_dxvk_restart));
        refreshOptionsSection();
    }

    @Override // android.app.Activity
    protected void onActivityResult(int requestCode, int resultCode, Intent data) throws IOException {
        if (requestCode != REQUEST_PICK_TREE) {
            super.onActivityResult(requestCode, resultCode, data);
            return;
        }
        if (resultCode != -1 || data == null || data.getData() == null) {
            toast(getString(R.string.folder_picker_cancelled));
            return;
        }
        Uri treeUri = data.getData();
        boolean persisted = T6TreeAccess.takePersistableReadPermission(this, treeUri, data.getFlags());
        if (!persisted) {
            final String display = T6TreeAccess.displayNameFor(treeUri);
            write(new Consumer() { // from class: org.wiiucoop.bo2android.SettingsActivity$$ExternalSyntheticLambda16
                @Override // java.util.function.Consumer
                public final void accept(Object obj) {
                    SettingsActivity.lambda$onActivityResult$11(display, (T6Config) obj);
                }
            });
            refresh();
            return;
        }
        applyFolder(treeUri);
    }

    static /* synthetic */ void lambda$onActivityResult$11(String display, T6Config current) {
        current.gameDirUri = "";
        current.gameDirPath = "";
        current.gameDirDisplay = display;
        current.gameDirState = T6Config.DIR_FAIL;
        current.gameDirDetail = "O Android não concedeu acesso permanente a esta pasta. Escolha outra pasta (por exemplo no armazenamento interno) e confirme o aviso.";
    }

    private void applyFolder(final Uri treeUri) throws IOException {
        final String state;
        T6Config probe = this.store.load();
        probe.gameDirUri = treeUri.toString();
        probe.gameDirPath = "";
        T6FolderReader.Snapshot snapshot = T6FolderReader.inspect(this, probe);
        final String path = snapshot.rawReadable ? snapshot.rawPath : "";
        if (!snapshot.rawReadable && snapshot.result.level != T6GameData.Level.FAIL) {
            state = T6Config.DIR_WARN;
        } else {
            state = snapshot.result.level.name();
        }
        final String display = T6TreeAccess.displayNameFor(treeUri);
        final String detail = T6FolderReader.describe(this, snapshot);
        write(new Consumer() { // from class: org.wiiucoop.bo2android.SettingsActivity$$ExternalSyntheticLambda10
            @Override // java.util.function.Consumer
            public final void accept(Object obj) {
                SettingsActivity.lambda$applyFolder$12(treeUri, display, path, state, detail, (T6Config) obj);
            }
        });
        T6SafStore.syncInto(this, treeUri.toString(), display, this.playerName);
        this.playerName = readStoredName();
        if (!snapshot.rawReadable) {
            requestLegacyReadPermission();
        }
        refresh();
    }

    static /* synthetic */ void lambda$applyFolder$12(Uri treeUri, String display, String path, String state, String detail, T6Config current) {
        current.gameDirUri = treeUri.toString();
        current.gameDirDisplay = display;
        current.gameDirPath = path;
        current.gameDirState = state;
        current.gameDirDetail = detail;
    }

    private void requestLegacyReadPermission() {
        if (Build.VERSION.SDK_INT >= 30 || checkSelfPermission("android.permission.READ_EXTERNAL_STORAGE") == 0) {
            return;
        }
        requestPermissions(new String[]{"android.permission.READ_EXTERNAL_STORAGE"}, REQUEST_READ_STORAGE);
    }

    @Override // android.app.Activity
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] results) throws IOException {
        if (requestCode == REQUEST_READ_STORAGE) {
            revalidateStoredFolder();
            refresh();
        } else {
            super.onRequestPermissionsResult(requestCode, permissions, results);
        }
    }

    private void revalidateStoredFolder() {
        final String state;
        if (!this.config.hasFolder()) {
            return;
        }
        T6FolderReader.Snapshot snapshot = T6FolderReader.inspect(this, this.config);
        final String path = snapshot.rawReadable ? snapshot.rawPath : "";
        if (!snapshot.rawReadable && snapshot.result.level != T6GameData.Level.FAIL) {
            state = T6Config.DIR_WARN;
        } else {
            state = snapshot.result.level.name();
        }
        final String detail = T6FolderReader.describe(this, snapshot);
        if (!path.equals(this.config.gameDirPath) || !state.equals(this.config.gameDirState) || !detail.equals(this.config.gameDirDetail)) {
            write(new Consumer() { // from class: org.wiiucoop.bo2android.SettingsActivity$$ExternalSyntheticLambda8
                @Override // java.util.function.Consumer
                public final void accept(Object obj) {
                    SettingsActivity.lambda$revalidateStoredFolder$13(path, state, detail, (T6Config) obj);
                }
            });
        }
    }

    static /* synthetic */ void lambda$revalidateStoredFolder$13(String path, String state, String detail, T6Config current) {
        current.gameDirPath = path;
        current.gameDirState = state;
        current.gameDirDetail = detail;
    }

    private void requestAllFilesAccess() throws IOException {
        if (Build.VERSION.SDK_INT < 30) {
            revalidateStoredFolder();
            refresh();
            return;
        }
        try {
            Intent intent = new Intent("android.settings.MANAGE_APP_ALL_FILES_ACCESS_PERMISSION");
            intent.setData(Uri.parse("package:" + getPackageName()));
            startActivity(intent);
        } catch (ActivityNotFoundException e) {
            try {
                startActivity(new Intent("android.settings.MANAGE_ALL_FILES_ACCESS_PERMISSION"));
            } catch (ActivityNotFoundException e2) {
                toast(getString(R.string.settings_no_files_access_screen));
            }
        }
    }

    private void refresh() throws IOException {
        refreshFolderSection();
        refreshNameSection();
        refreshInfoSection();
        refreshOptionsSection();
        this.footer.setVisibility(T6Ui.debugOverlayEnabled(this) ? 0 : 8);
        String footerText = getString(R.string.footer_runtime) + T6PlayerName.TRAILING_NEWLINE + T6Native.hostBuildSummary();
        T6RunStatus lastRun = T6RunStatus.load(new File(getFilesDir(), T6RunStatus.FILE_NAME));
        if (lastRun.exists() && !lastRun.engineBootReason.isEmpty()) {
            footerText = footerText + T6PlayerName.TRAILING_NEWLINE + getString(R.string.last_run_reason, new Object[]{lastRun.engineBootReason});
        }
        if (lastRun.exists() && !lastRun.guestStage.isEmpty()) {
            footerText = footerText + "\nEtapa do guest comprovada pelo host: " + lastRun.guestStage;
        }
        this.footer.setText(footerText);
    }

    private void refreshInfoSection() {
        if (this.deviceInfo == null) {
            return;
        }
        setText(R.id.text_info_cpu, this.deviceInfo.cpu);
        setText(R.id.text_info_gpu, this.deviceInfo.gpu);
        setText(R.id.text_info_ram, this.deviceInfo.ram);
        setText(R.id.text_info_vulkan, this.deviceInfo.vulkan);
        Log.i(TAG, "deviceinfo: cpu=" + T6DeviceInfo.orUnavailable(this.deviceInfo.cpu) + " gpu=" + T6DeviceInfo.orUnavailable(this.deviceInfo.gpu) + " ram=" + T6DeviceInfo.orUnavailable(this.deviceInfo.ram) + " vulkan=" + T6DeviceInfo.orUnavailable(this.deviceInfo.vulkan));
    }

    private void logRowGeometry(int viewId, String name) {
        View row = findViewById(viewId);
        if (row == null || row.getVisibility() != 0) {
            return;
        }
        int[] position = new int[2];
        row.getLocationOnScreen(position);
        int top = position[1];
        int bottom = row.getHeight() + top;
        View content = findViewById(android.R.id.content);
        int[] origin = new int[2];
        content.getLocationOnScreen(origin);
        Log.i(TAG, "settings: " + name + " tap " + (position[0] + (row.getWidth() / 2)) + "," + ((row.getHeight() / 2) + top) + " bounds " + position[0] + "," + top + ".." + (position[0] + row.getWidth()) + "," + bottom + " inside " + (top >= origin[1] && bottom <= origin[1] + content.getHeight()));
    }

    private void setText(int viewId, String value) {
        TextView view = (TextView) findViewById(viewId);
        if (view != null) {
            view.setText(T6DeviceInfo.orUnavailable(value));
        }
    }

    /* renamed from: org.wiiucoop.bo2android.SettingsActivity$3, reason: invalid class name */
    static /* synthetic */ class AnonymousClass3 {
        static final /* synthetic */ int[] $SwitchMap$org$wiiucoop$bo2android$T6PlayerName$Outcome = new int[T6PlayerName.Outcome.values().length];

        static {
            try {
                $SwitchMap$org$wiiucoop$bo2android$T6PlayerName$Outcome[T6PlayerName.Outcome.SAVED.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$org$wiiucoop$bo2android$T6PlayerName$Outcome[T6PlayerName.Outcome.NO_FOLDER.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$org$wiiucoop$bo2android$T6PlayerName$Outcome[T6PlayerName.Outcome.EMPTY.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$org$wiiucoop$bo2android$T6PlayerName$Outcome[T6PlayerName.Outcome.TOO_SHORT.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$org$wiiucoop$bo2android$T6PlayerName$Outcome[T6PlayerName.Outcome.PLACEHOLDER.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$org$wiiucoop$bo2android$T6PlayerName$Outcome[T6PlayerName.Outcome.WRITE_FAILED.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
        }
    }

    private String playerNameText(T6PlayerName.Outcome outcome) {
        switch (AnonymousClass3.$SwitchMap$org$wiiucoop$bo2android$T6PlayerName$Outcome[outcome.ordinal()]) {
            case 1:
                return getString(R.string.player_name_saved);
            case 2:
                return getString(R.string.player_name_no_folder);
            case 3:
                return getString(R.string.player_name_empty);
            case 4:
            case T6TouchLayout.AdsFire.MAX_QUEUED /* 5 */:
                return getString(R.string.player_name_client_rejects);
            case 6:
                return getString(R.string.player_name_write_failed);
            default:
                return getString(R.string.player_name_not_verified);
        }
    }

    private void refreshNameSection() {
        String string;
        String clientNote;
        TextView textView = this.nameValue;
        if (this.playerName.isEmpty()) {
            string = getString(R.string.player_name_none);
        } else {
            string = this.playerName;
        }
        textView.setText(string);
        if (this.playerName.isEmpty() || T6PlayerName.clientRejection(this.playerName).isEmpty()) {
            clientNote = "";
        } else {
            clientNote = getString(R.string.player_name_client_rejects) + T6PlayerName.TRAILING_NEWLINE;
        }
        this.nameDetail.setText(clientNote.trim());
        this.nameDetail.setVisibility(8);
    }

    private void refreshFolderSection() {
        if (!this.config.hasFolder()) {
            this.folderValue.setText(R.string.folder_none);
            this.folderDetail.setText("");
            this.pickButton.setText(R.string.action_pick_folder);
        } else {
            String display = this.config.gameDirDisplay.isEmpty() ? this.config.gameDirUri : this.config.gameDirDisplay;
            StringBuilder value = new StringBuilder(display);
            if (!this.config.gameDirPath.isEmpty()) {
                value.append(T6PlayerName.TRAILING_NEWLINE).append(this.config.gameDirPath);
            } else {
                value.append("\n(caminho de arquivo indisponível; veja abaixo)");
            }
            this.folderValue.setText(value.toString());
            this.folderDetail.setText(this.config.gameDirDetail);
            this.folderDetail.setVisibility(8);
            Log.i(TAG, "settings: folder: " + this.config.gameDirDetail);
            this.pickButton.setText(R.string.action_change_folder);
        }
        boolean needsAccess = this.config.hasFolder() && !T6TreeAccess.hasAllFilesAccess();
        this.grantButton.setVisibility(needsAccess ? 0 : 8);
    }

    private void write(Consumer<T6Config> change) {
        try {
            this.config = this.store.update(change);
        } catch (IOException e) {
            toast(getString(R.string.menu_config_write_failed, new Object[]{e.getMessage()}));
        }
    }

    private void toast(String message) {
        Toast.makeText(this, message, 1).show();
    }

    private void refreshKennelRow() throws JSONException {
        String string;
        if (this.kennelBusy || this.config == null || this.config.gameDirPath == null || this.config.gameDirPath.isEmpty()) {
            return;
        }
        File saved = new File(getFilesDir(), "kennel.json");
        if (saved.isFile()) {
            try {
                T6KennelPackage.Manifest m = T6KennelPackage.parse(new String(Files.readAllBytes(saved.toPath()), StandardCharsets.UTF_8));
                int installed = getSharedPreferences(T6Ui.PREFS, 4).getInt("kennel_version", -1);
                T6KennelPackage.State st = T6KennelPackage.state(new File(this.config.gameDirPath), installed, m);
                String size = Formatter.formatFileSize(this, m.size);
                TextView textView = (TextView) findViewById(R.id.text_kennel_value);
                if (st == T6KennelPackage.State.INSTALLED) {
                    string = getString(R.string.kennel_state_installed, new Object[]{Integer.valueOf(m.version)});
                } else {
                    string = getString(st == T6KennelPackage.State.MISSING ? R.string.kennel_state_missing : R.string.kennel_state_repair, new Object[]{size});
                }
                textView.setText(string);
            } catch (IOException e) {
                Log.w(TAG, "kennel: saved manifest unreadable: " + e.getMessage());
            }
        }
    }

    private void kennelStatus(final String text) {
        runOnUiThread(new Runnable() { // from class: org.wiiucoop.bo2android.SettingsActivity$$ExternalSyntheticLambda7
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m52lambda$kennelStatus$14$orgwiiucoopbo2androidSettingsActivity(text);
            }
        });
    }

    /* renamed from: lambda$kennelStatus$14$org-wiiucoop-bo2android-SettingsActivity, reason: not valid java name */
    /* synthetic */ void m52lambda$kennelStatus$14$orgwiiucoopbo2androidSettingsActivity(String text) {
        ((TextView) findViewById(R.id.text_kennel_value)).setText(text);
    }

    private void kennelCheckAndInstall() {
        if (this.kennelBusy) {
            return;
        }
        if (this.config == null || this.config.gameDirPath == null || this.config.gameDirPath.isEmpty()) {
            kennelStatus(getString(R.string.kennel_no_folder));
            return;
        }
        this.kennelBusy = true;
        final File gameDir = new File(this.config.gameDirPath);
        new Thread(new Runnable() { // from class: org.wiiucoop.bo2android.SettingsActivity$$ExternalSyntheticLambda14
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m51x7fb931a5(gameDir);
            }
        }, "kennel-install").start();
    }

    /* renamed from: lambda$kennelCheckAndInstall$16$org-wiiucoop-bo2android-SettingsActivity, reason: not valid java name */
    /* synthetic */ void m51x7fb931a5(File gameDir) {
        T6Updater updater;
        T6KennelPackage.Manifest m;
        T6KennelPackage.State st;
        final String size;
        try {
            try {
                updater = new T6Updater(getFilesDir(), getCacheDir(), 25);
                String text = updater.kennelManifestText();
                m = T6KennelPackage.parse(text);
                Files.write(new File(getFilesDir(), "kennel.json").toPath(), text.getBytes(StandardCharsets.UTF_8), new OpenOption[0]);
                int installed = getSharedPreferences(T6Ui.PREFS, 4).getInt("kennel_version", -1);
                st = T6KennelPackage.state(gameDir, installed, m);
                size = Formatter.formatFileSize(this, m.size);
            } catch (Exception e) {
                Log.w(TAG, "kennel: " + e.getMessage());
                kennelStatus(getString(R.string.kennel_failed, new Object[]{String.valueOf(e.getMessage())}));
            }
            if (st == T6KennelPackage.State.INSTALLED) {
                kennelStatus(getString(R.string.kennel_state_installed, new Object[]{Integer.valueOf(m.version)}));
                return;
            }
            File zip = updater.downloadKennel(m, new T6Updater.Progress() { // from class: org.wiiucoop.bo2android.SettingsActivity$$ExternalSyntheticLambda0
                @Override // org.wiiucoop.bo2android.T6Updater.Progress
                public final void onProgress(String str, long j, long j2) {
                    this.f$0.m50x7853fc86(size, str, j, j2);
                }
            });
            kennelStatus(getString(R.string.kennel_installing));
            T6KennelPackage.install(zip, gameDir, m);
            getSharedPreferences(T6Ui.PREFS, 4).edit().putInt("kennel_version", m.version).apply();
            zip.delete();
            Log.i(TAG, "kennel: version " + m.version + " installed in " + gameDir);
            kennelStatus(getString(R.string.kennel_state_installed, new Object[]{Integer.valueOf(m.version)}));
        } finally {
            this.kennelBusy = false;
        }
    }

    /* renamed from: lambda$kennelCheckAndInstall$15$org-wiiucoop-bo2android-SettingsActivity, reason: not valid java name */
    /* synthetic */ void m50x7853fc86(String size, String what, long done, long total) {
        kennelStatus(getString(R.string.kennel_progress, new Object[]{Integer.valueOf(total > 0 ? (int) ((100 * done) / total) : 0), size}));
    }
}
