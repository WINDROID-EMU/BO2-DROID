.class Lorg/libsdl/app/SDLAudioManager$1;
.super Landroid/media/AudioDeviceCallback;
.source "SDLAudioManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/libsdl/app/SDLAudioManager;->initialize()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Landroid/media/AudioDeviceCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onAudioDevicesAdded([Landroid/media/AudioDeviceInfo;)V
    .locals 6
    .param p1, "addedDevices"    # [Landroid/media/AudioDeviceInfo;

    .line 28
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    .line 29
    .local v2, "deviceInfo":Landroid/media/AudioDeviceInfo;
    invoke-virtual {v2}, Landroid/media/AudioDeviceInfo;->isSink()Z

    move-result v3

    invoke-virtual {v2}, Landroid/media/AudioDeviceInfo;->getProductName()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Landroid/media/AudioDeviceInfo;->getId()I

    move-result v5

    invoke-static {v3, v4, v5}, Lorg/libsdl/app/SDLAudioManager;->nativeAddAudioDevice(ZLjava/lang/String;I)V

    .line 28
    .end local v2    # "deviceInfo":Landroid/media/AudioDeviceInfo;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 31
    :cond_0
    return-void
.end method

.method public onAudioDevicesRemoved([Landroid/media/AudioDeviceInfo;)V
    .locals 5
    .param p1, "removedDevices"    # [Landroid/media/AudioDeviceInfo;

    .line 35
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    .line 36
    .local v2, "deviceInfo":Landroid/media/AudioDeviceInfo;
    invoke-virtual {v2}, Landroid/media/AudioDeviceInfo;->isSink()Z

    move-result v3

    invoke-virtual {v2}, Landroid/media/AudioDeviceInfo;->getId()I

    move-result v4

    invoke-static {v3, v4}, Lorg/libsdl/app/SDLAudioManager;->nativeRemoveAudioDevice(ZI)V

    .line 35
    .end local v2    # "deviceInfo":Landroid/media/AudioDeviceInfo;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 38
    :cond_0
    return-void
.end method
