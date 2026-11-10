.class public final Lorg/wiiucoop/bo2android/MenuActivity;
.super Landroid/app/Activity;
.source "MenuActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/wiiucoop/bo2android/MenuActivity$UpdateJob;
    }
.end annotation


# static fields
.field private static final REQUEST_INSTALL_APK:I = 0x7601

.field private static final TAG:Ljava/lang/String; = "t6android"

.field private static volatile pendingCheck:Lorg/wiiucoop/bo2android/T6Updater$Check;


# instance fields
.field private badgeModeMp:Landroid/widget/TextView;

.field private badgeModeZm:Landroid/widget/TextView;

.field private cardModeMp:Landroid/view/View;

.field private cardModeZm:Landroid/view/View;

.field private config:Lorg/wiiucoop/bo2android/T6Config;

.field private configFile:Ljava/io/File;

.field private createdTheme:Ljava/lang/String;

.field private folder:Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;

.field private folderHint:Landroid/widget/TextView;

.field private folderSummary:Landroid/widget/TextView;

.field private footer:Landroid/widget/TextView;

.field private integrityProblem:Ljava/lang/String;

.field private lastRun:Landroid/widget/TextView;

.field private loggedState:Ljava/lang/String;

.field private modeDetail:Landroid/widget/TextView;

.field private notice:Landroid/widget/TextView;

.field private preparingGuest:Z

.field private recheckOnResume:Z

.field private runtimeState:Landroid/widget/TextView;

.field private settingsButton:Landroid/widget/Button;

.field private statusFile:Ljava/io/File;

.field private store:Lorg/wiiucoop/bo2android/T6ConfigStore;

.field private updateDialog:Landroid/app/AlertDialog;

.field private updating:Z


# direct methods
.method public static synthetic $r8$lambda$HYyny3MAIKThYBcAGIRwijZWJ_8(Lorg/wiiucoop/bo2android/MenuActivity;)V
    .locals 0

    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->installApk()V

    return-void
.end method

.method public static synthetic $r8$lambda$Oiy26RMhBkihao0OvI5mJuWrxNQ(Lorg/wiiucoop/bo2android/MenuActivity;)V
    .locals 0

    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->showPendingCheck()V

    return-void
.end method

.method public static synthetic $r8$lambda$nrVsH8etcp0bknWqWumMomiejYk(Lorg/wiiucoop/bo2android/MenuActivity;Ljava/lang/String;JJ)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Lorg/wiiucoop/bo2android/MenuActivity;->showProgress(Ljava/lang/String;JJ)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 38
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 70
    const-string v0, ""

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->loggedState:Ljava/lang/String;

    .line 268
    const-string v0, "orange"

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->createdTheme:Ljava/lang/String;

    return-void
.end method

