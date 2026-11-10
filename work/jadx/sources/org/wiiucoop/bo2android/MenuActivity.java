package org.wiiucoop.bo2android;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.OpenOption;
import java.util.Locale;
import java.util.function.Consumer;
import org.wiiucoop.bo2android.T6FolderReader;
import org.wiiucoop.bo2android.T6GameData;
import org.wiiucoop.bo2android.T6GuestImage;
import org.wiiucoop.bo2android.T6KennelPackage;
import org.wiiucoop.bo2android.T6StartDecision;
import org.wiiucoop.bo2android.T6Updater;

/* loaded from: classes3.dex */
public final class MenuActivity extends Activity implements View.OnClickListener {
    private static final int REQUEST_INSTALL_APK = 30209;
    private static final String TAG = "t6android";
    private static volatile T6Updater.Check pendingCheck;
    private TextView badgeModeMp;
    private TextView badgeModeZm;
    private View cardModeMp;
    private View cardModeZm;
    private T6Config config;
    private File configFile;
    private T6FolderReader.Snapshot folder;
    private TextView folderHint;
    private TextView folderSummary;
    private TextView footer;
    private String integrityProblem;
    private TextView lastRun;
    private TextView modeDetail;
    private TextView notice;
    private boolean preparingGuest;
    private boolean recheckOnResume;
    private TextView runtimeState;
    private Button settingsButton;
    private File statusFile;
    private T6ConfigStore store;
    private AlertDialog updateDialog;
    private boolean updating;
    private String loggedState = "";
    private String createdTheme = "orange";

    /* JADX INFO: Access modifiers changed from: private */
    interface UpdateJob {
        void run() throws IOException;
    }

