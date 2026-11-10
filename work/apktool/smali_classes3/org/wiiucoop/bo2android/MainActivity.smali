.class public final Lorg/wiiucoop/bo2android/MainActivity;
.super Lorg/libsdl/app/SDLActivity;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field public static final EXTRA_CONFIG_PATH:Ljava/lang/String; = "org.wiiucoop.bo2android.CONFIG_PATH"

.field public static final EXTRA_MODE:Ljava/lang/String; = "org.wiiucoop.bo2android.MODE"

.field private static final PANEL_ANIMATION_MS:J = 0xaaL

.field private static final PROBE_INTERVAL_MS:J = 0x1f4L

.field private static final TAG:Ljava/lang/String; = "t6android"


# instance fields
.field private backCallback:Landroid/window/OnBackInvokedCallback;

.field private clientValue:Landroid/widget/TextView;

.field private config:Lorg/wiiucoop/bo2android/T6Config;

.field private consoleKeyboard:Z

.field private consoleWasOpen:Z

.field private engineValue:Landroid/widget/TextView;

.field private folderValue:Landroid/widget/TextView;

.field private fpsBadge:Landroid/widget/TextView;

.field private fpsRequested:Ljava/lang/String;

.field private fpsRequestedValue:Landroid/widget/TextView;

.field private fpsValue:Landroid/widget/TextView;

.field private hostStatus:Landroid/widget/TextView;

.field private hostStatusLoggedState:Lorg/wiiucoop/bo2android/T6SessionState$State;

.field private hostStatusText:Ljava/lang/String;

.field private lastFps:Lorg/wiiucoop/bo2android/T6EngineCommand$Result;

.field private loggedScrollY:I

.field private loggedTouchActive:Z

.field private loggedTouchButtons:I

.field private loggedTouchSticks:Z

.field private loggedTouchSticksAt:J

.field private networkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

.field private panelRoot:Landroid/view/View;

.field private final probe:Ljava/lang/Runnable;

.field private scrim:Landroid/view/View;

.field private final sessionMenu:Lorg/wiiucoop/bo2android/T6SessionMenu;

.field private sheet:Landroid/view/View;

.field private stateValue:Landroid/widget/TextView;

.field private store:Lorg/wiiucoop/bo2android/T6ConfigStore;

.field private final touchAuto:Lorg/wiiucoop/bo2android/T6TouchAuto;

.field private touchOverlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

.field private touchReason:Ljava/lang/String;

.field private touchShown:Z

.field private final touchTick:Ljava/lang/Runnable;

.field private final uiHandler:Landroid/os/Handler;