.method private checkForUpdates()V
    .locals 4

    .line 140
    invoke-static {}, Lorg/wiiucoop/bo2android/T6Updater;->configured()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 141
    :cond_0
    new-instance v0, Lorg/wiiucoop/bo2android/T6Updater;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->getCacheDir()Ljava/io/File;

    move-result-object v2

    const/16 v3, 0x19

    invoke-direct {v0, v1, v2, v3}, Lorg/wiiucoop/bo2android/T6Updater;-><init>(Ljava/io/File;Ljava/io/File;I)V

    .line 142
    .local v0, "updater":Lorg/wiiucoop/bo2android/T6Updater;
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/wiiucoop/bo2android/MenuActivity;->updating:Z

    .line 143
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda19;

    invoke-direct {v2, p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda19;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;Lorg/wiiucoop/bo2android/T6Updater;)V

    const-string v3, "t6-update-check"

    invoke-direct {v1, v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 154
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 155
    return-void
.end method

.method private decision()Lorg/wiiucoop/bo2android/T6StartDecision$Decision;
    .locals 4

    .line 555
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v0, v0, Lorg/wiiucoop/bo2android/T6Config;->mode:Ljava/lang/String;

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6Native;->isEngineRuntimeAvailable(Ljava/lang/String;)Z

    move-result v0

    .line 556
    .local v0, "runtimeAvailable":Z
    iget-object v1, p0, Lorg/wiiucoop/bo2android/MenuActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6Config;->mode:Ljava/lang/String;

    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6Native;->engineRuntimeReason(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 557
    .local v1, "runtimeReason":Ljava/lang/String;
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MenuActivity;->folder:Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;

    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MenuActivity;->folder:Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;

    iget-object v2, v2, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;->result:Lorg/wiiucoop/bo2android/T6GameData$Result;

    .line 558
    .local v2, "data":Lorg/wiiucoop/bo2android/T6GameData$Result;
    :goto_0
    iget-object v3, p0, Lorg/wiiucoop/bo2android/MenuActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    invoke-static {v3, v2, v0, v1}, Lorg/wiiucoop/bo2android/T6StartDecision;->evaluate(Lorg/wiiucoop/bo2android/T6Config;Lorg/wiiucoop/bo2android/T6GameData$Result;ZLjava/lang/String;)Lorg/wiiucoop/bo2android/T6StartDecision$Decision;

    move-result-object v3

    return-object v3
.end method

.method private installApk()V
    .locals 7

    .line 237
    const-string v0, "update_reopen.marker"

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/pm/PackageManager;->canRequestPackageInstalls()Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_0

    .line 238
    iput-boolean v2, p0, Lorg/wiiucoop/bo2android/MenuActivity;->updating:Z

    .line 239
    sget v0, Lorg/wiiucoop/bo2android/R$string;->update_allow_install:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->toast(Ljava/lang/String;)V

    .line 240
    new-instance v0, Landroid/content/Intent;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "package:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 241
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const-string v2, "android.settings.MANAGE_UNKNOWN_APP_SOURCES"

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 240
    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->startActivity(Landroid/content/Intent;)V

    .line 242
    iput-boolean v3, p0, Lorg/wiiucoop/bo2android/MenuActivity;->recheckOnResume:Z

    .line 243
    return-void

    .line 250
    :cond_0
    new-instance v1, Landroid/content/Intent;

    const-string v4, "android.intent.action.INSTALL_PACKAGE"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 251
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6ApkProvider;->uri(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v4

    const-string v5, "application/vnd.android.package-archive"

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 252
    const-string v4, "android.intent.extra.RETURN_RESULT"

    invoke-virtual {v1, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v1

    .line 253
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "android.intent.extra.INSTALLER_PACKAGE_NAME"

    invoke-virtual {v1, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 254
    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v1

    .line 258
    .local v1, "install":Landroid/content/Intent;
    :try_start_0
    new-instance v4, Ljava/io/File;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->getCacheDir()Ljava/io/File;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->createNewFile()Z

    .line 259
    new-instance v4, Ljava/io/File;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->getCacheDir()Ljava/io/File;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Ljava/io/File;->setLastModified(J)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 262
    goto :goto_0

    .line 260
    :catch_0
    move-exception v0

    .line 261
    .local v0, "e":Ljava/io/IOException;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "update: marcador de reabertura: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "t6android"

    invoke-static {v5, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 263
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    const/16 v0, 0x7601

    invoke-virtual {p0, v1, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 264
    iput-boolean v3, p0, Lorg/wiiucoop/bo2android/MenuActivity;->recheckOnResume:Z

    .line 265
    iput-boolean v2, p0, Lorg/wiiucoop/bo2android/MenuActivity;->updating:Z

    .line 266
    return-void
.end method

.method static synthetic lambda$refreshKennelStatus$21(Landroid/widget/TextView;Z)V
    .locals 1
    .param p0, "status"    # Landroid/widget/TextView;
    .param p1, "installed"    # Z

    .line 734
    if-eqz p1, :cond_0

    sget v0, Lorg/wiiucoop/bo2android/R$string;->kennel_home_installed:I

    goto :goto_0

    :cond_0
    sget v0, Lorg/wiiucoop/bo2android/R$string;->kennel_home_missing:I

    :goto_0
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    return-void
.end method

.method static synthetic lambda$selectMode$15(Ljava/lang/String;Lorg/wiiucoop/bo2android/T6Config;)V
    .locals 0
    .param p0, "mode"    # Ljava/lang/String;
    .param p1, "current"    # Lorg/wiiucoop/bo2android/T6Config;

    .line 335
    iput-object p0, p1, Lorg/wiiucoop/bo2android/T6Config;->mode:Ljava/lang/String;

    return-void
.end method

.method private launchHost(Ljava/lang/String;)V
    .locals 6
    .param p1, "mode"    # Ljava/lang/String;

    .line 420
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->integrityProblem:Ljava/lang/String;

    const-string v1, "t6android"

    if-eqz v0, :cond_0

    .line 421
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "menu: start refused: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lorg/wiiucoop/bo2android/MenuActivity;->integrityProblem:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 422
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->showIntegrityDialog()V

    .line 423
    return-void

    .line 425
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "menu: INICIAR aceito; abrindo a sess\u00e3o do host no modo "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 429
    invoke-static {}, Lorg/wiiucoop/bo2android/T6TreeAccess;->hasAllFilesAccess()Z

    move-result v0

    if-nez v0, :cond_1

    .line 430
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "menu: sem \"Acesso a todos os arquivos\": o motor n\u00e3o consegue ler "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lorg/wiiucoop/bo2android/MenuActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v2, v2, Lorg/wiiucoop/bo2android/T6Config;->gameDirPath:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " (conceda em CONFIGURA\u00c7\u00d5ES)"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 432
    sget v0, Lorg/wiiucoop/bo2android/R$string;->menu_needs_all_files_access:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->toast(Ljava/lang/String;)V

    .line 440
    :cond_1
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->engineLaunchEnabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 441
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "guest/engine_diag.request"

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 443
    .local v0, "request":Ljava/io/File;
    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 444
    :cond_2
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 445
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "menu: motor do jogo solicitado ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 449
    :cond_4
    goto :goto_0

    .line 447
    :catch_0
    move-exception v2

    .line 448
    .local v2, "e":Ljava/io/IOException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "menu: n\u00e3o foi poss\u00edvel criar "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 451
    .end local v0    # "request":Ljava/io/File;
    .end local v2    # "e":Ljava/io/IOException;
    :cond_5
    :goto_0
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->writeEngineOptions()V

    .line 453
    new-instance v0, Lorg/wiiucoop/bo2android/T6DxvkStore;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-direct {v0, v2}, Lorg/wiiucoop/bo2android/T6DxvkStore;-><init>(Ljava/io/File;)V

    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6DxvkStore;->apkStamp(Landroid/content/Context;)J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lorg/wiiucoop/bo2android/T6DxvkStore;->withApkStamp(J)Lorg/wiiucoop/bo2android/T6DxvkStore;

    move-result-object v0

    .line 454
    .local v0, "dxvkStore":Lorg/wiiucoop/bo2android/T6DxvkStore;
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/wiiucoop/bo2android/T6DxvkStore;->ensureBundled(Landroid/content/res/AssetManager;)Ljava/lang/String;

    move-result-object v2

    .line 455
    .local v2, "bundledProblem":Ljava/lang/String;
    if-eqz v2, :cond_6

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "menu: dxvk dxvk-1.9.2-legacy: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 457
    :cond_6
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/wiiucoop/bo2android/T6DxvkStore;->ensureUpstream3(Landroid/content/res/AssetManager;)Ljava/lang/String;

    move-result-object v3

    .line 458
    .local v3, "upstreamProblem":Ljava/lang/String;
    if-eqz v3, :cond_7

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "menu: dxvk dxvk-3.1.1: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 460
    :cond_7
    new-instance v1, Landroid/content/Intent;

    const-class v4, Lorg/wiiucoop/bo2android/MainActivity;

    invoke-direct {v1, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 461
    .local v1, "host":Landroid/content/Intent;
    const-string v4, "org.wiiucoop.bo2android.MODE"

    invoke-virtual {v1, v4, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 462
    iget-object v4, p0, Lorg/wiiucoop/bo2android/MenuActivity;->configFile:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    const-string v5, "org.wiiucoop.bo2android.CONFIG_PATH"

    invoke-virtual {v1, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 463
    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/MenuActivity;->startActivity(Landroid/content/Intent;)V

    .line 464
    return-void
.end method

.method private logCardGeometry(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;II)V
    .locals 9
    .param p1, "card"    # Landroid/view/View;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "why"    # Ljava/lang/String;
    .param p4, "windowTop"    # I
    .param p5, "windowBottom"    # I

    .line 673
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_1

    .line 677
    :cond_0
    const/4 v0, 0x2

    new-array v1, v0, [I

    .line 678
    .local v1, "position":[I
    invoke-virtual {p1, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 680
    const/4 v2, 0x1

    aget v3, v1, v2

    .line 681
    .local v3, "top":I
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v4

    add-int/2addr v4, v3

    .line 683
    .local v4, "bottom":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "menu: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " -> "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " tap "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    aget v7, v1, v6

    .line 684
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v8

    div-int/2addr v8, v0

    add-int/2addr v7, v8

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, ","

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v8

    div-int/2addr v8, v0

    add-int/2addr v8, v3

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, " bounds "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    aget v5, v1, v6

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, ".."

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    aget v5, v1, v6

    .line 686
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v8

    add-int/2addr v5, v8

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, " ativo "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 687
    invoke-virtual {p1}, Landroid/view/View;->isEnabled()Z

    move-result v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, " inside "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    if-lt v3, p4, :cond_1

    if-gt v4, p5, :cond_1

    goto :goto_0

    :cond_1
    move v2, v6

    :goto_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 683
    const-string v2, "t6android"

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 689
    return-void

    .line 674
    .end local v1    # "position":[I
    .end local v3    # "top":I
    .end local v4    # "bottom":I
    :cond_2
    :goto_1
    return-void
.end method

.method private logMenuGeometry(Ljava/lang/String;)V
    .locals 10
    .param p1, "why"    # Ljava/lang/String;

    .line 660
    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 661
    .local v0, "origin":[I
    const v1, 0x1020002

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/MenuActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 662
    const/4 v2, 0x1

    aget v3, v0, v2

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/MenuActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    add-int/2addr v3, v1

    .line 664
    .local v3, "windowBottom":I
    iget-object v5, p0, Lorg/wiiucoop/bo2android/MenuActivity;->cardModeMp:Landroid/view/View;

    const-string v6, "card_mode_mp"

    aget v8, v0, v2

    move-object v4, p0

    move-object v7, p1

    move v9, v3

    invoke-direct/range {v4 .. v9}, Lorg/wiiucoop/bo2android/MenuActivity;->logCardGeometry(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;II)V

    .line 665
    iget-object v5, p0, Lorg/wiiucoop/bo2android/MenuActivity;->cardModeZm:Landroid/view/View;

    const-string v6, "card_mode_zm"

    aget v8, v0, v2

    invoke-direct/range {v4 .. v9}, Lorg/wiiucoop/bo2android/MenuActivity;->logCardGeometry(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;II)V

    .line 668
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_settings:I

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/MenuActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    const-string v6, "button_settings"

    aget v8, v0, v2

    invoke-direct/range {v4 .. v9}, Lorg/wiiucoop/bo2android/MenuActivity;->logCardGeometry(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;II)V

    .line 670
    return-void
.end method

.method private logMenuState(Ljava/lang/String;)V
    .locals 5
    .param p1, "why"    # Ljava/lang/String;

    .line 630
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->decision()Lorg/wiiucoop/bo2android/T6StartDecision$Decision;

    move-result-object v0

    .line 632
    .local v0, "decision":Lorg/wiiucoop/bo2android/T6StartDecision$Decision;
    iget-object v1, p0, Lorg/wiiucoop/bo2android/MenuActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    invoke-virtual {v1}, Lorg/wiiucoop/bo2android/T6Config;->hasFolder()Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "nenhuma"

    goto :goto_0

    .line 633
    :cond_0
    iget-object v1, p0, Lorg/wiiucoop/bo2android/MenuActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6Config;->gameDirDisplay:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/wiiucoop/bo2android/MenuActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6Config;->gameDirUri:Ljava/lang/String;

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lorg/wiiucoop/bo2android/MenuActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6Config;->gameDirDisplay:Ljava/lang/String;

    :goto_0
    nop

    .line 635
    .local v1, "storedFolder":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "menu: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " -> modo="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 636
    iget-object v3, p0, Lorg/wiiucoop/bo2android/MenuActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    invoke-virtual {v3}, Lorg/wiiucoop/bo2android/T6Config;->hasMode()Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lorg/wiiucoop/bo2android/MenuActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v3, v3, Lorg/wiiucoop/bo2android/T6Config;->mode:Ljava/lang/String;

    goto :goto_1

    :cond_2
    const-string v3, "nenhum"

    :goto_1
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " pasta="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " leitura="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 638
    iget-object v3, p0, Lorg/wiiucoop/bo2android/MenuActivity;->folder:Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;

    if-nez v3, :cond_3

    const-string v3, "sem leitura"

    goto :goto_2

    :cond_3
    iget-object v3, p0, Lorg/wiiucoop/bo2android/MenuActivity;->folder:Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;

    iget-object v3, v3, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;->result:Lorg/wiiucoop/bo2android/T6GameData$Result;

    iget-object v3, v3, Lorg/wiiucoop/bo2android/T6GameData$Result;->level:Lorg/wiiucoop/bo2android/T6GameData$Level;

    :goto_2
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " iniciar="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 639
    iget-boolean v3, v0, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;->canLaunchHost:Z

    if-eqz v3, :cond_4

    const-string v3, "habilitado"

    goto :goto_3

    :cond_4
    const-string v3, "desabilitado"

    :goto_3
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 640
    iget-boolean v3, v0, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;->canLaunchHost:Z

    if-eqz v3, :cond_5

    const-string v3, ""

    goto :goto_4

    :cond_5
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;->reason:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_4
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 642
    .local v2, "line":Ljava/lang/String;
    iget-object v3, p0, Lorg/wiiucoop/bo2android/MenuActivity;->loggedState:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 643
    return-void

    .line 646
    :cond_6
    iput-object v2, p0, Lorg/wiiucoop/bo2android/MenuActivity;->loggedState:Ljava/lang/String;

    .line 647
    const-string v3, "t6android"

    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 648
    return-void
.end method

.method private offerApk(Lorg/wiiucoop/bo2android/T6Updater;Lorg/wiiucoop/bo2android/T6Updater$Component;)V
    .locals 4
    .param p1, "updater"    # Lorg/wiiucoop/bo2android/T6Updater;
    .param p2, "apk"    # Lorg/wiiucoop/bo2android/T6Updater$Component;

    .line 193
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v1, Lorg/wiiucoop/bo2android/R$string;->update_apk_title:I

    .line 194
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lorg/wiiucoop/bo2android/R$string;->update_apk_message:I

    const-string v2, "2.1.0-beta"

    iget-object v3, p2, Lorg/wiiucoop/bo2android/T6Updater$Component;->version:Ljava/lang/String;

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    .line 195
    invoke-virtual {p0, v1, v2}, Lorg/wiiucoop/bo2android/MenuActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 196
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lorg/wiiucoop/bo2android/R$string;->update_now:I

    new-instance v2, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda23;

    invoke-direct {v2, p0, p1, p2}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda23;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;Lorg/wiiucoop/bo2android/T6Updater;Lorg/wiiucoop/bo2android/T6Updater$Component;)V

    .line 197
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lorg/wiiucoop/bo2android/R$string;->update_later:I

    new-instance v2, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda24;

    invoke-direct {v2, p0}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda24;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;)V

    .line 201
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 202
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->updateDialog:Landroid/app/AlertDialog;

    .line 203
    return-void
.end method

.method private offerSource(Lorg/wiiucoop/bo2android/T6Updater;Lorg/wiiucoop/bo2android/T6Updater$Component;Ljava/lang/String;)V
    .locals 4
    .param p1, "updater"    # Lorg/wiiucoop/bo2android/T6Updater;
    .param p2, "source"    # Lorg/wiiucoop/bo2android/T6Updater$Component;
    .param p3, "current"    # Ljava/lang/String;

    .line 176
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v1, Lorg/wiiucoop/bo2android/R$string;->update_source_title:I

    .line 177
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lorg/wiiucoop/bo2android/R$string;->update_source_message:I

    .line 179
    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    sget v2, Lorg/wiiucoop/bo2android/R$string;->update_bundled:I

    invoke-virtual {p0, v2}, Lorg/wiiucoop/bo2android/MenuActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_0
    move-object v2, p3

    :goto_0
    iget-object v3, p2, Lorg/wiiucoop/bo2android/T6Updater$Component;->version:Ljava/lang/String;

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    .line 178
    invoke-virtual {p0, v1, v2}, Lorg/wiiucoop/bo2android/MenuActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 180
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lorg/wiiucoop/bo2android/R$string;->update_now:I

    new-instance v2, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda14;

    invoke-direct {v2, p0, p1, p2}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda14;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;Lorg/wiiucoop/bo2android/T6Updater;Lorg/wiiucoop/bo2android/T6Updater$Component;)V

    .line 181
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lorg/wiiucoop/bo2android/R$string;->update_later:I

    new-instance v2, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda15;

    invoke-direct {v2, p0}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda15;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;)V

    .line 188
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 189
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->updateDialog:Landroid/app/AlertDialog;

    .line 190
    return-void
.end method

.method private reasonText(Lorg/wiiucoop/bo2android/T6StartDecision$Decision;)Ljava/lang/String;
    .locals 2
    .param p1, "decision"    # Lorg/wiiucoop/bo2android/T6StartDecision$Decision;

    .line 350
    sget-object v0, Lorg/wiiucoop/bo2android/MenuActivity$1;->$SwitchMap$org$wiiucoop$bo2android$T6StartDecision$Code:[I

    iget-object v1, p1, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;->code:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    invoke-virtual {v1}, Lorg/wiiucoop/bo2android/T6StartDecision$Code;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 354
    iget-boolean v0, p1, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;->canLaunchHost:Z

    if-eqz v0, :cond_0

    const-string v0, ""

    goto :goto_0

    .line 353
    :pswitch_0
    sget v0, Lorg/wiiucoop/bo2android/R$string;->start_no_mode:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 352
    :pswitch_1
    sget v0, Lorg/wiiucoop/bo2android/R$string;->start_folder_unusable:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 351
    :pswitch_2
    sget v0, Lorg/wiiucoop/bo2android/R$string;->start_no_folder:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 354
    :cond_0
    sget v0, Lorg/wiiucoop/bo2android/R$string;->start_unavailable:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private refresh()V
    .locals 2

    .line 485
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    invoke-static {p0, v0}, Lorg/wiiucoop/bo2android/T6FolderReader;->inspect(Landroid/content/Context;Lorg/wiiucoop/bo2android/T6Config;)Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->folder:Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;

    .line 487
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->refreshModeSection()V

    .line 488
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->refreshFolderSection()V

    .line 489
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->refreshStartButton()V

    .line 490
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->refreshRuntimeSection()V

    .line 491
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->refreshLastRun()V

    .line 496
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "menu: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lorg/wiiucoop/bo2android/T6Native;->hostBuildSummary()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "t6android"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 497
    return-void
.end method

.method private refreshFolderSection()V
    .locals 2

    .line 523
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->folderSummary:Landroid/widget/TextView;

    const/16 v1, 0x8

    if-eqz v0, :cond_0

    .line 524
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->folderSummary:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 526
    :cond_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->folderHint:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    .line 527
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->folderHint:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 529
    :cond_1
    return-void
.end method

.method private refreshKennelStatus()V
    .locals 5

    .line 708
    sget v0, Lorg/wiiucoop/bo2android/R$id;->text_kennel_status:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 709
    .local v0, "status":Landroid/widget/TextView;
    if-nez v0, :cond_0

    return-void

    .line 710
    :cond_0
    sget v1, Lorg/wiiucoop/bo2android/R$string;->kennel_home_checking:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 711
    new-instance v1, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda4;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 712
    iget-object v1, p0, Lorg/wiiucoop/bo2android/MenuActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    if-nez v1, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lorg/wiiucoop/bo2android/MenuActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6Config;->gameDirPath:Ljava/lang/String;

    .line 713
    .local v1, "gamePath":Ljava/lang/String;
    :goto_0
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda5;

    invoke-direct {v3, p0, v1, v0}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda5;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;Ljava/lang/String;Landroid/widget/TextView;)V

    const-string v4, "kennel-check"

    invoke-direct {v2, v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 735
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 736
    return-void
.end method

.method private refreshLastRun()V
    .locals 10

    .line 562
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->statusFile:Ljava/io/File;

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6RunStatus;->load(Ljava/io/File;)Lorg/wiiucoop/bo2android/T6RunStatus;

    move-result-object v0

    .line 564
    .local v0, "status":Lorg/wiiucoop/bo2android/T6RunStatus;
    iget-object v1, p0, Lorg/wiiucoop/bo2android/MenuActivity;->lastRun:Landroid/widget/TextView;

    if-eqz v1, :cond_0

    .line 565
    iget-object v1, p0, Lorg/wiiucoop/bo2android/MenuActivity;->lastRun:Landroid/widget/TextView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 568
    :cond_0
    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6RunStatus;->exists()Z

    move-result v1

    const-string v2, "t6android"

    if-nez v1, :cond_1

    .line 569
    const-string v1, "menu: nenhuma execu\u00e7\u00e3o do host registrada ainda"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 570
    return-void

    .line 573
    :cond_1
    iget-object v1, p0, Lorg/wiiucoop/bo2android/MenuActivity;->lastRun:Landroid/widget/TextView;

    if-nez v1, :cond_2

    .line 574
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "menu: \u00faltima execu\u00e7\u00e3o: modo="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6RunStatus;->mode:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " frames="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6RunStatus;->frames()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " motor="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6RunStatus;->engineBoot:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 576
    return-void

    .line 579
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 580
    .local v1, "text":Ljava/lang/StringBuilder;
    sget v2, Lorg/wiiucoop/bo2android/R$string;->last_run_summary:I

    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6RunStatus;->mode:Ljava/lang/String;

    .line 581
    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6Config;->modeLabel(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6RunStatus;->hostLifecycle:Ljava/lang/String;

    .line 582
    invoke-direct {p0, v3}, Lorg/wiiucoop/bo2android/MenuActivity;->state(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6RunStatus;->vulkanSurface:Ljava/lang/String;

    .line 583
    invoke-direct {p0, v3}, Lorg/wiiucoop/bo2android/MenuActivity;->state(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 584
    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6RunStatus;->dxvkDevice:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_3

    sget v3, Lorg/wiiucoop/bo2android/R$string;->state_absent:I

    invoke-virtual {p0, v3}, Lorg/wiiucoop/bo2android/MenuActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    :cond_3
    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6RunStatus;->dxvkDevice:Ljava/lang/String;

    invoke-direct {p0, v3}, Lorg/wiiucoop/bo2android/MenuActivity;->state(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :goto_0
    move-object v7, v3

    .line 585
    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6RunStatus;->frames()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 586
    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6RunStatus;->engineBooted()Z

    move-result v3

    if-eqz v3, :cond_4

    sget v3, Lorg/wiiucoop/bo2android/R$string;->state_ok:I

    invoke-virtual {p0, v3}, Lorg/wiiucoop/bo2android/MenuActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    :cond_4
    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6RunStatus;->engineBoot:Ljava/lang/String;

    invoke-direct {p0, v3}, Lorg/wiiucoop/bo2android/MenuActivity;->state(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :goto_1
    move-object v9, v3

    filled-new-array/range {v4 .. v9}, [Ljava/lang/Object;

    move-result-object v3

    .line 580
    invoke-virtual {p0, v2, v3}, Lorg/wiiucoop/bo2android/MenuActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 588
    iget-object v2, v0, Lorg/wiiucoop/bo2android/T6RunStatus;->engineBootReason:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_5

    .line 589
    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Lorg/wiiucoop/bo2android/R$string;->last_run_reason:I

    iget-object v4, v0, Lorg/wiiucoop/bo2android/T6RunStatus;->engineBootReason:Ljava/lang/String;

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lorg/wiiucoop/bo2android/MenuActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 592
    :cond_5
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MenuActivity;->lastRun:Landroid/widget/TextView;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 593
    return-void
.end method

.method private refreshModeSection()V
    .locals 6

    .line 500
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v0, v0, Lorg/wiiucoop/bo2android/T6Config;->mode:Ljava/lang/String;

    const-string v1, "mp"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 501
    .local v0, "mp":Z
    iget-object v1, p0, Lorg/wiiucoop/bo2android/MenuActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6Config;->mode:Ljava/lang/String;

    const-string v2, "zm"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 503
    .local v1, "zm":Z
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MenuActivity;->cardModeMp:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setSelected(Z)V

    .line 504
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MenuActivity;->cardModeZm:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setSelected(Z)V

    .line 508
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MenuActivity;->badgeModeMp:Landroid/widget/TextView;

    const/4 v3, 0x0

    const/16 v4, 0x8

    if-eqz v2, :cond_1

    .line 509
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MenuActivity;->badgeModeMp:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    move v5, v3

    goto :goto_0

    :cond_0
    move v5, v4

    :goto_0
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 511
    :cond_1
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MenuActivity;->badgeModeZm:Landroid/widget/TextView;

    if-eqz v2, :cond_3

    .line 512
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MenuActivity;->badgeModeZm:Landroid/widget/TextView;

    if-eqz v1, :cond_2

    goto :goto_1

    :cond_2
    move v3, v4

    :goto_1
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 514
    :cond_3
    return-void
.end method

.method private refreshRuntimeSection()V
    .locals 2

    .line 545
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6Config;->hasMode()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v0, v0, Lorg/wiiucoop/bo2android/T6Config;->mode:Ljava/lang/String;

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6Native;->isEngineRuntimeAvailable(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 546
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "menu: motor indispon\u00edvel: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/wiiucoop/bo2android/MenuActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6Config;->mode:Ljava/lang/String;

    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6Native;->engineRuntimeReason(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "t6android"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 549
    :cond_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->runtimeState:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    .line 550
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->runtimeState:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 552
    :cond_1
    return-void
.end method

.method private refreshStartButton()V
    .locals 3

    .line 532
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->decision()Lorg/wiiucoop/bo2android/T6StartDecision$Decision;

    move-result-object v0

    .line 536
    .local v0, "decision":Lorg/wiiucoop/bo2android/T6StartDecision$Decision;
    iget-object v1, p0, Lorg/wiiucoop/bo2android/MenuActivity;->notice:Landroid/widget/TextView;

    iget-boolean v2, v0, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;->canLaunchHost:Z

    if-eqz v2, :cond_0

    const-string v2, ""

    goto :goto_0

    :cond_0
    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->reasonText(Lorg/wiiucoop/bo2android/T6StartDecision$Decision;)Ljava/lang/String;

    move-result-object v2

    :goto_0
    invoke-direct {p0, v1, v2}, Lorg/wiiucoop/bo2android/MenuActivity;->setText(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 537
    return-void
.end method

.method private runUpdate(Lorg/wiiucoop/bo2android/MenuActivity$UpdateJob;)V
    .locals 3
    .param p1, "job"    # Lorg/wiiucoop/bo2android/MenuActivity$UpdateJob;

    .line 208
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v1, Lorg/wiiucoop/bo2android/R$string;->update_downloading:I

    .line 209
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 210
    const-string v1, "\u2026"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 211
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 212
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->updateDialog:Landroid/app/AlertDialog;

    .line 213
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda25;

    invoke-direct {v1, p0, p1}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda25;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;Lorg/wiiucoop/bo2android/MenuActivity$UpdateJob;)V

    const-string v2, "t6-update"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 225
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 226
    return-void
.end method

.method private selectMode(Ljava/lang/String;)V
    .locals 3
    .param p1, "mode"    # Ljava/lang/String;

    .line 335
    :try_start_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->store:Lorg/wiiucoop/bo2android/T6ConfigStore;

    new-instance v1, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda20;

    invoke-direct {v1, p1}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda20;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/wiiucoop/bo2android/T6ConfigStore;->update(Ljava/util/function/Consumer;)Lorg/wiiucoop/bo2android/T6Config;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->config:Lorg/wiiucoop/bo2android/T6Config;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 338
    goto :goto_0

    .line 336
    :catch_0
    move-exception v0

    .line 337
    .local v0, "e":Ljava/io/IOException;
    sget v1, Lorg/wiiucoop/bo2android/R$string;->menu_config_write_failed:I

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/wiiucoop/bo2android/MenuActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/MenuActivity;->toast(Ljava/lang/String;)V

    .line 343
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->refresh()V

    .line 344
    return-void
.end method

.method private setText(Landroid/widget/TextView;Ljava/lang/String;)V
    .locals 0
    .param p1, "view"    # Landroid/widget/TextView;
    .param p2, "text"    # Ljava/lang/String;

    .line 617
    if-eqz p1, :cond_0

    .line 618
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 620
    :cond_0
    return-void
.end method

.method private showIntegrityDialog()V
    .locals 3

    .line 404
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v1, Lorg/wiiucoop/bo2android/R$string;->integrity_title:I

    .line 405
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lorg/wiiucoop/bo2android/R$string;->integrity_message:I

    .line 406
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 407
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lorg/wiiucoop/bo2android/R$string;->integrity_download:I

    new-instance v2, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda21;

    invoke-direct {v2, p0}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda21;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;)V

    .line 408
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lorg/wiiucoop/bo2android/R$string;->integrity_close:I

    new-instance v2, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda22;

    invoke-direct {v2, p0}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda22;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;)V

    .line 415
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 416
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 417
    return-void
.end method

.method private showPendingCheck()V
    .locals 5

    .line 165
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->updateDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->updateDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 166
    :cond_0
    sget-object v0, Lorg/wiiucoop/bo2android/MenuActivity;->pendingCheck:Lorg/wiiucoop/bo2android/T6Updater$Check;

    .line 167
    .local v0, "check":Lorg/wiiucoop/bo2android/T6Updater$Check;
    if-nez v0, :cond_1

    return-void

    .line 168
    :cond_1
    const/4 v1, 0x0

    sput-object v1, Lorg/wiiucoop/bo2android/MenuActivity;->pendingCheck:Lorg/wiiucoop/bo2android/T6Updater$Check;

    .line 169
    new-instance v1, Lorg/wiiucoop/bo2android/T6Updater;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->getCacheDir()Ljava/io/File;

    move-result-object v3

    const/16 v4, 0x19

    invoke-direct {v1, v2, v3, v4}, Lorg/wiiucoop/bo2android/T6Updater;-><init>(Ljava/io/File;Ljava/io/File;I)V

    .line 170
    .local v1, "updater":Lorg/wiiucoop/bo2android/T6Updater;
    iget-object v2, v0, Lorg/wiiucoop/bo2android/T6Updater$Check;->apk:Lorg/wiiucoop/bo2android/T6Updater$Component;

    if-eqz v2, :cond_2

    iget-object v2, v0, Lorg/wiiucoop/bo2android/T6Updater$Check;->apk:Lorg/wiiucoop/bo2android/T6Updater$Component;

    invoke-direct {p0, v1, v2}, Lorg/wiiucoop/bo2android/MenuActivity;->offerApk(Lorg/wiiucoop/bo2android/T6Updater;Lorg/wiiucoop/bo2android/T6Updater$Component;)V

    goto :goto_0

    .line 171
    :cond_2
    iget-object v2, v0, Lorg/wiiucoop/bo2android/T6Updater$Check;->source:Lorg/wiiucoop/bo2android/T6Updater$Component;

    if-eqz v2, :cond_3

    iget-object v2, v0, Lorg/wiiucoop/bo2android/T6Updater$Check;->source:Lorg/wiiucoop/bo2android/T6Updater$Component;

    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6Updater$Check;->sourceCurrent:Ljava/lang/String;

    invoke-direct {p0, v1, v2, v3}, Lorg/wiiucoop/bo2android/MenuActivity;->offerSource(Lorg/wiiucoop/bo2android/T6Updater;Lorg/wiiucoop/bo2android/T6Updater$Component;Ljava/lang/String;)V

    goto :goto_0

    .line 172
    :cond_3
    const/4 v2, 0x0

    iput-boolean v2, p0, Lorg/wiiucoop/bo2android/MenuActivity;->updating:Z

    .line 173
    :goto_0
    return-void

    .line 165
    .end local v0    # "check":Lorg/wiiucoop/bo2android/T6Updater$Check;
    .end local v1    # "updater":Lorg/wiiucoop/bo2android/T6Updater;
    :cond_4
    :goto_1
    return-void
.end method

.method private showProgress(Ljava/lang/String;JJ)V
    .locals 5
    .param p1, "what"    # Ljava/lang/String;
    .param p2, "done"    # J
    .param p4, "total"    # J

    .line 229
    const-wide/16 v0, 0x0

    cmp-long v0, p4, v0

    const-string v1, ": "

    const/16 v2, 0x14

    if-lez v0, :cond_0

    .line 230
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-wide/16 v3, 0x64

    mul-long/2addr v3, p2

    div-long/2addr v3, p4

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "% ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    shr-long v3, p2, v2

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " / "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    shr-long v1, p4, v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " MB)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 231
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    shr-long v1, p2, v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " MB"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    nop

    .line 232
    .local v0, "text":Ljava/lang/String;
    new-instance v1, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda9;

    invoke-direct {v1, p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda9;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/MenuActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 233
    return-void
.end method

.method private startSelectedClient()V
    .locals 5

    .line 359
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->decision()Lorg/wiiucoop/bo2android/T6StartDecision$Decision;

    move-result-object v0

    .line 360
    .local v0, "decision":Lorg/wiiucoop/bo2android/T6StartDecision$Decision;
    iget-object v1, p0, Lorg/wiiucoop/bo2android/MenuActivity;->notice:Landroid/widget/TextView;

    iget-boolean v2, v0, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;->canLaunchHost:Z

    if-eqz v2, :cond_0

    const-string v2, ""

    goto :goto_0

    :cond_0
    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->reasonText(Lorg/wiiucoop/bo2android/T6StartDecision$Decision;)Ljava/lang/String;

    move-result-object v2

    :goto_0
    invoke-direct {p0, v1, v2}, Lorg/wiiucoop/bo2android/MenuActivity;->setText(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 362
    iget-boolean v1, v0, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;->canLaunchHost:Z

    if-nez v1, :cond_3

    .line 363
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "menu: in\u00edcio recusado ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v0, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;->code:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v0, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;->reason:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "t6android"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 368
    iget-object v1, v0, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;->code:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    sget-object v2, Lorg/wiiucoop/bo2android/T6StartDecision$Code;->NO_FOLDER:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    if-eq v1, v2, :cond_2

    iget-object v1, v0, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;->code:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    sget-object v2, Lorg/wiiucoop/bo2android/T6StartDecision$Code;->FOLDER_UNUSABLE:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    if-ne v1, v2, :cond_1

    goto :goto_1

    .line 373
    :cond_1
    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->reasonText(Lorg/wiiucoop/bo2android/T6StartDecision$Decision;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/MenuActivity;->toast(Ljava/lang/String;)V

    goto :goto_2

    .line 370
    :cond_2
    :goto_1
    sget v1, Lorg/wiiucoop/bo2android/R$string;->menu_needs_folder_short:I

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/MenuActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/MenuActivity;->toast(Ljava/lang/String;)V

    .line 371
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lorg/wiiucoop/bo2android/SettingsActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/MenuActivity;->startActivity(Landroid/content/Intent;)V

    .line 375
    :goto_2
    return-void

    .line 378
    :cond_3
    iget-boolean v1, p0, Lorg/wiiucoop/bo2android/MenuActivity;->preparingGuest:Z

    if-eqz v1, :cond_4

    .line 379
    return-void

    .line 381
    :cond_4
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/wiiucoop/bo2android/MenuActivity;->preparingGuest:Z

    .line 387
    iget-object v1, p0, Lorg/wiiucoop/bo2android/MenuActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6Config;->mode:Ljava/lang/String;

    .line 388
    .local v1, "mode":Ljava/lang/String;
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, v1}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda0;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;Ljava/lang/String;)V

    const-string v4, "t6-guest-image"

    invoke-direct {v2, v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 397
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 398
    return-void
.end method

.method private state(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .line 596
    const-string v0, "ok"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 597
    sget v0, Lorg/wiiucoop/bo2android/R$string;->state_ok:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 599
    :cond_0
    const-string v0, "failed"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 600
    sget v0, Lorg/wiiucoop/bo2android/R$string;->state_failed:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 602
    :cond_1
    const-string v0, "absent"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 603
    sget v0, Lorg/wiiucoop/bo2android/R$string;->state_absent:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 605
    :cond_2
    const-string v0, "blocked"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 606
    sget v0, Lorg/wiiucoop/bo2android/R$string;->state_blocked:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 608
    :cond_3
    sget v0, Lorg/wiiucoop/bo2android/R$string;->state_unknown:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private toast(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .line 612
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 613
    return-void
.end method

.method private viewName(I)Ljava/lang/String;
    .locals 2
    .param p1, "id"    # I

    .line 693
    :try_start_0
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 694
    :catch_0
    move-exception v0

    .line 695
    .local v0, "e":Ljava/lang/RuntimeException;
    const-string v1, "desconhecida"

    return-object v1
.end method

.method private writeEngineOptions()V
    .locals 5

    .line 469
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "resolution="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->resolvedResolution(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nshow_fps="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 470
    const-string v1, "show_fps"

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Lorg/wiiucoop/bo2android/T6Ui;->getBool(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "1"

    goto :goto_0

    :cond_0
    const-string v1, "0"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nstick_deadzone="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 474
    const-string v2, "touch_profile"

    const-string v3, "codm"

    invoke-static {p0, v2, v3}, Lorg/wiiucoop/bo2android/T6Ui;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 473
    invoke-static {p0, v2}, Lorg/wiiucoop/bo2android/T6Ui;->loadTouchLayout(Landroid/content/Context;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6TouchLayout;

    move-result-object v2

    .line 474
    invoke-virtual {v2}, Lorg/wiiucoop/bo2android/T6TouchLayout;->stickDeadzone()F

    move-result v2

    .line 473
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const-string v3, "%.2f"

    invoke-static {v1, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 475
    .local v0, "text":Ljava/lang/String;
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->getFilesDir()Ljava/io/File;

    move-result-object v3

    const-string v4, "engine_options.cfg"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 476
    .local v1, "out":Ljava/io/FileOutputStream;
    :try_start_1
    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 477
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 479
    .end local v1    # "out":Ljava/io/FileOutputStream;
    goto :goto_2

    .line 475
    .restart local v1    # "out":Ljava/io/FileOutputStream;
    :catchall_0
    move-exception v2

    :try_start_3
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v3

    :try_start_4
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "text":Ljava/lang/String;
    :goto_1
    throw v2
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 477
    .end local v1    # "out":Ljava/io/FileOutputStream;
    .restart local v0    # "text":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 478
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "menu: engine_options.cfg n\u00e3o gravado: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "t6android"

    invoke-static {v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 480
    .end local v1    # "e":Ljava/io/IOException;
    :goto_2
    return-void
.end method


# virtual methods
.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 1
    .param p1, "base"    # Landroid/content/Context;

    .line 42
    invoke-static {p1}, Lorg/wiiucoop/bo2android/T6Ui;->wrapLocale(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/app/Activity;->attachBaseContext(Landroid/content/Context;)V

    .line 43
    return-void
.end method

.method synthetic lambda$checkForUpdates$1$org-wiiucoop-bo2android-MenuActivity()V
    .locals 1

    .line 152
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->updating:Z

    return-void
.end method

.method synthetic lambda$checkForUpdates$2$org-wiiucoop-bo2android-MenuActivity(Lorg/wiiucoop/bo2android/T6Updater;)V
    .locals 5
    .param p1, "updater"    # Lorg/wiiucoop/bo2android/T6Updater;

    .line 145
    const-string v0, "t6android"

    :try_start_0
    invoke-virtual {p1}, Lorg/wiiucoop/bo2android/T6Updater;->check()Lorg/wiiucoop/bo2android/T6Updater$Check;

    move-result-object v1

    .line 146
    .local v1, "check":Lorg/wiiucoop/bo2android/T6Updater$Check;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "update: apk="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v1, Lorg/wiiucoop/bo2android/T6Updater$Check;->apk:Lorg/wiiucoop/bo2android/T6Updater$Component;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v4, "atual"

    if-nez v3, :cond_0

    move-object v3, v4

    goto :goto_0

    :cond_0
    :try_start_1
    iget-object v3, v1, Lorg/wiiucoop/bo2android/T6Updater$Check;->apk:Lorg/wiiucoop/bo2android/T6Updater$Component;

    iget-object v3, v3, Lorg/wiiucoop/bo2android/T6Updater$Component;->version:Ljava/lang/String;

    :goto_0
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " source="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 147
    iget-object v3, v1, Lorg/wiiucoop/bo2android/T6Updater$Check;->source:Lorg/wiiucoop/bo2android/T6Updater$Component;

    if-nez v3, :cond_1

    goto :goto_1

    :cond_1
    iget-object v3, v1, Lorg/wiiucoop/bo2android/T6Updater$Check;->source:Lorg/wiiucoop/bo2android/T6Updater$Component;

    iget-object v4, v3, Lorg/wiiucoop/bo2android/T6Updater$Component;->version:Ljava/lang/String;

    :goto_1
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 146
    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    sput-object v1, Lorg/wiiucoop/bo2android/MenuActivity;->pendingCheck:Lorg/wiiucoop/bo2android/T6Updater$Check;

    .line 149
    new-instance v2, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda16;

    invoke-direct {v2, p0}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda16;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;)V

    invoke-virtual {p0, v2}, Lorg/wiiucoop/bo2android/MenuActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 153
    .end local v1    # "check":Lorg/wiiucoop/bo2android/T6Updater$Check;
    goto :goto_2

    .line 150
    :catch_0
    move-exception v1

    .line 151
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "update: verifica\u00e7\u00e3o falhou: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    new-instance v0, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda17;

    invoke-direct {v0, p0}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda17;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;)V

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 154
    .end local v1    # "e":Ljava/io/IOException;
    :goto_2
    return-void
.end method

.method synthetic lambda$offerApk$7$org-wiiucoop-bo2android-MenuActivity(Lorg/wiiucoop/bo2android/T6Updater;Lorg/wiiucoop/bo2android/T6Updater$Component;)V
    .locals 1
    .param p1, "updater"    # Lorg/wiiucoop/bo2android/T6Updater;
    .param p2, "apk"    # Lorg/wiiucoop/bo2android/T6Updater$Component;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 198
    new-instance v0, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda1;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;)V

    invoke-virtual {p1, p2, v0}, Lorg/wiiucoop/bo2android/T6Updater;->downloadApk(Lorg/wiiucoop/bo2android/T6Updater$Component;Lorg/wiiucoop/bo2android/T6Updater$Progress;)Ljava/io/File;

    .line 199
    new-instance v0, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda8;

    invoke-direct {v0, p0}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda8;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;)V

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 200
    return-void
.end method

.method synthetic lambda$offerApk$8$org-wiiucoop-bo2android-MenuActivity(Lorg/wiiucoop/bo2android/T6Updater;Lorg/wiiucoop/bo2android/T6Updater$Component;Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "updater"    # Lorg/wiiucoop/bo2android/T6Updater;
    .param p2, "apk"    # Lorg/wiiucoop/bo2android/T6Updater$Component;
    .param p3, "d"    # Landroid/content/DialogInterface;
    .param p4, "w"    # I

    .line 197
    new-instance v0, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda12;

    invoke-direct {v0, p0, p1, p2}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda12;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;Lorg/wiiucoop/bo2android/T6Updater;Lorg/wiiucoop/bo2android/T6Updater$Component;)V

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->runUpdate(Lorg/wiiucoop/bo2android/MenuActivity$UpdateJob;)V

    return-void
.end method

.method synthetic lambda$offerApk$9$org-wiiucoop-bo2android-MenuActivity(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "d"    # Landroid/content/DialogInterface;
    .param p2, "w"    # I

    .line 201
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->updating:Z

    return-void
.end method

.method synthetic lambda$offerSource$3$org-wiiucoop-bo2android-MenuActivity(Lorg/wiiucoop/bo2android/T6Updater$Component;)V
    .locals 2
    .param p1, "source"    # Lorg/wiiucoop/bo2android/T6Updater$Component;

    .line 184
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->updating:Z

    .line 185
    sget v0, Lorg/wiiucoop/bo2android/R$string;->update_source_done:I

    iget-object v1, p1, Lorg/wiiucoop/bo2android/T6Updater$Component;->version:Ljava/lang/String;

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/wiiucoop/bo2android/MenuActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->toast(Ljava/lang/String;)V

    .line 186
    return-void
.end method

.method synthetic lambda$offerSource$4$org-wiiucoop-bo2android-MenuActivity(Lorg/wiiucoop/bo2android/T6Updater;Lorg/wiiucoop/bo2android/T6Updater$Component;)V
    .locals 1
    .param p1, "updater"    # Lorg/wiiucoop/bo2android/T6Updater;
    .param p2, "source"    # Lorg/wiiucoop/bo2android/T6Updater$Component;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 182
    new-instance v0, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda1;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;)V

    invoke-virtual {p1, p2, v0}, Lorg/wiiucoop/bo2android/T6Updater;->installSource(Lorg/wiiucoop/bo2android/T6Updater$Component;Lorg/wiiucoop/bo2android/T6Updater$Progress;)V

    .line 183
    new-instance v0, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0, p2}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda2;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;Lorg/wiiucoop/bo2android/T6Updater$Component;)V

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 187
    return-void
.end method

.method synthetic lambda$offerSource$5$org-wiiucoop-bo2android-MenuActivity(Lorg/wiiucoop/bo2android/T6Updater;Lorg/wiiucoop/bo2android/T6Updater$Component;Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "updater"    # Lorg/wiiucoop/bo2android/T6Updater;
    .param p2, "source"    # Lorg/wiiucoop/bo2android/T6Updater$Component;
    .param p3, "d"    # Landroid/content/DialogInterface;
    .param p4, "w"    # I

    .line 181
    new-instance v0, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda13;

    invoke-direct {v0, p0, p1, p2}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda13;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;Lorg/wiiucoop/bo2android/T6Updater;Lorg/wiiucoop/bo2android/T6Updater$Component;)V

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->runUpdate(Lorg/wiiucoop/bo2android/MenuActivity$UpdateJob;)V

    return-void
.end method

.method synthetic lambda$offerSource$6$org-wiiucoop-bo2android-MenuActivity(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "d"    # Landroid/content/DialogInterface;
    .param p2, "w"    # I

    .line 188
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->updating:Z

    return-void
.end method

.method synthetic lambda$onCreate$0$org-wiiucoop-bo2android-MenuActivity()V
    .locals 1

    .line 125
    const-string v0, "layout pronto"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->logMenuGeometry(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$onResume$14$org-wiiucoop-bo2android-MenuActivity()V
    .locals 1

    .line 292
    const-string v0, "layout pronto"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->logMenuGeometry(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$refreshKennelStatus$20$org-wiiucoop-bo2android-MenuActivity(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 711
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/wiiucoop/bo2android/SettingsActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method synthetic lambda$refreshKennelStatus$22$org-wiiucoop-bo2android-MenuActivity(Ljava/lang/String;Landroid/widget/TextView;)V
    .locals 8
    .param p1, "gamePath"    # Ljava/lang/String;
    .param p2, "status"    # Landroid/widget/TextView;

    .line 714
    const/4 v0, 0x0

    .line 716
    .local v0, "ok":Z
    const-string v1, "kennel: home check: "

    const-string v2, "t6android"

    if-eqz p1, :cond_1

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 717
    new-instance v3, Ljava/io/File;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->getFilesDir()Ljava/io/File;

    move-result-object v4

    const-string v5, "kennel.json"

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 718
    .local v3, "saved":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v4

    if-nez v4, :cond_0

    invoke-static {}, Lorg/wiiucoop/bo2android/T6Updater;->configured()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 719
    new-instance v4, Lorg/wiiucoop/bo2android/T6Updater;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->getFilesDir()Ljava/io/File;

    move-result-object v5

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->getCacheDir()Ljava/io/File;

    move-result-object v6

    const/16 v7, 0x19

    invoke-direct {v4, v5, v6, v7}, Lorg/wiiucoop/bo2android/T6Updater;-><init>(Ljava/io/File;Ljava/io/File;I)V

    invoke-virtual {v4}, Lorg/wiiucoop/bo2android/T6Updater;->kennelManifestText()Ljava/lang/String;

    move-result-object v4

    .line 720
    .local v4, "text":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object v5

    sget-object v6, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v4, v6}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v6

    const/4 v7, 0x0

    new-array v7, v7, [Ljava/nio/file/OpenOption;

    invoke-static {v5, v6, v7}, Ljava/nio/file/Files;->write(Ljava/nio/file/Path;[B[Ljava/nio/file/OpenOption;)Ljava/nio/file/Path;

    .line 722
    .end local v4    # "text":Ljava/lang/String;
    :cond_0
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 723
    new-instance v4, Ljava/lang/String;

    .line 724
    invoke-virtual {v3}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object v5

    .line 723
    invoke-static {v5}, Ljava/nio/file/Files;->readAllBytes(Ljava/nio/file/Path;)[B

    move-result-object v5

    sget-object v6, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v4, v5, v6}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-static {v4}, Lorg/wiiucoop/bo2android/T6KennelPackage;->parse(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;

    move-result-object v4

    .line 725
    .local v4, "m":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const-string v6, "t6_ui"

    .line 726
    const/4 v7, 0x4

    invoke-virtual {p0, v6, v7}, Lorg/wiiucoop/bo2android/MenuActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 725
    invoke-static {v5, v4, v6}, Lorg/wiiucoop/bo2android/T6KennelPackage;->verify(Ljava/io/File;Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;Landroid/content/SharedPreferences;)Z

    move-result v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v5

    goto :goto_0

    .line 729
    .end local v3    # "saved":Ljava/io/File;
    .end local v4    # "m":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    :catch_0
    move-exception v3

    .line 730
    .local v3, "e":Ljava/lang/Exception;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 731
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_1
    :goto_0
    nop

    .line 732
    :goto_1
    move v3, v0

    .line 733
    .local v3, "installed":Z
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-eqz v3, :cond_2

    const-string v4, "installed"

    goto :goto_2

    :cond_2
    const-string v4, "not installed"

    :goto_2
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 734
    new-instance v1, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda18;

    invoke-direct {v1, p2, v3}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda18;-><init>(Landroid/widget/TextView;Z)V

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/MenuActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 735
    return-void
.end method

.method synthetic lambda$runUpdate$10$org-wiiucoop-bo2android-MenuActivity(Ljava/io/IOException;)V
    .locals 2
    .param p1, "e"    # Ljava/io/IOException;

    .line 219
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->updating:Z

    .line 220
    sget v0, Lorg/wiiucoop/bo2android/R$string;->update_failed:I

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/wiiucoop/bo2android/MenuActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->toast(Ljava/lang/String;)V

    .line 221
    return-void
.end method

.method synthetic lambda$runUpdate$11$org-wiiucoop-bo2android-MenuActivity()V
    .locals 1

    .line 223
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->updateDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->updateDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    :cond_0
    return-void
.end method

.method synthetic lambda$runUpdate$12$org-wiiucoop-bo2android-MenuActivity(Lorg/wiiucoop/bo2android/MenuActivity$UpdateJob;)V
    .locals 4
    .param p1, "job"    # Lorg/wiiucoop/bo2android/MenuActivity$UpdateJob;

    .line 215
    :try_start_0
    invoke-interface {p1}, Lorg/wiiucoop/bo2android/MenuActivity$UpdateJob;->run()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 223
    new-instance v0, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda6;

    invoke-direct {v0, p0}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda6;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;)V

    :goto_0
    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 224
    goto :goto_1

    .line 223
    :catchall_0
    move-exception v0

    goto :goto_2

    .line 216
    :catch_0
    move-exception v0

    .line 217
    .local v0, "e":Ljava/io/IOException;
    :try_start_1
    const-string v1, "t6android"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "update: falhou: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    new-instance v1, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda7;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;Ljava/io/IOException;)V

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/MenuActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 223
    .end local v0    # "e":Ljava/io/IOException;
    new-instance v0, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda6;

    invoke-direct {v0, p0}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda6;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;)V

    goto :goto_0

    .line 225
    :goto_1
    return-void

    .line 223
    :goto_2
    new-instance v1, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda6;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;)V

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/MenuActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 224
    throw v0
.end method

.method synthetic lambda$showIntegrityDialog$18$org-wiiucoop-bo2android-MenuActivity(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "d"    # Landroid/content/DialogInterface;
    .param p2, "w"    # I

    .line 410
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    const-string v2, "https://github.com/SoldadoGhost/T6Requiem-APK/releases"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 412
    goto :goto_0

    .line 411
    :catch_0
    move-exception v0

    .line 413
    :goto_0
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->finishAffinity()V

    .line 414
    return-void
.end method

.method synthetic lambda$showIntegrityDialog$19$org-wiiucoop-bo2android-MenuActivity(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "d"    # Landroid/content/DialogInterface;
    .param p2, "w"    # I

    .line 415
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->finishAffinity()V

    return-void
.end method

.method synthetic lambda$showProgress$13$org-wiiucoop-bo2android-MenuActivity(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .line 232
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->updateDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->updateDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$startSelectedClient$16$org-wiiucoop-bo2android-MenuActivity(Ljava/lang/String;)V
    .locals 1
    .param p1, "mode"    # Ljava/lang/String;

    .line 392
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->preparingGuest:Z

    .line 393
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 394
    invoke-direct {p0, p1}, Lorg/wiiucoop/bo2android/MenuActivity;->launchHost(Ljava/lang/String;)V

    .line 396
    :cond_0
    return-void
.end method

.method synthetic lambda$startSelectedClient$17$org-wiiucoop-bo2android-MenuActivity(Ljava/lang/String;)V
    .locals 3
    .param p1, "mode"    # Ljava/lang/String;

    .line 389
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lorg/wiiucoop/bo2android/T6GuestImage;->install(Landroid/content/res/AssetManager;Ljava/io/File;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6GuestImage$Result;

    move-result-object v0

    .line 390
    .local v0, "image":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "menu: imagem guest "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, v0, Lorg/wiiucoop/bo2android/T6GuestImage$Result;->ready:Z

    if-eqz v2, :cond_0

    const-string v2, "pronta"

    goto :goto_0

    :cond_0
    const-string v2, "n\u00e3o instalada"

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v0, Lorg/wiiucoop/bo2android/T6GuestImage$Result;->detail:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "t6android"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 391
    new-instance v1, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda10;

    invoke-direct {v1, p0, p1}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda10;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/MenuActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 397
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .line 306
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 308
    .local v0, "id":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "menu: toque em "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->viewName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " (id "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "t6android"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 310
    iget-boolean v1, p0, Lorg/wiiucoop/bo2android/MenuActivity;->updating:Z

    if-eqz v1, :cond_0

    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_settings:I

    if-eq v0, v1, :cond_0

    .line 311
    sget v1, Lorg/wiiucoop/bo2android/R$string;->update_wait:I

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/MenuActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/MenuActivity;->toast(Ljava/lang/String;)V

    .line 312
    return-void

    .line 315
    :cond_0
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_settings:I

    if-ne v0, v1, :cond_1

    .line 316
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lorg/wiiucoop/bo2android/SettingsActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/MenuActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 317
    :cond_1
    sget v1, Lorg/wiiucoop/bo2android/R$id;->card_mode_mp:I

    if-ne v0, v1, :cond_2

    .line 320
    const-string v1, "mp"

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/MenuActivity;->selectMode(Ljava/lang/String;)V

    .line 321
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->startSelectedClient()V

    goto :goto_0

    .line 322
    :cond_2
    sget v1, Lorg/wiiucoop/bo2android/R$id;->card_mode_zm:I

    if-ne v0, v1, :cond_3

    .line 323
    const-string v1, "zm"

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/MenuActivity;->selectMode(Ljava/lang/String;)V

    .line 324
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->startSelectedClient()V

    .line 326
    :cond_3
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 77
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->applyTheme(Landroid/app/Activity;)V

    .line 78
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->theme(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->createdTheme:Ljava/lang/String;

    .line 79
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 80
    sget v0, Lorg/wiiucoop/bo2android/R$layout;->activity_menu:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->setContentView(I)V

    .line 82
    sget v0, Lorg/wiiucoop/bo2android/R$id;->text_build_tag:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string v1, "2.1.0-beta"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->applyImmersive(Landroid/app/Activity;)V

    .line 87
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Integrity;->problem(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->integrityProblem:Ljava/lang/String;

    .line 88
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->integrityProblem:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 89
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "menu: integrity check FAILED: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/wiiucoop/bo2android/MenuActivity;->integrityProblem:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "t6android"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->showIntegrityDialog()V

    .line 93
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "t6_config.ini"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->configFile:Ljava/io/File;

    .line 94
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "t6_status.ini"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->statusFile:Ljava/io/File;

    .line 95
    new-instance v0, Lorg/wiiucoop/bo2android/T6ConfigStore;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/MenuActivity;->configFile:Ljava/io/File;

    invoke-direct {v0, v1}, Lorg/wiiucoop/bo2android/T6ConfigStore;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->store:Lorg/wiiucoop/bo2android/T6ConfigStore;

    .line 96
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->store:Lorg/wiiucoop/bo2android/T6ConfigStore;

    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6ConfigStore;->load()Lorg/wiiucoop/bo2android/T6Config;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    .line 101
    sget v0, Lorg/wiiucoop/bo2android/R$id;->card_mode_mp:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->cardModeMp:Landroid/view/View;

    .line 102
    sget v0, Lorg/wiiucoop/bo2android/R$id;->card_mode_zm:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->cardModeZm:Landroid/view/View;

    .line 104
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->cardModeMp:Landroid/view/View;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 105
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->cardModeZm:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 106
    sget v0, Lorg/wiiucoop/bo2android/R$id;->badge_mode_mp:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->badgeModeMp:Landroid/widget/TextView;

    .line 107
    sget v0, Lorg/wiiucoop/bo2android/R$id;->badge_mode_zm:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->badgeModeZm:Landroid/widget/TextView;

    .line 108
    sget v0, Lorg/wiiucoop/bo2android/R$id;->text_notice:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->notice:Landroid/widget/TextView;

    .line 110
    sget v0, Lorg/wiiucoop/bo2android/R$id;->button_settings:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 111
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->cardModeMp:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 112
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->cardModeZm:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 115
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-boolean v0, v0, Lorg/wiiucoop/bo2android/T6Config;->versionMismatch:Z

    if-eqz v0, :cond_1

    .line 116
    sget v0, Lorg/wiiucoop/bo2android/R$string;->menu_config_version_ignored:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->toast(Ljava/lang/String;)V

    .line 119
    :cond_1
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->refresh()V

    .line 124
    const-string v0, "aberto"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->logMenuState(Ljava/lang/String;)V

    .line 125
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->cardModeMp:Landroid/view/View;

    new-instance v1, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda11;

    invoke-direct {v1, p0}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda11;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 127
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->checkForUpdates()V

    .line 128
    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 272
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 274
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->createdTheme:Ljava/lang/String;

    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->theme(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 275
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->recreate()V

    .line 276
    return-void

    .line 279
    :cond_0
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->applyImmersive(Landroid/app/Activity;)V

    .line 285
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->store:Lorg/wiiucoop/bo2android/T6ConfigStore;

    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6ConfigStore;->load()Lorg/wiiucoop/bo2android/T6Config;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    .line 286
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->refreshKennelStatus()V

    .line 289
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->refresh()V

    .line 291
    const-string v0, "retomado"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/MenuActivity;->logMenuState(Ljava/lang/String;)V

    .line 292
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->cardModeMp:Landroid/view/View;

    new-instance v1, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda3;-><init>(Lorg/wiiucoop/bo2android/MenuActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 295
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->showPendingCheck()V

    .line 298
    iget-boolean v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->recheckOnResume:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->updating:Z

    if-nez v0, :cond_1

    .line 299
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/wiiucoop/bo2android/MenuActivity;->recheckOnResume:Z

    .line 300
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MenuActivity;->checkForUpdates()V

    .line 302
    :cond_1
    return-void
.end method
