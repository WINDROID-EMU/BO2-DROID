.class public final Lorg/wiiucoop/bo2android/T6Native;
.super Ljava/lang/Object;
.source "T6Native.java"


# static fields
.field private static final LIBRARY:Ljava/lang/String; = "libt6host.so"

.field private static loadFailure:Ljava/lang/String;

.field private static loaded:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 30
    const-string v0, ""

    sput-object v0, Lorg/wiiucoop/bo2android/T6Native;->loadFailure:Ljava/lang/String;

    .line 34
    :try_start_0
    const-string v0, "t6host"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 35
    const/4 v0, 0x1

    sput-boolean v0, Lorg/wiiucoop/bo2android/T6Native;->loaded:Z
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    goto :goto_1

    .line 36
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 37
    .local v0, "e":Ljava/lang/Throwable;
    :goto_0
    const/4 v1, 0x0

    sput-boolean v1, Lorg/wiiucoop/bo2android/T6Native;->loaded:Z

    .line 38
    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6Native;->describe(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/wiiucoop/bo2android/T6Native;->loadFailure:Ljava/lang/String;

    .line 40
    .end local v0    # "e":Ljava/lang/Throwable;
    :goto_1
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    return-void
.end method

.method public static clientState()I
    .locals 2

    .line 249
    sget-boolean v0, Lorg/wiiucoop/bo2android/T6Native;->loaded:Z

    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 250
    return v1

    .line 253
    :cond_0
    :try_start_0
    invoke-static {}, Lorg/wiiucoop/bo2android/T6Native;->nativeClientState()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 254
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 255
    .local v0, "e":Ljava/lang/Throwable;
    :goto_0
    return v1
.end method

.method public static connectedPads()I
    .locals 2

    .line 222
    sget-boolean v0, Lorg/wiiucoop/bo2android/T6Native;->loaded:Z

    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 223
    return v1

    .line 226
    :cond_0
    :try_start_0
    invoke-static {}, Lorg/wiiucoop/bo2android/T6Native;->nativeConnectedPads()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 227
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 228
    .local v0, "e":Ljava/lang/Throwable;
    :goto_0
    return v1
.end method

.method public static consoleOpen(I)Z
    .locals 2
    .param p0, "clientState"    # I

    .line 274
    if-ltz p0, :cond_0

    shr-int/lit8 v0, p0, 0x8

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private static describe(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 2
    .param p0, "error"    # Ljava/lang/Throwable;

    .line 298
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 299
    .local v0, "message":Ljava/lang/String;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    move-object v1, v0

    goto :goto_1

    :cond_1
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_1
    return-object v1
.end method

.method public static engineRuntimeReason(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "mode"    # Ljava/lang/String;

    .line 109
    sget-boolean v0, Lorg/wiiucoop/bo2android/T6Native;->loaded:Z

    if-nez v0, :cond_1

    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "libt6host.so n\u00e3o p\u00f4de ser carregada neste aparelho"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 111
    sget-object v1, Lorg/wiiucoop/bo2android/T6Native;->loadFailure:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "."

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lorg/wiiucoop/bo2android/T6Native;->loadFailure:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 110
    return-object v0

    .line 114
    :cond_1
    :try_start_0
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Native;->modeOrNone(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6Native;->nativeEngineRuntimeReason(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 115
    .local v0, "reason":Ljava/lang/String;
    if-nez v0, :cond_2

    const-string v1, ""
    :try_end_0
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :cond_2
    move-object v1, v0

    :goto_1
    return-object v1

    .line 121
    .end local v0    # "reason":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 122
    .local v0, "e":Ljava/lang/RuntimeException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "O host nativo falhou ao responder sobre o runtime do motor: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6Native;->describe(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 116
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :catch_1
    move-exception v0

    .line 119
    .local v0, "e":Ljava/lang/LinkageError;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "A libt6host.so foi carregada, mas esta build n\u00e3o exporta nativeEngineRuntimeReason: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 120
    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6Native;->describe(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 119
    return-object v1
.end method

.method public static hostBuildSummary()Ljava/lang/String;
    .locals 3

    .line 279
    sget-boolean v0, Lorg/wiiucoop/bo2android/T6Native;->loaded:Z

    if-nez v0, :cond_1

    .line 280
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "libt6host.so ausente"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 281
    sget-object v1, Lorg/wiiucoop/bo2android/T6Native;->loadFailure:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "."

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lorg/wiiucoop/bo2android/T6Native;->loadFailure:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 280
    return-object v0

    .line 284
    :cond_1
    :try_start_0
    invoke-static {}, Lorg/wiiucoop/bo2android/T6Native;->nativeHostBuild()Ljava/lang/String;

    move-result-object v0

    .line 285
    .local v0, "summary":Ljava/lang/String;
    if-nez v0, :cond_2

    const-string v1, ""
    :try_end_0
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :cond_2
    move-object v1, v0

    :goto_1
    return-object v1

    .line 288
    .end local v0    # "summary":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 289
    .local v0, "e":Ljava/lang/RuntimeException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Host nativo sem resumo de compila\u00e7\u00e3o: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6Native;->describe(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 286
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :catch_1
    move-exception v0

    .line 287
    .local v0, "e":Ljava/lang/LinkageError;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "libt6host.so sem nativeHostBuild nesta build: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6Native;->describe(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static inGameplay(I)Z
    .locals 3
    .param p0, "clientState"    # I

    .line 266
    const/4 v0, 0x0

    if-gez p0, :cond_0

    .line 267
    return v0

    .line 269
    :cond_0
    and-int/lit8 v1, p0, 0x7f

    const/16 v2, 0xa

    if-ne v1, v2, :cond_1

    and-int/lit16 v1, p0, 0x80

    if-eqz v1, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0
.end method

.method public static isEngineRuntimeAvailable(Ljava/lang/String;)Z
    .locals 2
    .param p0, "mode"    # Ljava/lang/String;

    .line 94
    sget-boolean v0, Lorg/wiiucoop/bo2android/T6Native;->loaded:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 95
    return v1

    .line 98
    :cond_0
    :try_start_0
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Native;->modeOrNone(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6Native;->nativeEngineRuntimeAvailable(Ljava/lang/String;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 99
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 100
    .local v0, "e":Ljava/lang/Throwable;
    :goto_0
    return v1
.end method

.method public static isLibraryLoaded()Z
    .locals 1

    .line 89
    sget-boolean v0, Lorg/wiiucoop/bo2android/T6Native;->loaded:Z

    return v0
.end method

.method private static modeOrNone(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "mode"    # Ljava/lang/String;

    .line 294
    if-nez p0, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    move-object v0, p0

    :goto_0
    return-object v0
.end method

.method private static native nativeClientState()I
.end method

.method private static native nativeConnectedPads()I
.end method

.method private static native nativeEngineRuntimeAvailable(Ljava/lang/String;)Z
.end method

.method private static native nativeEngineRuntimeReason(Ljava/lang/String;)Ljava/lang/String;
.end method

.method private static native nativeHostBuild()Ljava/lang/String;
.end method

.method private static native nativeSendKey(I)Z
.end method

.method private static native nativeSendKeyState(IZ)Z
.end method

.method private static native nativeSessionState()Ljava/lang/String;
.end method

.method private static native nativeSetNetwork(J)V
.end method

.method private static native nativeSetTextInput(Z)V
.end method

.method private static native nativeSetTouchPad(ZIIIIIII)V
.end method

.method private static native nativeSubmitDvar(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method private static native nativeTouch(IIFF)V
.end method

.method public static sendKey(I)Z
    .locals 2
    .param p0, "virtualKey"    # I

    .line 185
    sget-boolean v0, Lorg/wiiucoop/bo2android/T6Native;->loaded:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 186
    return v1

    .line 189
    :cond_0
    :try_start_0
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Native;->nativeSendKey(I)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 190
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 191
    .local v0, "e":Ljava/lang/Throwable;
    :goto_0
    return v1
.end method

.method public static sendKeyState(IZ)Z
    .locals 2
    .param p0, "virtualKey"    # I
    .param p1, "down"    # Z

    .line 197
    sget-boolean v0, Lorg/wiiucoop/bo2android/T6Native;->loaded:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 198
    return v1

    .line 201
    :cond_0
    :try_start_0
    invoke-static {p0, p1}, Lorg/wiiucoop/bo2android/T6Native;->nativeSendKeyState(IZ)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 202
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 203
    .local v0, "e":Ljava/lang/Throwable;
    :goto_0
    return v1
.end method

.method public static sessionState()Ljava/lang/String;
    .locals 2

    .line 135
    sget-boolean v0, Lorg/wiiucoop/bo2android/T6Native;->loaded:Z

    const-string v1, ""

    if-nez v0, :cond_0

    .line 136
    return-object v1

    .line 139
    :cond_0
    :try_start_0
    invoke-static {}, Lorg/wiiucoop/bo2android/T6Native;->nativeSessionState()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_0

    .line 140
    .local v0, "answer":Ljava/lang/String;
    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    move-object v1, v0

    :goto_0
    return-object v1

    .line 141
    .end local v0    # "answer":Ljava/lang/String;
    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    .line 142
    .local v0, "e":Ljava/lang/Throwable;
    :goto_1
    return-object v1
.end method

.method public static setNetwork(J)V
    .locals 1
    .param p0, "handle"    # J

    .line 75
    sget-boolean v0, Lorg/wiiucoop/bo2android/T6Native;->loaded:Z

    if-nez v0, :cond_0

    .line 76
    return-void

    .line 79
    :cond_0
    :try_start_0
    invoke-static {p0, p1}, Lorg/wiiucoop/bo2android/T6Native;->nativeSetNetwork(J)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    goto :goto_0

    .line 80
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 83
    :goto_0
    return-void
.end method

.method public static setTextInput(Z)Z
    .locals 2
    .param p0, "on"    # Z

    .line 172
    sget-boolean v0, Lorg/wiiucoop/bo2android/T6Native;->loaded:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 173
    return v1

    .line 176
    :cond_0
    :try_start_0
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Native;->nativeSetTextInput(Z)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_0

    .line 177
    const/4 v0, 0x1

    return v0

    .line 178
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 179
    .local v0, "e":Ljava/lang/Throwable;
    :goto_0
    return v1
.end method

.method public static setTouchPad(ZIIIIIII)V
    .locals 1
    .param p0, "active"    # Z
    .param p1, "buttons"    # I
    .param p2, "leftTrigger"    # I
    .param p3, "rightTrigger"    # I
    .param p4, "lx"    # I
    .param p5, "ly"    # I
    .param p6, "rx"    # I
    .param p7, "ry"    # I

    .line 210
    sget-boolean v0, Lorg/wiiucoop/bo2android/T6Native;->loaded:Z

    if-nez v0, :cond_0

    .line 211
    return-void

    .line 214
    :cond_0
    :try_start_0
    invoke-static/range {p0 .. p7}, Lorg/wiiucoop/bo2android/T6Native;->nativeSetTouchPad(ZIIIIIII)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_0

    .line 217
    goto :goto_0

    .line 215
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 218
    :goto_0
    return-void
.end method

.method public static submitDvar(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .line 155
    sget-boolean v0, Lorg/wiiucoop/bo2android/T6Native;->loaded:Z

    const-string v1, ""

    if-nez v0, :cond_0

    .line 156
    return-object v1

    .line 159
    :cond_0
    :try_start_0
    invoke-static {p0, p1}, Lorg/wiiucoop/bo2android/T6Native;->nativeSubmitDvar(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_0

    .line 160
    .local v0, "answer":Ljava/lang/String;
    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    move-object v1, v0

    :goto_0
    return-object v1

    .line 161
    .end local v0    # "answer":Ljava/lang/String;
    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    .line 162
    .local v0, "e":Ljava/lang/Throwable;
    :goto_1
    return-object v1
.end method

.method public static touch(IIFF)V
    .locals 1
    .param p0, "action"    # I
    .param p1, "finger"    # I
    .param p2, "nx"    # F
    .param p3, "ny"    # F

    .line 237
    sget-boolean v0, Lorg/wiiucoop/bo2android/T6Native;->loaded:Z

    if-nez v0, :cond_0

    .line 238
    return-void

    .line 241
    :cond_0
    :try_start_0
    invoke-static {p0, p1, p2, p3}, Lorg/wiiucoop/bo2android/T6Native;->nativeTouch(IIFF)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_0

    .line 244
    goto :goto_0

    .line 242
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 245
    :goto_0
    return-void
.end method