# direct methods
.method public static synthetic $r8$lambda$hGAGyr2hAPcpgmcBCovHKvZnCOQ(Lorg/wiiucoop/bo2android/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->openConsole()V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 85
    invoke-direct {p0}, Lorg/libsdl/app/SDLActivity;-><init>()V

    .line 112
    new-instance v0, Lorg/wiiucoop/bo2android/T6SessionMenu;

    invoke-direct {v0}, Lorg/wiiucoop/bo2android/T6SessionMenu;-><init>()V

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->sessionMenu:Lorg/wiiucoop/bo2android/T6SessionMenu;

    .line 114
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->uiHandler:Landroid/os/Handler;

    .line 121
    new-instance v0, Lorg/wiiucoop/bo2android/MainActivity$1;

    invoke-direct {v0, p0}, Lorg/wiiucoop/bo2android/MainActivity$1;-><init>(Lorg/wiiucoop/bo2android/MainActivity;)V

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchTick:Ljava/lang/Runnable;

    .line 129
    new-instance v0, Lorg/wiiucoop/bo2android/MainActivity$2;

    invoke-direct {v0, p0}, Lorg/wiiucoop/bo2android/MainActivity$2;-><init>(Lorg/wiiucoop/bo2android/MainActivity;)V

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->probe:Ljava/lang/Runnable;

    .line 156
    const-string v0, ""

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->hostStatusText:Ljava/lang/String;

    .line 158
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->hostStatusLoggedState:Lorg/wiiucoop/bo2android/T6SessionState$State;

    .line 174
    iput-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->fpsRequested:Ljava/lang/String;

    .line 177
    const/high16 v1, -0x80000000

    iput v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->loggedScrollY:I

    .line 287
    iput-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchReason:Ljava/lang/String;

    .line 288
    new-instance v0, Lorg/wiiucoop/bo2android/T6TouchAuto;

    invoke-direct {v0}, Lorg/wiiucoop/bo2android/T6TouchAuto;-><init>()V

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchAuto:Lorg/wiiucoop/bo2android/T6TouchAuto;

    .line 386
    const/4 v0, -0x1

    iput v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->loggedTouchButtons:I

    return-void
.end method

.method static synthetic access$000(Lorg/wiiucoop/bo2android/MainActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lorg/wiiucoop/bo2android/MainActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .line 85
    invoke-direct {p0, p1}, Lorg/wiiucoop/bo2android/MainActivity;->updateTouchControls(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lorg/wiiucoop/bo2android/MainActivity;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lorg/wiiucoop/bo2android/MainActivity;

    .line 85
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->uiHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$200(Lorg/wiiucoop/bo2android/MainActivity;)V
    .locals 0
    .param p0, "x0"    # Lorg/wiiucoop/bo2android/MainActivity;

    .line 85
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->refreshHostStatus()V

    return-void
.end method

.method static synthetic access$300(Lorg/wiiucoop/bo2android/MainActivity;)Lorg/wiiucoop/bo2android/T6SessionMenu;
    .locals 1
    .param p0, "x0"    # Lorg/wiiucoop/bo2android/MainActivity;

    .line 85
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->sessionMenu:Lorg/wiiucoop/bo2android/T6SessionMenu;

    return-object v0
.end method

.method static synthetic access$400(Lorg/wiiucoop/bo2android/MainActivity;)V
    .locals 0
    .param p0, "x0"    # Lorg/wiiucoop/bo2android/MainActivity;

    .line 85
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->refreshPanel()V

    return-void
.end method

.method static synthetic access$500(Lorg/wiiucoop/bo2android/MainActivity;)V
    .locals 0
    .param p0, "x0"    # Lorg/wiiucoop/bo2android/MainActivity;

    .line 85
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->handleBack()V

    return-void
.end method

.method private applyTouchOptions()V
    .locals 7

    .line 365
    :try_start_0
    const-string v0, "touch_sprint_threshold"

    const-string v1, "85"

    invoke-static {p0, v0, v1}, Lorg/wiiucoop/bo2android/T6Ui;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 368
    .local v0, "threshold":I
    goto :goto_0

    .line 366
    .end local v0    # "threshold":I
    :catch_0
    move-exception v0

    .line 367
    .local v0, "e":Ljava/lang/NumberFormatException;
    const/16 v1, 0x55

    move v0, v1

    .line 369
    .local v0, "threshold":I
    :goto_0
    const-string v1, "touch_aim_drag"

    const/4 v2, 0x1

    invoke-static {p0, v1, v2}, Lorg/wiiucoop/bo2android/T6Ui;->getBool(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v1

    .line 370
    .local v1, "aimDrag":Z
    const-string v3, "touch_stick_sprint"

    invoke-static {p0, v3, v2}, Lorg/wiiucoop/bo2android/T6Ui;->getBool(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v2

    .line 371
    .local v2, "stickSprint":Z
    const-string v3, "touch_ads_fire"

    const/4 v4, 0x0

    invoke-static {p0, v3, v4}, Lorg/wiiucoop/bo2android/T6Ui;->getBool(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v3

    .line 372
    .local v3, "adsFire":Z
    iget-object v4, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchOverlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    int-to-float v5, v0

    const/high16 v6, 0x42c80000    # 100.0f

    div-float/2addr v5, v6

    invoke-virtual {v4, v1, v2, v5, v3}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->setOptions(ZZFZ)V

    .line 373
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "touch options: aim drag "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", stick sprint "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " at "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "%, ads+fire "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "t6android"

    invoke-static {v5, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 375
    return-void
.end method

.method private closePanel(Ljava/lang/String;)V
    .locals 4
    .param p1, "reason"    # Ljava/lang/String;

    .line 847
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->sessionMenu:Lorg/wiiucoop/bo2android/T6SessionMenu;

    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6SessionMenu;->close()V

    .line 848
    const-string v0, "panel closed"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/MainActivity;->updateTouchControls(Ljava/lang/String;)V

    .line 850
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 859
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "session menu: closed by "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "t6android"

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 860
    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/MainActivity;->setHostStatusVisible(Z)V

    .line 861
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->refreshHostStatus()V

    .line 863
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->sheet:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->sheetWidth()F

    move-result v1

    neg-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0xaa

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 864
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->scrim:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lorg/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda8;

    invoke-direct {v1, p0}, Lorg/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda8;-><init>(Lorg/wiiucoop/bo2android/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 869
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 870
    return-void

    .line 851
    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    if-eqz v0, :cond_2

    .line 852
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 854
    :cond_2
    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/MainActivity;->setHostStatusVisible(Z)V

    .line 855
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->refreshHostStatus()V

    .line 856
    return-void
.end method

.method private ensurePanelAttached()V
    .locals 2

    .line 709
    sget-object v0, Lorg/wiiucoop/bo2android/MainActivity;->mLayout:Landroid/view/ViewGroup;

    if-nez v0, :cond_0

    .line 710
    return-void

    .line 713
    :cond_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    if-nez v0, :cond_1

    .line 714
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->prepareSessionPanel()V

    .line 715
    return-void

    .line 718
    :cond_1
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_2

    .line 719
    sget-object v0, Lorg/wiiucoop/bo2android/MainActivity;->mLayout:Landroid/view/ViewGroup;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 721
    :cond_2
    return-void
.end method

.method private followDefaultNetwork()V
    .locals 3

    .line 887
    :try_start_0
    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 888
    .local v0, "cm":Landroid/net/ConnectivityManager;
    new-instance v1, Lorg/wiiucoop/bo2android/MainActivity$4;

    invoke-direct {v1, p0}, Lorg/wiiucoop/bo2android/MainActivity$4;-><init>(Lorg/wiiucoop/bo2android/MainActivity;)V

    iput-object v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->networkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    .line 900
    iget-object v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->networkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->registerDefaultNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 904
    .end local v0    # "cm":Landroid/net/ConnectivityManager;
    goto :goto_0

    .line 901
    :catch_0
    move-exception v0

    .line 902
    .local v0, "e":Ljava/lang/RuntimeException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "network: default network callback unavailable: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "t6android"

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 903
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->networkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    .line 905
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :goto_0
    return-void
.end method

.method private handleBack()V
    .locals 3

    .line 629
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MainActivity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 630
    return-void

    .line 633
    :cond_0
    sget-object v0, Lorg/wiiucoop/bo2android/MainActivity$5;->$SwitchMap$org$wiiucoop$bo2android$T6SessionMenu$BackAction:[I

    iget-object v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->sessionMenu:Lorg/wiiucoop/bo2android/T6SessionMenu;

    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->isHostRunning()Z

    move-result v2

    invoke-virtual {v1, v2}, Lorg/wiiucoop/bo2android/T6SessionMenu;->onBack(Z)Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;

    move-result-object v1

    invoke-virtual {v1}, Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 642
    const-string v0, "voltar sem sess\u00e3o ativa"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/MainActivity;->leaveSession(Ljava/lang/String;)V

    goto :goto_0

    .line 638
    :pswitch_0
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->openPanel()V

    .line 639
    goto :goto_0

    .line 635
    :pswitch_1
    const-string v0, "voltar"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/MainActivity;->closePanel(Ljava/lang/String;)V

    .line 636
    nop

    .line 645
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static isFromPad(I)Z
    .locals 2
    .param p0, "source"    # I

    .line 579
    and-int/lit16 v0, p0, 0x401

    const/16 v1, 0x401

    if-eq v0, v1, :cond_1

    const v0, 0x1000010

    and-int v1, p0, v0

    if-ne v1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private isHostRunning()Z
    .locals 2

    .line 655
    invoke-static {}, Lorg/wiiucoop/bo2android/T6SessionState;->read()Lorg/wiiucoop/bo2android/T6SessionState;

    move-result-object v0

    .line 656
    .local v0, "state":Lorg/wiiucoop/bo2android/T6SessionState;
    iget-boolean v1, v0, Lorg/wiiucoop/bo2android/T6SessionState;->answered:Z

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6SessionState;->isHostRunning()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    return v1
.end method

.method static synthetic lambda$letterboxSurface$0(Landroid/view/View;IIIIIIII)V
    .locals 6
    .param p0, "v"    # Landroid/view/View;
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I
    .param p5, "oldLeft"    # I
    .param p6, "oldTop"    # I
    .param p7, "oldRight"    # I
    .param p8, "oldBottom"    # I

    .line 229
    sub-int v0, p3, p1

    .local v0, "w":I
    sub-int v1, p4, p2

    .line 230
    .local v1, "h":I
    if-lez v0, :cond_2

    if-lez v1, :cond_2

    sget-object v2, Lorg/wiiucoop/bo2android/MainActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    if-nez v2, :cond_0

    goto :goto_0

    .line 231
    :cond_0
    sub-int v2, p7, p5

    if-ne v0, v2, :cond_1

    sub-int v2, p8, p6

    if-ne v1, v2, :cond_1

    return-void

    .line 232
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "display: game surface fills the window, "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lorg/wiiucoop/bo2android/MainActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    invoke-virtual {v3}, Lorg/libsdl/app/SDLSurface;->getWidth()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v4, Lorg/wiiucoop/bo2android/MainActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    invoke-virtual {v4}, Lorg/libsdl/app/SDLSurface;->getHeight()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " inside "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    int-to-float v4, v0

    int-to-float v5, v1

    div-float/2addr v4, v5

    .line 233
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const-string v5, " (aspect %.4f)"

    invoke-static {v3, v5, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 232
    const-string v3, "t6android"

    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    return-void

    .line 230
    :cond_2
    :goto_0
    return-void
.end method

.method static synthetic lambda$prepareTouchControls$1(IIFF)V
    .locals 1
    .param p0, "action"    # I
    .param p1, "pointerId"    # I
    .param p2, "nx"    # F
    .param p3, "ny"    # F

    .line 296
    const/high16 v0, 0x10000

    add-int/2addr v0, p1

    invoke-static {p0, v0, p2, p3}, Lorg/wiiucoop/bo2android/T6Native;->touch(IIFF)V

    return-void
.end method

.method static synthetic lambda$prepareTouchControls$2(Ljava/lang/String;)V
    .locals 4
    .param p0, "command"    # Ljava/lang/String;

    .line 301
    const-string v0, "next"

    invoke-static {p0, v0}, Lorg/wiiucoop/bo2android/T6Native;->submitDvar(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 302
    .local v0, "answer":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "touch: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " -> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0xa

    const/16 v3, 0x20

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "t6android"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 303
    return-void
.end method

.method static synthetic lambda$prepareTouchControls$3(IZ)V
    .locals 3
    .param p0, "vk"    # I
    .param p1, "down"    # Z

    .line 306
    invoke-static {p0, p1}, Lorg/wiiucoop/bo2android/T6Native;->sendKeyState(IZ)Z

    move-result v0

    .line 307
    .local v0, "sent":Z
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "touch: key 0x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-eqz p1, :cond_0

    const-string v2, " down"

    goto :goto_0

    :cond_0
    const-string v2, " up"

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-eqz v0, :cond_1

    const-string v2, ""

    goto :goto_1

    :cond_1
    const-string v2, " NOT queued"

    :goto_1
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "t6android"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 308
    return-void
.end method

.method private leaveSession(Ljava/lang/String;)V
    .locals 2
    .param p1, "reason"    # Ljava/lang/String;

    .line 908
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "session menu: leaving the session ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "t6android"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 909
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->sessionMenu:Lorg/wiiucoop/bo2android/T6SessionMenu;

    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6SessionMenu;->close()V

    .line 910
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->stopProbe()V

    .line 912
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 913
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 916
    :cond_0
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MainActivity;->finish()V

    .line 917
    return-void
.end method

.method private letterboxSurface()V
    .locals 2

    .line 226
    sget-object v0, Lorg/wiiucoop/bo2android/MainActivity;->mLayout:Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    sget-object v0, Lorg/wiiucoop/bo2android/MainActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    if-nez v0, :cond_0

    goto :goto_0

    .line 227
    :cond_0
    sget-object v0, Lorg/wiiucoop/bo2android/MainActivity;->mLayout:Landroid/view/ViewGroup;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setBackgroundColor(I)V

    .line 228
    sget-object v0, Lorg/wiiucoop/bo2android/MainActivity;->mLayout:Landroid/view/ViewGroup;

    new-instance v1, Lorg/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda9;

    invoke-direct {v1}, Lorg/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda9;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 235
    return-void

    .line 226
    :cond_1
    :goto_0
    return-void
.end method

.method private loadConfiguration()V
    .locals 4

    .line 1122
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->store:Lorg/wiiucoop/bo2android/T6ConfigStore;

    if-nez v0, :cond_0

    .line 1123
    new-instance v0, Lorg/wiiucoop/bo2android/T6ConfigStore;

    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MainActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "t6_config.ini"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/wiiucoop/bo2android/T6ConfigStore;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->store:Lorg/wiiucoop/bo2android/T6ConfigStore;

    .line 1126
    :cond_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->store:Lorg/wiiucoop/bo2android/T6ConfigStore;

    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6ConfigStore;->load()Lorg/wiiucoop/bo2android/T6Config;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    .line 1127
    return-void
.end method

.method private logPanelState(Ljava/lang/String;)V
    .locals 6
    .param p1, "reason"    # Ljava/lang/String;

    .line 1089
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    if-nez v0, :cond_0

    .line 1090
    return-void

    .line 1093
    :cond_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    .line 1094
    invoke-static {}, Lorg/wiiucoop/bo2android/T6SessionState;->read()Lorg/wiiucoop/bo2android/T6SessionState;

    move-result-object v1

    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->lastFps:Lorg/wiiucoop/bo2android/T6EngineCommand$Result;

    iget-object v3, p0, Lorg/wiiucoop/bo2android/MainActivity;->fpsRequested:Ljava/lang/String;

    .line 1093
    invoke-static {v0, v1, v2, v3}, Lorg/wiiucoop/bo2android/T6SessionMenu;->snapshot(Lorg/wiiucoop/bo2android/T6Config;Lorg/wiiucoop/bo2android/T6SessionState;Lorg/wiiucoop/bo2android/T6EngineCommand$Result;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6SessionMenu$Snapshot;

    move-result-object v0

    .line 1096
    .local v0, "snapshot":Lorg/wiiucoop/bo2android/T6SessionMenu$Snapshot;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "session menu: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " -> "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v4, v0, Lorg/wiiucoop/bo2android/T6SessionMenu$Snapshot;->session:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v4, "t6android"

    invoke-static {v4, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1097
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v5, v0, Lorg/wiiucoop/bo2android/T6SessionMenu$Snapshot;->engine:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1098
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v5, v0, Lorg/wiiucoop/bo2android/T6SessionMenu$Snapshot;->client:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1099
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v5, v0, Lorg/wiiucoop/bo2android/T6SessionMenu$Snapshot;->folder:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1100
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v0, Lorg/wiiucoop/bo2android/T6SessionMenu$Snapshot;->fps:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1101
    return-void
.end method

.method private logRowBounds(ILjava/lang/String;Ljava/lang/String;II)V
    .locals 10
    .param p1, "id"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "reason"    # Ljava/lang/String;
    .param p4, "windowTop"    # I
    .param p5, "windowBottom"    # I

    .line 805
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

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
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "session menu: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " -> "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " tap "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/4 v7, 0x0

    aget v8, v2, v7

    .line 818
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v9

    div-int/2addr v9, v1

    add-int/2addr v8, v9

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, ","

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v9

    div-int/2addr v9, v1

    add-int/2addr v9, v4

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v6, " bounds "

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget v6, v2, v7

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v6, ".."

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget v6, v2, v7

    .line 820
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v9

    add-int/2addr v6, v9

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v6, " inside "

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-lt v4, p4, :cond_1

    if-gt v5, p5, :cond_1

    goto :goto_0

    :cond_1
    move v3, v7

    :goto_0
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 817
    const-string v3, "t6android"

    invoke-static {v3, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 822
    return-void

    .line 808
    .end local v2    # "position":[I
    .end local v4    # "top":I
    .end local v5    # "bottom":I
    :cond_2
    :goto_1
    return-void
.end method

.method private logRowGeometry(Ljava/lang/String;)V
    .locals 9
    .param p1, "reason"    # Ljava/lang/String;

    .line 782
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_2

    .line 786
    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 787
    .local v0, "window":[I
    iget-object v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 788
    const/4 v1, 0x1

    aget v1, v0, v1

    .line 789
    .local v1, "windowTop":I
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    add-int v8, v1, v2

    .line 791
    .local v8, "windowBottom":I
    sget v3, Lorg/wiiucoop/bo2android/R$id;->row_session_exit:I

    const-string v4, "row_session_exit"

    move-object v2, p0

    move-object v5, p1

    move v6, v1

    move v7, v8

    invoke-direct/range {v2 .. v7}, Lorg/wiiucoop/bo2android/MainActivity;->logRowBounds(ILjava/lang/String;Ljava/lang/String;II)V

    .line 792
    sget v3, Lorg/wiiucoop/bo2android/R$id;->row_session_fps:I

    const-string v4, "row_session_fps"

    invoke-direct/range {v2 .. v7}, Lorg/wiiucoop/bo2android/MainActivity;->logRowBounds(ILjava/lang/String;Ljava/lang/String;II)V

    .line 793
    sget v3, Lorg/wiiucoop/bo2android/R$id;->row_session_controls:I

    const-string v4, "row_session_controls"

    invoke-direct/range {v2 .. v7}, Lorg/wiiucoop/bo2android/MainActivity;->logRowBounds(ILjava/lang/String;Ljava/lang/String;II)V

    .line 795
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->sheet:Landroid/view/View;

    instance-of v2, v2, Landroid/widget/ScrollView;

    if-eqz v2, :cond_3

    .line 796
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->sheet:Landroid/view/View;

    check-cast v2, Landroid/widget/ScrollView;

    .line 797
    .local v2, "scroll":Landroid/widget/ScrollView;
    invoke-virtual {v2}, Landroid/widget/ScrollView;->getChildCount()I

    move-result v3

    const/4 v4, 0x0

    if-lez v3, :cond_1

    invoke-virtual {v2, v4}, Landroid/widget/ScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    .line 798
    .local v3, "content":Landroid/view/View;
    :goto_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "session menu: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " -> sheet scroll "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " content "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 799
    if-nez v3, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v4

    :goto_1
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " viewport "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 800
    invoke-virtual {v2}, Landroid/widget/ScrollView;->getHeight()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 798
    const-string v5, "t6android"

    invoke-static {v5, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 802
    .end local v2    # "scroll":Landroid/widget/ScrollView;
    .end local v3    # "content":Landroid/view/View;
    :cond_3
    return-void

    .line 783
    .end local v0    # "window":[I
    .end local v1    # "windowTop":I
    .end local v8    # "windowBottom":I
    :cond_4
    :goto_2
    return-void
.end method

.method private logTouchPad(ZIIIIIII)V
    .locals 14
    .param p1, "active"    # Z
    .param p2, "buttons"    # I
    .param p3, "lt"    # I
    .param p4, "rt"    # I
    .param p5, "lx"    # I
    .param p6, "ly"    # I
    .param p7, "rx"    # I
    .param p8, "ry"    # I

    .line 397
    move-object v0, p0

    move v1, p1

    move/from16 v2, p5

    move/from16 v3, p6

    move/from16 v4, p7

    move/from16 v5, p8

    const/4 v6, 0x0

    if-lez p3, :cond_0

    const/high16 v7, 0x10000

    goto :goto_0

    :cond_0
    move v7, v6

    :goto_0
    or-int v7, p2, v7

    if-lez p4, :cond_1

    const/high16 v8, 0x20000

    goto :goto_1

    :cond_1
    move v8, v6

    :goto_1
    or-int/2addr v7, v8

    .line 398
    .local v7, "pressed":I
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v8

    .line 399
    .local v8, "now":J
    if-nez v2, :cond_2

    if-nez v3, :cond_2

    if-nez v4, :cond_2

    if-eqz v5, :cond_3

    :cond_2
    const/4 v6, 0x1

    .line 400
    .local v6, "sticks":Z
    :cond_3
    iget v10, v0, Lorg/wiiucoop/bo2android/MainActivity;->loggedTouchButtons:I

    if-ne v7, v10, :cond_4

    iget-boolean v10, v0, Lorg/wiiucoop/bo2android/MainActivity;->loggedTouchActive:Z

    if-ne v1, v10, :cond_4

    iget-boolean v10, v0, Lorg/wiiucoop/bo2android/MainActivity;->loggedTouchSticks:Z

    if-ne v6, v10, :cond_4

    if-eqz v6, :cond_7

    iget-wide v10, v0, Lorg/wiiucoop/bo2android/MainActivity;->loggedTouchSticksAt:J

    sub-long v10, v8, v10

    const-wide/16 v12, 0x1f4

    cmp-long v10, v10, v12

    if-ltz v10, :cond_7

    .line 402
    :cond_4
    iput v7, v0, Lorg/wiiucoop/bo2android/MainActivity;->loggedTouchButtons:I

    .line 403
    iput-boolean v1, v0, Lorg/wiiucoop/bo2android/MainActivity;->loggedTouchActive:Z

    .line 404
    iput-boolean v6, v0, Lorg/wiiucoop/bo2android/MainActivity;->loggedTouchSticks:Z

    .line 405
    if-eqz v6, :cond_5

    iput-wide v8, v0, Lorg/wiiucoop/bo2android/MainActivity;->loggedTouchSticksAt:J

    .line 406
    :cond_5
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "touch pad: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    if-eqz v1, :cond_6

    const-string v11, "active"

    goto :goto_2

    :cond_6
    const-string v11, "inactive"

    :goto_2
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " buttons 0x"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-static {v7}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " left "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ","

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v12, " right "

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    const-string v11, "t6android"

    invoke-static {v11, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 409
    :cond_7
    return-void
.end method

.method private onPadInput()V
    .locals 1

    .line 584
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchAuto:Lorg/wiiucoop/bo2android/T6TouchAuto;

    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6TouchAuto;->onPadInput()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "gamepad input"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/MainActivity;->updateTouchControls(Ljava/lang/String;)V

    .line 585
    :cond_0
    return-void
.end method

.method private onSheetScrolled(I)V
    .locals 2
    .param p1, "scrollY"    # I

    .line 830
    iget v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->loggedScrollY:I

    sub-int v0, p1, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    const/16 v1, 0x10

    if-ge v0, v1, :cond_0

    .line 831
    return-void

    .line 834
    :cond_0
    iput p1, p0, Lorg/wiiucoop/bo2android/MainActivity;->loggedScrollY:I

    .line 835
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "sheet at "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/MainActivity;->logRowGeometry(Ljava/lang/String;)V

    .line 836
    return-void
.end method

.method private openConsole()V
    .locals 3

    .line 378
    const/16 v0, 0xc0

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6Native;->sendKey(I)Z

    move-result v0

    .line 379
    .local v0, "sent":Z
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "touch: CMD -> console key "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-eqz v0, :cond_0

    const-string v2, "sent"

    goto :goto_0

    :cond_0
    const-string v2, "NOT queued"

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "t6android"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 380
    if-eqz v0, :cond_1

    iget-boolean v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->consoleWasOpen:Z

    if-nez v1, :cond_1

    .line 381
    const/4 v1, 0x1

    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6Native;->setTextInput(Z)Z

    .line 382
    iput-boolean v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->consoleKeyboard:Z

    .line 384
    :cond_1
    return-void
.end method

.method private openPanel()V
    .locals 6

    .line 724
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->ensurePanelAttached()V

    .line 726
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchOverlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchOverlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    invoke-virtual {v0, v1}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->setPadActive(Z)V

    .line 728
    :cond_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    const-string v2, "t6android"

    if-nez v0, :cond_1

    .line 731
    const-string v0, "session menu: no panel is available; treating back as leaving"

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 732
    const-string v0, "painel indispon\u00edvel"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/MainActivity;->leaveSession(Ljava/lang/String;)V

    .line 733
    return-void

    .line 736
    :cond_1
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->sessionMenu:Lorg/wiiucoop/bo2android/T6SessionMenu;

    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6SessionMenu;->open()V

    .line 737
    const-string v0, "session menu: opened by back"

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 738
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 744
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->sheet:Landroid/view/View;

    instance-of v0, v0, Landroid/widget/ScrollView;

    if-eqz v0, :cond_2

    .line 745
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->sheet:Landroid/view/View;

    check-cast v0, Landroid/widget/ScrollView;

    invoke-virtual {v0, v1, v1}, Landroid/widget/ScrollView;->scrollTo(II)V

    .line 750
    :cond_2
    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/MainActivity;->setHostStatusVisible(Z)V

    .line 752
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->sheetWidth()F

    move-result v0

    .line 753
    .local v0, "width":F
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->sheet:Landroid/view/View;

    neg-float v3, v0

    invoke-virtual {v2, v3}, Landroid/view/View;->setTranslationX(F)V

    .line 754
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->sheet:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    const-wide/16 v4, 0xaa

    invoke-virtual {v2, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 755
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->scrim:Landroid/view/View;

    invoke-virtual {v2, v3}, Landroid/view/View;->setAlpha(F)V

    .line 756
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->scrim:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 758
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->refreshPanel()V

    .line 759
    const-string v2, "painel aberto"

    invoke-direct {p0, v2}, Lorg/wiiucoop/bo2android/MainActivity;->logPanelState(Ljava/lang/String;)V

    .line 760
    iput v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->loggedScrollY:I

    .line 765
    iget-object v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->uiHandler:Landroid/os/Handler;

    new-instance v2, Lorg/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda7;

    invoke-direct {v2, p0}, Lorg/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda7;-><init>(Lorg/wiiucoop/bo2android/MainActivity;)V

    const-wide/16 v3, 0xfa

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 766
    return-void
.end method

.method private prepareHostStatus()V
    .locals 5

    .line 929
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->debugOverlayEnabled(Landroid/content/Context;)Z

    move-result v0

    const-string v1, "t6android"

    if-nez v0, :cond_0

    .line 930
    const-string v0, "host status: strip disabled (debug overlay off); state is logged only"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 931
    return-void

    .line 933
    :cond_0
    sget-object v0, Lorg/wiiucoop/bo2android/MainActivity;->mLayout:Landroid/view/ViewGroup;

    if-nez v0, :cond_1

    .line 934
    const-string v0, "host status: the host window does not exist yet; no strip to prepare"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 935
    return-void

    .line 939
    :cond_1
    :try_start_0
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 940
    .local v0, "inflater":Landroid/view/LayoutInflater;
    sget v2, Lorg/wiiucoop/bo2android/R$layout;->view_host_status:I

    sget-object v3, Lorg/wiiucoop/bo2android/MainActivity;->mLayout:Landroid/view/ViewGroup;

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->hostStatus:Landroid/widget/TextView;

    .line 941
    sget-object v2, Lorg/wiiucoop/bo2android/MainActivity;->mLayout:Landroid/view/ViewGroup;

    iget-object v3, p0, Lorg/wiiucoop/bo2android/MainActivity;->hostStatus:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 942
    const-string v2, "host status: strip added to the host window"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 946
    nop

    .end local v0    # "inflater":Landroid/view/LayoutInflater;
    goto :goto_0

    .line 943
    :catch_0
    move-exception v0

    .line 944
    .local v0, "e":Ljava/lang/RuntimeException;
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->hostStatus:Landroid/widget/TextView;

    .line 945
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "host status: the strip could not be inflated: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 947
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :goto_0
    return-void
.end method

.method private prepareSessionPanel()V
    .locals 6

    .line 665
    sget-object v0, Lorg/wiiucoop/bo2android/MainActivity;->mLayout:Landroid/view/ViewGroup;

    const-string v1, "t6android"

    if-nez v0, :cond_0

    .line 666
    const-string v0, "session menu: the host window does not exist yet; no panel to prepare"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 667
    return-void

    .line 671
    :cond_0
    const/4 v0, 0x0

    :try_start_0
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    .line 672
    .local v2, "inflater":Landroid/view/LayoutInflater;
    sget v3, Lorg/wiiucoop/bo2android/R$layout;->view_session_panel:I

    sget-object v4, Lorg/wiiucoop/bo2android/MainActivity;->mLayout:Landroid/view/ViewGroup;

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    .line 677
    iget-object v3, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    sget v4, Lorg/wiiucoop/bo2android/R$id;->session_panel_sheet:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lorg/wiiucoop/bo2android/MainActivity;->sheet:Landroid/view/View;

    .line 678
    iget-object v3, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    sget v4, Lorg/wiiucoop/bo2android/R$id;->session_panel_scrim:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lorg/wiiucoop/bo2android/MainActivity;->scrim:Landroid/view/View;

    .line 679
    iput-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->fpsRequestedValue:Landroid/widget/TextView;

    .line 680
    iget-object v3, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    sget v4, Lorg/wiiucoop/bo2android/R$id;->session_fps_badge:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lorg/wiiucoop/bo2android/MainActivity;->fpsBadge:Landroid/widget/TextView;

    .line 682
    iget-object v3, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    sget v4, Lorg/wiiucoop/bo2android/R$id;->row_session_exit:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 683
    iget-object v3, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    sget v4, Lorg/wiiucoop/bo2android/R$id;->row_session_fps:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 684
    iget-object v3, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    sget v4, Lorg/wiiucoop/bo2android/R$id;->row_session_controls:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 685
    iget-object v3, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    sget v4, Lorg/wiiucoop/bo2android/R$id;->row_session_keyboard:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 686
    iget-object v3, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    sget v4, Lorg/wiiucoop/bo2android/R$id;->row_session_console:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 687
    iget-object v3, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    sget v4, Lorg/wiiucoop/bo2android/R$id;->row_session_touch:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 688
    iget-object v3, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    sget v4, Lorg/wiiucoop/bo2android/R$id;->row_session_logs:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 689
    iget-object v3, p0, Lorg/wiiucoop/bo2android/MainActivity;->scrim:Landroid/view/View;

    invoke-virtual {v3, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 695
    iget-object v3, p0, Lorg/wiiucoop/bo2android/MainActivity;->sheet:Landroid/view/View;

    instance-of v3, v3, Landroid/widget/ScrollView;

    if-eqz v3, :cond_1

    .line 696
    iget-object v3, p0, Lorg/wiiucoop/bo2android/MainActivity;->sheet:Landroid/view/View;

    check-cast v3, Landroid/widget/ScrollView;

    new-instance v4, Lorg/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda10;

    invoke-direct {v4, p0}, Lorg/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda10;-><init>(Lorg/wiiucoop/bo2android/MainActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/ScrollView;->setOnScrollChangeListener(Landroid/view/View$OnScrollChangeListener;)V

    .line 700
    :cond_1
    iget-object v3, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 701
    sget-object v3, Lorg/wiiucoop/bo2android/MainActivity;->mLayout:Landroid/view/ViewGroup;

    iget-object v4, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 705
    .end local v2    # "inflater":Landroid/view/LayoutInflater;
    goto :goto_0

    .line 702
    :catch_0
    move-exception v2

    .line 703
    .local v2, "e":Ljava/lang/RuntimeException;
    iput-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    .line 704
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "session menu: the panel could not be inflated: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 706
    .end local v2    # "e":Ljava/lang/RuntimeException;
    :goto_0
    return-void
.end method

.method private prepareTouchControls()V
    .locals 3

    .line 292
    sget-object v0, Lorg/wiiucoop/bo2android/MainActivity;->mLayout:Landroid/view/ViewGroup;

    if-nez v0, :cond_0

    return-void

    .line 293
    :cond_0
    new-instance v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;

    invoke-direct {v0, p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchOverlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    .line 296
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchOverlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    new-instance v1, Lorg/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lorg/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda0;-><init>()V

    invoke-virtual {v0, v1}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->setCameraSink(Lorg/wiiucoop/bo2android/T6TouchOverlay$CameraSink;)V

    .line 297
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchOverlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    new-instance v1, Lorg/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lorg/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda2;-><init>(Lorg/wiiucoop/bo2android/MainActivity;)V

    invoke-virtual {v0, v1}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->setConsoleListener(Lorg/wiiucoop/bo2android/T6TouchOverlay$ConsoleListener;)V

    .line 300
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchOverlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    new-instance v1, Lorg/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda3;

    invoke-direct {v1}, Lorg/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda3;-><init>()V

    invoke-virtual {v0, v1}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->setCommandListener(Lorg/wiiucoop/bo2android/T6TouchOverlay$CommandListener;)V

    .line 305
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchOverlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    new-instance v1, Lorg/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda4;

    invoke-direct {v1}, Lorg/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda4;-><init>()V

    invoke-virtual {v0, v1}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->setKeyListener(Lorg/wiiucoop/bo2android/T6TouchOverlay$KeyListener;)V

    .line 309
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchOverlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    new-instance v1, Lorg/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0}, Lorg/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda5;-><init>(Lorg/wiiucoop/bo2android/MainActivity;)V

    invoke-virtual {v0, v1}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->setPadSink(Lorg/wiiucoop/bo2android/T6TouchOverlay$PadSink;)V

    .line 313
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchOverlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->setVisibility(I)V

    .line 316
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchOverlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    new-instance v1, Lorg/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0}, Lorg/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda6;-><init>(Lorg/wiiucoop/bo2android/MainActivity;)V

    invoke-virtual {v0, v1}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 323
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 325
    .local v0, "p":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 326
    sget-object v1, Lorg/wiiucoop/bo2android/MainActivity;->mLayout:Landroid/view/ViewGroup;

    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchOverlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    invoke-virtual {v1, v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 327
    return-void
.end method

.method private refreshHostStatus()V
    .locals 4

    .line 967
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->hostStatus:Landroid/widget/TextView;

    if-nez v0, :cond_0

    .line 968
    return-void

    .line 971
    :cond_0
    invoke-static {}, Lorg/wiiucoop/bo2android/T6SessionState;->read()Lorg/wiiucoop/bo2android/T6SessionState;

    move-result-object v0

    .line 972
    .local v0, "state":Lorg/wiiucoop/bo2android/T6SessionState;
    iget-object v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->sessionMenu:Lorg/wiiucoop/bo2android/T6SessionMenu;

    invoke-virtual {v1}, Lorg/wiiucoop/bo2android/T6SessionMenu;->isVisible()Z

    move-result v1

    invoke-static {v0, v1}, Lorg/wiiucoop/bo2android/T6SessionMenu;->statusLine(Lorg/wiiucoop/bo2android/T6SessionState;Z)Ljava/lang/String;

    move-result-object v1

    .line 974
    .local v1, "text":Ljava/lang/String;
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->hostStatusText:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 975
    iput-object v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->hostStatusText:Ljava/lang/String;

    .line 976
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->hostStatus:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 981
    iget-object v2, v0, Lorg/wiiucoop/bo2android/T6SessionState;->state:Lorg/wiiucoop/bo2android/T6SessionState$State;

    iget-object v3, p0, Lorg/wiiucoop/bo2android/MainActivity;->hostStatusLoggedState:Lorg/wiiucoop/bo2android/T6SessionState$State;

    if-eq v2, v3, :cond_1

    .line 982
    iget-object v2, v0, Lorg/wiiucoop/bo2android/T6SessionState;->state:Lorg/wiiucoop/bo2android/T6SessionState$State;

    iput-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->hostStatusLoggedState:Lorg/wiiucoop/bo2android/T6SessionState$State;

    .line 983
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "host status strip -> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "t6android"

    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 986
    :cond_1
    return-void
.end method

.method private refreshPanel()V
    .locals 5

    .line 1130
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    if-nez v0, :cond_0

    .line 1131
    return-void

    .line 1136
    :cond_0
    invoke-static {}, Lorg/wiiucoop/bo2android/T6SessionState;->read()Lorg/wiiucoop/bo2android/T6SessionState;

    move-result-object v0

    .line 1137
    .local v0, "state":Lorg/wiiucoop/bo2android/T6SessionState;
    iget-object v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->config:Lorg/wiiucoop/bo2android/T6Config;

    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->lastFps:Lorg/wiiucoop/bo2android/T6EngineCommand$Result;

    iget-object v3, p0, Lorg/wiiucoop/bo2android/MainActivity;->fpsRequested:Ljava/lang/String;

    .line 1138
    invoke-static {v1, v0, v2, v3}, Lorg/wiiucoop/bo2android/T6SessionMenu;->snapshot(Lorg/wiiucoop/bo2android/T6Config;Lorg/wiiucoop/bo2android/T6SessionState;Lorg/wiiucoop/bo2android/T6EngineCommand$Result;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6SessionMenu$Snapshot;

    move-result-object v1

    .line 1143
    .local v1, "snapshot":Lorg/wiiucoop/bo2android/T6SessionMenu$Snapshot;
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->stateValue:Landroid/widget/TextView;

    iget-object v3, v1, Lorg/wiiucoop/bo2android/T6SessionMenu$Snapshot;->session:Ljava/lang/String;

    invoke-direct {p0, v2, v3}, Lorg/wiiucoop/bo2android/MainActivity;->setText(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 1144
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->engineValue:Landroid/widget/TextView;

    iget-object v3, v1, Lorg/wiiucoop/bo2android/T6SessionMenu$Snapshot;->engine:Ljava/lang/String;

    invoke-direct {p0, v2, v3}, Lorg/wiiucoop/bo2android/MainActivity;->setText(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 1145
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->clientValue:Landroid/widget/TextView;

    iget-object v3, v1, Lorg/wiiucoop/bo2android/T6SessionMenu$Snapshot;->client:Ljava/lang/String;

    invoke-direct {p0, v2, v3}, Lorg/wiiucoop/bo2android/MainActivity;->setText(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 1146
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->folderValue:Landroid/widget/TextView;

    iget-object v3, v1, Lorg/wiiucoop/bo2android/T6SessionMenu$Snapshot;->folder:Ljava/lang/String;

    invoke-direct {p0, v2, v3}, Lorg/wiiucoop/bo2android/MainActivity;->setText(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 1147
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->fpsValue:Landroid/widget/TextView;

    iget-object v3, v1, Lorg/wiiucoop/bo2android/T6SessionMenu$Snapshot;->fps:Ljava/lang/String;

    invoke-direct {p0, v2, v3}, Lorg/wiiucoop/bo2android/MainActivity;->setText(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 1149
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->fpsRequestedValue:Landroid/widget/TextView;

    if-eqz v2, :cond_2

    .line 1151
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->fpsRequestedValue:Landroid/widget/TextView;

    iget-object v3, p0, Lorg/wiiucoop/bo2android/MainActivity;->lastFps:Lorg/wiiucoop/bo2android/T6EngineCommand$Result;

    if-nez v3, :cond_1

    const-string v3, ""

    goto :goto_0

    .line 1152
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "cg_drawfps "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/wiiucoop/bo2android/MainActivity;->fpsRequested:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1151
    :goto_0
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1155
    :cond_2
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->fpsBadge:Landroid/widget/TextView;

    if-eqz v2, :cond_4

    .line 1156
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->fpsBadge:Landroid/widget/TextView;

    const-string v3, "show_fps"

    const/4 v4, 0x0

    invoke-static {p0, v3, v4}, Lorg/wiiucoop/bo2android/T6Ui;->getBool(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_3

    sget v3, Lorg/wiiucoop/bo2android/R$string;->session_hud_badge_on:I

    goto :goto_1

    .line 1157
    :cond_3
    sget v3, Lorg/wiiucoop/bo2android/R$string;->session_hud_badge_off:I

    .line 1156
    :goto_1
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 1159
    :cond_4
    return-void
.end method

.method private refreshTouchBadge(Ljava/lang/String;I)V
    .locals 2
    .param p1, "mode"    # Ljava/lang/String;
    .param p2, "pads"    # I

    .line 345
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    if-nez v0, :cond_0

    return-void

    .line 346
    :cond_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    sget v1, Lorg/wiiucoop/bo2android/R$id;->session_touch_badge:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 347
    .local v0, "badge":Landroid/widget/TextView;
    if-nez v0, :cond_1

    return-void

    .line 348
    :cond_1
    const-string v1, "off"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    sget v1, Lorg/wiiucoop/bo2android/R$string;->session_touch_off:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 349
    :cond_2
    const-string v1, "auto"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    if-lez p2, :cond_3

    iget-object v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchAuto:Lorg/wiiucoop/bo2android/T6TouchAuto;

    invoke-virtual {v1}, Lorg/wiiucoop/bo2android/T6TouchAuto;->touchTookOver()Z

    move-result v1

    if-nez v1, :cond_3

    sget v1, Lorg/wiiucoop/bo2android/R$string;->session_touch_auto_pad:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 350
    :cond_3
    sget v1, Lorg/wiiucoop/bo2android/R$string;->session_touch_on:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 351
    :goto_0
    return-void
.end method

.method private registerBackCallback()V
    .locals 3

    .line 609
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-ge v0, v1, :cond_0

    .line 610
    return-void

    .line 613
    :cond_0
    new-instance v0, Lorg/wiiucoop/bo2android/MainActivity$3;

    invoke-direct {v0, p0}, Lorg/wiiucoop/bo2android/MainActivity$3;-><init>(Lorg/wiiucoop/bo2android/MainActivity;)V

    iput-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->backCallback:Landroid/window/OnBackInvokedCallback;

    .line 620
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MainActivity;->getOnBackInvokedDispatcher()Landroid/window/OnBackInvokedDispatcher;

    move-result-object v0

    const/4 v1, 0x0

    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->backCallback:Landroid/window/OnBackInvokedCallback;

    invoke-interface {v0, v1, v2}, Landroid/window/OnBackInvokedDispatcher;->registerOnBackInvokedCallback(ILandroid/window/OnBackInvokedCallback;)V

    .line 622
    return-void
.end method

.method private requestFpsOverlay()V
    .locals 7

    .line 1049
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->fpsRequested:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const-string v1, "show_fps"

    const-string v2, "1"

    const/4 v3, 0x0

    if-eqz v0, :cond_0

    .line 1050
    invoke-static {p0, v1, v3}, Lorg/wiiucoop/bo2android/T6Ui;->getBool(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    goto :goto_0

    .line 1051
    :cond_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->fpsRequested:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_0
    nop

    .line 1052
    .local v0, "current":Z
    if-nez v0, :cond_1

    const/4 v4, 0x1

    goto :goto_1

    :cond_1
    move v4, v3

    .line 1054
    .local v4, "enable":Z
    :goto_1
    invoke-static {v4}, Lorg/wiiucoop/bo2android/T6EngineCommand;->setFpsOverlay(Z)Lorg/wiiucoop/bo2android/T6EngineCommand$Result;

    move-result-object v5

    iput-object v5, p0, Lorg/wiiucoop/bo2android/MainActivity;->lastFps:Lorg/wiiucoop/bo2android/T6EngineCommand$Result;

    .line 1056
    iget-object v5, p0, Lorg/wiiucoop/bo2android/MainActivity;->lastFps:Lorg/wiiucoop/bo2android/T6EngineCommand$Result;

    iget-boolean v5, v5, Lorg/wiiucoop/bo2android/T6EngineCommand$Result;->applied:Z

    if-eqz v5, :cond_2

    invoke-static {p0, v1, v4}, Lorg/wiiucoop/bo2android/T6Ui;->setBool(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 1057
    :cond_2
    if-eqz v4, :cond_3

    goto :goto_2

    :cond_3
    const-string v2, "0"

    :goto_2
    iput-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->fpsRequested:Ljava/lang/String;

    .line 1059
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->refreshPanel()V

    .line 1060
    const-string v1, "item Exibir FPS"

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/MainActivity;->logPanelState(Ljava/lang/String;)V

    .line 1064
    iget-object v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->uiHandler:Landroid/os/Handler;

    new-instance v2, Lorg/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0}, Lorg/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda1;-><init>(Lorg/wiiucoop/bo2android/MainActivity;)V

    const-wide/16 v5, 0xaa

    invoke-virtual {v1, v2, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1068
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "session menu: cg_drawfps badge = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1069
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->fpsBadge:Landroid/widget/TextView;

    if-nez v2, :cond_4

    const-string v2, ""

    goto :goto_3

    :cond_4
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->fpsBadge:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    :goto_3
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1068
    const-string v2, "t6android"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1071
    iget-object v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->lastFps:Lorg/wiiucoop/bo2android/T6EngineCommand$Result;

    const-string v5, "cg_drawfps"

    iget-object v6, p0, Lorg/wiiucoop/bo2android/MainActivity;->fpsRequested:Ljava/lang/String;

    invoke-static {v1, v5, v6}, Lorg/wiiucoop/bo2android/T6EngineCommand;->describe(Lorg/wiiucoop/bo2android/T6EngineCommand$Result;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1072
    .local v1, "answer":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "session menu: cg_drawfps request -> "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1075
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->lastFps:Lorg/wiiucoop/bo2android/T6EngineCommand$Result;

    iget-boolean v2, v2, Lorg/wiiucoop/bo2android/T6EngineCommand$Result;->applied:Z

    if-eqz v2, :cond_6

    if-eqz v4, :cond_5

    sget v2, Lorg/wiiucoop/bo2android/R$string;->session_fps_on:I

    goto :goto_4

    :cond_5
    sget v2, Lorg/wiiucoop/bo2android/R$string;->session_fps_off:I

    goto :goto_4

    .line 1076
    :cond_6
    sget v2, Lorg/wiiucoop/bo2android/R$string;->session_fps_not_applied:I

    :goto_4
    nop

    .line 1075
    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    .line 1076
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 1077
    return-void
.end method

.method private setHostStatusVisible(Z)V
    .locals 2
    .param p1, "visible"    # Z

    .line 950
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->hostStatus:Landroid/widget/TextView;

    if-nez v0, :cond_0

    .line 951
    return-void

    .line 954
    :cond_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->hostStatus:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_1

    sget-object v0, Lorg/wiiucoop/bo2android/MainActivity;->mLayout:Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    .line 955
    sget-object v0, Lorg/wiiucoop/bo2android/MainActivity;->mLayout:Landroid/view/ViewGroup;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->hostStatus:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 958
    :cond_1
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->hostStatus:Landroid/widget/TextView;

    if-eqz p1, :cond_2

    const/4 v1, 0x0

    goto :goto_0

    :cond_2
    const/16 v1, 0x8

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 959
    return-void
.end method

.method private setText(Landroid/widget/TextView;Ljava/lang/String;)V
    .locals 0
    .param p1, "view"    # Landroid/widget/TextView;
    .param p2, "text"    # Ljava/lang/String;

    .line 1162
    if-eqz p1, :cond_0

    .line 1163
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1165
    :cond_0
    return-void
.end method

.method private sheetWidth()F
    .locals 3

    .line 989
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->sheet:Landroid/view/View;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->sheet:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    .line 990
    .local v0, "width":I
    :goto_0
    if-lez v0, :cond_1

    int-to-float v1, v0

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v2, 0x43a20000    # 324.0f

    mul-float/2addr v1, v2

    :goto_1
    return v1
.end method

.method private startProbe()V
    .locals 4

    .line 1104
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->uiHandler:Landroid/os/Handler;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->probe:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1105
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->uiHandler:Landroid/os/Handler;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->probe:Ljava/lang/Runnable;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1106
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->uiHandler:Landroid/os/Handler;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchTick:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1107
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->uiHandler:Landroid/os/Handler;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchTick:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1108
    return-void
.end method

.method private stopProbe()V
    .locals 2

    .line 1111
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->uiHandler:Landroid/os/Handler;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->probe:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1112
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->uiHandler:Landroid/os/Handler;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchTick:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1113
    return-void
.end method

.method private toggleDxvkHud()V
    .locals 4

    .line 1033
    const-string v0, "show_fps"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lorg/wiiucoop/bo2android/T6Ui;->getBool(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    .line 1034
    .local v2, "enable":Z
    invoke-static {p0, v0, v2}, Lorg/wiiucoop/bo2android/T6Ui;->setBool(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 1035
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->refreshPanel()V

    .line 1036
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "session menu: DXVK HUD set "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    if-eqz v2, :cond_0

    const-string v3, "on"

    goto :goto_0

    :cond_0
    const-string v3, "off"

    :goto_0
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " (from the next start)"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v3, "t6android"

    invoke-static {v3, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1037
    if-eqz v2, :cond_1

    sget v0, Lorg/wiiucoop/bo2android/R$string;->session_hud_on:I

    goto :goto_1

    :cond_1
    sget v0, Lorg/wiiucoop/bo2android/R$string;->session_hud_off:I

    :goto_1
    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1038
    return-void
.end method

.method private toggleTouchControls()V
    .locals 7

    .line 336
    const-string v0, "touch_mode"

    const-string v1, "auto"

    invoke-static {p0, v0, v1}, Lorg/wiiucoop/bo2android/T6Ui;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 337
    .local v2, "mode":Ljava/lang/String;
    const-string v3, "on"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lorg/wiiucoop/bo2android/T6Native;->connectedPads()I

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchAuto:Lorg/wiiucoop/bo2android/T6TouchAuto;

    invoke-virtual {v1}, Lorg/wiiucoop/bo2android/T6TouchAuto;->touchTookOver()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    .line 338
    .local v1, "enabled":Z
    :goto_1
    const-string v4, "off"

    if-eqz v1, :cond_2

    move-object v5, v4

    goto :goto_2

    :cond_2
    move-object v5, v3

    .line 339
    .local v5, "next":Ljava/lang/String;
    :goto_2
    invoke-static {p0, v0, v5}, Lorg/wiiucoop/bo2android/T6Ui;->setString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 340
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "session menu: virtual controls "

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    if-eqz v1, :cond_3

    move-object v3, v4

    :cond_3
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " (touch_mode "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " -> "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ")"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v3, "t6android"

    invoke-static {v3, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 341
    const-string v0, "side menu"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/MainActivity;->updateTouchControls(Ljava/lang/String;)V

    .line 342
    return-void
.end method

.method private updateTouchControls(Ljava/lang/String;)V
    .locals 13
    .param p1, "why"    # Ljava/lang/String;

    .line 417
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchOverlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    if-nez v0, :cond_0

    return-void

    .line 418
    :cond_0
    const-string v0, "touch_mode"

    const-string v1, "auto"

    invoke-static {p0, v0, v1}, Lorg/wiiucoop/bo2android/T6Ui;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 419
    .local v0, "mode":Ljava/lang/String;
    invoke-static {}, Lorg/wiiucoop/bo2android/T6Native;->connectedPads()I

    move-result v1

    .line 420
    .local v1, "pads":I
    invoke-static {}, Lorg/wiiucoop/bo2android/T6Native;->clientState()I

    move-result v2

    .line 421
    .local v2, "client":I
    invoke-static {v2}, Lorg/wiiucoop/bo2android/T6Native;->inGameplay(I)Z

    move-result v3

    .line 422
    .local v3, "gameplay":Z
    invoke-static {v2}, Lorg/wiiucoop/bo2android/T6Native;->consoleOpen(I)Z

    move-result v4

    .line 423
    .local v4, "console":Z
    iget-boolean v5, p0, Lorg/wiiucoop/bo2android/MainActivity;->consoleWasOpen:Z

    const-string v6, "t6android"

    const/4 v7, 0x0

    if-eq v4, v5, :cond_3

    .line 424
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "touch: engine console "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    if-eqz v4, :cond_1

    const-string v8, "opened"

    goto :goto_0

    :cond_1
    const-string v8, "closed"

    :goto_0
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 425
    iget-object v5, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchOverlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    invoke-virtual {v5}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->releaseAll()V

    .line 426
    if-nez v4, :cond_2

    iget-boolean v5, p0, Lorg/wiiucoop/bo2android/MainActivity;->consoleKeyboard:Z

    if-eqz v5, :cond_2

    .line 427
    invoke-static {v7}, Lorg/wiiucoop/bo2android/T6Native;->setTextInput(Z)Z

    .line 428
    iput-boolean v7, p0, Lorg/wiiucoop/bo2android/MainActivity;->consoleKeyboard:Z

    .line 430
    :cond_2
    iput-boolean v4, p0, Lorg/wiiucoop/bo2android/MainActivity;->consoleWasOpen:Z

    .line 434
    :cond_3
    iget-object v5, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchAuto:Lorg/wiiucoop/bo2android/T6TouchAuto;

    invoke-virtual {v5, v0, v3, v1}, Lorg/wiiucoop/bo2android/T6TouchAuto;->show(Ljava/lang/String;ZI)Z

    move-result v5

    .line 435
    .local v5, "show":Z
    if-eqz v5, :cond_4

    iget-object v8, p0, Lorg/wiiucoop/bo2android/MainActivity;->sessionMenu:Lorg/wiiucoop/bo2android/T6SessionMenu;

    invoke-virtual {v8}, Lorg/wiiucoop/bo2android/T6SessionMenu;->isVisible()Z

    move-result v8

    if-nez v8, :cond_4

    const/4 v8, 0x1

    goto :goto_1

    :cond_4
    move v8, v7

    .line 436
    .local v8, "active":Z
    :goto_1
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "mode "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    if-gez v1, :cond_5

    const-string v11, "gamepads unknown"

    goto :goto_2

    :cond_5
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " SDL gamepad(s)"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    :goto_2
    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 437
    iget-object v11, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchAuto:Lorg/wiiucoop/bo2android/T6TouchAuto;

    invoke-virtual {v11}, Lorg/wiiucoop/bo2android/T6TouchAuto;->touchTookOver()Z

    move-result v11

    if-eqz v11, :cond_6

    const-string v11, ", touch took over"

    goto :goto_3

    :cond_6
    const-string v11, ""

    :goto_3
    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    if-eqz v3, :cond_7

    const-string v11, "gameplay"

    goto :goto_4

    :cond_7
    const-string v11, "engine menu"

    :goto_4
    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 438
    .local v9, "reason":Ljava/lang/String;
    iget-boolean v11, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchShown:Z

    if-ne v5, v11, :cond_8

    iget-object v11, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchReason:Ljava/lang/String;

    invoke-virtual {v9, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_a

    .line 439
    :cond_8
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "touch controls: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    if-eqz v5, :cond_9

    const-string v12, "shown"

    goto :goto_5

    :cond_9
    const-string v12, "hidden"

    :goto_5
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " ("

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ")"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v6, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 440
    iput-object v9, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchReason:Ljava/lang/String;

    .line 442
    :cond_a
    iput-boolean v5, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchShown:Z

    .line 443
    iget-object v10, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchOverlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    if-eqz v5, :cond_b

    goto :goto_6

    :cond_b
    const/16 v7, 0x8

    :goto_6
    invoke-virtual {v10, v7}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->setVisibility(I)V

    .line 444
    iget-object v7, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchOverlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    invoke-virtual {v7, v8}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->setPadActive(Z)V

    .line 446
    if-eqz v8, :cond_c

    new-instance v7, Ljava/io/File;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MainActivity;->getFilesDir()Ljava/io/File;

    move-result-object v10

    const-string v11, "touch_selftest.request"

    invoke-direct {v7, v10, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    move-result v7

    if-eqz v7, :cond_c

    .line 447
    const-string v7, "touch selftest: requested; running in gameplay"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 448
    sget-object v6, Lorg/wiiucoop/bo2android/MainActivity;->mLayout:Landroid/view/ViewGroup;

    iget-object v7, p0, Lorg/wiiucoop/bo2android/MainActivity;->uiHandler:Landroid/os/Handler;

    iget-object v10, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchOverlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    invoke-virtual {v10}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getLayout()Lorg/wiiucoop/bo2android/T6TouchLayout;

    move-result-object v10

    invoke-static {v6, v7, v10}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->run(Landroid/view/ViewGroup;Landroid/os/Handler;Lorg/wiiucoop/bo2android/T6TouchLayout;)V

    .line 450
    :cond_c
    invoke-direct {p0, v0, v1}, Lorg/wiiucoop/bo2android/MainActivity;->refreshTouchBadge(Ljava/lang/String;I)V

    .line 451
    return-void
.end method


# virtual methods
.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 1
    .param p1, "base"    # Landroid/content/Context;

    .line 89
    invoke-static {p1}, Lorg/wiiucoop/bo2android/T6Ui;->wrapLocale(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-super {p0, v0}, Lorg/libsdl/app/SDLActivity;->attachBaseContext(Landroid/content/Context;)V

    .line 90
    return-void
.end method

.method public dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 6
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 565
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v0

    invoke-static {v0}, Lorg/wiiucoop/bo2android/MainActivity;->isFromPad(I)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 566
    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 568
    .local v0, "axes":[I
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget v3, v0, v2

    .line 569
    .local v3, "axis":I
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result v4

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    const/high16 v5, 0x3f000000    # 0.5f

    cmpl-float v4, v4, v5

    if-lez v4, :cond_0

    .line 570
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->onPadInput()V

    .line 571
    goto :goto_1

    .line 568
    .end local v3    # "axis":I
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 575
    .end local v0    # "axes":[I
    :cond_1
    :goto_1
    invoke-super {p0, p1}, Lorg/libsdl/app/SDLActivity;->dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    :array_0
    .array-data 4
        0x0
        0x1
        0xb
        0xe
        0x11
        0x12
        0xf
        0x10
    .end array-data
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 4
    .param p1, "event"    # Landroid/view/KeyEvent;

    .line 521
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getSource()I

    move-result v0

    invoke-static {v0}, Lorg/wiiucoop/bo2android/MainActivity;->isFromPad(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->onPadInput()V

    .line 522
    :cond_0
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6SessionMenu;->isBackKey(I)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_3

    .line 523
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getSource()I

    move-result v2

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getFlags()I

    move-result v3

    invoke-static {v0, v2, v3}, Lorg/wiiucoop/bo2android/T6SessionMenu;->isPanelBack(III)Z

    move-result v0

    if-nez v0, :cond_3

    .line 524
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v1, :cond_1

    .line 525
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "back key from a controller (source 0x"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getSource()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", flags 0x"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 526
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getFlags()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "): not the panel"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 525
    const-string v2, "t6android"

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 530
    :cond_1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getFlags()I

    move-result v0

    and-int/lit16 v0, v0, 0x400

    if-eqz v0, :cond_2

    return v1

    .line 531
    :cond_2
    invoke-super {p0, p1}, Lorg/libsdl/app/SDLActivity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    return v0

    .line 533
    :cond_3
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6SessionMenu;->isBackKey(I)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 536
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v2

    invoke-static {v0, v2}, Lorg/wiiucoop/bo2android/T6SessionMenu;->isBackPress(II)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 537
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->handleBack()V

    .line 539
    :cond_4
    return v1

    .line 542
    :cond_5
    invoke-super {p0, p1}, Lorg/libsdl/app/SDLActivity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 551
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchOverlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchShown:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->sessionMenu:Lorg/wiiucoop/bo2android/T6SessionMenu;

    .line 552
    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6SessionMenu;->isVisible()Z

    move-result v0

    if-nez v0, :cond_0

    .line 553
    invoke-static {}, Lorg/wiiucoop/bo2android/T6Native;->clientState()I

    move-result v0

    .line 554
    .local v0, "client":I
    const-string v1, "touch_mode"

    const-string v2, "auto"

    invoke-static {p0, v1, v2}, Lorg/wiiucoop/bo2android/T6Ui;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 555
    .local v1, "mode":Ljava/lang/String;
    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchAuto:Lorg/wiiucoop/bo2android/T6TouchAuto;

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6Native;->inGameplay(I)Z

    move-result v3

    invoke-static {}, Lorg/wiiucoop/bo2android/T6Native;->connectedPads()I

    move-result v4

    invoke-virtual {v2, v1, v3, v4}, Lorg/wiiucoop/bo2android/T6TouchAuto;->onScreenTouch(Ljava/lang/String;ZI)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 556
    const-string v2, "screen touch"

    invoke-direct {p0, v2}, Lorg/wiiucoop/bo2android/MainActivity;->updateTouchControls(Ljava/lang/String;)V

    .line 559
    .end local v0    # "client":I
    .end local v1    # "mode":Ljava/lang/String;
    :cond_0
    invoke-super {p0, p1}, Lorg/libsdl/app/SDLActivity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method protected getArguments()[Ljava/lang/String;
    .locals 5

    .line 479
    const/4 v0, 0x0

    .line 480
    .local v0, "configPath":Ljava/lang/String;
    const/4 v1, 0x0

    .line 482
    .local v1, "mode":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MainActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 483
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MainActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "org.wiiucoop.bo2android.CONFIG_PATH"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 484
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MainActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "org.wiiucoop.bo2android.MODE"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 487
    :cond_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 488
    :cond_1
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MainActivity;->getFilesDir()Ljava/io/File;

    move-result-object v3

    const-string v4, "t6_config.ini"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 491
    :cond_2
    if-eqz v1, :cond_3

    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6Config;->isKnownMode(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 492
    :cond_3
    const-string v1, ""

    .line 495
    :cond_4
    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "--config"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object v0, v2, v3

    const/4 v3, 0x2

    const-string v4, "--mode"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    aput-object v1, v2, v3

    return-object v2
.end method

.method protected getLibraries()[Ljava/lang/String;
    .locals 3

    .line 474
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "SDL3"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "t6host"

    aput-object v2, v0, v1

    return-object v0
.end method

.method synthetic lambda$closePanel$8$org-wiiucoop-bo2android-MainActivity()V
    .locals 2

    .line 866
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->sessionMenu:Lorg/wiiucoop/bo2android/T6SessionMenu;

    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6SessionMenu;->isVisible()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 867
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->panelRoot:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 869
    :cond_0
    return-void
.end method

.method synthetic lambda$openPanel$7$org-wiiucoop-bo2android-MainActivity()V
    .locals 1

    .line 765
    const-string v0, "painel aberto"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/MainActivity;->logRowGeometry(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$prepareSessionPanel$6$org-wiiucoop-bo2android-MainActivity(Landroid/view/View;IIII)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;
    .param p2, "scrollX"    # I
    .param p3, "scrollY"    # I
    .param p4, "oldScrollX"    # I
    .param p5, "oldScrollY"    # I

    .line 697
    invoke-direct {p0, p3}, Lorg/wiiucoop/bo2android/MainActivity;->onSheetScrolled(I)V

    return-void
.end method

.method synthetic lambda$prepareTouchControls$4$org-wiiucoop-bo2android-MainActivity(ZIIIIIII)V
    .locals 0
    .param p1, "active"    # Z
    .param p2, "buttons"    # I
    .param p3, "lt"    # I
    .param p4, "rt"    # I
    .param p5, "lx"    # I
    .param p6, "ly"    # I
    .param p7, "rx"    # I
    .param p8, "ry"    # I

    .line 310
    invoke-static/range {p1 .. p8}, Lorg/wiiucoop/bo2android/T6Native;->setTouchPad(ZIIIIIII)V

    .line 311
    invoke-direct/range {p0 .. p8}, Lorg/wiiucoop/bo2android/MainActivity;->logTouchPad(ZIIIIIII)V

    .line 312
    return-void
.end method

.method synthetic lambda$prepareTouchControls$5$org-wiiucoop-bo2android-MainActivity(Landroid/view/View;IIIIIIII)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I
    .param p6, "ol"    # I
    .param p7, "ot"    # I
    .param p8, "or"    # I
    .param p9, "ob"    # I

    .line 317
    sub-int v0, p4, p2

    .local v0, "w":I
    sub-int v1, p5, p3

    .line 318
    .local v1, "h":I
    if-lez v0, :cond_1

    if-lez v1, :cond_1

    sub-int v2, p8, p6

    if-ne v0, v2, :cond_0

    sub-int v2, p9, p7

    if-eq v1, v2, :cond_1

    .line 319
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v4, "touch_surface"

    invoke-static {p0, v4, v2}, Lorg/wiiucoop/bo2android/T6Ui;->setString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 320
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "touch: game surface "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " (recorded for the controls editor)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "t6android"

    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 322
    :cond_1
    return-void
.end method

.method synthetic lambda$requestFpsOverlay$9$org-wiiucoop-bo2android-MainActivity()V
    .locals 1

    .line 1064
    const-string v0, "item Exibir FPS"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/MainActivity;->logRowGeometry(Ljava/lang/String;)V

    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .line 594
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->handleBack()V

    .line 595
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .line 997
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 999
    .local v0, "id":I
    sget v1, Lorg/wiiucoop/bo2android/R$id;->row_session_exit:I

    if-ne v0, v1, :cond_0

    .line 1000
    const-string v1, "item SAIR"

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/MainActivity;->leaveSession(Ljava/lang/String;)V

    goto :goto_0

    .line 1001
    :cond_0
    sget v1, Lorg/wiiucoop/bo2android/R$id;->row_session_fps:I

    if-ne v0, v1, :cond_1

    .line 1002
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->toggleDxvkHud()V

    goto :goto_0

    .line 1003
    :cond_1
    sget v1, Lorg/wiiucoop/bo2android/R$id;->row_session_controls:I

    if-ne v0, v1, :cond_2

    .line 1004
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lorg/wiiucoop/bo2android/TouchControlsActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 1005
    const-string v1, "item Editar Controles"

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/MainActivity;->closePanel(Ljava/lang/String;)V

    goto :goto_0

    .line 1006
    :cond_2
    sget v1, Lorg/wiiucoop/bo2android/R$id;->row_session_touch:I

    if-ne v0, v1, :cond_3

    .line 1007
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->toggleTouchControls()V

    goto :goto_0

    .line 1008
    :cond_3
    sget v1, Lorg/wiiucoop/bo2android/R$id;->row_session_keyboard:I

    if-ne v0, v1, :cond_4

    .line 1011
    const-string v1, "item Teclado"

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/MainActivity;->closePanel(Ljava/lang/String;)V

    .line 1012
    const/4 v1, 0x1

    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6Native;->setTextInput(Z)Z

    .line 1013
    sget v1, Lorg/wiiucoop/bo2android/R$string;->session_keyboard_opened:I

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 1014
    :cond_4
    sget v1, Lorg/wiiucoop/bo2android/R$id;->row_session_console:I

    if-ne v0, v1, :cond_5

    .line 1017
    const-string v1, "item Console"

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/MainActivity;->closePanel(Ljava/lang/String;)V

    .line 1018
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->openConsole()V

    goto :goto_0

    .line 1019
    :cond_5
    sget v1, Lorg/wiiucoop/bo2android/R$id;->row_session_logs:I

    if-ne v0, v1, :cond_6

    .line 1020
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lorg/wiiucoop/bo2android/LogsActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 1021
    const-string v1, "item Logs"

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/MainActivity;->closePanel(Ljava/lang/String;)V

    goto :goto_0

    .line 1022
    :cond_6
    sget v1, Lorg/wiiucoop/bo2android/R$id;->session_panel_scrim:I

    if-ne v0, v1, :cond_7

    .line 1023
    const-string v1, "toque fora do painel"

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/MainActivity;->closePanel(Ljava/lang/String;)V

    .line 1025
    :cond_7
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 185
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MainActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 186
    .local v0, "intent":Landroid/content/Intent;
    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 187
    const-string v2, "org.wiiucoop.bo2android.CONFIG_PATH"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 189
    .local v2, "launchedByMenu":Z
    :goto_0
    if-nez v2, :cond_1

    .line 190
    const-string v1, "t6android"

    const-string v3, "host: MainActivity started without the menu\'s arguments; returning to the menu"

    invoke-static {v1, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    new-instance v1, Landroid/content/Intent;

    const-class v3, Lorg/wiiucoop/bo2android/MenuActivity;

    invoke-direct {v1, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 192
    .local v1, "menu":Landroid/content/Intent;
    const/high16 v3, 0x24000000

    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 193
    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 194
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MainActivity;->finish()V

    .line 195
    return-void

    .line 198
    .end local v1    # "menu":Landroid/content/Intent;
    :cond_1
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->applyTheme(Landroid/app/Activity;)V

    .line 199
    invoke-super {p0, p1}, Lorg/libsdl/app/SDLActivity;->onCreate(Landroid/os/Bundle;)V

    .line 201
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->followDefaultNetwork()V

    .line 202
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->applyImmersive(Landroid/app/Activity;)V

    .line 203
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->letterboxSurface()V

    .line 205
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->loadConfiguration()V

    .line 209
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->prepareHostStatus()V

    .line 210
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->prepareTouchControls()V

    .line 211
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->prepareSessionPanel()V

    .line 212
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->registerBackCallback()V

    .line 214
    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/MainActivity;->setHostStatusVisible(Z)V

    .line 215
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->refreshHostStatus()V

    .line 216
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->refreshPanel()V

    .line 217
    return-void
.end method

.method protected onDestroy()V
    .locals 3

    .line 455
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->stopProbe()V

    .line 456
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->networkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 458
    :try_start_0
    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->networkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    invoke-virtual {v0, v2}, Landroid/net/ConnectivityManager;->unregisterNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 460
    goto :goto_0

    .line 459
    :catch_0
    move-exception v0

    .line 461
    :goto_0
    iput-object v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->networkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    .line 464
    :cond_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->backCallback:Landroid/window/OnBackInvokedCallback;

    if-eqz v0, :cond_1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x21

    if-lt v0, v2, :cond_1

    .line 465
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/MainActivity;->getOnBackInvokedDispatcher()Landroid/window/OnBackInvokedDispatcher;

    move-result-object v0

    iget-object v2, p0, Lorg/wiiucoop/bo2android/MainActivity;->backCallback:Landroid/window/OnBackInvokedCallback;

    invoke-interface {v0, v2}, Landroid/window/OnBackInvokedDispatcher;->unregisterOnBackInvokedCallback(Landroid/window/OnBackInvokedCallback;)V

    .line 466
    iput-object v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->backCallback:Landroid/window/OnBackInvokedCallback;

    .line 469
    :cond_1
    invoke-super {p0}, Lorg/libsdl/app/SDLActivity;->onDestroy()V

    .line 470
    return-void
.end method

.method protected onPause()V
    .locals 2

    .line 276
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->stopProbe()V

    .line 278
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchOverlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchOverlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    invoke-virtual {v0, v1}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->setPadActive(Z)V

    .line 279
    :cond_0
    iput-boolean v1, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchShown:Z

    .line 280
    invoke-super {p0}, Lorg/libsdl/app/SDLActivity;->onPause()V

    .line 281
    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 247
    invoke-super {p0}, Lorg/libsdl/app/SDLActivity;->onResume()V

    .line 251
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->applyImmersive(Landroid/app/Activity;)V

    .line 255
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->ensurePanelAttached()V

    .line 259
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->loadConfiguration()V

    .line 260
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->refreshHostStatus()V

    .line 261
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->refreshPanel()V

    .line 262
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchOverlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    if-eqz v0, :cond_0

    .line 263
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity;->touchOverlay:Lorg/wiiucoop/bo2android/T6TouchOverlay;

    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->touchProfile(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lorg/wiiucoop/bo2android/T6Ui;->loadTouchLayout(Landroid/content/Context;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6TouchLayout;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->setLayout(Lorg/wiiucoop/bo2android/T6TouchLayout;)V

    .line 264
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->applyTouchOptions()V

    .line 266
    :cond_0
    const-string v0, "resume"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/MainActivity;->updateTouchControls(Ljava/lang/String;)V

    .line 271
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/MainActivity;->startProbe()V

    .line 272
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0
    .param p1, "hasFocus"    # Z

    .line 239
    invoke-super {p0, p1}, Lorg/libsdl/app/SDLActivity;->onWindowFocusChanged(Z)V

    .line 242
    if-eqz p1, :cond_0

    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->applyImmersive(Landroid/app/Activity;)V

    .line 243
    :cond_0
    return-void
.end method

.method public setOrientationBis(IIZLjava/lang/String;)V
    .locals 1
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "resizable"    # Z
    .param p4, "hint"    # Ljava/lang/String;

    .line 100
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/MainActivity;->setRequestedOrientation(I)V

    .line 101
    return-void
.end method
