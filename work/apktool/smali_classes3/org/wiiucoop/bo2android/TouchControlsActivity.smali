.class public final Lorg/wiiucoop/bo2android/TouchControlsActivity;
.super Landroid/app/Activity;
.source "TouchControlsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "t6android"


# instance fields
.field private codm:Lorg/wiiucoop/bo2android/T6TouchLayout;

.field private overlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

.field private profile:Ljava/lang/String;

.field private x360:Lorg/wiiucoop/bo2android/T6TouchLayout;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private current()Lorg/wiiucoop/bo2android/T6TouchLayout;
    .locals 2

    .line 107
    const-string v0, "x360"

    iget-object v1, p0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->profile:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->x360:Lorg/wiiucoop/bo2android/T6TouchLayout;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->codm:Lorg/wiiucoop/bo2android/T6TouchLayout;

    :goto_0
    return-object v0
.end method

.method private fitOverlay(II)V
    .locals 9
    .param p1, "areaWidth"    # I
    .param p2, "areaHeight"    # I

    .line 93
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->gameSurface()[I

    move-result-object v0

    .line 94
    .local v0, "game":[I
    const/4 v1, 0x0

    aget v2, v0, v1

    const/4 v3, 0x1

    aget v4, v0, v3

    invoke-static {p1, p2, v2, v4}, Lorg/wiiucoop/bo2android/T6TouchLayout;->fitSurface(IIII)[I

    move-result-object v2

    .line 95
    .local v2, "r":[I
    iget-object v4, p0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->overlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    invoke-virtual {v4}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 96
    .local v4, "p":Landroid/widget/FrameLayout$LayoutParams;
    iget v5, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    aget v6, v2, v1

    const/4 v7, 0x3

    const/4 v8, 0x2

    if-ne v5, v6, :cond_0

    iget v5, v4, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    aget v6, v2, v3

    if-ne v5, v6, :cond_0

    iget v5, v4, Landroid/widget/FrameLayout$LayoutParams;->width:I

    aget v6, v2, v8

    if-ne v5, v6, :cond_0

    iget v5, v4, Landroid/widget/FrameLayout$LayoutParams;->height:I

    aget v6, v2, v7

    if-ne v5, v6, :cond_0

    return-void

    .line 97
    :cond_0
    aget v5, v2, v1

    iput v5, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 98
    aget v5, v2, v3

    iput v5, v4, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 99
    aget v5, v2, v8

    iput v5, v4, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 100
    aget v5, v2, v7

    iput v5, v4, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 101
    iget-object v5, p0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->overlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    invoke-virtual {v5, v4}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 102
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "controls editor: surface "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget v6, v2, v8

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "x"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget v7, v2, v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " at "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget v7, v2, v1

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, ","

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget v7, v2, v3

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " = the game surface "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget v1, v0, v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget v3, v0, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " scaled"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v3, "t6android"

    invoke-static {v3, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    return-void
.end method

.method private gameSurface()[I
    .locals 6

    .line 77
    const-string v0, "touch_surface"

    const-string v1, ""

    invoke-static {p0, v0, v1}, Lorg/wiiucoop/bo2android/T6Ui;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 78
    .local v0, "saved":Ljava/lang/String;
    const/16 v1, 0x78

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 79
    .local v1, "x":I
    if-lez v1, :cond_1

    .line 81
    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .local v2, "w":I
    add-int/lit8 v3, v1, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 82
    .local v3, "h":I
    if-lez v2, :cond_0

    if-lez v3, :cond_0

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v5

    filled-new-array {v4, v5}, [I

    move-result-object v4
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v4

    .line 85
    .end local v2    # "w":I
    .end local v3    # "h":I
    :cond_0
    goto :goto_0

    .line 83
    :catch_0
    move-exception v2

    .line 87
    :cond_1
    :goto_0
    new-instance v2, Landroid/util/DisplayMetrics;

    invoke-direct {v2}, Landroid/util/DisplayMetrics;-><init>()V

    .line 88
    .local v2, "m":Landroid/util/DisplayMetrics;
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v3

    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    .line 89
    iget v3, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v4, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    iget v4, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v5, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    filled-new-array {v3, v4}, [I

    move-result-object v3

    return-object v3
.end method

.method private refresh()V
    .locals 11

    .line 146
    sget v0, Lorg/wiiucoop/bo2android/R$id;->button_controls_profile:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 147
    const-string v1, "x360"

    iget-object v2, p0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->profile:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget v1, Lorg/wiiucoop/bo2android/R$string;->touch_profile_x360:I

    goto :goto_0

    :cond_0
    sget v1, Lorg/wiiucoop/bo2android/R$string;->touch_profile_codm:I

    .line 146
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 148
    iget-object v0, p0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->overlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getSelected()Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v0

    .line 149
    .local v0, "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v2, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->kind:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    sget-object v3, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;->BUTTON:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    if-eq v2, v3, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    move v2, v1

    .line 150
    .local v2, "stick":Z
    :goto_1
    sget v3, Lorg/wiiucoop/bo2android/R$id;->text_controls_selected:I

    invoke-virtual {p0, v3}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 151
    if-nez v0, :cond_2

    sget v4, Lorg/wiiucoop/bo2android/R$string;->controls_select_hint:I

    invoke-virtual {p0, v4}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    goto :goto_2

    :cond_2
    iget-object v4, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->id:Ljava/lang/String;

    .line 150
    :goto_2
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 152
    sget v3, Lorg/wiiucoop/bo2android/R$id;->text_controls_size:I

    invoke-virtual {p0, v3}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    sget v4, Lorg/wiiucoop/bo2android/R$string;->controls_size:I

    .line 153
    const/high16 v5, 0x42c80000    # 100.0f

    const-string v6, "%.0f%%"

    const-string v7, "\u2014"

    if-nez v0, :cond_3

    move-object v8, v7

    goto :goto_3

    :cond_3
    sget-object v8, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    iget v9, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->size:F

    mul-float/2addr v9, v5

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    filled-new-array {v9}, [Ljava/lang/Object;

    move-result-object v9

    invoke-static {v8, v6, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    :goto_3
    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    .line 152
    invoke-virtual {p0, v4, v8}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 154
    sget v3, Lorg/wiiucoop/bo2android/R$id;->text_controls_opacity:I

    invoke-virtual {p0, v3}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    sget v4, Lorg/wiiucoop/bo2android/R$string;->controls_opacity:I

    .line 155
    if-nez v0, :cond_4

    move-object v8, v7

    goto :goto_4

    :cond_4
    sget-object v8, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    iget v9, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->opacity:F

    mul-float/2addr v9, v5

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    filled-new-array {v9}, [Ljava/lang/Object;

    move-result-object v9

    invoke-static {v8, v6, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    :goto_4
    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    .line 154
    invoke-virtual {p0, v4, v8}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 156
    sget v3, Lorg/wiiucoop/bo2android/R$id;->text_controls_sensitivity:I

    invoke-virtual {p0, v3}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    sget v4, Lorg/wiiucoop/bo2android/R$string;->controls_sensitivity:I

    .line 157
    if-eqz v2, :cond_5

    sget-object v8, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    iget v9, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->sensitivity:F

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    filled-new-array {v9}, [Ljava/lang/Object;

    move-result-object v9

    const-string v10, "%.1fx"

    invoke-static {v8, v10, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    goto :goto_5

    :cond_5
    move-object v8, v7

    :goto_5
    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    .line 156
    invoke-virtual {p0, v4, v8}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 158
    sget v3, Lorg/wiiucoop/bo2android/R$id;->text_controls_deadzone:I

    invoke-virtual {p0, v3}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    sget v4, Lorg/wiiucoop/bo2android/R$string;->controls_deadzone:I

    .line 159
    if-eqz v2, :cond_6

    sget-object v7, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    iget v8, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->deadzone:F

    mul-float/2addr v8, v5

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {v7, v6, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    :cond_6
    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v5

    .line 158
    invoke-virtual {p0, v4, v5}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 160
    sget v3, Lorg/wiiucoop/bo2android/R$id;->button_controls_enabled:I

    invoke-virtual {p0, v3}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    .line 161
    if-eqz v0, :cond_7

    iget-boolean v4, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->enabled:Z

    if-nez v4, :cond_7

    sget v4, Lorg/wiiucoop/bo2android/R$string;->controls_enable:I

    goto :goto_6

    :cond_7
    sget v4, Lorg/wiiucoop/bo2android/R$string;->controls_disable:I

    .line 160
    :goto_6
    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(I)V

    .line 162
    sget v3, Lorg/wiiucoop/bo2android/R$id;->button_sensitivity_minus:I

    sget v4, Lorg/wiiucoop/bo2android/R$id;->button_sensitivity_plus:I

    filled-new-array {v3, v4}, [I

    move-result-object v3

    .line 163
    .local v3, "stickOnly":[I
    array-length v4, v3

    :goto_7
    if-ge v1, v4, :cond_8

    aget v5, v3, v1

    .local v5, "id":I
    invoke-virtual {p0, v5}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6, v2}, Landroid/view/View;->setEnabled(Z)V

    .end local v5    # "id":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 164
    :cond_8
    move v1, v2

    .line 165
    .local v1, "dead":Z
    sget v4, Lorg/wiiucoop/bo2android/R$id;->button_deadzone_minus:I

    invoke-virtual {p0, v4}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 166
    sget v4, Lorg/wiiucoop/bo2android/R$id;->button_deadzone_plus:I

    invoke-virtual {p0, v4}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 167
    return-void
.end method


# virtual methods
.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 1
    .param p1, "base"    # Landroid/content/Context;

    .line 32
    invoke-static {p1}, Lorg/wiiucoop/bo2android/T6Ui;->wrapLocale(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/app/Activity;->attachBaseContext(Landroid/content/Context;)V

    .line 33
    return-void
.end method

.method synthetic lambda$onCreate$0$org-wiiucoop-bo2android-TouchControlsActivity(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)V
    .locals 0
    .param p1, "control"    # Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    .line 47
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->refresh()V

    return-void
.end method

.method synthetic lambda$onCreate$1$org-wiiucoop-bo2android-TouchControlsActivity(IIII)V
    .locals 2
    .param p1, "r"    # I
    .param p2, "l"    # I
    .param p3, "b"    # I
    .param p4, "t"    # I

    .line 51
    sub-int v0, p1, p2

    sub-int v1, p3, p4

    invoke-direct {p0, v0, v1}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->fitOverlay(II)V

    return-void
.end method

.method synthetic lambda$onCreate$2$org-wiiucoop-bo2android-TouchControlsActivity(Landroid/view/View;IIIIIIII)V
    .locals 7
    .param p1, "v"    # Landroid/view/View;
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I
    .param p6, "ol"    # I
    .param p7, "ot"    # I
    .param p8, "or"    # I
    .param p9, "ob"    # I

    .line 51
    new-instance v6, Lorg/wiiucoop/bo2android/TouchControlsActivity$$ExternalSyntheticLambda2;

    move-object v0, v6

    move-object v1, p0

    move v2, p4

    move v3, p2

    move v4, p5

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lorg/wiiucoop/bo2android/TouchControlsActivity$$ExternalSyntheticLambda2;-><init>(Lorg/wiiucoop/bo2android/TouchControlsActivity;IIII)V

    move-object v0, p1

    invoke-virtual {p1, v6}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 7
    .param p1, "view"    # Landroid/view/View;

    .line 112
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 113
    .local v0, "id":I
    iget-object v1, p0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->overlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    invoke-virtual {v1}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getSelected()Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v1

    .line 114
    .local v1, "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    sget v2, Lorg/wiiucoop/bo2android/R$id;->button_back:I

    if-ne v0, v2, :cond_0

    .line 115
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->finish()V

    goto/16 :goto_3

    .line 116
    :cond_0
    sget v2, Lorg/wiiucoop/bo2android/R$id;->button_controls_save:I

    if-ne v0, v2, :cond_1

    .line 117
    iget-object v2, p0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->codm:Lorg/wiiucoop/bo2android/T6TouchLayout;

    invoke-static {p0, v2}, Lorg/wiiucoop/bo2android/T6Ui;->saveTouchLayout(Landroid/content/Context;Lorg/wiiucoop/bo2android/T6TouchLayout;)V

    .line 118
    iget-object v2, p0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->x360:Lorg/wiiucoop/bo2android/T6TouchLayout;

    invoke-static {p0, v2}, Lorg/wiiucoop/bo2android/T6Ui;->saveTouchLayout(Landroid/content/Context;Lorg/wiiucoop/bo2android/T6TouchLayout;)V

    .line 119
    const-string v2, "touch_profile"

    iget-object v3, p0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->profile:Ljava/lang/String;

    invoke-static {p0, v2, v3}, Lorg/wiiucoop/bo2android/T6Ui;->setString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "controls: saved both profiles; in game: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->profile:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "t6android"

    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    sget v2, Lorg/wiiucoop/bo2android/R$string;->controls_saved:I

    const/4 v3, 0x0

    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 122
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->finish()V

    goto/16 :goto_3

    .line 123
    :cond_1
    sget v2, Lorg/wiiucoop/bo2android/R$id;->button_controls_profile:I

    const-string v3, "x360"

    if-ne v0, v2, :cond_3

    .line 124
    iget-object v2, p0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->profile:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v3, "codm"

    :cond_2
    iput-object v3, p0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->profile:Ljava/lang/String;

    .line 125
    iget-object v2, p0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->overlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    invoke-direct {p0}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->current()Lorg/wiiucoop/bo2android/T6TouchLayout;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->setLayout(Lorg/wiiucoop/bo2android/T6TouchLayout;)V

    goto/16 :goto_3

    .line 126
    :cond_3
    sget v2, Lorg/wiiucoop/bo2android/R$id;->button_controls_restore:I

    if-ne v0, v2, :cond_5

    .line 127
    iget-object v2, p0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->profile:Ljava/lang/String;

    invoke-static {v2}, Lorg/wiiucoop/bo2android/T6TouchLayout;->defaults(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6TouchLayout;

    move-result-object v2

    .line 128
    .local v2, "fresh":Lorg/wiiucoop/bo2android/T6TouchLayout;
    iget-object v4, p0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->profile:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    iput-object v2, p0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->x360:Lorg/wiiucoop/bo2android/T6TouchLayout;

    goto :goto_0

    :cond_4
    iput-object v2, p0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->codm:Lorg/wiiucoop/bo2android/T6TouchLayout;

    .line 129
    :goto_0
    iget-object v3, p0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->overlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    invoke-virtual {v3, v2}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->setLayout(Lorg/wiiucoop/bo2android/T6TouchLayout;)V

    .end local v2    # "fresh":Lorg/wiiucoop/bo2android/T6TouchLayout;
    goto/16 :goto_2

    .line 130
    :cond_5
    if-eqz v1, :cond_f

    .line 131
    sget v2, Lorg/wiiucoop/bo2android/R$id;->button_size_minus:I

    const v3, 0x3f666666    # 0.9f

    const v4, 0x3d75c28f    # 0.06f

    const v5, 0x3c23d70a    # 0.01f

    if-ne v0, v2, :cond_6

    iget v2, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->size:F

    sub-float/2addr v2, v5

    invoke-static {v2, v4, v3}, Lorg/wiiucoop/bo2android/T6TouchLayout;->clamp(FFF)F

    move-result v2

    iput v2, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->size:F

    goto/16 :goto_1

    .line 132
    :cond_6
    sget v2, Lorg/wiiucoop/bo2android/R$id;->button_size_plus:I

    if-ne v0, v2, :cond_7

    iget v2, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->size:F

    add-float/2addr v2, v5

    invoke-static {v2, v4, v3}, Lorg/wiiucoop/bo2android/T6TouchLayout;->clamp(FFF)F

    move-result v2

    iput v2, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->size:F

    goto/16 :goto_1

    .line 133
    :cond_7
    sget v2, Lorg/wiiucoop/bo2android/R$id;->button_opacity_minus:I

    const/high16 v3, 0x3f800000    # 1.0f

    const v4, 0x3d4ccccd    # 0.05f

    const/4 v5, 0x0

    if-ne v0, v2, :cond_8

    iget v2, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->opacity:F

    sub-float/2addr v2, v4

    invoke-static {v2, v5, v3}, Lorg/wiiucoop/bo2android/T6TouchLayout;->clamp(FFF)F

    move-result v2

    iput v2, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->opacity:F

    goto :goto_1

    .line 134
    :cond_8
    sget v2, Lorg/wiiucoop/bo2android/R$id;->button_opacity_plus:I

    if-ne v0, v2, :cond_9

    iget v2, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->opacity:F

    add-float/2addr v2, v4

    invoke-static {v2, v5, v3}, Lorg/wiiucoop/bo2android/T6TouchLayout;->clamp(FFF)F

    move-result v2

    iput v2, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->opacity:F

    goto :goto_1

    .line 135
    :cond_9
    sget v2, Lorg/wiiucoop/bo2android/R$id;->button_sensitivity_minus:I

    const/high16 v3, 0x40400000    # 3.0f

    const v4, 0x3e4ccccd    # 0.2f

    const v6, 0x3dcccccd    # 0.1f

    if-ne v0, v2, :cond_a

    iget v2, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->sensitivity:F

    sub-float/2addr v2, v6

    invoke-static {v2, v4, v3}, Lorg/wiiucoop/bo2android/T6TouchLayout;->clamp(FFF)F

    move-result v2

    iput v2, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->sensitivity:F

    goto :goto_1

    .line 136
    :cond_a
    sget v2, Lorg/wiiucoop/bo2android/R$id;->button_sensitivity_plus:I

    if-ne v0, v2, :cond_b

    iget v2, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->sensitivity:F

    add-float/2addr v2, v6

    invoke-static {v2, v4, v3}, Lorg/wiiucoop/bo2android/T6TouchLayout;->clamp(FFF)F

    move-result v2

    iput v2, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->sensitivity:F

    goto :goto_1

    .line 137
    :cond_b
    sget v2, Lorg/wiiucoop/bo2android/R$id;->button_deadzone_minus:I

    const v3, 0x3f19999a    # 0.6f

    const v4, 0x3ca3d70a    # 0.02f

    if-ne v0, v2, :cond_c

    iget v2, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->deadzone:F

    sub-float/2addr v2, v4

    invoke-static {v2, v5, v3}, Lorg/wiiucoop/bo2android/T6TouchLayout;->clamp(FFF)F

    move-result v2

    iput v2, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->deadzone:F

    goto :goto_1

    .line 138
    :cond_c
    sget v2, Lorg/wiiucoop/bo2android/R$id;->button_deadzone_plus:I

    if-ne v0, v2, :cond_d

    iget v2, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->deadzone:F

    add-float/2addr v2, v4

    invoke-static {v2, v5, v3}, Lorg/wiiucoop/bo2android/T6TouchLayout;->clamp(FFF)F

    move-result v2

    iput v2, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->deadzone:F

    goto :goto_1

    .line 139
    :cond_d
    sget v2, Lorg/wiiucoop/bo2android/R$id;->button_controls_enabled:I

    if-ne v0, v2, :cond_e

    iget-boolean v2, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->enabled:Z

    xor-int/lit8 v2, v2, 0x1

    iput-boolean v2, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->enabled:Z

    .line 140
    :cond_e
    :goto_1
    iget-object v2, p0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->overlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    invoke-virtual {v2}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->invalidate()V

    goto :goto_3

    .line 130
    :cond_f
    :goto_2
    nop

    .line 142
    :goto_3
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->refresh()V

    .line 143
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 18
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 37
    move-object/from16 v0, p0

    invoke-static/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6Ui;->applyTheme(Landroid/app/Activity;)V

    .line 38
    invoke-super/range {p0 .. p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 39
    sget v1, Lorg/wiiucoop/bo2android/R$layout;->activity_touch_controls:I

    invoke-virtual {v0, v1}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->setContentView(I)V

    .line 41
    invoke-static/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6Ui;->touchProfile(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->profile:Ljava/lang/String;

    .line 42
    const-string v1, "codm"

    invoke-static {v0, v1}, Lorg/wiiucoop/bo2android/T6Ui;->loadTouchLayout(Landroid/content/Context;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6TouchLayout;

    move-result-object v1

    iput-object v1, v0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->codm:Lorg/wiiucoop/bo2android/T6TouchLayout;

    .line 43
    const-string v1, "x360"

    invoke-static {v0, v1}, Lorg/wiiucoop/bo2android/T6Ui;->loadTouchLayout(Landroid/content/Context;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6TouchLayout;

    move-result-object v1

    iput-object v1, v0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->x360:Lorg/wiiucoop/bo2android/T6TouchLayout;

    .line 45
    new-instance v1, Lorg/wiiucoop/bo2android/T6TouchOverlay;

    invoke-direct {v1, v0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->overlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    .line 46
    iget-object v1, v0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->overlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->setEditMode(Z)V

    .line 47
    iget-object v1, v0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->overlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    new-instance v2, Lorg/wiiucoop/bo2android/TouchControlsActivity$$ExternalSyntheticLambda0;

    invoke-direct {v2, v0}, Lorg/wiiucoop/bo2android/TouchControlsActivity$$ExternalSyntheticLambda0;-><init>(Lorg/wiiucoop/bo2android/TouchControlsActivity;)V

    invoke-virtual {v1, v2}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->setSelectionListener(Lorg/wiiucoop/bo2android/T6TouchOverlay$SelectionListener;)V

    .line 48
    sget v1, Lorg/wiiucoop/bo2android/R$id;->controls_surface:I

    invoke-virtual {v0, v1}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    .line 49
    .local v1, "area":Landroid/widget/FrameLayout;
    iget-object v2, v0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->overlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, 0x0

    invoke-direct {v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 51
    new-instance v2, Lorg/wiiucoop/bo2android/TouchControlsActivity$$ExternalSyntheticLambda1;

    invoke-direct {v2, v0}, Lorg/wiiucoop/bo2android/TouchControlsActivity$$ExternalSyntheticLambda1;-><init>(Lorg/wiiucoop/bo2android/TouchControlsActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 52
    iget-object v2, v0, Lorg/wiiucoop/bo2android/TouchControlsActivity;->overlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    invoke-direct/range {p0 .. p0}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->current()Lorg/wiiucoop/bo2android/T6TouchLayout;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->setLayout(Lorg/wiiucoop/bo2android/T6TouchLayout;)V

    .line 54
    sget v5, Lorg/wiiucoop/bo2android/R$id;->button_back:I

    sget v6, Lorg/wiiucoop/bo2android/R$id;->button_controls_save:I

    sget v7, Lorg/wiiucoop/bo2android/R$id;->button_controls_profile:I

    sget v8, Lorg/wiiucoop/bo2android/R$id;->button_controls_restore:I

    sget v9, Lorg/wiiucoop/bo2android/R$id;->button_size_minus:I

    sget v10, Lorg/wiiucoop/bo2android/R$id;->button_size_plus:I

    sget v11, Lorg/wiiucoop/bo2android/R$id;->button_opacity_minus:I

    sget v12, Lorg/wiiucoop/bo2android/R$id;->button_opacity_plus:I

    sget v13, Lorg/wiiucoop/bo2android/R$id;->button_sensitivity_minus:I

    sget v14, Lorg/wiiucoop/bo2android/R$id;->button_sensitivity_plus:I

    sget v15, Lorg/wiiucoop/bo2android/R$id;->button_deadzone_minus:I

    sget v16, Lorg/wiiucoop/bo2android/R$id;->button_deadzone_plus:I

    sget v17, Lorg/wiiucoop/bo2android/R$id;->button_controls_enabled:I

    filled-new-array/range {v5 .. v17}, [I

    move-result-object v2

    .line 59
    .local v2, "buttons":[I
    array-length v3, v2

    :goto_0
    if-ge v4, v3, :cond_0

    aget v5, v2, v4

    .local v5, "id":I
    invoke-virtual {v0, v5}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .end local v5    # "id":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 60
    :cond_0
    invoke-direct/range {p0 .. p0}, Lorg/wiiucoop/bo2android/TouchControlsActivity;->refresh()V

    .line 61
    return-void
.end method

.method protected onResume()V
    .locals 0

    .line 65
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 66
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->applyImmersive(Landroid/app/Activity;)V

    .line 67
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0
    .param p1, "hasFocus"    # Z

    .line 71
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 72
    if-eqz p1, :cond_0

    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->applyImmersive(Landroid/app/Activity;)V

    .line 73
    :cond_0
    return-void
.end method
