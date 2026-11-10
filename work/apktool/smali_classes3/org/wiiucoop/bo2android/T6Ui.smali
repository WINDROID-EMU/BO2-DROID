.class public final Lorg/wiiucoop/bo2android/T6Ui;
.super Ljava/lang/Object;
.source "T6Ui.java"


# static fields
.field public static final ASPECT_BASE_HEIGHT:I = 0x2d0

.field public static final ASPECT_RESOLUTION:Ljava/lang/String; = "aspect"

.field public static final DEFAULT_LANGUAGE:Ljava/lang/String; = "en-US"

.field public static final DEFAULT_RESOLUTION:Ljava/lang/String; = "1280x720"

.field public static final DEFAULT_THEME:Ljava/lang/String; = "orange"

.field public static final DISCORD_URL:Ljava/lang/String; = "https://discord.gg/hGkAYecRg"

.field public static final KEY_LANGUAGE:Ljava/lang/String; = "language"

.field public static final KEY_RESOLUTION:Ljava/lang/String; = "resolution"

.field public static final KEY_SHOW_FPS:Ljava/lang/String; = "show_fps"

.field public static final KEY_THEME:Ljava/lang/String; = "theme"

.field public static final KEY_TOUCH_ADS_FIRE:Ljava/lang/String; = "touch_ads_fire"

.field public static final KEY_TOUCH_AIM_DRAG:Ljava/lang/String; = "touch_aim_drag"

.field public static final KEY_TOUCH_MODE:Ljava/lang/String; = "touch_mode"

.field public static final KEY_TOUCH_PROFILE:Ljava/lang/String; = "touch_profile"

.field public static final KEY_TOUCH_SPRINT_THRESHOLD:Ljava/lang/String; = "touch_sprint_threshold"

.field public static final KEY_TOUCH_STICK_SPRINT:Ljava/lang/String; = "touch_stick_sprint"

.field public static final KEY_TOUCH_SURFACE:Ljava/lang/String; = "touch_surface"

.field public static final NATIVE_RESOLUTION:Ljava/lang/String; = "native"

.field public static final OFFICIAL_APK_URL:Ljava/lang/String; = "https://github.com/SoldadoGhost/T6Requiem-APK/releases"

.field public static final PREFS:Ljava/lang/String; = "t6_ui"

.field static final PREFS_MODE:I = 0x4

