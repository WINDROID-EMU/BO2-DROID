.class Lorg/libsdl/app/SDLHapticHandler_API26;
.super Lorg/libsdl/app/SDLHapticHandler;
.source "SDLControllerManager.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 686
    invoke-direct {p0}, Lorg/libsdl/app/SDLHapticHandler;-><init>()V

    return-void
.end method


# virtual methods
.method run(IFI)V
    .locals 6
    .param p1, "device_id"    # I
    .param p2, "intensity"    # F
    .param p3, "length"    # I

    .line 690
    nop

    .line 695
    invoke-virtual {p0, p1}, Lorg/libsdl/app/SDLHapticHandler_API26;->getHaptic(I)Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;

    move-result-object v0

    .line 696
    .local v0, "haptic":Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;
    if-eqz v0, :cond_3

    .line 697
    const/4 v1, 0x0

    cmpl-float v1, p2, v1

    if-nez v1, :cond_0

    .line 698
    invoke-virtual {p0, p1}, Lorg/libsdl/app/SDLHapticHandler_API26;->stop(I)V

    .line 699
    return-void

    .line 702
    :cond_0
    const/high16 v1, 0x437f0000    # 255.0f

    mul-float/2addr v1, p2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 704
    .local v1, "vibeValue":I
    const/16 v2, 0xff

    if-le v1, v2, :cond_1

    .line 705
    const/16 v1, 0xff

    .line 707
    :cond_1
    const/4 v2, 0x1

    if-ge v1, v2, :cond_2

    .line 708
    invoke-virtual {p0, p1}, Lorg/libsdl/app/SDLHapticHandler_API26;->stop(I)V

    .line 709
    return-void

    .line 712
    :cond_2
    :try_start_0
    iget-object v2, v0, Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;->vib:Landroid/os/Vibrator;

    int-to-long v3, p3

    invoke-static {v3, v4, v1}, Landroid/os/VibrationEffect;->createOneShot(JI)Landroid/os/VibrationEffect;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 718
    goto :goto_0

    .line 714
    :catch_0
    move-exception v2

    .line 717
    .local v2, "e":Ljava/lang/Exception;
    iget-object v3, v0, Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;->vib:Landroid/os/Vibrator;

    int-to-long v4, p3

    invoke-virtual {v3, v4, v5}, Landroid/os/Vibrator;->vibrate(J)V

    .line 720
    .end local v1    # "vibeValue":I
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_3
    :goto_0
    return-void
.end method
