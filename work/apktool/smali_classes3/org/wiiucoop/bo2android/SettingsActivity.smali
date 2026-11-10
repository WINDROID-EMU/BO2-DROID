.class public final Lorg/wiiucoop/bo2android/SettingsActivity;
.super Landroid/app/Activity;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field static final LANGUAGE_NAMES:[I

.field static final LANGUAGE_TAGS:[Ljava/lang/String;

.field private static final REQUEST_PICK_TREE:I = 0x3e9

.field private static final REQUEST_READ_STORAGE:I = 0x3ea

.field private static final TAG:Ljava/lang/String; = "t6android"

.field static final THEMES:[Ljava/lang/String;

.field static final THEME_NAMES:[I

.field private static final TOUCH_MODES:[Ljava/lang/String;

.field private static final TOUCH_MODE_NAMES:[I

.field private static final TU_FLAGS:[Ljava/lang/String;


# instance fields
.field private config:Lorg/wiiucoop/bo2android/T6Config;

.field private final controllerListener:Landroid/hardware/input/InputManager$InputDeviceListener;

.field private deviceInfo:Lorg/wiiucoop/bo2android/T6DeviceInfo$Info;

.field private folderDetail:Landroid/widget/TextView;

.field private folderValue:Landroid/widget/TextView;

.field private footer:Landroid/widget/TextView;

.field private grantButton:Landroid/widget/Button;

.field private inputManager:Landroid/hardware/input/InputManager;

.field private volatile kennelBusy:Z

.field private nameDetail:Landroid/widget/TextView;

.field private nameValue:Landroid/widget/TextView;

.field private pickButton:Landroid/widget/Button;

.field private playerName:Ljava/lang/String;

.field private store:Lorg/wiiucoop/bo2android/T6ConfigStore;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 191
    const/4 v0, 0x6

    new-array v1, v0, [Ljava/lang/String;

    const-string v2, "system"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "pt-BR"

    const/4 v4, 0x1

    aput-object v2, v1, v4

    const-string v2, "en-US"

    const/4 v5, 0x2

    aput-object v2, v1, v5

    const-string v2, "es"

    const/4 v6, 0x3

    aput-object v2, v1, v6

    const-string v2, "fr"

    const/4 v7, 0x4

    aput-object v2, v1, v7

    const-string v2, "id"

    const/4 v8, 0x5

    aput-object v2, v1, v8

    sput-object v1, Lorg/wiiucoop/bo2android/SettingsActivity;->LANGUAGE_TAGS:[Ljava/lang/String;

    .line 192
    sget v9, Lorg/wiiucoop/bo2android/R$string;->language_system:I

    sget v10, Lorg/wiiucoop/bo2android/R$string;->language_pt_br:I

    sget v11, Lorg/wiiucoop/bo2android/R$string;->language_en_us:I

    sget v12, Lorg/wiiucoop/bo2android/R$string;->language_es:I

    sget v13, Lorg/wiiucoop/bo2android/R$string;->language_fr:I

    sget v14, Lorg/wiiucoop/bo2android/R$string;->language_id:I

    filled-new-array/range {v9 .. v14}, [I

    move-result-object v1

    sput-object v1, Lorg/wiiucoop/bo2android/SettingsActivity;->LANGUAGE_NAMES:[I

    .line 194
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "orange"

    aput-object v2, v1, v3

    const-string v2, "blue"

    aput-object v2, v1, v4

    const-string v2, "red"

    aput-object v2, v1, v5

    sput-object v1, Lorg/wiiucoop/bo2android/SettingsActivity;->THEMES:[Ljava/lang/String;

    .line 195
    sget v1, Lorg/wiiucoop/bo2android/R$string;->theme_orange:I

    sget v2, Lorg/wiiucoop/bo2android/R$string;->theme_blue:I

    sget v9, Lorg/wiiucoop/bo2android/R$string;->theme_red:I

    filled-new-array {v1, v2, v9}, [I

    move-result-object v1

    sput-object v1, Lorg/wiiucoop/bo2android/SettingsActivity;->THEME_NAMES:[I

    .line 196
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "auto"

    aput-object v2, v1, v3

    const-string v2, "on"

    aput-object v2, v1, v4

    const-string v2, "off"

    aput-object v2, v1, v5

    sput-object v1, Lorg/wiiucoop/bo2android/SettingsActivity;->TOUCH_MODES:[Ljava/lang/String;

    .line 197
    sget v1, Lorg/wiiucoop/bo2android/R$string;->touch_mode_auto:I

    sget v2, Lorg/wiiucoop/bo2android/R$string;->touch_mode_on:I

    sget v9, Lorg/wiiucoop/bo2android/R$string;->touch_mode_off:I

    filled-new-array {v1, v2, v9}, [I

    move-result-object v1

    sput-object v1, Lorg/wiiucoop/bo2android/SettingsActivity;->TOUCH_MODE_NAMES:[I

    .line 232
    const/16 v1, 0x9

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "noconform"

    aput-object v2, v1, v3

    const-string v2, "sysmem"

    aput-object v2, v1, v4

    const-string v2, "gmem"

    aput-object v2, v1, v5

    const-string v2, "nolrz"

    aput-object v2, v1, v6

    const-string v2, "noubwc"

    aput-object v2, v1, v7

    const-string v2, "flushall"

    aput-object v2, v1, v8

    const-string v2, "syncdraw"

    aput-object v2, v1, v0

    const/4 v0, 0x7

    const-string v2, "forcebin"

    aput-object v2, v1, v0

    const/16 v0, 0x8

    const-string v2, "nobin"

    aput-object v2, v1, v0

    sput-object v1, Lorg/wiiucoop/bo2android/SettingsActivity;->TU_FLAGS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 45
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 69
    const-string v0, ""

    iput-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->playerName:Ljava/lang/String;

    .line 133
    new-instance v0, Lorg/wiiucoop/bo2android/SettingsActivity$1;

    invoke-direct {v0, p0}, Lorg/wiiucoop/bo2android/SettingsActivity$1;-><init>(Lorg/wiiucoop/bo2android/SettingsActivity;)V

    iput-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->controllerListener:Landroid/hardware/input/InputManager$InputDeviceListener;

    return-void
.end method

.method static synthetic access$000(Lorg/wiiucoop/bo2android/SettingsActivity;)V
    .locals 0
    .param p0, "x0"    # Lorg/wiiucoop/bo2android/SettingsActivity;

    .line 45
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->refreshOptionsSection()V

    return-void
.end method

.method private applyFolder(Landroid/net/Uri;)V
    .locals 11
    .param p1, "treeUri"    # Landroid/net/Uri;

    .line 653
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->store:Lorg/wiiucoop/bo2android/T6ConfigStore;

    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6ConfigStore;->load()Lorg/wiiucoop/bo2android/T6Config;

    move-result-object v0

    .line 654
    .local v0, "probe":Lorg/wiiucoop/bo2android/T6Config;
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/wiiucoop/bo2android/T6Config;->gameDirUri:Ljava/lang/String;

    .line 655
    const-string v1, ""

    iput-object v1, v0, Lorg/wiiucoop/bo2android/T6Config;->gameDirPath:Ljava/lang/String;

    .line 657
    invoke-static {p0, v0}, Lorg/wiiucoop/bo2android/T6FolderReader;->inspect(Landroid/content/Context;Lorg/wiiucoop/bo2android/T6Config;)Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;

    move-result-object v2

    .line 659
    .local v2, "snapshot":Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;
    iget-boolean v3, v2, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;->rawReadable:Z

    if-eqz v3, :cond_0

    iget-object v1, v2, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;->rawPath:Ljava/lang/String;

    :cond_0
    move-object v6, v1

    .line 662
    .local v6, "path":Ljava/lang/String;
    iget-boolean v1, v2, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;->rawReadable:Z

    if-nez v1, :cond_1

    iget-object v1, v2, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;->result:Lorg/wiiucoop/bo2android/T6GameData$Result;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6GameData$Result;->level:Lorg/wiiucoop/bo2android/T6GameData$Level;

    sget-object v3, Lorg/wiiucoop/bo2android/T6GameData$Level;->FAIL:Lorg/wiiucoop/bo2android/T6GameData$Level;

    if-eq v1, v3, :cond_1

    .line 663
    const-string v1, "WARN"

    move-object v7, v1

    goto :goto_0

    .line 664
    :cond_1
    iget-object v1, v2, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;->result:Lorg/wiiucoop/bo2android/T6GameData$Result;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6GameData$Result;->level:Lorg/wiiucoop/bo2android/T6GameData$Level;

    invoke-virtual {v1}, Lorg/wiiucoop/bo2android/T6GameData$Level;->name()Ljava/lang/String;

    move-result-object v1

    move-object v7, v1

    :goto_0
    nop

    .line 665
    .local v7, "state":Ljava/lang/String;
    invoke-static {p1}, Lorg/wiiucoop/bo2android/T6TreeAccess;->displayNameFor(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    .line 666
    .local v1, "display":Ljava/lang/String;
    invoke-static {p0, v2}, Lorg/wiiucoop/bo2android/T6FolderReader;->describe(Landroid/content/Context;Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;)Ljava/lang/String;

    move-result-object v9

    .line 668
    .local v9, "detail":Ljava/lang/String;
    new-instance v10, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda10;

    move-object v3, v10

    move-object v4, p1

    move-object v5, v1

    move-object v8, v9

    invoke-direct/range {v3 .. v8}, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda10;-><init>(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v10}, Lorg/wiiucoop/bo2android/SettingsActivity;->write(Ljava/util/function/Consumer;)V

    .line 678
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->playerName:Ljava/lang/String;

    invoke-static {p0, v3, v1, v4}, Lorg/wiiucoop/bo2android/T6SafStore;->syncInto(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 679
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->readStoredName()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->playerName:Ljava/lang/String;

    .line 683
    iget-boolean v3, v2, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;->rawReadable:Z

    if-nez v3, :cond_2

    .line 684
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->requestLegacyReadPermission()V

    .line 687
    :cond_2
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->refresh()V

    .line 688
    return-void
.end method

.method private bindSprintThreshold()V
    .locals 5

    .line 152
    sget v0, Lorg/wiiucoop/bo2android/R$id;->seek_touch_sprint_threshold:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    .line 153
    .local v0, "seek":Landroid/widget/SeekBar;
    sget v1, Lorg/wiiucoop/bo2android/R$id;->text_touch_sprint_threshold:I

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 156
    .local v1, "label":Landroid/widget/TextView;
    :try_start_0
    const-string v2, "touch_sprint_threshold"

    const-string v3, "85"

    invoke-static {p0, v2, v3}, Lorg/wiiucoop/bo2android/T6Ui;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 159
    .local v2, "value":I
    goto :goto_0

    .line 157
    .end local v2    # "value":I
    :catch_0
    move-exception v2

    .line 158
    .local v2, "e":Ljava/lang/NumberFormatException;
    const/16 v3, 0x55

    move v2, v3

    .line 160
    .local v2, "value":I
    :goto_0
    const/16 v3, 0x64

    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v3

    const/16 v4, 0x32

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 161
    add-int/lit8 v3, v2, -0x32

    invoke-virtual {v0, v3}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 162
    sget v3, Lorg/wiiucoop/bo2android/R$string;->settings_touch_sprint_threshold_value:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 163
    new-instance v3, Lorg/wiiucoop/bo2android/SettingsActivity$2;

    invoke-direct {v3, p0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity$2;-><init>(Lorg/wiiucoop/bo2android/SettingsActivity;Landroid/widget/TextView;)V

    invoke-virtual {v0, v3}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 180
    return-void
.end method

.method private bindSwitch(ILjava/lang/String;)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "key"    # Ljava/lang/String;

    .line 147
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->bindSwitch(ILjava/lang/String;Z)V

    .line 148
    return-void
.end method

.method private bindSwitch(ILjava/lang/String;Z)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "fallback"    # Z

    .line 183
    invoke-virtual {p0, p1}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    .line 184
    .local v0, "toggle":Landroid/widget/Switch;
    invoke-static {p0, p2, p3}, Lorg/wiiucoop/bo2android/T6Ui;->getBool(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 185
    new-instance v1, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda12;

    invoke-direct {v1, p0, p2}, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda12;-><init>(Lorg/wiiucoop/bo2android/SettingsActivity;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 189
    return-void
.end method

.method private chooseDxvk()V
    .locals 18

    .line 565
    move-object/from16 v0, p0

    new-instance v1, Lorg/wiiucoop/bo2android/T6DxvkStore;

    invoke-virtual/range {p0 .. p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/wiiucoop/bo2android/T6DxvkStore;-><init>(Ljava/io/File;)V

    invoke-static/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6DxvkStore;->apkStamp(Landroid/content/Context;)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lorg/wiiucoop/bo2android/T6DxvkStore;->withApkStamp(J)Lorg/wiiucoop/bo2android/T6DxvkStore;

    move-result-object v1

    .line 566
    .local v1, "store":Lorg/wiiucoop/bo2android/T6DxvkStore;
    invoke-virtual/range {p0 .. p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/wiiucoop/bo2android/T6DxvkStore;->ensureBundled(Landroid/content/res/AssetManager;)Ljava/lang/String;

    move-result-object v2

    .line 567
    .local v2, "bundledProblem":Ljava/lang/String;
    const-string v3, "t6android"

    if-eqz v2, :cond_0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "settings: dxvk dxvk-1.9.2-legacy: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 568
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/wiiucoop/bo2android/T6DxvkStore;->ensureUpstream3(Landroid/content/res/AssetManager;)Ljava/lang/String;

    move-result-object v4

    .line 569
    .local v4, "upstreamProblem":Ljava/lang/String;
    if-eqz v4, :cond_1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "settings: dxvk dxvk-3.1.1: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 570
    :cond_1
    invoke-virtual {v1}, Lorg/wiiucoop/bo2android/T6DxvkStore;->list()Ljava/util/List;

    move-result-object v5

    .line 571
    .local v5, "entries":Ljava/util/List;, "Ljava/util/List<Lorg/wiiucoop/bo2android/T6DxvkStore$Entry;>;"
    invoke-virtual {v1}, Lorg/wiiucoop/bo2android/T6DxvkStore;->selected()Ljava/lang/String;

    move-result-object v6

    .line 572
    .local v6, "current":Ljava/lang/String;
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 573
    .local v7, "idList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 574
    .local v8, "labelList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v9, "builtin"

    invoke-interface {v7, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 575
    sget v10, Lorg/wiiucoop/bo2android/R$string;->settings_dxvk_builtin:I

    const-string v11, "2.6.0"

    filled-new-array {v11}, [Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v0, v10, v11}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v8, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 576
    if-nez v2, :cond_2

    .line 577
    const-string v10, "dxvk-1.9.2-legacy"

    invoke-interface {v7, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 578
    sget v10, Lorg/wiiucoop/bo2android/R$string;->settings_dxvk_bundled:I

    const-string v11, "1.9.2"

    filled-new-array {v11}, [Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v0, v10, v11}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v8, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 580
    :cond_2
    if-nez v4, :cond_3

    .line 581
    const-string v10, "dxvk-3.1.1"

    invoke-interface {v7, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 582
    sget v10, Lorg/wiiucoop/bo2android/R$string;->settings_dxvk_upstream3:I

    const-string v11, "3.1.1"

    filled-new-array {v11}, [Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v0, v10, v11}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v8, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 584
    :cond_3
    const/4 v10, 0x0

    new-array v11, v10, [Ljava/lang/String;

    invoke-interface {v7, v11}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [Ljava/lang/String;

    .line 585
    .local v11, "ids":[Ljava/lang/String;
    new-array v10, v10, [Ljava/lang/String;

    invoke-interface {v8, v10}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [Ljava/lang/String;

    .line 586
    .local v10, "labels":[Ljava/lang/String;
    invoke-virtual {v1}, Lorg/wiiucoop/bo2android/T6DxvkStore;->lastStatus()Ljava/util/Map;

    move-result-object v12

    .line 587
    .local v12, "status":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v12}, Ljava/util/Map;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_4

    move-object/from16 v16, v2

    move-object/from16 v17, v4

    const/4 v2, 0x0

    goto :goto_1

    .line 588
    :cond_4
    sget v13, Lorg/wiiucoop/bo2android/R$string;->settings_dxvk_last:I

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "loaded"

    invoke-interface {v12, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " ("

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "stage"

    invoke-interface {v12, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ")"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    .line 589
    const-string v15, "reason"

    invoke-interface {v12, v15}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_5

    invoke-interface {v12, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->isEmpty()Z

    move-result v16

    if-nez v16, :cond_5

    move-object/from16 v16, v2

    .end local v2    # "bundledProblem":Ljava/lang/String;
    .local v16, "bundledProblem":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v17, v4

    .end local v4    # "upstreamProblem":Ljava/lang/String;
    .local v17, "upstreamProblem":Ljava/lang/String;
    const-string v4, " \u2014 "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {v12, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .end local v16    # "bundledProblem":Ljava/lang/String;
    .end local v17    # "upstreamProblem":Ljava/lang/String;
    .restart local v2    # "bundledProblem":Ljava/lang/String;
    .restart local v4    # "upstreamProblem":Ljava/lang/String;
    :cond_5
    move-object/from16 v16, v2

    move-object/from16 v17, v4

    .end local v2    # "bundledProblem":Ljava/lang/String;
    .end local v4    # "upstreamProblem":Ljava/lang/String;
    .restart local v16    # "bundledProblem":Ljava/lang/String;
    .restart local v17    # "upstreamProblem":Ljava/lang/String;
    const-string v2, ""

    :goto_0
    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    .line 588
    invoke-virtual {v0, v13, v2}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    :goto_1
    nop

    .line 590
    .local v2, "last":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "settings: dxvk selected="

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v13, ", installed="

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v13

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v13, ", last="

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 591
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 592
    if-nez v2, :cond_6

    sget v4, Lorg/wiiucoop/bo2android/R$string;->settings_dxvk_label:I

    invoke-virtual {v0, v4}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    goto :goto_2

    :cond_6
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget v13, Lorg/wiiucoop/bo2android/R$string;->settings_dxvk_label:I

    invoke-virtual {v0, v13}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v13, "\n"

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_2
    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 593
    invoke-static {v11, v6}, Lorg/wiiucoop/bo2android/SettingsActivity;->find([Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    new-instance v13, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda1;

    invoke-direct {v13, v0, v1, v11, v6}, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda1;-><init>(Lorg/wiiucoop/bo2android/SettingsActivity;Lorg/wiiucoop/bo2android/T6DxvkStore;[Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v10, v4, v13}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    sget v4, Lorg/wiiucoop/bo2android/R$string;->action_cancel:I

    .line 601
    const/4 v13, 0x0

    invoke-virtual {v3, v4, v13}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 602
    .local v3, "dialog":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_7

    invoke-static {v6}, Lorg/wiiucoop/bo2android/T6DxvkStore;->isApkSet(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_7

    .line 603
    sget v4, Lorg/wiiucoop/bo2android/R$string;->settings_dxvk_remove:I

    new-instance v9, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda2;

    invoke-direct {v9, v0, v1, v6}, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda2;-><init>(Lorg/wiiucoop/bo2android/SettingsActivity;Lorg/wiiucoop/bo2android/T6DxvkStore;Ljava/lang/String;)V

    invoke-virtual {v3, v4, v9}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 610
    :cond_7
    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 611
    return-void
.end method

.method private chooseLanguage()V
    .locals 5

    .line 211
    sget-object v0, Lorg/wiiucoop/bo2android/SettingsActivity;->LANGUAGE_TAGS:[Ljava/lang/String;

    array-length v0, v0

    new-array v0, v0, [Ljava/lang/String;

    .line 212
    .local v0, "names":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    sget-object v2, Lorg/wiiucoop/bo2android/SettingsActivity;->LANGUAGE_NAMES:[I

    aget v2, v2, v1

    invoke-virtual {p0, v2}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 213
    .end local v1    # "i":I
    :cond_0
    sget-object v1, Lorg/wiiucoop/bo2android/SettingsActivity;->LANGUAGE_TAGS:[Ljava/lang/String;

    const-string v2, "language"

    const-string v3, "en-US"

    invoke-static {p0, v2, v3}, Lorg/wiiucoop/bo2android/T6Ui;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/wiiucoop/bo2android/SettingsActivity;->indexOf([Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 214
    .local v1, "current":I
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v3, Lorg/wiiucoop/bo2android/R$string;->settings_language_label:I

    .line 215
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda9;

    invoke-direct {v3, p0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda9;-><init>(Lorg/wiiucoop/bo2android/SettingsActivity;I)V

    .line 216
    invoke-virtual {v2, v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    sget v3, Lorg/wiiucoop/bo2android/R$string;->action_cancel:I

    .line 223
    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 224
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 225
    return-void
.end method

.method private chooseResolution()V
    .locals 16

    .line 307
    move-object/from16 v0, p0

    const-string v1, "resolution"

    const-string v2, "1280x720"

    invoke-static {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6Ui;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 308
    .local v1, "current":Ljava/lang/String;
    invoke-static/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6Ui;->nativeResolution(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 309
    .local v2, "nativeSize":Ljava/lang/String;
    invoke-static/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6Ui;->aspectResolution(Landroid/content/Context;)[I

    move-result-object v3

    .line 310
    .local v3, "aspect":[I
    const-string v5, "x"

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-nez v3, :cond_0

    const/4 v8, 0x0

    goto :goto_0

    :cond_0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    aget v9, v3, v6

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    aget v9, v3, v7

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 311
    .local v8, "aspectSize":Ljava/lang/String;
    :goto_0
    if-eqz v8, :cond_1

    sget-object v9, Lorg/wiiucoop/bo2android/T6Ui;->RESOLUTIONS:[Ljava/lang/String;

    invoke-static {v9, v8}, Lorg/wiiucoop/bo2android/SettingsActivity;->find([Ljava/lang/String;Ljava/lang/String;)I

    move-result v9

    if-gez v9, :cond_1

    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_1

    move v9, v7

    goto :goto_1

    :cond_1
    move v9, v6

    .line 312
    .local v9, "addAspect":Z
    :goto_1
    if-eqz v2, :cond_2

    sget-object v10, Lorg/wiiucoop/bo2android/T6Ui;->RESOLUTIONS:[Ljava/lang/String;

    invoke-static {v10, v2}, Lorg/wiiucoop/bo2android/SettingsActivity;->find([Ljava/lang/String;Ljava/lang/String;)I

    move-result v10

    if-gez v10, :cond_2

    move v10, v7

    goto :goto_2

    :cond_2
    move v10, v6

    .line 313
    .local v10, "addNative":Z
    :goto_2
    sget-object v11, Lorg/wiiucoop/bo2android/T6Ui;->RESOLUTIONS:[Ljava/lang/String;

    array-length v11, v11

    if-eqz v9, :cond_3

    move v12, v7

    goto :goto_3

    :cond_3
    move v12, v6

    :goto_3
    add-int/2addr v11, v12

    if-eqz v10, :cond_4

    move v6, v7

    :cond_4
    add-int/2addr v11, v6

    new-array v6, v11, [Ljava/lang/String;

    .line 314
    .local v6, "values":[Ljava/lang/String;
    array-length v7, v6

    new-array v7, v7, [Ljava/lang/String;

    .line 315
    .local v7, "labels":[Ljava/lang/String;
    const/4 v11, 0x0

    .line 316
    .local v11, "n":I
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_4
    sget-object v13, Lorg/wiiucoop/bo2android/T6Ui;->RESOLUTIONS:[Ljava/lang/String;

    array-length v13, v13

    const-string v14, " \u00d7 "

    if-ge v12, v13, :cond_5

    .line 317
    sget-object v13, Lorg/wiiucoop/bo2android/T6Ui;->RESOLUTIONS:[Ljava/lang/String;

    aget-object v13, v13, v12

    aput-object v13, v6, v11

    .line 318
    sget-object v13, Lorg/wiiucoop/bo2android/T6Ui;->RESOLUTIONS:[Ljava/lang/String;

    aget-object v13, v13, v12

    invoke-virtual {v13, v5, v14}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v7, v11

    .line 316
    add-int/lit8 v12, v12, 0x1

    add-int/lit8 v11, v11, 0x1

    goto :goto_4

    .line 320
    .end local v12    # "i":I
    :cond_5
    if-eqz v9, :cond_6

    .line 321
    const-string v12, "aspect"

    aput-object v12, v6, v11

    .line 322
    add-int/lit8 v12, v11, 0x1

    .end local v11    # "n":I
    .local v12, "n":I
    sget v13, Lorg/wiiucoop/bo2android/R$string;->settings_resolution_aspect:I

    invoke-static/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6Ui;->displayAspectLabel(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v15

    .line 323
    invoke-virtual {v8, v5, v14}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    filled-new-array {v15, v4}, [Ljava/lang/Object;

    move-result-object v4

    .line 322
    invoke-virtual {v0, v13, v4}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v7, v11

    move v11, v12

    .line 325
    .end local v12    # "n":I
    .restart local v11    # "n":I
    :cond_6
    const-string v4, "native"

    if-eqz v10, :cond_7

    .line 326
    aput-object v4, v6, v11

    .line 327
    add-int/lit8 v12, v11, 0x1

    .end local v11    # "n":I
    .restart local v12    # "n":I
    sget v13, Lorg/wiiucoop/bo2android/R$string;->settings_resolution_native:I

    invoke-virtual {v2, v5, v14}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v0, v13, v5}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v7, v11

    move v11, v12

    .line 329
    .end local v12    # "n":I
    .restart local v11    # "n":I
    :cond_7
    invoke-static {v6, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->find([Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    .line 330
    .local v5, "checked":I
    if-gez v5, :cond_8

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-static {v6, v2}, Lorg/wiiucoop/bo2android/SettingsActivity;->find([Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    .line 331
    :cond_8
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "settings: native display "

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v12, " ("

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6Ui;->displayAspectLabel(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v12, "), phone-aspect size "

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v12, ", saved resolution "

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v12, "t6android"

    invoke-static {v12, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 333
    new-instance v4, Landroid/app/AlertDialog$Builder;

    invoke-direct {v4, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v12, Lorg/wiiucoop/bo2android/R$string;->settings_resolution_label:I

    .line 334
    invoke-virtual {v4, v12}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    new-instance v12, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda13;

    invoke-direct {v12, v0, v6}, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda13;-><init>(Lorg/wiiucoop/bo2android/SettingsActivity;[Ljava/lang/String;)V

    .line 335
    invoke-virtual {v4, v7, v5, v12}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    sget v12, Lorg/wiiucoop/bo2android/R$string;->action_cancel:I

    .line 341
    const/4 v13, 0x0

    invoke-virtual {v4, v12, v13}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 342
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 343
    return-void
.end method

.method private chooseTheme()V
    .locals 5

    .line 348
    sget-object v0, Lorg/wiiucoop/bo2android/SettingsActivity;->THEMES:[Ljava/lang/String;

    array-length v0, v0

    new-array v0, v0, [Ljava/lang/String;

    .line 349
    .local v0, "names":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    sget-object v2, Lorg/wiiucoop/bo2android/SettingsActivity;->THEME_NAMES:[I

    aget v2, v2, v1

    invoke-virtual {p0, v2}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 350
    .end local v1    # "i":I
    :cond_0
    sget-object v1, Lorg/wiiucoop/bo2android/SettingsActivity;->THEMES:[Ljava/lang/String;

    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->theme(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/wiiucoop/bo2android/SettingsActivity;->indexOf([Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 351
    .local v1, "current":I
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v3, Lorg/wiiucoop/bo2android/R$string;->settings_theme_label:I

    .line 352
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda11;

    invoke-direct {v3, p0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda11;-><init>(Lorg/wiiucoop/bo2android/SettingsActivity;I)V

    .line 353
    invoke-virtual {v2, v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    sget v3, Lorg/wiiucoop/bo2android/R$string;->action_cancel:I

    .line 360
    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 361
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 362
    return-void
.end method

.method private chooseTuDebug()V
    .locals 8

    .line 273
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->readTuDebug()Ljava/lang/String;

    move-result-object v0

    .line 274
    .local v0, "current":Ljava/lang/String;
    sget-object v1, Lorg/wiiucoop/bo2android/SettingsActivity;->TU_FLAGS:[Ljava/lang/String;

    array-length v1, v1

    new-array v1, v1, [Z

    .line 275
    .local v1, "checked":[Z
    if-eqz v0, :cond_1

    .line 276
    const-string v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_1

    aget-object v5, v2, v4

    .line 277
    .local v5, "f":Ljava/lang/String;
    sget-object v6, Lorg/wiiucoop/bo2android/SettingsActivity;->TU_FLAGS:[Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lorg/wiiucoop/bo2android/SettingsActivity;->find([Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    .line 278
    .local v6, "i":I
    if-ltz v6, :cond_0

    const/4 v7, 0x1

    aput-boolean v7, v1, v6

    .line 276
    .end local v5    # "f":Ljava/lang/String;
    .end local v6    # "i":I
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 281
    :cond_1
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v3, Lorg/wiiucoop/bo2android/R$string;->settings_tu_debug_label:I

    .line 282
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    sget-object v3, Lorg/wiiucoop/bo2android/SettingsActivity;->TU_FLAGS:[Ljava/lang/String;

    new-instance v4, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda3;

    invoke-direct {v4, v1}, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda3;-><init>([Z)V

    .line 283
    invoke-virtual {v2, v3, v1, v4}, Landroid/app/AlertDialog$Builder;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    sget v3, Lorg/wiiucoop/bo2android/R$string;->settings_tu_debug_save:I

    new-instance v4, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda4;

    invoke-direct {v4, p0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda4;-><init>(Lorg/wiiucoop/bo2android/SettingsActivity;[Z)V

    .line 284
    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    sget v3, Lorg/wiiucoop/bo2android/R$string;->settings_tu_debug_auto:I

    new-instance v4, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda5;

    invoke-direct {v4, p0}, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda5;-><init>(Lorg/wiiucoop/bo2android/SettingsActivity;)V

    .line 294
    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    sget v3, Lorg/wiiucoop/bo2android/R$string;->action_cancel:I

    .line 298
    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 299
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 300
    return-void
.end method

.method private cycleTouchMode()V
    .locals 3

    .line 374
    sget-object v0, Lorg/wiiucoop/bo2android/SettingsActivity;->TOUCH_MODES:[Ljava/lang/String;

    const-string v1, "auto"

    const-string v2, "touch_mode"

    invoke-static {p0, v2, v1}, Lorg/wiiucoop/bo2android/T6Ui;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->indexOf([Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    sget-object v1, Lorg/wiiucoop/bo2android/SettingsActivity;->TOUCH_MODES:[Ljava/lang/String;

    array-length v1, v1

    rem-int/2addr v0, v1

    .line 375
    .local v0, "next":I
    sget-object v1, Lorg/wiiucoop/bo2android/SettingsActivity;->TOUCH_MODES:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-static {p0, v2, v1}, Lorg/wiiucoop/bo2android/T6Ui;->setString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 376
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "settings: touch_mode="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lorg/wiiucoop/bo2android/SettingsActivity;->TOUCH_MODES:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "t6android"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 377
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->refreshOptionsSection()V

    .line 378
    return-void
.end method

.method private editPlayerName()V
    .locals 7

    .line 498
    new-instance v0, Landroid/widget/EditText;

    invoke-direct {v0, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 499
    .local v0, "input":Landroid/widget/EditText;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 500
    iget-object v2, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->playerName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 501
    sget v2, Lorg/wiiucoop/bo2android/R$string;->player_name_hint:I

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setHint(I)V

    .line 502
    const/16 v2, 0x2001

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setInputType(I)V

    .line 503
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelectAllOnFocus(Z)V

    .line 505
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    .line 506
    .local v1, "density":F
    const/high16 v2, 0x41800000    # 16.0f

    mul-float/2addr v2, v1

    float-to-int v2, v2

    .line 507
    .local v2, "padding":I
    new-instance v3, Landroid/widget/FrameLayout;

    invoke-direct {v3, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 508
    .local v3, "holder":Landroid/widget/FrameLayout;
    div-int/lit8 v4, v2, 0x2

    const/4 v5, 0x0

    invoke-virtual {v3, v2, v4, v2, v5}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 509
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {v4, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v0, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 512
    new-instance v4, Landroid/app/AlertDialog$Builder;

    invoke-direct {v4, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v5, Lorg/wiiucoop/bo2android/R$string;->label_player_name:I

    .line 513
    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 514
    invoke-virtual {v4, v3}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    sget v5, Lorg/wiiucoop/bo2android/R$string;->action_save:I

    new-instance v6, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda15;

    invoke-direct {v6, p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda15;-><init>(Lorg/wiiucoop/bo2android/SettingsActivity;Landroid/widget/EditText;)V

    .line 515
    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    sget v5, Lorg/wiiucoop/bo2android/R$string;->action_cancel:I

    .line 517
    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 518
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 519
    return-void
.end method

.method private static find([Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p0, "values"    # [Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .line 206
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    aget-object v1, p0, v0

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 207
    .end local v0    # "i":I
    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method private static indexOf([Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p0, "values"    # [Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .line 200
    invoke-static {p0, p1}, Lorg/wiiucoop/bo2android/SettingsActivity;->find([Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 201
    .local v0, "i":I
    if-gez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_0
    return v1
.end method

.method private kennelCheckAndInstall()V
    .locals 4

    .line 948
    iget-boolean v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->kennelBusy:Z

    if-eqz v0, :cond_0

    return-void

    .line 949
    :cond_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v0, v0, Lorg/wiiucoop/bo2android/T6Config;->gameDirPath:Ljava/lang/String;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v0, v0, Lorg/wiiucoop/bo2android/T6Config;->gameDirPath:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 953
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->kennelBusy:Z

    .line 954
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6Config;->gameDirPath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 955
    .local v0, "gameDir":Ljava/io/File;
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda14;

    invoke-direct {v2, p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda14;-><init>(Lorg/wiiucoop/bo2android/SettingsActivity;Ljava/io/File;)V

    const-string v3, "kennel-install"

    invoke-direct {v1, v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 984
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 985
    return-void

    .line 950
    .end local v0    # "gameDir":Ljava/io/File;
    :cond_2
    :goto_0
    sget v0, Lorg/wiiucoop/bo2android/R$string;->kennel_no_folder:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->kennelStatus(Ljava/lang/String;)V

    .line 951
    return-void
.end method

.method private kennelStatus(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .line 940
    new-instance v0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda7;

    invoke-direct {v0, p0, p1}, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda7;-><init>(Lorg/wiiucoop/bo2android/SettingsActivity;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 941
    return-void
.end method

.method static synthetic lambda$applyFolder$12(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/wiiucoop/bo2android/T6Config;)V
    .locals 1
    .param p0, "treeUri"    # Landroid/net/Uri;
    .param p1, "display"    # Ljava/lang/String;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "state"    # Ljava/lang/String;
    .param p4, "detail"    # Ljava/lang/String;
    .param p5, "current"    # Lorg/wiiucoop/bo2android/T6Config;

    .line 669
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p5, Lorg/wiiucoop/bo2android/T6Config;->gameDirUri:Ljava/lang/String;

    .line 670
    iput-object p1, p5, Lorg/wiiucoop/bo2android/T6Config;->gameDirDisplay:Ljava/lang/String;

    .line 671
    iput-object p2, p5, Lorg/wiiucoop/bo2android/T6Config;->gameDirPath:Ljava/lang/String;

    .line 672
    iput-object p3, p5, Lorg/wiiucoop/bo2android/T6Config;->gameDirState:Ljava/lang/String;

    .line 673
    iput-object p4, p5, Lorg/wiiucoop/bo2android/T6Config;->gameDirDetail:Ljava/lang/String;

    .line 674
    return-void
.end method

.method static synthetic lambda$chooseTuDebug$3([ZLandroid/content/DialogInterface;IZ)V
    .locals 0
    .param p0, "checked"    # [Z
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I
    .param p3, "isChecked"    # Z

    .line 283
    aput-boolean p3, p0, p2

    return-void
.end method

.method static synthetic lambda$onActivityResult$11(Ljava/lang/String;Lorg/wiiucoop/bo2android/T6Config;)V
    .locals 1
    .param p0, "display"    # Ljava/lang/String;
    .param p1, "current"    # Lorg/wiiucoop/bo2android/T6Config;

    .line 635
    const-string v0, ""

    iput-object v0, p1, Lorg/wiiucoop/bo2android/T6Config;->gameDirUri:Ljava/lang/String;

    .line 636
    iput-object v0, p1, Lorg/wiiucoop/bo2android/T6Config;->gameDirPath:Ljava/lang/String;

    .line 637
    iput-object p0, p1, Lorg/wiiucoop/bo2android/T6Config;->gameDirDisplay:Ljava/lang/String;

    .line 638
    const-string v0, "FAIL"

    iput-object v0, p1, Lorg/wiiucoop/bo2android/T6Config;->gameDirState:Ljava/lang/String;

    .line 639
    const-string v0, "O Android n\u00e3o concedeu acesso permanente a esta pasta. Escolha outra pasta (por exemplo no armazenamento interno) e confirme o aviso."

    iput-object v0, p1, Lorg/wiiucoop/bo2android/T6Config;->gameDirDetail:Ljava/lang/String;

    .line 641
    return-void
.end method

.method static synthetic lambda$revalidateStoredFolder$13(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/wiiucoop/bo2android/T6Config;)V
    .locals 0
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "state"    # Ljava/lang/String;
    .param p2, "detail"    # Ljava/lang/String;
    .param p3, "current"    # Lorg/wiiucoop/bo2android/T6Config;

    .line 733
    iput-object p0, p3, Lorg/wiiucoop/bo2android/T6Config;->gameDirPath:Ljava/lang/String;

    .line 734
    iput-object p1, p3, Lorg/wiiucoop/bo2android/T6Config;->gameDirState:Ljava/lang/String;

    .line 735
    iput-object p2, p3, Lorg/wiiucoop/bo2android/T6Config;->gameDirDetail:Ljava/lang/String;

    .line 736
    return-void
.end method

.method private logRowGeometry(ILjava/lang/String;)V
    .locals 12
    .param p1, "viewId"    # I
    .param p2, "name"    # Ljava/lang/String;

    .line 805
    invoke-virtual {p0, p1}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 807
    .local v0, "row":Landroid/view/View;
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_1

    .line 811
    :cond_0
    const/4 v1, 0x2

    new-array v2, v1, [I

    .line 812
    .local v2, "position":[I
    invoke-virtual {v0, v2}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 814
    const/4 v3, 0x1

    aget v4, v2, v3

    .line 815
    .local v4, "top":I
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v5

    add-int/2addr v5, v4

    .line 817
    .local v5, "bottom":I
    const v6, 0x1020002

    invoke-virtual {p0, v6}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 818
    .local v6, "content":Landroid/view/View;
    new-array v7, v1, [I

    .line 819
    .local v7, "origin":[I
    invoke-virtual {v6, v7}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 821
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "settings: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " tap "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/4 v9, 0x0

    aget v10, v2, v9

    .line 822
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v11

    div-int/2addr v11, v1

    add-int/2addr v10, v11

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, ","

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v11

    div-int/2addr v11, v1

    add-int/2addr v11, v4

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v8, " bounds "

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget v8, v2, v9

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v8, ".."

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget v8, v2, v9

    .line 824
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v11

    add-int/2addr v8, v11

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v8, " inside "

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget v8, v7, v3

    if-lt v4, v8, :cond_1

    aget v8, v7, v3

    .line 825
    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    move-result v10

    add-int/2addr v8, v10

    if-gt v5, v8, :cond_1

    goto :goto_0

    :cond_1
    move v3, v9

    :goto_0
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 821
    const-string v3, "t6android"

    invoke-static {v3, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 826
    return-void

    .line 808
    .end local v2    # "position":[I
    .end local v4    # "top":I
    .end local v5    # "bottom":I
    .end local v6    # "content":Landroid/view/View;
    .end local v7    # "origin":[I
    :cond_2
    :goto_1
    return-void
.end method

.method private openDiscord()V
    .locals 3

    .line 366
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    const-string v2, "https://discord.gg/hGkAYecRg"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->startActivity(Landroid/content/Intent;)V

    .line 367
    const-string v0, "t6android"

    const-string v1, "settings: Discord opened"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 370
    goto :goto_0

    .line 368
    :catch_0
    move-exception v0

    .line 369
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    sget v1, Lorg/wiiucoop/bo2android/R$string;->discord_unavailable:I

    const/4 v2, 0x1

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 371
    .end local v0    # "e":Landroid/content/ActivityNotFoundException;
    :goto_0
    return-void
.end method

.method private pickFolder()V
    .locals 4

    .line 540
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.OPEN_DOCUMENT_TREE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 541
    .local v0, "intent":Landroid/content/Intent;
    const/16 v1, 0xc1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 545
    iget-object v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6Config;->gameDirUri:Ljava/lang/String;

    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6TreeAccess;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 546
    .local v1, "previous":Landroid/net/Uri;
    if-eqz v1, :cond_0

    .line 547
    const-string v2, "android.provider.extra.INITIAL_URI"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 551
    :cond_0
    const/16 v2, 0x3e9

    :try_start_0
    invoke-virtual {p0, v0, v2}, Lorg/wiiucoop/bo2android/SettingsActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 554
    goto :goto_0

    .line 552
    :catch_0
    move-exception v2

    .line 553
    .local v2, "e":Landroid/content/ActivityNotFoundException;
    sget v3, Lorg/wiiucoop/bo2android/R$string;->settings_no_folder_picker:I

    invoke-virtual {p0, v3}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/wiiucoop/bo2android/SettingsActivity;->toast(Ljava/lang/String;)V

    .line 555
    .end local v2    # "e":Landroid/content/ActivityNotFoundException;
    :goto_0
    return-void
.end method

.method private playerNameText(Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;)Ljava/lang/String;
    .locals 2
    .param p1, "outcome"    # Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    .line 844
    sget-object v0, Lorg/wiiucoop/bo2android/SettingsActivity$3;->$SwitchMap$org$wiiucoop$bo2android$T6PlayerName$Outcome:[I

    invoke-virtual {p1}, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 851
    sget v0, Lorg/wiiucoop/bo2android/R$string;->player_name_not_verified:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 850
    :pswitch_0
    sget v0, Lorg/wiiucoop/bo2android/R$string;->player_name_write_failed:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 849
    :pswitch_1
    sget v0, Lorg/wiiucoop/bo2android/R$string;->player_name_client_rejects:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 847
    :pswitch_2
    sget v0, Lorg/wiiucoop/bo2android/R$string;->player_name_empty:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 846
    :pswitch_3
    sget v0, Lorg/wiiucoop/bo2android/R$string;->player_name_no_folder:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 845
    :pswitch_4
    sget v0, Lorg/wiiucoop/bo2android/R$string;->player_name_saved:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private readStoredName()Ljava/lang/String;
    .locals 2

    .line 493
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v0, v0, Lorg/wiiucoop/bo2android/T6Config;->gameDirUri:Ljava/lang/String;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6Config;->gameDirDisplay:Ljava/lang/String;

    invoke-static {p0, v0, v1}, Lorg/wiiucoop/bo2android/T6SafStore;->forTree(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6SafStore;

    move-result-object v0

    .line 494
    .local v0, "store":Lorg/wiiucoop/bo2android/T6SafStore;
    const-string v1, ""

    invoke-static {v0, v1}, Lorg/wiiucoop/bo2android/T6PlayerName;->load(Lorg/wiiucoop/bo2android/T6PlayerName$Store;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private readTuDebug()Ljava/lang/String;
    .locals 5

    .line 241
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->tuDebugFile()Ljava/io/File;

    move-result-object v0

    .line 242
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return-object v2

    .line 244
    :cond_0
    :try_start_0
    new-instance v1, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object v3

    invoke-static {v3}, Ljava/nio/file/Files;->readAllBytes(Ljava/nio/file/Path;)[B

    move-result-object v3

    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v1, v3, v4}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 245
    .local v1, "text":Ljava/lang/String;
    const-string v3, "TU_DEBUG="

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    const/16 v3, 0x9

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    return-object v2

    .line 246
    .end local v1    # "text":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 247
    .local v1, "e":Ljava/io/IOException;
    return-object v2
.end method

.method private refresh()V
    .locals 5

    .line 763
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->refreshFolderSection()V

    .line 764
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->refreshNameSection()V

    .line 765
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->refreshInfoSection()V

    .line 766
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->refreshOptionsSection()V

    .line 769
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->footer:Landroid/widget/TextView;

    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->debugOverlayEnabled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/16 v1, 0x8

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 772
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget v1, Lorg/wiiucoop/bo2android/R$string;->footer_runtime:I

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lorg/wiiucoop/bo2android/T6Native;->hostBuildSummary()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 773
    .local v0, "footerText":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getFilesDir()Ljava/io/File;

    move-result-object v3

    const-string v4, "t6_status.ini"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v2}, Lorg/wiiucoop/bo2android/T6RunStatus;->load(Ljava/io/File;)Lorg/wiiucoop/bo2android/T6RunStatus;

    move-result-object v2

    .line 774
    .local v2, "lastRun":Lorg/wiiucoop/bo2android/T6RunStatus;
    invoke-virtual {v2}, Lorg/wiiucoop/bo2android/T6RunStatus;->exists()Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, v2, Lorg/wiiucoop/bo2android/T6RunStatus;->engineBootReason:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 775
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v3, Lorg/wiiucoop/bo2android/R$string;->last_run_reason:I

    iget-object v4, v2, Lorg/wiiucoop/bo2android/T6RunStatus;->engineBootReason:Ljava/lang/String;

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 777
    :cond_1
    invoke-virtual {v2}, Lorg/wiiucoop/bo2android/T6RunStatus;->exists()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, v2, Lorg/wiiucoop/bo2android/T6RunStatus;->guestStage:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 778
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "\nEtapa do guest comprovada pelo host: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, v2, Lorg/wiiucoop/bo2android/T6RunStatus;->guestStage:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 780
    :cond_2
    iget-object v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->footer:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 781
    return-void
.end method

.method private refreshFolderSection()V
    .locals 5

    .line 873
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6Config;->hasFolder()Z

    move-result v0

    const/16 v1, 0x8

    if-nez v0, :cond_0

    .line 874
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->folderValue:Landroid/widget/TextView;

    sget v2, Lorg/wiiucoop/bo2android/R$string;->folder_none:I

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 875
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->folderDetail:Landroid/widget/TextView;

    const-string v2, ""

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 876
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->pickButton:Landroid/widget/Button;

    sget v2, Lorg/wiiucoop/bo2android/R$string;->action_pick_folder:I

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(I)V

    goto :goto_2

    .line 878
    :cond_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v0, v0, Lorg/wiiucoop/bo2android/T6Config;->gameDirDisplay:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 879
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v0, v0, Lorg/wiiucoop/bo2android/T6Config;->gameDirUri:Ljava/lang/String;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v0, v0, Lorg/wiiucoop/bo2android/T6Config;->gameDirDisplay:Ljava/lang/String;

    .line 880
    .local v0, "display":Ljava/lang/String;
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 882
    .local v2, "value":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v3, v3, Lorg/wiiucoop/bo2android/T6Config;->gameDirPath:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    .line 883
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v4, v4, Lorg/wiiucoop/bo2android/T6Config;->gameDirPath:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 885
    :cond_2
    const-string v3, "\n(caminho de arquivo indispon\u00edvel; veja abaixo)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 888
    :goto_1
    iget-object v3, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->folderValue:Landroid/widget/TextView;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 889
    iget-object v3, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->folderDetail:Landroid/widget/TextView;

    iget-object v4, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v4, v4, Lorg/wiiucoop/bo2android/T6Config;->gameDirDetail:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 890
    iget-object v3, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->folderDetail:Landroid/widget/TextView;

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 891
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "settings: folder: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v4, v4, Lorg/wiiucoop/bo2android/T6Config;->gameDirDetail:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "t6android"

    invoke-static {v4, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 892
    iget-object v3, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->pickButton:Landroid/widget/Button;

    sget v4, Lorg/wiiucoop/bo2android/R$string;->action_change_folder:I

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(I)V

    .line 898
    .end local v0    # "display":Ljava/lang/String;
    .end local v2    # "value":Ljava/lang/StringBuilder;
    :goto_2
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6Config;->hasFolder()Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_3

    invoke-static {}, Lorg/wiiucoop/bo2android/T6TreeAccess;->hasAllFilesAccess()Z

    move-result v0

    if-nez v0, :cond_3

    const/4 v0, 0x1

    goto :goto_3

    :cond_3
    move v0, v2

    .line 899
    .local v0, "needsAccess":Z
    :goto_3
    iget-object v3, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->grantButton:Landroid/widget/Button;

    if-eqz v0, :cond_4

    move v1, v2

    :cond_4
    invoke-virtual {v3, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 900
    return-void
.end method

.method private refreshInfoSection()V
    .locals 2

    .line 788
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->deviceInfo:Lorg/wiiucoop/bo2android/T6DeviceInfo$Info;

    if-nez v0, :cond_0

    .line 789
    return-void

    .line 792
    :cond_0
    sget v0, Lorg/wiiucoop/bo2android/R$id;->text_info_cpu:I

    iget-object v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->deviceInfo:Lorg/wiiucoop/bo2android/T6DeviceInfo$Info;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6DeviceInfo$Info;->cpu:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->setText(ILjava/lang/String;)V

    .line 793
    sget v0, Lorg/wiiucoop/bo2android/R$id;->text_info_gpu:I

    iget-object v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->deviceInfo:Lorg/wiiucoop/bo2android/T6DeviceInfo$Info;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6DeviceInfo$Info;->gpu:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->setText(ILjava/lang/String;)V

    .line 794
    sget v0, Lorg/wiiucoop/bo2android/R$id;->text_info_ram:I

    iget-object v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->deviceInfo:Lorg/wiiucoop/bo2android/T6DeviceInfo$Info;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6DeviceInfo$Info;->ram:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->setText(ILjava/lang/String;)V

    .line 795
    sget v0, Lorg/wiiucoop/bo2android/R$id;->text_info_vulkan:I

    iget-object v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->deviceInfo:Lorg/wiiucoop/bo2android/T6DeviceInfo$Info;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6DeviceInfo$Info;->vulkan:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->setText(ILjava/lang/String;)V

    .line 797
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "deviceinfo: cpu="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->deviceInfo:Lorg/wiiucoop/bo2android/T6DeviceInfo$Info;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6DeviceInfo$Info;->cpu:Ljava/lang/String;

    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6DeviceInfo;->orUnavailable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " gpu="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->deviceInfo:Lorg/wiiucoop/bo2android/T6DeviceInfo$Info;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6DeviceInfo$Info;->gpu:Ljava/lang/String;

    .line 798
    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6DeviceInfo;->orUnavailable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ram="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->deviceInfo:Lorg/wiiucoop/bo2android/T6DeviceInfo$Info;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6DeviceInfo$Info;->ram:Ljava/lang/String;

    .line 799
    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6DeviceInfo;->orUnavailable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " vulkan="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->deviceInfo:Lorg/wiiucoop/bo2android/T6DeviceInfo$Info;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6DeviceInfo$Info;->vulkan:Ljava/lang/String;

    .line 800
    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6DeviceInfo;->orUnavailable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 797
    const-string v1, "t6android"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 801
    return-void
.end method

.method private refreshKennelRow()V
    .locals 8

    .line 921
    iget-boolean v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->kennelBusy:Z

    if-nez v0, :cond_4

    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v0, v0, Lorg/wiiucoop/bo2android/T6Config;->gameDirPath:Ljava/lang/String;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v0, v0, Lorg/wiiucoop/bo2android/T6Config;->gameDirPath:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_3

    .line 922
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "kennel.json"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 923
    .local v0, "saved":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-nez v1, :cond_1

    return-void

    .line 925
    :cond_1
    :try_start_0
    new-instance v1, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object v2

    invoke-static {v2}, Ljava/nio/file/Files;->readAllBytes(Ljava/nio/file/Path;)[B

    move-result-object v2

    sget-object v3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v1, v2, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6KennelPackage;->parse(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;

    move-result-object v1

    .line 927
    .local v1, "m":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    const-string v2, "t6_ui"

    const/4 v3, 0x4

    invoke-virtual {p0, v2, v3}, Lorg/wiiucoop/bo2android/SettingsActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "kennel_version"

    const/4 v4, -0x1

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 928
    .local v2, "installed":I
    new-instance v3, Ljava/io/File;

    iget-object v4, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v4, v4, Lorg/wiiucoop/bo2android/T6Config;->gameDirPath:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v3, v2, v1}, Lorg/wiiucoop/bo2android/T6KennelPackage;->state(Ljava/io/File;ILorg/wiiucoop/bo2android/T6KennelPackage$Manifest;)Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    move-result-object v3

    .line 929
    .local v3, "st":Lorg/wiiucoop/bo2android/T6KennelPackage$State;
    iget-wide v4, v1, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;->size:J

    invoke-static {p0, v4, v5}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v4

    .line 930
    .local v4, "size":Ljava/lang/String;
    sget v5, Lorg/wiiucoop/bo2android/R$id;->text_kennel_value:I

    invoke-virtual {p0, v5}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    sget-object v6, Lorg/wiiucoop/bo2android/T6KennelPackage$State;->INSTALLED:Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    if-ne v3, v6, :cond_2

    .line 931
    sget v6, Lorg/wiiucoop/bo2android/R$string;->kennel_state_installed:I

    iget v7, v1, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;->version:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {p0, v6, v7}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 932
    :cond_2
    sget-object v6, Lorg/wiiucoop/bo2android/T6KennelPackage$State;->MISSING:Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    if-ne v3, v6, :cond_3

    sget v6, Lorg/wiiucoop/bo2android/R$string;->kennel_state_missing:I

    goto :goto_0

    .line 933
    :cond_3
    sget v6, Lorg/wiiucoop/bo2android/R$string;->kennel_state_repair:I

    :goto_0
    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v7

    .line 932
    invoke-virtual {p0, v6, v7}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 930
    :goto_1
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 936
    .end local v1    # "m":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    .end local v2    # "installed":I
    .end local v3    # "st":Lorg/wiiucoop/bo2android/T6KennelPackage$State;
    .end local v4    # "size":Ljava/lang/String;
    goto :goto_2

    .line 934
    :catch_0
    move-exception v1

    .line 935
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "kennel: saved manifest unreadable: "

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

    .line 937
    .end local v1    # "e":Ljava/io/IOException;
    :goto_2
    return-void

    .line 921
    .end local v0    # "saved":Ljava/io/File;
    :cond_4
    :goto_3
    return-void
.end method

.method private refreshNameSection()V
    .locals 3

    .line 856
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->nameValue:Landroid/widget/TextView;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->playerName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 857
    sget v1, Lorg/wiiucoop/bo2android/R$string;->player_name_none:I

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 858
    :cond_0
    iget-object v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->playerName:Ljava/lang/String;

    .line 856
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 863
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->playerName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->playerName:Ljava/lang/String;

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6PlayerName;->clientRejection(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    .line 865
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget v1, Lorg/wiiucoop/bo2android/R$string;->player_name_client_rejects:I

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 864
    :cond_2
    :goto_1
    const-string v0, ""

    .line 865
    :goto_2
    nop

    .line 868
    .local v0, "clientNote":Ljava/lang/String;
    iget-object v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->nameDetail:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 869
    iget-object v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->nameDetail:Landroid/widget/TextView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 870
    return-void
.end method

.method private refreshOptionsSection()V
    .locals 12

    .line 381
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->firstControllerName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 382
    .local v0, "pad":Ljava/lang/String;
    sget v1, Lorg/wiiucoop/bo2android/R$id;->text_controller_value:I

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 383
    sget v2, Lorg/wiiucoop/bo2android/R$string;->settings_controller_none:I

    invoke-virtual {p0, v2}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 384
    :cond_0
    sget v2, Lorg/wiiucoop/bo2android/R$string;->settings_controller_connected:I

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 382
    :goto_0
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 385
    sget v1, Lorg/wiiucoop/bo2android/R$id;->text_touch_mode_value:I

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    sget-object v2, Lorg/wiiucoop/bo2android/SettingsActivity;->TOUCH_MODE_NAMES:[I

    sget-object v3, Lorg/wiiucoop/bo2android/SettingsActivity;->TOUCH_MODES:[Ljava/lang/String;

    .line 386
    const-string v4, "touch_mode"

    const-string v5, "auto"

    invoke-static {p0, v4, v5}, Lorg/wiiucoop/bo2android/T6Ui;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/wiiucoop/bo2android/SettingsActivity;->indexOf([Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    aget v2, v2, v3

    .line 385
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 387
    sget v1, Lorg/wiiucoop/bo2android/R$id;->text_theme_value:I

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    sget-object v2, Lorg/wiiucoop/bo2android/SettingsActivity;->THEME_NAMES:[I

    sget-object v3, Lorg/wiiucoop/bo2android/SettingsActivity;->THEMES:[Ljava/lang/String;

    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->theme(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/wiiucoop/bo2android/SettingsActivity;->indexOf([Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    aget v2, v2, v3

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 388
    sget v1, Lorg/wiiucoop/bo2android/R$id;->text_language_value:I

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    sget-object v2, Lorg/wiiucoop/bo2android/SettingsActivity;->LANGUAGE_NAMES:[I

    sget-object v3, Lorg/wiiucoop/bo2android/SettingsActivity;->LANGUAGE_TAGS:[Ljava/lang/String;

    .line 389
    const-string v4, "language"

    const-string v5, "en-US"

    invoke-static {p0, v4, v5}, Lorg/wiiucoop/bo2android/T6Ui;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/wiiucoop/bo2android/SettingsActivity;->indexOf([Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    aget v2, v2, v3

    .line 388
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 391
    new-instance v1, Lorg/wiiucoop/bo2android/T6DriverStore;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/wiiucoop/bo2android/T6DriverStore;-><init>(Ljava/io/File;)V

    .line 392
    .local v1, "drivers":Lorg/wiiucoop/bo2android/T6DriverStore;
    invoke-virtual {v1}, Lorg/wiiucoop/bo2android/T6DriverStore;->selected()Ljava/lang/String;

    move-result-object v2

    .line 393
    .local v2, "selectedDriver":Ljava/lang/String;
    invoke-virtual {v1, v2}, Lorg/wiiucoop/bo2android/T6DriverStore;->find(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverStore$Entry;

    move-result-object v3

    .line 394
    .local v3, "entry":Lorg/wiiucoop/bo2android/T6DriverStore$Entry;
    sget v4, Lorg/wiiucoop/bo2android/R$id;->text_driver_value:I

    invoke-virtual {p0, v4}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    if-nez v3, :cond_1

    .line 395
    sget v5, Lorg/wiiucoop/bo2android/R$string;->settings_driver_value:I

    invoke-virtual {p0, v5}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 396
    :cond_1
    iget-object v5, v3, Lorg/wiiucoop/bo2android/T6DriverStore$Entry;->meta:Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;

    iget-object v5, v5, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->name:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_2

    iget-object v5, v3, Lorg/wiiucoop/bo2android/T6DriverStore$Entry;->id:Ljava/lang/String;

    goto :goto_1

    :cond_2
    iget-object v5, v3, Lorg/wiiucoop/bo2android/T6DriverStore$Entry;->meta:Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;

    iget-object v5, v5, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->name:Ljava/lang/String;

    .line 394
    :goto_1
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 397
    new-instance v4, Lorg/wiiucoop/bo2android/T6DxvkStore;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getFilesDir()Ljava/io/File;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/wiiucoop/bo2android/T6DxvkStore;-><init>(Ljava/io/File;)V

    .line 398
    .local v4, "dxvk":Lorg/wiiucoop/bo2android/T6DxvkStore;
    invoke-virtual {v4}, Lorg/wiiucoop/bo2android/T6DxvkStore;->selected()Ljava/lang/String;

    move-result-object v5

    .line 399
    .local v5, "selectedDxvk":Ljava/lang/String;
    sget v6, Lorg/wiiucoop/bo2android/R$id;->text_dxvk_value:I

    invoke-virtual {p0, v6}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    const-string v7, "builtin"

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 400
    sget v7, Lorg/wiiucoop/bo2android/R$string;->settings_dxvk_builtin:I

    const-string v8, "2.6.0"

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {p0, v7, v8}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    goto :goto_2

    .line 401
    :cond_3
    const-string v7, "dxvk-1.9.2-legacy"

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 402
    sget v7, Lorg/wiiucoop/bo2android/R$string;->settings_dxvk_bundled:I

    const-string v8, "1.9.2"

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {p0, v7, v8}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    goto :goto_2

    .line 403
    :cond_4
    const-string v7, "dxvk-3.1.1"

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 404
    sget v7, Lorg/wiiucoop/bo2android/R$string;->settings_dxvk_upstream3:I

    const-string v8, "3.1.1"

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {p0, v7, v8}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    goto :goto_2

    .line 405
    :cond_5
    invoke-virtual {v4, v5}, Lorg/wiiucoop/bo2android/T6DxvkStore;->label(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 399
    :goto_2
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 406
    sget v6, Lorg/wiiucoop/bo2android/R$id;->text_tu_debug_value:I

    invoke-virtual {p0, v6}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->readTuDebug()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lorg/wiiucoop/bo2android/SettingsActivity;->tuDebugLabel(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 407
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getFilesDir()Ljava/io/File;

    move-result-object v6

    invoke-static {v6}, Lorg/wiiucoop/bo2android/T6EnvVars;->load(Ljava/io/File;)Ljava/util/List;

    move-result-object v6

    invoke-static {v6}, Lorg/wiiucoop/bo2android/T6EnvVars;->effective(Ljava/util/List;)Ljava/util/Map;

    move-result-object v6

    .line 408
    .local v6, "env":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    sget v7, Lorg/wiiucoop/bo2android/R$id;->text_env_vars_value:I

    invoke-virtual {p0, v7}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    invoke-interface {v6}, Ljava/util/Map;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_6

    .line 409
    sget v8, Lorg/wiiucoop/bo2android/R$string;->settings_env_none:I

    invoke-virtual {p0, v8}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    goto :goto_3

    .line 410
    :cond_6
    sget v8, Lorg/wiiucoop/bo2android/R$string;->settings_env_count:I

    invoke-interface {v6}, Ljava/util/Map;->size()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, ", "

    invoke-interface {v6}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v10

    filled-new-array {v9, v10}, [Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {p0, v8, v9}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 408
    :goto_3
    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 411
    const-string v7, "resolution"

    const-string v8, "1280x720"

    invoke-static {p0, v7, v8}, Lorg/wiiucoop/bo2android/T6Ui;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 412
    .local v7, "resolution":Ljava/lang/String;
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->resolvedResolution(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "x"

    const-string v10, " \u00d7 "

    invoke-virtual {v8, v9, v10}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    .line 413
    .local v8, "resolved":Ljava/lang/String;
    sget v9, Lorg/wiiucoop/bo2android/R$id;->text_resolution_value:I

    invoke-virtual {p0, v9}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    const-string v10, "native"

    invoke-virtual {v10, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_7

    .line 414
    sget v10, Lorg/wiiucoop/bo2android/R$string;->settings_resolution_native:I

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {p0, v10, v11}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    goto :goto_4

    .line 415
    :cond_7
    const-string v10, "aspect"

    invoke-virtual {v10, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_8

    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->aspectResolution(Landroid/content/Context;)[I

    move-result-object v10

    if-eqz v10, :cond_8

    .line 416
    sget v10, Lorg/wiiucoop/bo2android/R$string;->settings_resolution_aspect:I

    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->displayAspectLabel(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v11

    filled-new-array {v11, v8}, [Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {p0, v10, v11}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    goto :goto_4

    .line 417
    :cond_8
    move-object v10, v8

    .line 413
    :goto_4
    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 418
    const-string v9, "touch_profile"

    const-string v10, "codm"

    invoke-static {p0, v9, v10}, Lorg/wiiucoop/bo2android/T6Ui;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 419
    .local v9, "profile":Ljava/lang/String;
    sget v10, Lorg/wiiucoop/bo2android/R$id;->text_controls_value:I

    invoke-virtual {p0, v10}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    .line 420
    const-string v11, "x360"

    invoke-virtual {v11, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_9

    sget v11, Lorg/wiiucoop/bo2android/R$string;->touch_profile_x360:I

    goto :goto_5

    :cond_9
    sget v11, Lorg/wiiucoop/bo2android/R$string;->touch_profile_codm:I

    .line 419
    :goto_5
    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(I)V

    .line 421
    return-void
.end method

.method private requestAllFilesAccess()V
    .locals 3

    .line 741
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-ge v0, v1, :cond_0

    .line 742
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->revalidateStoredFolder()V

    .line 743
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->refresh()V

    .line 744
    return-void

    .line 748
    :cond_0
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.MANAGE_APP_ALL_FILES_ACCESS_PERMISSION"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 749
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "package:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 750
    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 757
    .end local v0    # "intent":Landroid/content/Intent;
    goto :goto_0

    .line 751
    :catch_0
    move-exception v0

    .line 753
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    :try_start_1
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.MANAGE_ALL_FILES_ACCESS_PERMISSION"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 756
    goto :goto_0

    .line 754
    :catch_1
    move-exception v1

    .line 755
    .local v1, "nested":Landroid/content/ActivityNotFoundException;
    sget v2, Lorg/wiiucoop/bo2android/R$string;->settings_no_files_access_screen:I

    invoke-virtual {p0, v2}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/wiiucoop/bo2android/SettingsActivity;->toast(Ljava/lang/String;)V

    .line 758
    .end local v0    # "e":Landroid/content/ActivityNotFoundException;
    .end local v1    # "nested":Landroid/content/ActivityNotFoundException;
    :goto_0
    return-void
.end method

.method private requestLegacyReadPermission()V
    .locals 3

    .line 692
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_0

    .line 693
    return-void

    .line 696
    :cond_0
    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->checkSelfPermission(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_1

    .line 698
    return-void

    .line 701
    :cond_1
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const/16 v0, 0x3ea

    invoke-virtual {p0, v1, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->requestPermissions([Ljava/lang/String;I)V

    .line 703
    return-void
.end method

.method private revalidateStoredFolder()V
    .locals 5

    .line 718
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6Config;->hasFolder()Z

    move-result v0

    if-nez v0, :cond_0

    .line 719
    return-void

    .line 722
    :cond_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    invoke-static {p0, v0}, Lorg/wiiucoop/bo2android/T6FolderReader;->inspect(Landroid/content/Context;Lorg/wiiucoop/bo2android/T6Config;)Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;

    move-result-object v0

    .line 724
    .local v0, "snapshot":Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;
    iget-boolean v1, v0, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;->rawReadable:Z

    if-eqz v1, :cond_1

    iget-object v1, v0, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;->rawPath:Ljava/lang/String;

    goto :goto_0

    :cond_1
    const-string v1, ""

    .line 725
    .local v1, "path":Ljava/lang/String;
    :goto_0
    iget-boolean v2, v0, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;->rawReadable:Z

    if-nez v2, :cond_2

    iget-object v2, v0, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;->result:Lorg/wiiucoop/bo2android/T6GameData$Result;

    iget-object v2, v2, Lorg/wiiucoop/bo2android/T6GameData$Result;->level:Lorg/wiiucoop/bo2android/T6GameData$Level;

    sget-object v3, Lorg/wiiucoop/bo2android/T6GameData$Level;->FAIL:Lorg/wiiucoop/bo2android/T6GameData$Level;

    if-eq v2, v3, :cond_2

    .line 726
    const-string v2, "WARN"

    goto :goto_1

    .line 727
    :cond_2
    iget-object v2, v0, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;->result:Lorg/wiiucoop/bo2android/T6GameData$Result;

    iget-object v2, v2, Lorg/wiiucoop/bo2android/T6GameData$Result;->level:Lorg/wiiucoop/bo2android/T6GameData$Level;

    invoke-virtual {v2}, Lorg/wiiucoop/bo2android/T6GameData$Level;->name()Ljava/lang/String;

    move-result-object v2

    :goto_1
    nop

    .line 728
    .local v2, "state":Ljava/lang/String;
    invoke-static {p0, v0}, Lorg/wiiucoop/bo2android/T6FolderReader;->describe(Landroid/content/Context;Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;)Ljava/lang/String;

    move-result-object v3

    .line 730
    .local v3, "detail":Ljava/lang/String;
    iget-object v4, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v4, v4, Lorg/wiiucoop/bo2android/T6Config;->gameDirPath:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    iget-object v4, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v4, v4, Lorg/wiiucoop/bo2android/T6Config;->gameDirState:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    iget-object v4, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v4, v4, Lorg/wiiucoop/bo2android/T6Config;->gameDirDetail:Ljava/lang/String;

    .line 731
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 732
    :cond_3
    new-instance v4, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda8;

    invoke-direct {v4, v1, v2, v3}, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda8;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v4}, Lorg/wiiucoop/bo2android/SettingsActivity;->write(Ljava/util/function/Consumer;)V

    .line 738
    :cond_4
    return-void
.end method

.method private savePlayerName(Ljava/lang/String;)V
    .locals 4
    .param p1, "raw"    # Ljava/lang/String;

    .line 527
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v0, v0, Lorg/wiiucoop/bo2android/T6Config;->gameDirUri:Ljava/lang/String;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6Config;->gameDirDisplay:Ljava/lang/String;

    invoke-static {p0, v0, v1}, Lorg/wiiucoop/bo2android/T6SafStore;->forTree(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6SafStore;

    move-result-object v0

    .line 528
    .local v0, "store":Lorg/wiiucoop/bo2android/T6SafStore;
    invoke-static {v0, p1}, Lorg/wiiucoop/bo2android/T6PlayerName;->save(Lorg/wiiucoop/bo2android/T6PlayerName$Store;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6PlayerName$Result;

    move-result-object v1

    .line 530
    .local v1, "result":Lorg/wiiucoop/bo2android/T6PlayerName$Result;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "playername: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v1, Lorg/wiiucoop/bo2android/T6PlayerName$Result;->message:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "t6android"

    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 531
    iget-object v2, v1, Lorg/wiiucoop/bo2android/T6PlayerName$Result;->outcome:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    invoke-direct {p0, v2}, Lorg/wiiucoop/bo2android/SettingsActivity;->playerNameText(Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/wiiucoop/bo2android/SettingsActivity;->toast(Ljava/lang/String;)V

    .line 533
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->readStoredName()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->playerName:Ljava/lang/String;

    .line 534
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->refresh()V

    .line 535
    return-void
.end method

.method private setText(ILjava/lang/String;)V
    .locals 2
    .param p1, "viewId"    # I
    .param p2, "value"    # Ljava/lang/String;

    .line 829
    invoke-virtual {p0, p1}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 831
    .local v0, "view":Landroid/widget/TextView;
    if-eqz v0, :cond_0

    .line 832
    invoke-static {p2}, Lorg/wiiucoop/bo2android/T6DeviceInfo;->orUnavailable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 834
    :cond_0
    return-void
.end method

.method private toast(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .line 912
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 913
    return-void
.end method

.method private tuDebugFile()Ljava/io/File;
    .locals 3

    .line 236
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "vulkan_driver_options.cfg"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private tuDebugLabel(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "flags"    # Ljava/lang/String;

    .line 267
    if-nez p1, :cond_0

    sget v0, Lorg/wiiucoop/bo2android/R$string;->settings_tu_debug_auto:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 268
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    sget v0, Lorg/wiiucoop/bo2android/R$string;->settings_tu_debug_none:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 269
    :cond_1
    return-object p1
.end method

.method private write(Ljava/util/function/Consumer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Lorg/wiiucoop/bo2android/T6Config;",
            ">;)V"
        }
    .end annotation

    .line 905
    .local p1, "change":Ljava/util/function/Consumer;, "Ljava/util/function/Consumer<Lorg/wiiucoop/bo2android/T6Config;>;"
    :try_start_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->store:Lorg/wiiucoop/bo2android/T6ConfigStore;

    invoke-virtual {v0, p1}, Lorg/wiiucoop/bo2android/T6ConfigStore;->update(Ljava/util/function/Consumer;)Lorg/wiiucoop/bo2android/T6Config;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 908
    goto :goto_0

    .line 906
    :catch_0
    move-exception v0

    .line 907
    .local v0, "e":Ljava/io/IOException;
    sget v1, Lorg/wiiucoop/bo2android/R$string;->menu_config_write_failed:I

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->toast(Ljava/lang/String;)V

    .line 909
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    return-void
.end method

.method private writeTuDebug(Ljava/lang/String;)V
    .locals 5
    .param p1, "flags"    # Ljava/lang/String;

    .line 252
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->tuDebugFile()Ljava/io/File;

    move-result-object v0

    .line 253
    .local v0, "f":Ljava/io/File;
    const-string v1, "t6android"

    if-nez p1, :cond_1

    .line 254
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v2

    if-nez v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "settings: could not remove "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 255
    :cond_0
    const-string v2, "settings: TU_DEBUG automatic"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 256
    return-void

    .line 258
    :cond_1
    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 259
    .local v2, "out":Ljava/io/FileOutputStream;
    :try_start_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "TU_DEBUG="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/FileOutputStream;->write([B)V

    .line 260
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "settings: TU_DEBUG="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 261
    :try_start_2
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 263
    .end local v2    # "out":Ljava/io/FileOutputStream;
    goto :goto_1

    .line 258
    .restart local v2    # "out":Ljava/io/FileOutputStream;
    :catchall_0
    move-exception v3

    :try_start_3
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v4

    :try_start_4
    invoke-virtual {v3, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "f":Ljava/io/File;
    .end local p1    # "flags":Ljava/lang/String;
    :goto_0
    throw v3
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 261
    .end local v2    # "out":Ljava/io/FileOutputStream;
    .restart local v0    # "f":Ljava/io/File;
    .restart local p1    # "flags":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 262
    .local v2, "e":Ljava/io/IOException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "settings: TU_DEBUG not saved: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    .end local v2    # "e":Ljava/io/IOException;
    :goto_1
    return-void
.end method


# virtual methods
.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 1
    .param p1, "base"    # Landroid/content/Context;

    .line 49
    invoke-static {p1}, Lorg/wiiucoop/bo2android/T6Ui;->wrapLocale(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/app/Activity;->attachBaseContext(Landroid/content/Context;)V

    .line 50
    return-void
.end method

.method synthetic lambda$bindSwitch$1$org-wiiucoop-bo2android-SettingsActivity(Ljava/lang/String;Landroid/widget/CompoundButton;Z)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "button"    # Landroid/widget/CompoundButton;
    .param p3, "checked"    # Z

    .line 186
    invoke-static {p0, p1, p3}, Lorg/wiiucoop/bo2android/T6Ui;->setBool(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 187
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "settings: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "t6android"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    return-void
.end method

.method synthetic lambda$chooseDxvk$10$org-wiiucoop-bo2android-SettingsActivity(Lorg/wiiucoop/bo2android/T6DxvkStore;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "store"    # Lorg/wiiucoop/bo2android/T6DxvkStore;
    .param p2, "current"    # Ljava/lang/String;
    .param p3, "d"    # Landroid/content/DialogInterface;
    .param p4, "which"    # I

    .line 604
    invoke-virtual {p1, p2}, Lorg/wiiucoop/bo2android/T6DxvkStore;->remove(Ljava/lang/String;)Z

    .line 605
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "settings: dxvk removed "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "; the next start uses the APK\'s DXVK"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "t6android"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 606
    sget v0, Lorg/wiiucoop/bo2android/R$string;->settings_dxvk_restart:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->toast(Ljava/lang/String;)V

    .line 607
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->refreshOptionsSection()V

    .line 608
    return-void
.end method

.method synthetic lambda$chooseDxvk$9$org-wiiucoop-bo2android-SettingsActivity(Lorg/wiiucoop/bo2android/T6DxvkStore;[Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "store"    # Lorg/wiiucoop/bo2android/T6DxvkStore;
    .param p2, "ids"    # [Ljava/lang/String;
    .param p3, "current"    # Ljava/lang/String;
    .param p4, "d"    # Landroid/content/DialogInterface;
    .param p5, "which"    # I

    .line 594
    invoke-interface {p4}, Landroid/content/DialogInterface;->dismiss()V

    .line 595
    aget-object v0, p2, p5

    invoke-virtual {p1, v0}, Lorg/wiiucoop/bo2android/T6DxvkStore;->select(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 596
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "settings: dxvk selected for the next start: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    aget-object v1, p2, p5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "t6android"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 597
    aget-object v0, p2, p5

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    sget v0, Lorg/wiiucoop/bo2android/R$string;->settings_dxvk_restart:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->toast(Ljava/lang/String;)V

    .line 599
    :cond_0
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->refreshOptionsSection()V

    .line 600
    return-void
.end method

.method synthetic lambda$chooseLanguage$2$org-wiiucoop-bo2android-SettingsActivity(ILandroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "current"    # I
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .line 217
    invoke-interface {p2}, Landroid/content/DialogInterface;->dismiss()V

    .line 218
    if-ne p3, p1, :cond_0

    return-void

    .line 219
    :cond_0
    sget-object v0, Lorg/wiiucoop/bo2android/SettingsActivity;->LANGUAGE_TAGS:[Ljava/lang/String;

    aget-object v0, v0, p3

    const-string v1, "language"

    invoke-static {p0, v1, v0}, Lorg/wiiucoop/bo2android/T6Ui;->setString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "settings: language="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lorg/wiiucoop/bo2android/SettingsActivity;->LANGUAGE_TAGS:[Ljava/lang/String;

    aget-object v1, v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "t6android"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->recreate()V

    .line 222
    return-void
.end method

.method synthetic lambda$chooseResolution$6$org-wiiucoop-bo2android-SettingsActivity([Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "values"    # [Ljava/lang/String;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .line 336
    invoke-interface {p2}, Landroid/content/DialogInterface;->dismiss()V

    .line 337
    const-string v0, "resolution"

    aget-object v1, p1, p3

    invoke-static {p0, v0, v1}, Lorg/wiiucoop/bo2android/T6Ui;->setString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 338
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "settings: resolution="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    aget-object v1, p1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "t6android"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 339
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->refreshOptionsSection()V

    .line 340
    return-void
.end method

.method synthetic lambda$chooseTheme$7$org-wiiucoop-bo2android-SettingsActivity(ILandroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "current"    # I
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .line 354
    invoke-interface {p2}, Landroid/content/DialogInterface;->dismiss()V

    .line 355
    if-ne p3, p1, :cond_0

    return-void

    .line 356
    :cond_0
    sget-object v0, Lorg/wiiucoop/bo2android/SettingsActivity;->THEMES:[Ljava/lang/String;

    aget-object v0, v0, p3

    const-string v1, "theme"

    invoke-static {p0, v1, v0}, Lorg/wiiucoop/bo2android/T6Ui;->setString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 357
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "settings: theme="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lorg/wiiucoop/bo2android/SettingsActivity;->THEMES:[Ljava/lang/String;

    aget-object v1, v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "t6android"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 358
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->recreate()V

    .line 359
    return-void
.end method

.method synthetic lambda$chooseTuDebug$4$org-wiiucoop-bo2android-SettingsActivity([ZLandroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "checked"    # [Z
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "w"    # I

    .line 285
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 286
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    sget-object v2, Lorg/wiiucoop/bo2android/SettingsActivity;->TU_FLAGS:[Ljava/lang/String;

    array-length v2, v2

    if-ge v1, v2, :cond_2

    .line 287
    aget-boolean v2, p1, v1

    if-nez v2, :cond_0

    goto :goto_1

    .line 288
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_1

    const/16 v2, 0x2c

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 289
    :cond_1
    sget-object v2, Lorg/wiiucoop/bo2android/SettingsActivity;->TU_FLAGS:[Ljava/lang/String;

    aget-object v2, v2, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 291
    .end local v1    # "i":I
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->writeTuDebug(Ljava/lang/String;)V

    .line 292
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->refreshOptionsSection()V

    .line 293
    return-void
.end method

.method synthetic lambda$chooseTuDebug$5$org-wiiucoop-bo2android-SettingsActivity(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "w"    # I

    .line 295
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->writeTuDebug(Ljava/lang/String;)V

    .line 296
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->refreshOptionsSection()V

    .line 297
    return-void
.end method

.method synthetic lambda$editPlayerName$8$org-wiiucoop-bo2android-SettingsActivity(Landroid/widget/EditText;Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "input"    # Landroid/widget/EditText;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .line 516
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->savePlayerName(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$kennelCheckAndInstall$15$org-wiiucoop-bo2android-SettingsActivity(Ljava/lang/String;Ljava/lang/String;JJ)V
    .locals 3
    .param p1, "size"    # Ljava/lang/String;
    .param p2, "what"    # Ljava/lang/String;
    .param p3, "done"    # J
    .param p5, "total"    # J

    .line 970
    sget v0, Lorg/wiiucoop/bo2android/R$string;->kennel_progress:I

    .line 971
    const-wide/16 v1, 0x0

    cmp-long v1, p5, v1

    if-lez v1, :cond_0

    const-wide/16 v1, 0x64

    mul-long/2addr v1, p3

    div-long/2addr v1, p5

    long-to-int v1, v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1, p1}, [Ljava/lang/Object;

    move-result-object v1

    .line 970
    invoke-virtual {p0, v0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->kennelStatus(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$kennelCheckAndInstall$16$org-wiiucoop-bo2android-SettingsActivity(Ljava/io/File;)V
    .locals 13
    .param p1, "gameDir"    # Ljava/io/File;

    .line 957
    const-string v0, "kennel_version"

    const-string v1, "t6_ui"

    const-string v2, "t6android"

    const/4 v3, 0x0

    :try_start_0
    new-instance v4, Lorg/wiiucoop/bo2android/T6Updater;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getFilesDir()Ljava/io/File;

    move-result-object v5

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getCacheDir()Ljava/io/File;

    move-result-object v6

    const/16 v7, 0x19

    invoke-direct {v4, v5, v6, v7}, Lorg/wiiucoop/bo2android/T6Updater;-><init>(Ljava/io/File;Ljava/io/File;I)V

    .line 958
    .local v4, "updater":Lorg/wiiucoop/bo2android/T6Updater;
    invoke-virtual {v4}, Lorg/wiiucoop/bo2android/T6Updater;->kennelManifestText()Ljava/lang/String;

    move-result-object v5

    .line 959
    .local v5, "text":Ljava/lang/String;
    invoke-static {v5}, Lorg/wiiucoop/bo2android/T6KennelPackage;->parse(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;

    move-result-object v6

    .line 961
    .local v6, "m":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    new-instance v7, Ljava/io/File;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getFilesDir()Ljava/io/File;

    move-result-object v8

    const-string v9, "kennel.json"

    invoke-direct {v7, v8, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object v7

    sget-object v8, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 962
    invoke-virtual {v5, v8}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v8

    new-array v9, v3, [Ljava/nio/file/OpenOption;

    .line 961
    invoke-static {v7, v8, v9}, Ljava/nio/file/Files;->write(Ljava/nio/file/Path;[B[Ljava/nio/file/OpenOption;)Ljava/nio/file/Path;

    .line 963
    const/4 v7, 0x4

    invoke-virtual {p0, v1, v7}, Lorg/wiiucoop/bo2android/SettingsActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v8

    const/4 v9, -0x1

    invoke-interface {v8, v0, v9}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v8

    .line 964
    .local v8, "installed":I
    invoke-static {p1, v8, v6}, Lorg/wiiucoop/bo2android/T6KennelPackage;->state(Ljava/io/File;ILorg/wiiucoop/bo2android/T6KennelPackage$Manifest;)Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    move-result-object v9

    .line 965
    .local v9, "st":Lorg/wiiucoop/bo2android/T6KennelPackage$State;
    iget-wide v10, v6, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;->size:J

    invoke-static {p0, v10, v11}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v10

    .line 966
    .local v10, "size":Ljava/lang/String;
    sget-object v11, Lorg/wiiucoop/bo2android/T6KennelPackage$State;->INSTALLED:Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    if-ne v9, v11, :cond_0

    .line 967
    sget v0, Lorg/wiiucoop/bo2android/R$string;->kennel_state_installed:I

    iget v1, v6, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;->version:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->kennelStatus(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 982
    iput-boolean v3, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->kennelBusy:Z

    .line 968
    return-void

    .line 970
    :cond_0
    :try_start_1
    new-instance v11, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda0;

    invoke-direct {v11, p0, v10}, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda0;-><init>(Lorg/wiiucoop/bo2android/SettingsActivity;Ljava/lang/String;)V

    invoke-virtual {v4, v6, v11}, Lorg/wiiucoop/bo2android/T6Updater;->downloadKennel(Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;Lorg/wiiucoop/bo2android/T6Updater$Progress;)Ljava/io/File;

    move-result-object v11

    .line 972
    .local v11, "zip":Ljava/io/File;
    sget v12, Lorg/wiiucoop/bo2android/R$string;->kennel_installing:I

    invoke-virtual {p0, v12}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-direct {p0, v12}, Lorg/wiiucoop/bo2android/SettingsActivity;->kennelStatus(Ljava/lang/String;)V

    .line 973
    invoke-static {v11, p1, v6}, Lorg/wiiucoop/bo2android/T6KennelPackage;->install(Ljava/io/File;Ljava/io/File;Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;)V

    .line 974
    invoke-virtual {p0, v1, v7}, Lorg/wiiucoop/bo2android/SettingsActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    iget v7, v6, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;->version:I

    invoke-interface {v1, v0, v7}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 975
    invoke-virtual {v11}, Ljava/io/File;->delete()Z

    .line 976
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "kennel: version "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, v6, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;->version:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " installed in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 977
    sget v0, Lorg/wiiucoop/bo2android/R$string;->kennel_state_installed:I

    iget v1, v6, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;->version:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->kennelStatus(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v4    # "updater":Lorg/wiiucoop/bo2android/T6Updater;
    .end local v5    # "text":Ljava/lang/String;
    .end local v6    # "m":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    .end local v8    # "installed":I
    .end local v9    # "st":Lorg/wiiucoop/bo2android/T6KennelPackage$State;
    .end local v10    # "size":Ljava/lang/String;
    .end local v11    # "zip":Ljava/io/File;
    goto :goto_0

    .line 982
    :catchall_0
    move-exception v0

    goto :goto_1

    .line 978
    :catch_0
    move-exception v0

    .line 979
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "kennel: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 980
    sget v1, Lorg/wiiucoop/bo2android/R$string;->kennel_failed:I

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->kennelStatus(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 982
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    iput-boolean v3, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->kennelBusy:Z

    .line 983
    nop

    .line 984
    return-void

    .line 982
    :goto_1
    iput-boolean v3, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->kennelBusy:Z

    .line 983
    throw v0
.end method

.method synthetic lambda$kennelStatus$14$org-wiiucoop-bo2android-SettingsActivity(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .line 940
    sget v0, Lorg/wiiucoop/bo2android/R$id;->text_kennel_value:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method synthetic lambda$onCreate$0$org-wiiucoop-bo2android-SettingsActivity()V
    .locals 2

    .line 98
    sget v0, Lorg/wiiucoop/bo2android/R$id;->row_player_name:I

    const-string v1, "row_player_name"

    invoke-direct {p0, v0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->logRowGeometry(ILjava/lang/String;)V

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .line 615
    const/16 v0, 0x3e9

    if-eq p1, v0, :cond_0

    .line 616
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 617
    return-void

    .line 620
    :cond_0
    const/4 v0, -0x1

    if-ne p2, v0, :cond_3

    if-eqz p3, :cond_3

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 627
    :cond_1
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    .line 628
    .local v0, "treeUri":Landroid/net/Uri;
    invoke-virtual {p3}, Landroid/content/Intent;->getFlags()I

    move-result v1

    invoke-static {p0, v0, v1}, Lorg/wiiucoop/bo2android/T6TreeAccess;->takePersistableReadPermission(Landroid/content/Context;Landroid/net/Uri;I)Z

    move-result v1

    .line 630
    .local v1, "persisted":Z
    if-nez v1, :cond_2

    .line 633
    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6TreeAccess;->displayNameFor(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    .line 634
    .local v2, "display":Ljava/lang/String;
    new-instance v3, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda16;

    invoke-direct {v3, v2}, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda16;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v3}, Lorg/wiiucoop/bo2android/SettingsActivity;->write(Ljava/util/function/Consumer;)V

    .line 642
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->refresh()V

    .line 643
    return-void

    .line 646
    .end local v2    # "display":Ljava/lang/String;
    :cond_2
    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->applyFolder(Landroid/net/Uri;)V

    .line 647
    return-void

    .line 623
    .end local v0    # "treeUri":Landroid/net/Uri;
    .end local v1    # "persisted":Z
    :cond_3
    :goto_0
    sget v0, Lorg/wiiucoop/bo2android/R$string;->folder_picker_cancelled:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->toast(Ljava/lang/String;)V

    .line 624
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .line 450
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 452
    .local v0, "id":I
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_back:I

    if-ne v0, v1, :cond_0

    .line 453
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->finish()V

    goto/16 :goto_0

    .line 454
    :cond_0
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_pick_folder:I

    if-ne v0, v1, :cond_1

    .line 455
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->pickFolder()V

    goto/16 :goto_0

    .line 456
    :cond_1
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_grant_access:I

    if-ne v0, v1, :cond_2

    .line 457
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->requestAllFilesAccess()V

    goto/16 :goto_0

    .line 458
    :cond_2
    sget v1, Lorg/wiiucoop/bo2android/R$id;->row_player_name:I

    if-ne v0, v1, :cond_3

    .line 459
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->editPlayerName()V

    goto/16 :goto_0

    .line 460
    :cond_3
    sget v1, Lorg/wiiucoop/bo2android/R$id;->row_tu_debug:I

    if-ne v0, v1, :cond_4

    .line 461
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->chooseTuDebug()V

    goto/16 :goto_0

    .line 462
    :cond_4
    sget v1, Lorg/wiiucoop/bo2android/R$id;->row_env_vars:I

    if-ne v0, v1, :cond_5

    .line 463
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lorg/wiiucoop/bo2android/EnvVarsActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 464
    :cond_5
    sget v1, Lorg/wiiucoop/bo2android/R$id;->row_kennel:I

    if-ne v0, v1, :cond_6

    .line 465
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->kennelCheckAndInstall()V

    goto :goto_0

    .line 466
    :cond_6
    sget v1, Lorg/wiiucoop/bo2android/R$id;->row_driver:I

    if-ne v0, v1, :cond_7

    .line 467
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 468
    :cond_7
    sget v1, Lorg/wiiucoop/bo2android/R$id;->row_dxvk:I

    if-ne v0, v1, :cond_8

    .line 469
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->chooseDxvk()V

    goto :goto_0

    .line 470
    :cond_8
    sget v1, Lorg/wiiucoop/bo2android/R$id;->row_controls:I

    if-ne v0, v1, :cond_9

    .line 471
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lorg/wiiucoop/bo2android/TouchControlsActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 472
    :cond_9
    sget v1, Lorg/wiiucoop/bo2android/R$id;->row_touch_mode:I

    if-ne v0, v1, :cond_a

    .line 473
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->cycleTouchMode()V

    goto :goto_0

    .line 474
    :cond_a
    sget v1, Lorg/wiiucoop/bo2android/R$id;->row_theme:I

    if-ne v0, v1, :cond_b

    .line 475
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->chooseTheme()V

    goto :goto_0

    .line 476
    :cond_b
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_discord:I

    if-ne v0, v1, :cond_c

    .line 477
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->openDiscord()V

    goto :goto_0

    .line 478
    :cond_c
    sget v1, Lorg/wiiucoop/bo2android/R$id;->row_language:I

    if-ne v0, v1, :cond_d

    .line 479
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->chooseLanguage()V

    goto :goto_0

    .line 480
    :cond_d
    sget v1, Lorg/wiiucoop/bo2android/R$id;->row_resolution:I

    if-ne v0, v1, :cond_e

    .line 481
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->chooseResolution()V

    .line 483
    :cond_e
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 79
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->applyTheme(Landroid/app/Activity;)V

    .line 80
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 81
    sget v0, Lorg/wiiucoop/bo2android/R$layout;->activity_settings:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->setContentView(I)V

    .line 83
    new-instance v0, Lorg/wiiucoop/bo2android/T6ConfigStore;

    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "t6_config.ini"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/wiiucoop/bo2android/T6ConfigStore;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->store:Lorg/wiiucoop/bo2android/T6ConfigStore;

    .line 84
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->store:Lorg/wiiucoop/bo2android/T6ConfigStore;

    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6ConfigStore;->load()Lorg/wiiucoop/bo2android/T6Config;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    .line 86
    sget v0, Lorg/wiiucoop/bo2android/R$id;->text_folder_value:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->folderValue:Landroid/widget/TextView;

    .line 87
    sget v0, Lorg/wiiucoop/bo2android/R$id;->text_folder_detail:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->folderDetail:Landroid/widget/TextView;

    .line 88
    sget v0, Lorg/wiiucoop/bo2android/R$id;->button_pick_folder:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->pickButton:Landroid/widget/Button;

    .line 89
    sget v0, Lorg/wiiucoop/bo2android/R$id;->button_grant_access:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->grantButton:Landroid/widget/Button;

    .line 90
    sget v0, Lorg/wiiucoop/bo2android/R$id;->text_player_name_value:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->nameValue:Landroid/widget/TextView;

    .line 91
    sget v0, Lorg/wiiucoop/bo2android/R$id;->text_player_name_detail:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->nameDetail:Landroid/widget/TextView;

    .line 92
    sget v0, Lorg/wiiucoop/bo2android/R$id;->text_footer:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->footer:Landroid/widget/TextView;

    .line 94
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6DeviceInfo;->read(Landroid/content/Context;)Lorg/wiiucoop/bo2android/T6DeviceInfo$Info;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->deviceInfo:Lorg/wiiucoop/bo2android/T6DeviceInfo$Info;

    .line 98
    sget v0, Lorg/wiiucoop/bo2android/R$id;->row_player_name:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0}, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda6;-><init>(Lorg/wiiucoop/bo2android/SettingsActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 101
    sget v0, Lorg/wiiucoop/bo2android/R$id;->button_back:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->pickButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 103
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->grantButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 104
    sget v0, Lorg/wiiucoop/bo2android/R$id;->row_player_name:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 105
    sget v0, Lorg/wiiucoop/bo2android/R$id;->row_driver:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 106
    sget v0, Lorg/wiiucoop/bo2android/R$id;->row_dxvk:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 107
    sget v0, Lorg/wiiucoop/bo2android/R$id;->row_tu_debug:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 108
    sget v0, Lorg/wiiucoop/bo2android/R$id;->row_env_vars:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 109
    sget v0, Lorg/wiiucoop/bo2android/R$id;->row_kennel:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    sget v0, Lorg/wiiucoop/bo2android/R$id;->row_controls:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 111
    sget v0, Lorg/wiiucoop/bo2android/R$id;->row_touch_mode:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 112
    sget v0, Lorg/wiiucoop/bo2android/R$id;->row_theme:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 113
    sget v0, Lorg/wiiucoop/bo2android/R$id;->button_discord:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 114
    sget v0, Lorg/wiiucoop/bo2android/R$id;->row_language:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 115
    sget v0, Lorg/wiiucoop/bo2android/R$id;->row_resolution:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 117
    sget v0, Lorg/wiiucoop/bo2android/R$id;->switch_show_fps:I

    const-string v1, "show_fps"

    invoke-direct {p0, v0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->bindSwitch(ILjava/lang/String;)V

    .line 118
    sget v0, Lorg/wiiucoop/bo2android/R$id;->switch_touch_aim_drag:I

    const-string v1, "touch_aim_drag"

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lorg/wiiucoop/bo2android/SettingsActivity;->bindSwitch(ILjava/lang/String;Z)V

    .line 119
    sget v0, Lorg/wiiucoop/bo2android/R$id;->switch_touch_stick_sprint:I

    const-string v1, "touch_stick_sprint"

    invoke-direct {p0, v0, v1, v2}, Lorg/wiiucoop/bo2android/SettingsActivity;->bindSwitch(ILjava/lang/String;Z)V

    .line 120
    sget v0, Lorg/wiiucoop/bo2android/R$id;->switch_touch_ads_fire:I

    const-string v1, "touch_ads_fire"

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lorg/wiiucoop/bo2android/SettingsActivity;->bindSwitch(ILjava/lang/String;Z)V

    .line 121
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->bindSprintThreshold()V

    .line 123
    const-string v0, "input"

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/input/InputManager;

    iput-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->inputManager:Landroid/hardware/input/InputManager;

    .line 125
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->refresh()V

    .line 126
    return-void
.end method

.method protected onPause()V
    .locals 2

    .line 142
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 143
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->inputManager:Landroid/hardware/input/InputManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->inputManager:Landroid/hardware/input/InputManager;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->controllerListener:Landroid/hardware/input/InputManager$InputDeviceListener;

    invoke-virtual {v0, v1}, Landroid/hardware/input/InputManager;->unregisterInputDeviceListener(Landroid/hardware/input/InputManager$InputDeviceListener;)V

    .line 144
    :cond_0
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "results"    # [I

    .line 707
    const/16 v0, 0x3ea

    if-ne p1, v0, :cond_0

    .line 708
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->revalidateStoredFolder()V

    .line 709
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->refresh()V

    .line 710
    return-void

    .line 713
    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 714
    return-void
.end method

.method protected onResume()V
    .locals 3

    .line 431
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 432
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->refreshKennelRow()V

    .line 437
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->store:Lorg/wiiucoop/bo2android/T6ConfigStore;

    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6ConfigStore;->load()Lorg/wiiucoop/bo2android/T6Config;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    .line 438
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->revalidateStoredFolder()V

    .line 442
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->readStoredName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->playerName:Ljava/lang/String;

    .line 444
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->inputManager:Landroid/hardware/input/InputManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->inputManager:Landroid/hardware/input/InputManager;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity;->controllerListener:Landroid/hardware/input/InputManager$InputDeviceListener;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/hardware/input/InputManager;->registerInputDeviceListener(Landroid/hardware/input/InputManager$InputDeviceListener;Landroid/os/Handler;)V

    .line 445
    :cond_0
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/SettingsActivity;->refresh()V

    .line 446
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0
    .param p1, "hasFocus"    # Z

    .line 425
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 426
    if-eqz p1, :cond_0

    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->applyImmersive(Landroid/app/Activity;)V

    .line 427
    :cond_0
    return-void
.end method