.field public static final RESOLUTIONS:[Ljava/lang/String;

.field public static final THEME_BLUE:Ljava/lang/String; = "blue"

.field public static final THEME_ORANGE:Ljava/lang/String; = "orange"

.field public static final THEME_RED:Ljava/lang/String; = "red"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 97
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "960x540"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "1280x720"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "1600x900"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "1920x1080"

    aput-object v2, v0, v1

    sput-object v0, Lorg/wiiucoop/bo2android/T6Ui;->RESOLUTIONS:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    return-void
.end method

.method public static applyImmersive(Landroid/app/Activity;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;

    .line 280
    if-nez p0, :cond_0

    .line 281
    return-void

    .line 284
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 288
    .local v0, "window":Landroid/view/Window;
    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 290
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-lt v1, v2, :cond_2

    .line 291
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setDecorFitsSystemWindows(Z)V

    .line 293
    invoke-virtual {v0}, Landroid/view/Window;->getInsetsController()Landroid/view/WindowInsetsController;

    move-result-object v1

    .line 294
    .local v1, "controller":Landroid/view/WindowInsetsController;
    if-eqz v1, :cond_1

    .line 295
    invoke-static {}, Landroid/view/WindowInsets$Type;->systemBars()I

    move-result v2

    invoke-interface {v1, v2}, Landroid/view/WindowInsetsController;->hide(I)V

    .line 296
    const/4 v2, 0x2

    invoke-interface {v1, v2}, Landroid/view/WindowInsetsController;->setSystemBarsBehavior(I)V

    .line 299
    :cond_1
    return-void

    .line 302
    .end local v1    # "controller":Landroid/view/WindowInsetsController;
    :cond_2
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    const/16 v2, 0x1706

    invoke-virtual {v1, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 309
    return-void
.end method

.method public static applyTheme(Landroid/app/Activity;)V
    .locals 4
    .param p0, "activity"    # Landroid/app/Activity;

    .line 75
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->theme(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 76
    .local v0, "theme":Ljava/lang/String;
    const-string v1, "blue"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget v1, Lorg/wiiucoop/bo2android/R$style;->T6PaletteBlue:I

    goto :goto_0

    .line 77
    :cond_0
    const-string v1, "red"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    sget v1, Lorg/wiiucoop/bo2android/R$style;->T6PaletteRed:I

    goto :goto_0

    :cond_1
    sget v1, Lorg/wiiucoop/bo2android/R$style;->T6PaletteOrange:I

    :goto_0
    nop

    .line 78
    .local v1, "palette":I
    invoke-virtual {p0}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v1, v3}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    .line 79
    return-void
.end method

.method public static aspectResolution(Landroid/content/Context;)[I
    .locals 10
    .param p0, "context"    # Landroid/content/Context;

    .line 135
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->nativeResolution(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6Ui;->parseSize(Ljava/lang/String;)[I

    move-result-object v0

    .line 136
    .local v0, "d":[I
    const/4 v1, 0x0

    if-eqz v0, :cond_2

    const/4 v2, 0x0

    aget v3, v0, v2

    int-to-long v3, v3

    const-wide/16 v5, 0x9

    mul-long/2addr v3, v5

    const/4 v5, 0x1

    aget v6, v0, v5

    int-to-long v6, v6

    const-wide/16 v8, 0x10

    mul-long/2addr v6, v8

    cmp-long v3, v3, v6

    if-gtz v3, :cond_0

    goto :goto_0

    .line 137
    :cond_0
    aget v3, v0, v2

    int-to-float v3, v3

    const/high16 v4, 0x44340000    # 720.0f

    mul-float/2addr v3, v4

    aget v4, v0, v5

    int-to-float v4, v4

    div-float/2addr v3, v4

    const/high16 v4, 0x41000000    # 8.0f

    div-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    mul-int/lit8 v3, v3, 0x8

    .line 138
    .local v3, "w":I
    if-lez v3, :cond_1

    aget v4, v0, v2

    if-gt v3, v4, :cond_1

    const/4 v1, 0x2

    new-array v1, v1, [I

    aput v3, v1, v2

    const/16 v2, 0x2d0

    aput v2, v1, v5

    :cond_1
    return-object v1

    .line 136
    .end local v3    # "w":I
    :cond_2
    :goto_0
    return-object v1
.end method

.method public static debugOverlayEnabled(Landroid/content/Context;)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 34
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "debug_overlay"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    return v0
.end method

.method public static displayAspectLabel(Landroid/content/Context;)Ljava/lang/String;
    .locals 12
    .param p0, "context"    # Landroid/content/Context;

    .line 143
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->nativeResolution(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6Ui;->parseSize(Ljava/lang/String;)[I

    move-result-object v0

    .line 144
    .local v0, "d":[I
    if-nez v0, :cond_0

    const/4 v1, 0x0

    return-object v1

    .line 145
    :cond_0
    const/4 v1, 0x0

    aget v1, v0, v1

    int-to-double v1, v1

    const-wide/high16 v3, 0x4022000000000000L    # 9.0

    mul-double/2addr v1, v3

    const/4 v3, 0x1

    aget v3, v0, v3

    int-to-double v3, v3

    div-double/2addr v1, v3

    .line 146
    .local v1, "ninths":D
    const-wide/high16 v3, 0x4024000000000000L    # 10.0

    mul-double/2addr v3, v1

    invoke-static {v3, v4}, Ljava/lang/Math;->round(D)J

    move-result-wide v3

    .line 147
    .local v3, "tenths":J
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-wide/16 v6, 0xa

    rem-long v8, v3, v6

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-nez v8, :cond_1

    div-long v6, v3, v6

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    :cond_1
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    div-long v9, v3, v6

    invoke-virtual {v8, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ","

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    rem-long v6, v3, v6

    invoke-virtual {v8, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    :goto_0
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":9"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public static engineLaunchEnabled(Landroid/content/Context;)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .line 276
    const/4 v0, 0x1

    return v0
.end method

.method public static firstControllerName(Landroid/content/Context;)Ljava/lang/String;
    .locals 12
    .param p0, "context"    # Landroid/content/Context;

    .line 240
    invoke-static {}, Landroid/view/InputDevice;->getDeviceIds()[I

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_7

    aget v4, v0, v3

    .line 241
    .local v4, "id":I
    invoke-static {v4}, Landroid/view/InputDevice;->getDevice(I)Landroid/view/InputDevice;

    move-result-object v5

    .line 242
    .local v5, "device":Landroid/view/InputDevice;
    if-eqz v5, :cond_6

    invoke-virtual {v5}, Landroid/view/InputDevice;->isVirtual()Z

    move-result v6

    if-eqz v6, :cond_0

    goto :goto_4

    .line 243
    :cond_0
    invoke-virtual {v5}, Landroid/view/InputDevice;->getSources()I

    move-result v6

    .line 244
    .local v6, "sources":I
    const v7, 0x1000010

    and-int v8, v6, v7

    const/4 v9, 0x1

    if-ne v8, v7, :cond_1

    move v7, v9

    goto :goto_1

    :cond_1
    move v7, v2

    .line 245
    .local v7, "sticks":Z
    :goto_1
    and-int/lit16 v8, v6, 0x401

    const/16 v10, 0x401

    if-ne v8, v10, :cond_2

    move v8, v9

    goto :goto_2

    :cond_2
    move v8, v2

    .line 246
    .local v8, "buttons":Z
    :goto_2
    sget v10, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v11, 0x1d

    if-lt v10, v11, :cond_4

    invoke-virtual {v5}, Landroid/view/InputDevice;->isExternal()Z

    move-result v10

    if-eqz v10, :cond_3

    goto :goto_3

    :cond_3
    move v9, v2

    .line 247
    .local v9, "external":Z
    :cond_4
    :goto_3
    if-nez v7, :cond_5

    if-eqz v8, :cond_6

    if-eqz v9, :cond_6

    :cond_5
    invoke-virtual {v5}, Landroid/view/InputDevice;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 240
    .end local v4    # "id":I
    .end local v5    # "device":Landroid/view/InputDevice;
    .end local v6    # "sources":I
    .end local v7    # "sticks":Z
    .end local v8    # "buttons":Z
    .end local v9    # "external":Z
    :cond_6
    :goto_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 249
    :cond_7
    const-string v0, ""

    return-object v0
.end method

.method public static getBool(Landroid/content/Context;Ljava/lang/String;Z)Z
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "fallback"    # Z

    .line 179
    const-string v0, "t6_ui"

    const/4 v1, 0x4

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "fallback"    # Ljava/lang/String;

    .line 187
    const-string v0, "t6_ui"

    const/4 v1, 0x4

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static loadTouchLayout(Landroid/content/Context;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6TouchLayout;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "profile"    # Ljava/lang/String;

    .line 254
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "touch_layout_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lorg/wiiucoop/bo2android/T6Ui;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lorg/wiiucoop/bo2android/T6TouchLayout;->load(Ljava/lang/String;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6TouchLayout;

    move-result-object v0

    return-object v0
.end method

.method public static nativeResolution(Landroid/content/Context;)Ljava/lang/String;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;

    .line 116
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "display"

    .line 117
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/display/DisplayManager;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    move-result-object v1

    .line 118
    .local v1, "display":Landroid/view/Display;
    if-nez v1, :cond_0

    return-object v0

    .line 119
    :cond_0
    invoke-virtual {v1}, Landroid/view/Display;->getMode()Landroid/view/Display$Mode;

    move-result-object v2

    .line 120
    .local v2, "mode":Landroid/view/Display$Mode;
    invoke-virtual {v2}, Landroid/view/Display$Mode;->getPhysicalWidth()I

    move-result v3

    invoke-virtual {v2}, Landroid/view/Display$Mode;->getPhysicalHeight()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 121
    .local v3, "w":I
    invoke-virtual {v2}, Landroid/view/Display$Mode;->getPhysicalWidth()I

    move-result v4

    invoke-virtual {v2}, Landroid/view/Display$Mode;->getPhysicalHeight()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 122
    .local v4, "h":I
    if-lez v3, :cond_1

    if-lez v4, :cond_1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "x"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    return-object v0

    .line 123
    .end local v1    # "display":Landroid/view/Display;
    .end local v2    # "mode":Landroid/view/Display$Mode;
    .end local v3    # "w":I
    .end local v4    # "h":I
    :catch_0
    move-exception v1

    .line 124
    .local v1, "e":Ljava/lang/RuntimeException;
    return-object v0
.end method

.method public static normalizeTheme(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "saved"    # Ljava/lang/String;

    .line 63
    const-string v0, "blue"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "red"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "orange"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    move-object v0, p0

    :cond_1
    return-object v0
.end method

.method static parseSize(Ljava/lang/String;)[I
    .locals 4
    .param p0, "size"    # Ljava/lang/String;

    .line 152
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 153
    :cond_0
    const/16 v1, 0x78

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 154
    .local v1, "x":I
    if-gtz v1, :cond_1

    return-object v0

    .line 156
    :cond_1
    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .local v2, "w":I
    add-int/lit8 v3, v1, 0x1

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 157
    .local v3, "h":I
    if-lez v2, :cond_2

    if-lez v3, :cond_2

    filled-new-array {v2, v3}, [I

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    return-object v0

    .line 158
    .end local v2    # "w":I
    .end local v3    # "h":I
    :catch_0
    move-exception v2

    .line 159
    .local v2, "e":Ljava/lang/NumberFormatException;
    return-object v0
.end method

.method public static resetTouchLayout(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "profile"    # Ljava/lang/String;

    .line 263
    const-string v0, "t6_ui"

    const/4 v1, 0x4

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "touch_layout_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 264
    return-void
.end method

.method public static resolvedResolution(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .line 168
    const-string v0, "resolution"

    const-string v1, "1280x720"

    invoke-static {p0, v0, v1}, Lorg/wiiucoop/bo2android/T6Ui;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 169
    .local v0, "saved":Ljava/lang/String;
    const-string v2, "aspect"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 170
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->aspectResolution(Landroid/content/Context;)[I

    move-result-object v2

    .line 171
    .local v2, "a":[I
    if-eqz v2, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v3, 0x0

    aget v3, v2, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "x"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v3, 0x1

    aget v3, v2, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_0
    return-object v1

    .line 173
    .end local v2    # "a":[I
    :cond_1
    const-string v2, "native"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    return-object v0

    .line 174
    :cond_2
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->nativeResolution(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 175
    .local v2, "n":Ljava/lang/String;
    if-eqz v2, :cond_3

    move-object v1, v2

    :cond_3
    return-object v1
.end method

.method public static saveTouchLayout(Landroid/content/Context;Lorg/wiiucoop/bo2android/T6TouchLayout;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "layout"    # Lorg/wiiucoop/bo2android/T6TouchLayout;

    .line 258
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "touch_layout_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lorg/wiiucoop/bo2android/T6TouchLayout;->profile:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/wiiucoop/bo2android/T6TouchLayout;->serialize()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lorg/wiiucoop/bo2android/T6Ui;->setString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 259
    return-void
.end method

.method public static setBool(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Z

    .line 183
    const-string v0, "t6_ui"

    const/4 v1, 0x4

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 184
    return-void
.end method

.method public static setString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 191
    const-string v0, "t6_ui"

    const/4 v1, 0x4

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 192
    return-void
.end method

.method public static supportedLanguage(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "language"    # Ljava/lang/String;

    .line 205
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 206
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const-string v2, "id"

    const-string v3, "fr"

    const-string v4, "es"

    sparse-switch v1, :sswitch_data_0

    :cond_1
    goto :goto_0

    :sswitch_0
    const-string v1, "pt"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    goto :goto_1

    :sswitch_1
    const-string v1, "in"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x4

    goto :goto_1

    :sswitch_2
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x5

    goto :goto_1

    :sswitch_3
    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x3

    goto :goto_1

    :sswitch_4
    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x2

    goto :goto_1

    :sswitch_5
    const-string v1, "en"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    goto :goto_1

    :goto_0
    const/4 v1, -0x1

    :goto_1
    packed-switch v1, :pswitch_data_0

    .line 213
    return-object v0

    .line 212
    :pswitch_0
    return-object v2

    .line 210
    :pswitch_1
    return-object v3

    .line 209
    :pswitch_2
    return-object v4

    .line 208
    :pswitch_3
    const-string v0, "en-US"

    return-object v0

    .line 207
    :pswitch_4
    const-string v0, "pt-BR"

    return-object v0

    :sswitch_data_0
    .sparse-switch
        0xca9 -> :sswitch_5
        0xcae -> :sswitch_4
        0xccc -> :sswitch_3
        0xd1b -> :sswitch_2
        0xd25 -> :sswitch_1
        0xe04 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static theme(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .line 58
    const-string v0, "theme"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lorg/wiiucoop/bo2android/T6Ui;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6Ui;->normalizeTheme(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static themeColor(Landroid/content/Context;I)I
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "attr"    # I

    .line 83
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 84
    .local v0, "value":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 85
    iget v1, v0, Landroid/util/TypedValue;->data:I

    return v1
.end method

.method public static touchProfile(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 267
    const-string v0, "touch_profile"

    const-string v1, "codm"

    invoke-static {p0, v0, v1}, Lorg/wiiucoop/bo2android/T6Ui;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "x360"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 268
    move-object v1, v2

    goto :goto_0

    :cond_0
    nop

    .line 267
    :goto_0
    return-object v1
.end method

.method public static wrapLocale(Landroid/content/Context;)Landroid/content/Context;
    .locals 4
    .param p0, "base"    # Landroid/content/Context;

    .line 218
    const-string v0, "language"

    const-string v1, "en-US"

    invoke-static {p0, v0, v1}, Lorg/wiiucoop/bo2android/T6Ui;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 219
    .local v0, "tag":Ljava/lang/String;
    const-string v1, "system"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 220
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Configuration;->getLocales()Landroid/os/LocaleList;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/LocaleList;->get(I)Ljava/util/Locale;

    move-result-object v1

    .line 221
    .local v1, "device":Ljava/util/Locale;
    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/wiiucoop/bo2android/T6Ui;->supportedLanguage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 222
    if-nez v0, :cond_0

    const-string v0, "en-US"

    .line 224
    .end local v1    # "device":Ljava/util/Locale;
    :cond_0
    invoke-static {v0}, Ljava/util/Locale;->forLanguageTag(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v1

    .line 225
    .local v1, "locale":Ljava/util/Locale;
    new-instance v2, Landroid/content/res/Configuration;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .line 226
    .local v2, "config":Landroid/content/res/Configuration;
    invoke-virtual {v2, v1}, Landroid/content/res/Configuration;->setLocale(Ljava/util/Locale;)V

    .line 227
    invoke-virtual {v2, v1}, Landroid/content/res/Configuration;->setLayoutDirection(Ljava/util/Locale;)V

    .line 228
    invoke-virtual {p0, v2}, Landroid/content/Context;->createConfigurationContext(Landroid/content/res/Configuration;)Landroid/content/Context;

    move-result-object v3

    return-object v3
.end method
