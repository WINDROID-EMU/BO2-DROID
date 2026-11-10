.class final Lorg/wiiucoop/bo2android/T6TouchAuto;
.super Ljava/lang/Object;
.source "T6TouchAuto.java"


# instance fields
.field private lastPads:I

.field private touchTookOver:Z


# direct methods
.method constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method onPadInput()Z
    .locals 2

    .line 31
    iget-boolean v0, p0, Lorg/wiiucoop/bo2android/T6TouchAuto;->touchTookOver:Z

    .line 32
    .local v0, "was":Z
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/wiiucoop/bo2android/T6TouchAuto;->touchTookOver:Z

    .line 33
    return v0
.end method

.method onScreenTouch(Ljava/lang/String;ZI)Z
    .locals 1
    .param p1, "mode"    # Ljava/lang/String;
    .param p2, "gameplay"    # Z
    .param p3, "pads"    # I

    .line 24
    const-string v0, "auto"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p2, :cond_1

    if-lez p3, :cond_1

    iget-boolean v0, p0, Lorg/wiiucoop/bo2android/T6TouchAuto;->touchTookOver:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 25
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/wiiucoop/bo2android/T6TouchAuto;->touchTookOver:Z

    .line 26
    return v0

    .line 24
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method show(Ljava/lang/String;ZI)Z
    .locals 3
    .param p1, "mode"    # Ljava/lang/String;
    .param p2, "gameplay"    # Z
    .param p3, "pads"    # I

    .line 15
    iget v0, p0, Lorg/wiiucoop/bo2android/T6TouchAuto;->lastPads:I

    const/4 v1, 0x0

    if-le p3, v0, :cond_0

    iput-boolean v1, p0, Lorg/wiiucoop/bo2android/T6TouchAuto;->touchTookOver:Z

    .line 16
    :cond_0
    invoke-static {p3, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lorg/wiiucoop/bo2android/T6TouchAuto;->lastPads:I

    .line 17
    if-eqz p2, :cond_5

    const-string v0, "off"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 18
    :cond_1
    const-string v0, "on"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    return v2

    .line 19
    :cond_2
    if-lez p3, :cond_3

    iget-boolean v0, p0, Lorg/wiiucoop/bo2android/T6TouchAuto;->touchTookOver:Z

    if-eqz v0, :cond_4

    :cond_3
    move v1, v2

    :cond_4
    return v1

    .line 17
    :cond_5
    :goto_0
    return v1
.end method

.method touchTookOver()Z
    .locals 1

    .line 37
    iget-boolean v0, p0, Lorg/wiiucoop/bo2android/T6TouchAuto;->touchTookOver:Z

    return v0
.end method