    @Override // android.app.Activity, android.view.ContextThemeWrapper, android.content.ContextWrapper
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(T6Ui.wrapLocale(base));
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) throws IOException {
        T6Ui.applyTheme(this);
        this.createdTheme = T6Ui.theme(this);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_menu);
        ((TextView) findViewById(R.id.text_build_tag)).setText(BuildConfig.VERSION_NAME);
        T6Ui.applyImmersive(this);
        this.integrityProblem = T6Integrity.problem(this);
        if (this.integrityProblem != null) {
            Log.w(TAG, "menu: integrity check FAILED: " + this.integrityProblem);
            showIntegrityDialog();
        }
        this.configFile = new File(getFilesDir(), T6Config.FILE_NAME);
        this.statusFile = new File(getFilesDir(), T6RunStatus.FILE_NAME);
        this.store = new T6ConfigStore(this.configFile);
        this.config = this.store.load();
        this.cardModeMp = findViewById(R.id.card_mode_mp);
        this.cardModeZm = findViewById(R.id.card_mode_zm);
        this.cardModeMp.setClipToOutline(true);
        this.cardModeZm.setClipToOutline(true);
        this.badgeModeMp = (TextView) findViewById(R.id.badge_mode_mp);
        this.badgeModeZm = (TextView) findViewById(R.id.badge_mode_zm);
        this.notice = (TextView) findViewById(R.id.text_notice);
        findViewById(R.id.button_settings).setOnClickListener(this);
        this.cardModeMp.setOnClickListener(this);
        this.cardModeZm.setOnClickListener(this);
        if (this.config.versionMismatch) {
            toast(getString(R.string.menu_config_version_ignored));
        }
        refresh();
        logMenuState("aberto");
        this.cardModeMp.post(new Runnable() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda11
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m29lambda$onCreate$0$orgwiiucoopbo2androidMenuActivity();
            }
        });
        checkForUpdates();
    }

    /* renamed from: lambda$onCreate$0$org-wiiucoop-bo2android-MenuActivity, reason: not valid java name */
    /* synthetic */ void m29lambda$onCreate$0$orgwiiucoopbo2androidMenuActivity() {
        logMenuGeometry("layout pronto");
    }

    private void checkForUpdates() {
        if (T6Updater.configured()) {
            final T6Updater updater = new T6Updater(getFilesDir(), getCacheDir(), 25);
            this.updating = true;
            new Thread(new Runnable() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda19
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m21lambda$checkForUpdates$2$orgwiiucoopbo2androidMenuActivity(updater);
                }
            }, "t6-update-check").start();
        }
    }

    /* renamed from: lambda$checkForUpdates$2$org-wiiucoop-bo2android-MenuActivity, reason: not valid java name */
    /* synthetic */ void m21lambda$checkForUpdates$2$orgwiiucoopbo2androidMenuActivity(T6Updater updater) {
        try {
            T6Updater.Check check = updater.check();
            String str = "atual";
            StringBuilder sbAppend = new StringBuilder().append("update: apk=").append(check.apk == null ? "atual" : check.apk.version).append(" source=");
            if (check.source != null) {
                str = check.source.version;
            }
            Log.i(TAG, sbAppend.append(str).toString());
            pendingCheck = check;
            runOnUiThread(new Runnable() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda16
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.showPendingCheck();
                }
            });
        } catch (IOException e) {
            Log.w(TAG, "update: verificação falhou: " + e.getMessage());
            runOnUiThread(new Runnable() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda17
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m20lambda$checkForUpdates$1$orgwiiucoopbo2androidMenuActivity();
                }
            });
        }
    }

    /* renamed from: lambda$checkForUpdates$1$org-wiiucoop-bo2android-MenuActivity, reason: not valid java name */
    /* synthetic */ void m20lambda$checkForUpdates$1$orgwiiucoopbo2androidMenuActivity() {
        this.updating = false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showPendingCheck() {
        T6Updater.Check check;
        if (isFinishing() || isDestroyed()) {
            return;
        }
        if ((this.updateDialog == null || !this.updateDialog.isShowing()) && (check = pendingCheck) != null) {
            pendingCheck = null;
            T6Updater updater = new T6Updater(getFilesDir(), getCacheDir(), 25);
            if (check.apk == null) {
                if (check.source == null) {
                    this.updating = false;
                    return;
                } else {
                    offerSource(updater, check.source, check.sourceCurrent);
                    return;
                }
            }
            offerApk(updater, check.apk);
        }
    }

    private void offerSource(final T6Updater updater, final T6Updater.Component source, String current) {
        this.updateDialog = new AlertDialog.Builder(this).setTitle(R.string.update_source_title).setMessage(getString(R.string.update_source_message, new Object[]{current.isEmpty() ? getString(R.string.update_bundled) : current, source.version})).setCancelable(false).setPositiveButton(R.string.update_now, new DialogInterface.OnClickListener() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda14
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                this.f$0.m27lambda$offerSource$5$orgwiiucoopbo2androidMenuActivity(updater, source, dialogInterface, i);
            }
        }).setNegativeButton(R.string.update_later, new DialogInterface.OnClickListener() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda15
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                this.f$0.m28lambda$offerSource$6$orgwiiucoopbo2androidMenuActivity(dialogInterface, i);
            }
        }).show();
    }

    /* renamed from: lambda$offerSource$5$org-wiiucoop-bo2android-MenuActivity, reason: not valid java name */
    /* synthetic */ void m27lambda$offerSource$5$orgwiiucoopbo2androidMenuActivity(final T6Updater updater, final T6Updater.Component source, DialogInterface d, int w) {
        runUpdate(new UpdateJob() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda13
            @Override // org.wiiucoop.bo2android.MenuActivity.UpdateJob
            public final void run() throws Throwable {
                this.f$0.m26lambda$offerSource$4$orgwiiucoopbo2androidMenuActivity(updater, source);
            }
        });
    }

    /* renamed from: lambda$offerSource$4$org-wiiucoop-bo2android-MenuActivity, reason: not valid java name */
    /* synthetic */ void m26lambda$offerSource$4$orgwiiucoopbo2androidMenuActivity(T6Updater updater, final T6Updater.Component source) throws Throwable {
        updater.installSource(source, new MenuActivity$$ExternalSyntheticLambda1(this));
        runOnUiThread(new Runnable() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m25lambda$offerSource$3$orgwiiucoopbo2androidMenuActivity(source);
            }
        });
    }

    /* renamed from: lambda$offerSource$3$org-wiiucoop-bo2android-MenuActivity, reason: not valid java name */
    /* synthetic */ void m25lambda$offerSource$3$orgwiiucoopbo2androidMenuActivity(T6Updater.Component source) {
        this.updating = false;
        toast(getString(R.string.update_source_done, new Object[]{source.version}));
    }

    /* renamed from: lambda$offerSource$6$org-wiiucoop-bo2android-MenuActivity, reason: not valid java name */
    /* synthetic */ void m28lambda$offerSource$6$orgwiiucoopbo2androidMenuActivity(DialogInterface d, int w) {
        this.updating = false;
    }

    private void offerApk(final T6Updater updater, final T6Updater.Component apk) {
        this.updateDialog = new AlertDialog.Builder(this).setTitle(R.string.update_apk_title).setMessage(getString(R.string.update_apk_message, new Object[]{BuildConfig.VERSION_NAME, apk.version})).setCancelable(false).setPositiveButton(R.string.update_now, new DialogInterface.OnClickListener() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda23
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                this.f$0.m23lambda$offerApk$8$orgwiiucoopbo2androidMenuActivity(updater, apk, dialogInterface, i);
            }
        }).setNegativeButton(R.string.update_later, new DialogInterface.OnClickListener() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda24
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                this.f$0.m24lambda$offerApk$9$orgwiiucoopbo2androidMenuActivity(dialogInterface, i);
            }
        }).show();
    }

    /* renamed from: lambda$offerApk$8$org-wiiucoop-bo2android-MenuActivity, reason: not valid java name */
    /* synthetic */ void m23lambda$offerApk$8$orgwiiucoopbo2androidMenuActivity(final T6Updater updater, final T6Updater.Component apk, DialogInterface d, int w) {
        runUpdate(new UpdateJob() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda12
            @Override // org.wiiucoop.bo2android.MenuActivity.UpdateJob
            public final void run() throws Throwable {
                this.f$0.m22lambda$offerApk$7$orgwiiucoopbo2androidMenuActivity(updater, apk);
            }
        });
    }

    /* renamed from: lambda$offerApk$7$org-wiiucoop-bo2android-MenuActivity, reason: not valid java name */
    /* synthetic */ void m22lambda$offerApk$7$orgwiiucoopbo2androidMenuActivity(T6Updater updater, T6Updater.Component apk) throws Throwable {
        updater.downloadApk(apk, new MenuActivity$$ExternalSyntheticLambda1(this));
        runOnUiThread(new Runnable() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda8
            @Override // java.lang.Runnable
            public final void run() throws IOException {
                this.f$0.installApk();
            }
        });
    }

    /* renamed from: lambda$offerApk$9$org-wiiucoop-bo2android-MenuActivity, reason: not valid java name */
    /* synthetic */ void m24lambda$offerApk$9$orgwiiucoopbo2androidMenuActivity(DialogInterface d, int w) {
        this.updating = false;
    }

    private void runUpdate(final UpdateJob job) {
        this.updateDialog = new AlertDialog.Builder(this).setTitle(R.string.update_downloading).setMessage("…").setCancelable(false).show();
        new Thread(new Runnable() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda25
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m35lambda$runUpdate$12$orgwiiucoopbo2androidMenuActivity(job);
            }
        }, "t6-update").start();
    }

    /* renamed from: lambda$runUpdate$12$org-wiiucoop-bo2android-MenuActivity, reason: not valid java name */
    /* synthetic */ void m35lambda$runUpdate$12$orgwiiucoopbo2androidMenuActivity(UpdateJob job) {
        Runnable runnable;
        try {
            try {
                job.run();
                runnable = new Runnable() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda6
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m34lambda$runUpdate$11$orgwiiucoopbo2androidMenuActivity();
                    }
                };
            } catch (IOException e) {
                Log.w(TAG, "update: falhou: " + e.getMessage());
                runOnUiThread(new Runnable() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda7
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m33lambda$runUpdate$10$orgwiiucoopbo2androidMenuActivity(e);
                    }
                });
                runnable = new Runnable() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda6
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m34lambda$runUpdate$11$orgwiiucoopbo2androidMenuActivity();
                    }
                };
            }
            runOnUiThread(runnable);
        } catch (Throwable th) {
            runOnUiThread(new Runnable() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda6
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m34lambda$runUpdate$11$orgwiiucoopbo2androidMenuActivity();
                }
            });
            throw th;
        }
    }

    /* renamed from: lambda$runUpdate$10$org-wiiucoop-bo2android-MenuActivity, reason: not valid java name */
    /* synthetic */ void m33lambda$runUpdate$10$orgwiiucoopbo2androidMenuActivity(IOException e) {
        this.updating = false;
        toast(getString(R.string.update_failed, new Object[]{e.getMessage()}));
    }

    /* renamed from: lambda$runUpdate$11$org-wiiucoop-bo2android-MenuActivity, reason: not valid java name */
    /* synthetic */ void m34lambda$runUpdate$11$orgwiiucoopbo2androidMenuActivity() {
        if (this.updateDialog != null) {
            this.updateDialog.dismiss();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showProgress(String what, long done, long total) {
        final String text;
        if (total > 0) {
            text = what + ": " + ((100 * done) / total) + "% (" + (done >> 20) + " / " + (total >> 20) + " MB)";
        } else {
            text = what + ": " + (done >> 20) + " MB";
        }
        runOnUiThread(new Runnable() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda9
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m38lambda$showProgress$13$orgwiiucoopbo2androidMenuActivity(text);
            }
        });
    }

    /* renamed from: lambda$showProgress$13$org-wiiucoop-bo2android-MenuActivity, reason: not valid java name */
    /* synthetic */ void m38lambda$showProgress$13$orgwiiucoopbo2androidMenuActivity(String text) {
        if (this.updateDialog != null) {
            this.updateDialog.setMessage(text);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void installApk() throws IOException {
        if (!getPackageManager().canRequestPackageInstalls()) {
            this.updating = false;
            toast(getString(R.string.update_allow_install));
            startActivity(new Intent("android.settings.MANAGE_UNKNOWN_APP_SOURCES", Uri.parse("package:" + getPackageName())));
            this.recheckOnResume = true;
            return;
        }
        Intent install = new Intent("android.intent.action.INSTALL_PACKAGE").setDataAndType(T6ApkProvider.uri(this), "application/vnd.android.package-archive").putExtra("android.intent.extra.RETURN_RESULT", true).putExtra("android.intent.extra.INSTALLER_PACKAGE_NAME", getPackageName()).addFlags(1);
        try {
            new File(getCacheDir(), "update_reopen.marker").createNewFile();
            new File(getCacheDir(), "update_reopen.marker").setLastModified(System.currentTimeMillis());
        } catch (IOException e) {
            Log.w(TAG, "update: marcador de reabertura: " + e.getMessage());
        }
        startActivityForResult(install, REQUEST_INSTALL_APK);
        this.recheckOnResume = true;
        this.updating = false;
    }

    @Override // android.app.Activity
    protected void onResume() throws IOException {
        super.onResume();
        if (!this.createdTheme.equals(T6Ui.theme(this))) {
            recreate();
            return;
        }
        T6Ui.applyImmersive(this);
        this.config = this.store.load();
        refreshKennelStatus();
        refresh();
        logMenuState("retomado");
        this.cardModeMp.post(new Runnable() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m30lambda$onResume$14$orgwiiucoopbo2androidMenuActivity();
            }
        });
        showPendingCheck();
        if (this.recheckOnResume && !this.updating) {
            this.recheckOnResume = false;
            checkForUpdates();
        }
    }

    /* renamed from: lambda$onResume$14$org-wiiucoop-bo2android-MenuActivity, reason: not valid java name */
    /* synthetic */ void m30lambda$onResume$14$orgwiiucoopbo2androidMenuActivity() {
        logMenuGeometry("layout pronto");
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) throws IOException {
        int id = view.getId();
        Log.i(TAG, "menu: toque em " + viewName(id) + " (id " + id + ")");
        if (this.updating && id != R.id.button_settings) {
            toast(getString(R.string.update_wait));
            return;
        }
        if (id == R.id.button_settings) {
            startActivity(new Intent(this, (Class<?>) SettingsActivity.class));
            return;
        }
        if (id == R.id.card_mode_mp) {
            selectMode(T6Config.MODE_MP);
            startSelectedClient();
        } else if (id == R.id.card_mode_zm) {
            selectMode(T6Config.MODE_ZM);
            startSelectedClient();
        }
    }

    private void selectMode(final String mode) throws IOException {
        try {
            this.config = this.store.update(new Consumer() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda20
                @Override // java.util.function.Consumer
                public final void accept(Object obj) {
                    ((T6Config) obj).mode = mode;
                }
            });
        } catch (IOException e) {
            toast(getString(R.string.menu_config_write_failed, new Object[]{e.getMessage()}));
        }
        refresh();
    }

    private String reasonText(T6StartDecision.Decision decision) {
        switch (decision.code) {
            case NO_FOLDER:
                return getString(R.string.start_no_folder);
            case FOLDER_UNUSABLE:
                return getString(R.string.start_folder_unusable);
            case NO_MODE:
                return getString(R.string.start_no_mode);
            default:
                return decision.canLaunchHost ? "" : getString(R.string.start_unavailable);
        }
    }

    private void startSelectedClient() {
        T6StartDecision.Decision decision = decision();
        setText(this.notice, decision.canLaunchHost ? "" : reasonText(decision));
        if (!decision.canLaunchHost) {
            Log.i(TAG, "menu: início recusado (" + decision.code + "): " + decision.reason);
            if (decision.code == T6StartDecision.Code.NO_FOLDER || decision.code == T6StartDecision.Code.FOLDER_UNUSABLE) {
                toast(getString(R.string.menu_needs_folder_short));
                startActivity(new Intent(this, (Class<?>) SettingsActivity.class));
                return;
            } else {
                toast(reasonText(decision));
                return;
            }
        }
        if (this.preparingGuest) {
            return;
        }
        this.preparingGuest = true;
        final String mode = this.config.mode;
        new Thread(new Runnable() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() throws IOException, NumberFormatException {
                this.f$0.m40x4aa54a1d(mode);
            }
        }, "t6-guest-image").start();
    }

    /* renamed from: lambda$startSelectedClient$17$org-wiiucoop-bo2android-MenuActivity, reason: not valid java name */
    /* synthetic */ void m40x4aa54a1d(final String mode) throws IOException, NumberFormatException {
        T6GuestImage.Result image = T6GuestImage.install(getAssets(), getFilesDir(), mode);
        Log.i(TAG, "menu: imagem guest " + (image.ready ? "pronta" : "não instalada") + ": " + image.detail);
        runOnUiThread(new Runnable() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda10
            @Override // java.lang.Runnable
            public final void run() throws IOException {
                this.f$0.m39xe952ad7e(mode);
            }
        });
    }

    /* renamed from: lambda$startSelectedClient$16$org-wiiucoop-bo2android-MenuActivity, reason: not valid java name */
    /* synthetic */ void m39xe952ad7e(String mode) throws IOException {
        this.preparingGuest = false;
        if (!isFinishing()) {
            launchHost(mode);
        }
    }

    private void showIntegrityDialog() {
        new AlertDialog.Builder(this).setTitle(R.string.integrity_title).setMessage(R.string.integrity_message).setCancelable(false).setPositiveButton(R.string.integrity_download, new DialogInterface.OnClickListener() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda21
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                this.f$0.m36xaf8425ac(dialogInterface, i);
            }
        }).setNegativeButton(R.string.integrity_close, new DialogInterface.OnClickListener() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda22
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                this.f$0.m37x10d6c24b(dialogInterface, i);
            }
        }).show();
    }

    /* renamed from: lambda$showIntegrityDialog$18$org-wiiucoop-bo2android-MenuActivity, reason: not valid java name */
    /* synthetic */ void m36xaf8425ac(DialogInterface d, int w) {
        try {
            startActivity(new Intent("android.intent.action.VIEW", Uri.parse(T6Ui.OFFICIAL_APK_URL)));
        } catch (ActivityNotFoundException e) {
        }
        finishAffinity();
    }

    /* renamed from: lambda$showIntegrityDialog$19$org-wiiucoop-bo2android-MenuActivity, reason: not valid java name */
    /* synthetic */ void m37x10d6c24b(DialogInterface d, int w) {
        finishAffinity();
    }

    private void launchHost(String mode) throws IOException {
        if (this.integrityProblem != null) {
            Log.w(TAG, "menu: start refused: " + this.integrityProblem);
            showIntegrityDialog();
            return;
        }
        Log.i(TAG, "menu: INICIAR aceito; abrindo a sessão do host no modo " + mode);
        if (!T6TreeAccess.hasAllFilesAccess()) {
            Log.i(TAG, "menu: sem \"Acesso a todos os arquivos\": o motor não consegue ler " + this.config.gameDirPath + " (conceda em CONFIGURAÇÕES)");
            toast(getString(R.string.menu_needs_all_files_access));
        }
        if (T6Ui.engineLaunchEnabled(this)) {
            File request = new File(getFilesDir(), "guest/engine_diag.request");
            try {
                if (request.getParentFile() != null) {
                    request.getParentFile().mkdirs();
                }
                if (request.exists() || request.createNewFile()) {
                    Log.i(TAG, "menu: motor do jogo solicitado (" + request.getName() + ")");
                }
            } catch (IOException e) {
                Log.w(TAG, "menu: não foi possível criar " + request + ": " + e.getMessage());
            }
        }
        writeEngineOptions();
        T6DxvkStore dxvkStore = new T6DxvkStore(getFilesDir()).withApkStamp(T6DxvkStore.apkStamp(this));
        String bundledProblem = dxvkStore.ensureBundled(getAssets());
        if (bundledProblem != null) {
            Log.w(TAG, "menu: dxvk dxvk-1.9.2-legacy: " + bundledProblem);
        }
        String upstreamProblem = dxvkStore.ensureUpstream3(getAssets());
        if (upstreamProblem != null) {
            Log.w(TAG, "menu: dxvk dxvk-3.1.1: " + upstreamProblem);
        }
        Intent host = new Intent(this, (Class<?>) MainActivity.class);
        host.putExtra(MainActivity.EXTRA_MODE, mode);
        host.putExtra(MainActivity.EXTRA_CONFIG_PATH, this.configFile.getAbsolutePath());
        startActivity(host);
    }

    private void writeEngineOptions() throws IOException {
        String text = "resolution=" + T6Ui.resolvedResolution(this) + "\nshow_fps=" + (T6Ui.getBool(this, T6Ui.KEY_SHOW_FPS, false) ? T6EngineCommand.VALUE_ON : T6EngineCommand.VALUE_OFF) + "\nstick_deadzone=" + String.format(Locale.ROOT, "%.2f", Float.valueOf(T6Ui.loadTouchLayout(this, T6Ui.getString(this, T6Ui.KEY_TOUCH_PROFILE, T6TouchLayout.PROFILE_CODM)).stickDeadzone())) + T6PlayerName.TRAILING_NEWLINE;
        try {
            FileOutputStream out = new FileOutputStream(new File(getFilesDir(), "engine_options.cfg"));
            try {
                out.write(text.getBytes(StandardCharsets.UTF_8));
                out.close();
            } finally {
            }
        } catch (IOException e) {
            Log.w(TAG, "menu: engine_options.cfg não gravado: " + e.getMessage());
        }
    }

    private void refresh() throws IOException {
        this.folder = T6FolderReader.inspect(this, this.config);
        refreshModeSection();
        refreshFolderSection();
        refreshStartButton();
        refreshRuntimeSection();
        refreshLastRun();
        Log.i(TAG, "menu: " + T6Native.hostBuildSummary());
    }

    private void refreshModeSection() {
        boolean mp = T6Config.MODE_MP.equals(this.config.mode);
        boolean zm = T6Config.MODE_ZM.equals(this.config.mode);
        this.cardModeMp.setSelected(mp);
        this.cardModeZm.setSelected(zm);
        if (this.badgeModeMp != null) {
            this.badgeModeMp.setVisibility(mp ? 0 : 8);
        }
        if (this.badgeModeZm != null) {
            this.badgeModeZm.setVisibility(zm ? 0 : 8);
        }
    }

    private void refreshFolderSection() {
        if (this.folderSummary != null) {
            this.folderSummary.setVisibility(8);
        }
        if (this.folderHint != null) {
            this.folderHint.setVisibility(8);
        }
    }

    private void refreshStartButton() {
        T6StartDecision.Decision decision = decision();
        setText(this.notice, decision.canLaunchHost ? "" : reasonText(decision));
    }

    private void refreshRuntimeSection() {
        if (this.config.hasMode() && !T6Native.isEngineRuntimeAvailable(this.config.mode)) {
            Log.i(TAG, "menu: motor indisponível: " + T6Native.engineRuntimeReason(this.config.mode));
        }
        if (this.runtimeState != null) {
            this.runtimeState.setVisibility(8);
        }
    }

    private T6StartDecision.Decision decision() {
        boolean runtimeAvailable = T6Native.isEngineRuntimeAvailable(this.config.mode);
        String runtimeReason = T6Native.engineRuntimeReason(this.config.mode);
        T6GameData.Result data = this.folder == null ? null : this.folder.result;
        return T6StartDecision.evaluate(this.config, data, runtimeAvailable, runtimeReason);
    }

    private void refreshLastRun() throws IOException {
        T6RunStatus status = T6RunStatus.load(this.statusFile);
        if (this.lastRun != null) {
            this.lastRun.setVisibility(8);
        }
        if (!status.exists()) {
            Log.i(TAG, "menu: nenhuma execução do host registrada ainda");
            return;
        }
        if (this.lastRun == null) {
            Log.i(TAG, "menu: última execução: modo=" + status.mode + " frames=" + status.frames() + " motor=" + status.engineBoot);
            return;
        }
        StringBuilder text = new StringBuilder();
        text.append(getString(R.string.last_run_summary, new Object[]{T6Config.modeLabel(status.mode), state(status.hostLifecycle), state(status.vulkanSurface), status.dxvkDevice.isEmpty() ? getString(R.string.state_absent) : state(status.dxvkDevice), Integer.valueOf(status.frames()), status.engineBooted() ? getString(R.string.state_ok) : state(status.engineBoot)}));
        if (!status.engineBootReason.isEmpty()) {
            text.append(T6PlayerName.TRAILING_NEWLINE).append(getString(R.string.last_run_reason, new Object[]{status.engineBootReason}));
        }
        this.lastRun.setText(text.toString());
    }

    private String state(String value) {
        if ("ok".equals(value)) {
            return getString(R.string.state_ok);
        }
        if ("failed".equals(value)) {
            return getString(R.string.state_failed);
        }
        if ("absent".equals(value)) {
            return getString(R.string.state_absent);
        }
        if ("blocked".equals(value)) {
            return getString(R.string.state_blocked);
        }
        return getString(R.string.state_unknown);
    }

    private void toast(String message) {
        Toast.makeText(this, message, 1).show();
    }

    private void setText(TextView view, String text) {
        if (view != null) {
            view.setText(text);
        }
    }

    private void logMenuState(String why) {
        String storedFolder;
        T6StartDecision.Decision decision = decision();
        if (this.config.hasFolder()) {
            storedFolder = this.config.gameDirDisplay.isEmpty() ? this.config.gameDirUri : this.config.gameDirDisplay;
        } else {
            storedFolder = "nenhuma";
        }
        String line = "menu: " + why + " -> modo=" + (this.config.hasMode() ? this.config.mode : "nenhum") + " pasta=" + storedFolder + " leitura=" + (this.folder == null ? "sem leitura" : this.folder.result.level) + " iniciar=" + (decision.canLaunchHost ? "habilitado" : "desabilitado") + (decision.canLaunchHost ? "" : " (" + decision.reason + ")");
        if (line.equals(this.loggedState)) {
            return;
        }
        this.loggedState = line;
        Log.i(TAG, line);
    }

    private void logMenuGeometry(String why) {
        int[] origin = new int[2];
        findViewById(android.R.id.content).getLocationOnScreen(origin);
        int windowBottom = origin[1] + findViewById(android.R.id.content).getHeight();
        logCardGeometry(this.cardModeMp, "card_mode_mp", why, origin[1], windowBottom);
        logCardGeometry(this.cardModeZm, "card_mode_zm", why, origin[1], windowBottom);
        logCardGeometry(findViewById(R.id.button_settings), "button_settings", why, origin[1], windowBottom);
    }

    private void logCardGeometry(View card, String name, String why, int windowTop, int windowBottom) {
        if (card == null || card.getVisibility() != 0) {
            return;
        }
        int[] position = new int[2];
        card.getLocationOnScreen(position);
        int top = position[1];
        int bottom = card.getHeight() + top;
        Log.i(TAG, "menu: " + why + " -> " + name + " tap " + (position[0] + (card.getWidth() / 2)) + "," + ((card.getHeight() / 2) + top) + " bounds " + position[0] + "," + top + ".." + (position[0] + card.getWidth()) + "," + bottom + " ativo " + card.isEnabled() + " inside " + (top >= windowTop && bottom <= windowBottom));
    }

    private String viewName(int id) {
        try {
            return getResources().getResourceEntryName(id);
        } catch (RuntimeException e) {
            return "desconhecida";
        }
    }

    private void refreshKennelStatus() {
        final TextView status = (TextView) findViewById(R.id.text_kennel_status);
        if (status == null) {
            return;
        }
        status.setText(R.string.kennel_home_checking);
        status.setOnClickListener(new View.OnClickListener() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda4
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m31xe5e8244b(view);
            }
        });
        final String gamePath = this.config == null ? null : this.config.gameDirPath;
        new Thread(new Runnable() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda5
            @Override // java.lang.Runnable
            public final void run() throws IOException {
                this.f$0.m32xa88d5d89(gamePath, status);
            }
        }, "kennel-check").start();
    }

    /* renamed from: lambda$refreshKennelStatus$20$org-wiiucoop-bo2android-MenuActivity, reason: not valid java name */
    /* synthetic */ void m31xe5e8244b(View v) {
        startActivity(new Intent(this, (Class<?>) SettingsActivity.class));
    }

    /* renamed from: lambda$refreshKennelStatus$22$org-wiiucoop-bo2android-MenuActivity, reason: not valid java name */
    /* synthetic */ void m32xa88d5d89(String gamePath, final TextView status) throws IOException {
        boolean ok = false;
        if (gamePath != null) {
            try {
                if (!gamePath.isEmpty()) {
                    File saved = new File(getFilesDir(), "kennel.json");
                    if (!saved.isFile() && T6Updater.configured()) {
                        String text = new T6Updater(getFilesDir(), getCacheDir(), 25).kennelManifestText();
                        Files.write(saved.toPath(), text.getBytes(StandardCharsets.UTF_8), new OpenOption[0]);
                    }
                    if (saved.isFile()) {
                        T6KennelPackage.Manifest m = T6KennelPackage.parse(new String(Files.readAllBytes(saved.toPath()), StandardCharsets.UTF_8));
                        ok = T6KennelPackage.verify(new File(gamePath), m, getSharedPreferences(T6Ui.PREFS, 4));
                    }
                }
            } catch (Exception e) {
                Log.w(TAG, "kennel: home check: " + e.getMessage());
            }
        }
        final boolean installed = ok;
        Log.i(TAG, "kennel: home check: " + (installed ? "installed" : "not installed"));
        runOnUiThread(new Runnable() { // from class: org.wiiucoop.bo2android.MenuActivity$$ExternalSyntheticLambda18
            @Override // java.lang.Runnable
            public final void run() {
                status.setText(installed ? R.string.kennel_home_installed : R.string.kennel_home_missing);
            }
        });
    }
}
