.class Lorg/libsdl/app/SDLHapticHandler;
.super Ljava/lang/Object;
.source "SDLControllerManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;
    }
.end annotation


# instance fields
.field private final mHaptics:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 733
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 734
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/libsdl/app/SDLHapticHandler;->mHaptics:Ljava/util/ArrayList;

    .line 735
    return-void
.end method


# virtual methods
.method declared-synchronized detectHapticDevices()V
    .locals 9

    monitor-enter p0

    .line 757
    const v0, 0xf423f

    .line 758
    .local v0, "deviceId_VIBRATOR_SERVICE":I
    const/4 v1, 0x0

    .line 761
    .local v1, "hasVibratorService":Z
    :try_start_0
    invoke-static {}, Lorg/libsdl/app/SDL;->getContext()Landroid/app/Activity;

    move-result-object v2

    const-string v3, "vibrator"

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Vibrator;

    .line 762
    .local v2, "vib":Landroid/os/Vibrator;
    const v3, 0xf423f

    if-eqz v2, :cond_0

    .line 763
    invoke-virtual {v2}, Landroid/os/Vibrator;->hasVibrator()Z

    move-result v4

    move v1, v4

    .line 765
    if-eqz v1, :cond_0

    .line 766
    invoke-virtual {p0, v3}, Lorg/libsdl/app/SDLHapticHandler;->getHaptic(I)Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;

    move-result-object v4

    .line 767
    .local v4, "haptic":Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;
    if-nez v4, :cond_0

    .line 768
    new-instance v5, Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;

    invoke-direct {v5}, Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;-><init>()V

    move-object v4, v5

    .line 769
    iput v3, v4, Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;->device_id:I

    .line 770
    const-string v5, "VIBRATOR_SERVICE"

    iput-object v5, v4, Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;->name:Ljava/lang/String;

    .line 771
    iput-object v2, v4, Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;->vib:Landroid/os/Vibrator;

    .line 772
    iget-object v5, p0, Lorg/libsdl/app/SDLHapticHandler;->mHaptics:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 773
    iget v5, v4, Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;->device_id:I

    iget-object v6, v4, Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;->name:Ljava/lang/String;

    invoke-static {v5, v6}, Lorg/libsdl/app/SDLControllerManager;->nativeAddHaptic(ILjava/lang/String;)V

    .line 779
    .end local v4    # "haptic":Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;
    .end local p0    # "this":Lorg/libsdl/app/SDLHapticHandler;
    :cond_0
    const/4 v4, 0x0

    .line 780
    .local v4, "removedDevices":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iget-object v5, p0, Lorg/libsdl/app/SDLHapticHandler;->mHaptics:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;

    .line 781
    .local v6, "haptic":Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;
    iget v7, v6, Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;->device_id:I

    .line 782
    .local v7, "device_id":I
    if-ne v7, v3, :cond_1

    if-nez v1, :cond_3

    .line 783
    :cond_1
    if-nez v4, :cond_2

    .line 784
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    move-object v4, v8

    .line 786
    :cond_2
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 788
    .end local v6    # "haptic":Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;
    .end local v7    # "device_id":I
    :cond_3
    goto :goto_0

    .line 790
    :cond_4
    if-eqz v4, :cond_7

    .line 791
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 792
    .local v5, "device_id":I
    invoke-static {v5}, Lorg/libsdl/app/SDLControllerManager;->nativeRemoveHaptic(I)V

    .line 793
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_2
    iget-object v7, p0, Lorg/libsdl/app/SDLHapticHandler;->mHaptics:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v6, v7, :cond_6

    .line 794
    iget-object v7, p0, Lorg/libsdl/app/SDLHapticHandler;->mHaptics:Ljava/util/ArrayList;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;

    iget v7, v7, Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;->device_id:I

    if-ne v7, v5, :cond_5

    .line 795
    iget-object v7, p0, Lorg/libsdl/app/SDLHapticHandler;->mHaptics:Ljava/util/ArrayList;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 796
    goto :goto_3

    .line 793
    :cond_5
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 799
    .end local v5    # "device_id":I
    .end local v6    # "i":I
    :cond_6
    :goto_3
    goto :goto_1

    .line 801
    :cond_7
    monitor-exit p0

    return-void

    .line 756
    .end local v0    # "deviceId_VIBRATOR_SERVICE":I
    .end local v1    # "hasVibratorService":Z
    .end local v2    # "vib":Landroid/os/Vibrator;
    .end local v4    # "removedDevices":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method protected declared-synchronized getHaptic(I)Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;
    .locals 3
    .param p1, "device_id"    # I

    monitor-enter p0

    .line 804
    :try_start_0
    iget-object v0, p0, Lorg/libsdl/app/SDLHapticHandler;->mHaptics:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;

    .line 805
    .local v1, "haptic":Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;
    iget v2, v1, Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;->device_id:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v2, p1, :cond_0

    .line 806
    monitor-exit p0

    return-object v1

    .line 808
    .end local v1    # "haptic":Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;
    :cond_0
    goto :goto_0

    .line 809
    .end local p0    # "this":Lorg/libsdl/app/SDLHapticHandler;
    :cond_1
    monitor-exit p0

    const/4 v0, 0x0

    return-object v0

    .line 803
    .end local p1    # "device_id":I
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method rumble(IFFI)V
    .locals 0
    .param p1, "device_id"    # I
    .param p2, "low_frequency_intensity"    # F
    .param p3, "high_frequency_intensity"    # F
    .param p4, "length"    # I

    .line 746
    return-void
.end method

.method run(IFI)V
    .locals 4
    .param p1, "device_id"    # I
    .param p2, "intensity"    # F
    .param p3, "length"    # I

    .line 738
    invoke-virtual {p0, p1}, Lorg/libsdl/app/SDLHapticHandler;->getHaptic(I)Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;

    move-result-object v0

    .line 739
    .local v0, "haptic":Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;
    if-eqz v0, :cond_0

    .line 740
    iget-object v1, v0, Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;->vib:Landroid/os/Vibrator;

    int-to-long v2, p3

    invoke-virtual {v1, v2, v3}, Landroid/os/Vibrator;->vibrate(J)V

    .line 742
    :cond_0
    return-void
.end method

.method stop(I)V
    .locals 2
    .param p1, "device_id"    # I

    .line 749
    invoke-virtual {p0, p1}, Lorg/libsdl/app/SDLHapticHandler;->getHaptic(I)Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;

    move-result-object v0

    .line 750
    .local v0, "haptic":Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;
    if-eqz v0, :cond_0

    .line 751
    iget-object v1, v0, Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;->vib:Landroid/os/Vibrator;

    invoke-virtual {v1}, Landroid/os/Vibrator;->cancel()V

    .line 753
    :cond_0
    return-void
.end method
