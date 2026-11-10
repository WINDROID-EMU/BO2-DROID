.class public final Lorg/wiiucoop/bo2android/T6RunStatus;
.super Ljava/lang/Object;
.source "T6RunStatus.java"


# static fields
.field public static final FILE_NAME:Ljava/lang/String; = "t6_status.ini"


# instance fields
.field public dxvkDevice:Ljava/lang/String;

.field public engineBoot:Ljava/lang/String;

.field public engineBootReason:Ljava/lang/String;

.field public finishedAt:Ljava/lang/String;

.field public framesPresented:Ljava/lang/String;

.field public guestStage:Ljava/lang/String;

.field public hostLifecycle:Ljava/lang/String;

.field public mode:Ljava/lang/String;

.field public vulkanApi:Ljava/lang/String;

.field public vulkanSurface:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    const-string v0, ""

    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6RunStatus;->mode:Ljava/lang/String;

    .line 36
    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6RunStatus;->hostLifecycle:Ljava/lang/String;

    .line 37
    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6RunStatus;->vulkanSurface:Ljava/lang/String;

    .line 38
    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6RunStatus;->dxvkDevice:Ljava/lang/String;

    .line 39
    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6RunStatus;->framesPresented:Ljava/lang/String;

    .line 40
    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6RunStatus;->engineBoot:Ljava/lang/String;

    .line 41
    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6RunStatus;->engineBootReason:Ljava/lang/String;

    .line 43
    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6RunStatus;->guestStage:Ljava/lang/String;

    .line 45
    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6RunStatus;->vulkanApi:Ljava/lang/String;

    .line 46
    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6RunStatus;->finishedAt:Ljava/lang/String;

    return-void
.end method

