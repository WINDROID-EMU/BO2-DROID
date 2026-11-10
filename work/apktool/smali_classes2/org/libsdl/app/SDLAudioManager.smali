.class Lorg/libsdl/app/SDLAudioManager;
.super Ljava/lang/Object;
.source "SDLAudioManager.java"


# static fields
.field protected static final TAG:Ljava/lang/String; = "SDLAudio"

.field private static mAudioDeviceCallback:Landroid/media/AudioDeviceCallback;

.field protected static mContext:Landroid/content/Context;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static audioSetThreadPriority(ZI)V
    .locals 3
    .param p0, "recording"    # Z
    .param p1, "device_id"    # I

    .line 106
    if-eqz p0, :cond_0

    .line 107
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SDLAudioC"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    goto :goto_0

    .line 109
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SDLAudioP"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 113
    :goto_0
    const/16 v0, -0x10

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    goto :goto_1

    .line 115
    :catch_0
    move-exception v0

    .line 116
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "modify thread properties failed "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "SDLAudio"

    invoke-static {v2, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    return-void
.end method

.method private static getInputAudioDeviceInfo(I)Landroid/media/AudioDeviceInfo;
    .locals 6
    .param p0, "deviceId"    # I

    .line 54
    nop

    .line 55
    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mContext:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 56
    .local v0, "audioManager":Landroid/media/AudioManager;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getDevices(I)[Landroid/media/AudioDeviceInfo;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    .line 57
    .local v4, "deviceInfo":Landroid/media/AudioDeviceInfo;
    invoke-virtual {v4}, Landroid/media/AudioDeviceInfo;->getId()I

    move-result v5

    if-ne v5, p0, :cond_0

    .line 58
    return-object v4

    .line 56
    .end local v4    # "deviceInfo":Landroid/media/AudioDeviceInfo;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 62
    .end local v0    # "audioManager":Landroid/media/AudioManager;
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private static getPlaybackAudioDeviceInfo(I)Landroid/media/AudioDeviceInfo;
    .locals 6
    .param p0, "deviceId"    # I

    .line 66
    nop

    .line 67
    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mContext:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 68
    .local v0, "audioManager":Landroid/media/AudioManager;
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getDevices(I)[Landroid/media/AudioDeviceInfo;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    .line 69
    .local v4, "deviceInfo":Landroid/media/AudioDeviceInfo;
    invoke-virtual {v4}, Landroid/media/AudioDeviceInfo;->getId()I

    move-result v5

    if-ne v5, p0, :cond_0

    .line 70
    return-object v4

    .line 68
    .end local v4    # "deviceInfo":Landroid/media/AudioDeviceInfo;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 74
    .end local v0    # "audioManager":Landroid/media/AudioManager;
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method static initialize()V
    .locals 1

    .line 21
    const/4 v0, 0x0

    sput-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioDeviceCallback:Landroid/media/AudioDeviceCallback;

    .line 23
    nop

    .line 25
    new-instance v0, Lorg/libsdl/app/SDLAudioManager$1;

    invoke-direct {v0}, Lorg/libsdl/app/SDLAudioManager$1;-><init>()V

    sput-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioDeviceCallback:Landroid/media/AudioDeviceCallback;

    .line 41
    return-void
.end method

.method static native nativeAddAudioDevice(ZLjava/lang/String;I)V
.end method

.method static native nativeRemoveAudioDevice(ZI)V
.end method

.method static native nativeSetupJNI()V
.end method

.method static registerAudioDeviceCallback()V
    .locals 9

    .line 78
    nop

    .line 79
    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mContext:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 81
    .local v0, "audioManager":Landroid/media/AudioManager;
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getDevices(I)[Landroid/media/AudioDeviceInfo;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_1

    aget-object v5, v1, v4

    .line 82
    .local v5, "dev":Landroid/media/AudioDeviceInfo;
    invoke-virtual {v5}, Landroid/media/AudioDeviceInfo;->getType()I

    move-result v6

    const/16 v7, 0x12

    if-ne v6, v7, :cond_0

    .line 83
    goto :goto_1

    .line 85
    :cond_0
    invoke-virtual {v5}, Landroid/media/AudioDeviceInfo;->isSink()Z

    move-result v6

    invoke-virtual {v5}, Landroid/media/AudioDeviceInfo;->getProductName()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5}, Landroid/media/AudioDeviceInfo;->getId()I

    move-result v8

    invoke-static {v6, v7, v8}, Lorg/libsdl/app/SDLAudioManager;->nativeAddAudioDevice(ZLjava/lang/String;I)V

    .line 81
    .end local v5    # "dev":Landroid/media/AudioDeviceInfo;
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 87
    :cond_1
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getDevices(I)[Landroid/media/AudioDeviceInfo;

    move-result-object v1

    array-length v2, v1

    :goto_2
    if-ge v3, v2, :cond_2

    aget-object v4, v1, v3

    .line 88
    .local v4, "dev":Landroid/media/AudioDeviceInfo;
    invoke-virtual {v4}, Landroid/media/AudioDeviceInfo;->isSink()Z

    move-result v5

    invoke-virtual {v4}, Landroid/media/AudioDeviceInfo;->getProductName()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4}, Landroid/media/AudioDeviceInfo;->getId()I

    move-result v7

    invoke-static {v5, v6, v7}, Lorg/libsdl/app/SDLAudioManager;->nativeAddAudioDevice(ZLjava/lang/String;I)V

    .line 87
    .end local v4    # "dev":Landroid/media/AudioDeviceInfo;
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 90
    :cond_2
    sget-object v1, Lorg/libsdl/app/SDLAudioManager;->mAudioDeviceCallback:Landroid/media/AudioDeviceCallback;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/media/AudioManager;->registerAudioDeviceCallback(Landroid/media/AudioDeviceCallback;Landroid/os/Handler;)V

    .line 92
    .end local v0    # "audioManager":Landroid/media/AudioManager;
    return-void
.end method

.method static release(Landroid/content/Context;)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;

    .line 49
    return-void
.end method

.method static setContext(Landroid/content/Context;)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;

    .line 44
    sput-object p0, Lorg/libsdl/app/SDLAudioManager;->mContext:Landroid/content/Context;

    .line 45
    return-void
.end method

.method static unregisterAudioDeviceCallback()V
    .locals 2

    .line 95
    nop

    .line 96
    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mContext:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 97
    .local v0, "audioManager":Landroid/media/AudioManager;
    sget-object v1, Lorg/libsdl/app/SDLAudioManager;->mAudioDeviceCallback:Landroid/media/AudioDeviceCallback;

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->unregisterAudioDeviceCallback(Landroid/media/AudioDeviceCallback;)V

    .line 99
    .end local v0    # "audioManager":Landroid/media/AudioManager;
    return-void
.end method