.method public static load(Ljava/io/File;)Lorg/wiiucoop/bo2android/T6RunStatus;
    .locals 6
    .param p0, "file"    # Ljava/io/File;

    .line 86
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_2

    .line 91
    :cond_0
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    .local v0, "in":Ljava/io/InputStream;
    :try_start_1
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v1

    long-to-int v1, v1

    new-array v1, v1, [B

    .line 93
    .local v1, "buffer":[B
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .line 94
    .local v2, "read":I
    if-gtz v2, :cond_1

    const-string v3, ""

    goto :goto_0

    :cond_1
    new-instance v3, Ljava/lang/String;

    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    const/4 v5, 0x0

    invoke-direct {v3, v1, v5, v2, v4}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 95
    .end local v1    # "buffer":[B
    .end local v2    # "read":I
    .local v3, "text":Ljava/lang/String;
    :goto_0
    :try_start_2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 97
    .end local v0    # "in":Ljava/io/InputStream;
    nop

    .line 99
    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6RunStatus;->parse(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6RunStatus;

    move-result-object v0

    return-object v0

    .line 91
    .end local v3    # "text":Ljava/lang/String;
    .restart local v0    # "in":Ljava/io/InputStream;
    :catchall_0
    move-exception v1

    :try_start_3
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v2

    :try_start_4
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p0    # "file":Ljava/io/File;
    :goto_1
    throw v1
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 95
    .end local v0    # "in":Ljava/io/InputStream;
    .restart local p0    # "file":Ljava/io/File;
    :catch_0
    move-exception v0

    .line 96
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/wiiucoop/bo2android/T6RunStatus;

    invoke-direct {v1}, Lorg/wiiucoop/bo2android/T6RunStatus;-><init>()V

    return-object v1

    .line 87
    .end local v0    # "e":Ljava/io/IOException;
    :cond_2
    :goto_2
    new-instance v0, Lorg/wiiucoop/bo2android/T6RunStatus;

    invoke-direct {v0}, Lorg/wiiucoop/bo2android/T6RunStatus;-><init>()V

    return-object v0
.end method

.method public static parse(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6RunStatus;
    .locals 11
    .param p0, "text"    # Ljava/lang/String;

    .line 103
    new-instance v0, Lorg/wiiucoop/bo2android/T6RunStatus;

    invoke-direct {v0}, Lorg/wiiucoop/bo2android/T6RunStatus;-><init>()V

    .line 105
    .local v0, "status":Lorg/wiiucoop/bo2android/T6RunStatus;
    if-nez p0, :cond_0

    .line 106
    return-object v0

    .line 109
    :cond_0
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 110
    .local v1, "values":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "\n"

    invoke-virtual {p0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v5, v3, :cond_4

    aget-object v6, v2, v5

    .line 111
    .local v6, "rawLine":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    .line 112
    .local v7, "line":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_3

    const-string v8, "#"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 113
    goto :goto_1

    .line 115
    :cond_1
    const/16 v8, 0x3d

    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    .line 116
    .local v8, "separator":I
    if-gtz v8, :cond_2

    .line 117
    goto :goto_1

    .line 119
    :cond_2
    invoke-virtual {v7, v4, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    add-int/lit8 v10, v8, 0x1

    invoke-virtual {v7, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v1, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .end local v6    # "rawLine":Ljava/lang/String;
    .end local v7    # "line":Ljava/lang/String;
    .end local v8    # "separator":I
    :cond_3
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 122
    :cond_4
    const-string v2, "mode"

    invoke-static {v1, v2}, Lorg/wiiucoop/bo2android/T6RunStatus;->value(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lorg/wiiucoop/bo2android/T6RunStatus;->mode:Ljava/lang/String;

    .line 123
    const-string v2, "host_lifecycle"

    invoke-static {v1, v2}, Lorg/wiiucoop/bo2android/T6RunStatus;->value(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lorg/wiiucoop/bo2android/T6RunStatus;->hostLifecycle:Ljava/lang/String;

    .line 124
    const-string v2, "vulkan_surface"

    invoke-static {v1, v2}, Lorg/wiiucoop/bo2android/T6RunStatus;->value(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lorg/wiiucoop/bo2android/T6RunStatus;->vulkanSurface:Ljava/lang/String;

    .line 125
    const-string v2, "dxvk_device"

    invoke-static {v1, v2}, Lorg/wiiucoop/bo2android/T6RunStatus;->value(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lorg/wiiucoop/bo2android/T6RunStatus;->dxvkDevice:Ljava/lang/String;

    .line 126
    const-string v2, "frames_presented"

    invoke-static {v1, v2}, Lorg/wiiucoop/bo2android/T6RunStatus;->value(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lorg/wiiucoop/bo2android/T6RunStatus;->framesPresented:Ljava/lang/String;

    .line 127
    const-string v2, "engine_boot"

    invoke-static {v1, v2}, Lorg/wiiucoop/bo2android/T6RunStatus;->value(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lorg/wiiucoop/bo2android/T6RunStatus;->engineBoot:Ljava/lang/String;

    .line 128
    const-string v2, "engine_boot_reason"

    invoke-static {v1, v2}, Lorg/wiiucoop/bo2android/T6RunStatus;->value(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lorg/wiiucoop/bo2android/T6RunStatus;->engineBootReason:Ljava/lang/String;

    .line 129
    const-string v2, "vulkan_api"

    invoke-static {v1, v2}, Lorg/wiiucoop/bo2android/T6RunStatus;->value(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lorg/wiiucoop/bo2android/T6RunStatus;->vulkanApi:Ljava/lang/String;

    .line 130
    const-string v2, "guest_stage"

    invoke-static {v1, v2}, Lorg/wiiucoop/bo2android/T6RunStatus;->value(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lorg/wiiucoop/bo2android/T6RunStatus;->guestStage:Ljava/lang/String;

    .line 131
    const-string v2, "finished_at"

    invoke-static {v1, v2}, Lorg/wiiucoop/bo2android/T6RunStatus;->value(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lorg/wiiucoop/bo2android/T6RunStatus;->finishedAt:Ljava/lang/String;

    .line 133
    iget-object v2, v0, Lorg/wiiucoop/bo2android/T6RunStatus;->mode:Ljava/lang/String;

    invoke-static {v2}, Lorg/wiiucoop/bo2android/T6Config;->isKnownMode(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 134
    const-string v2, ""

    iput-object v2, v0, Lorg/wiiucoop/bo2android/T6RunStatus;->mode:Ljava/lang/String;

    .line 137
    :cond_5
    return-object v0
.end method

.method private static value(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 141
    .local p0, "values":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 142
    .local v0, "found":Ljava/lang/String;
    if-nez v0, :cond_0

    const-string v1, ""

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    return-object v1
.end method


# virtual methods
.method public deviceCreated()Z
    .locals 2

    .line 61
    const-string v0, "ok"

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6RunStatus;->dxvkDevice:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public engineBlocked()Z
    .locals 2

    .line 77
    const-string v0, "blocked"

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6RunStatus;->engineBoot:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public engineBooted()Z
    .locals 2

    .line 73
    const-string v0, "ok"

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6RunStatus;->engineBoot:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public exists()Z
    .locals 1

    .line 49
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6RunStatus;->finishedAt:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public frames()I
    .locals 2

    .line 66
    :try_start_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6RunStatus;->framesPresented:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 67
    :catch_0
    move-exception v0

    .line 68
    .local v0, "e":Ljava/lang/NumberFormatException;
    const/4 v1, 0x0

    return v1
.end method

.method public hostProvenWorking()Z
    .locals 1

    .line 82
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6RunStatus;->hostStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6RunStatus;->surfaceCreated()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hostStarted()Z
    .locals 2

    .line 53
    const-string v0, "ok"

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6RunStatus;->hostLifecycle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public surfaceCreated()Z
    .locals 2

    .line 57
    const-string v0, "ok"

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6RunStatus;->vulkanSurface:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
