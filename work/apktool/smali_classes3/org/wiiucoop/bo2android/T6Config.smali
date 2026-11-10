.class public final Lorg/wiiucoop/bo2android/T6Config;
.super Ljava/lang/Object;
.source "T6Config.java"


# static fields
.field public static final DIR_FAIL:Ljava/lang/String; = "FAIL"

.field public static final DIR_OK:Ljava/lang/String; = "OK"

.field public static final DIR_WARN:Ljava/lang/String; = "WARN"

.field public static final FILE_NAME:Ljava/lang/String; = "t6_config.ini"

.field public static final FORMAT_VERSION:I = 0x1

.field public static final MODE_MP:Ljava/lang/String; = "mp"

.field public static final MODE_NONE:Ljava/lang/String; = ""

.field public static final MODE_ZM:Ljava/lang/String; = "zm"


# instance fields
.field public gameDirDetail:Ljava/lang/String;

.field public gameDirDisplay:Ljava/lang/String;

.field public gameDirPath:Ljava/lang/String;

.field public gameDirState:Ljava/lang/String;

.field public gameDirUri:Ljava/lang/String;

.field public mode:Ljava/lang/String;

.field public updatedAt:Ljava/lang/String;

.field public version:Ljava/lang/String;

.field public versionMismatch:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const-string v0, ""

    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6Config;->version:Ljava/lang/String;

    .line 49
    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6Config;->mode:Ljava/lang/String;

    .line 50
    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6Config;->gameDirPath:Ljava/lang/String;

    .line 51
    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6Config;->gameDirUri:Ljava/lang/String;

    .line 52
    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6Config;->gameDirDisplay:Ljava/lang/String;

    .line 53
    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6Config;->gameDirState:Ljava/lang/String;

    .line 54
    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6Config;->gameDirDetail:Ljava/lang/String;

    .line 55
    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6Config;->updatedAt:Ljava/lang/String;

    return-void
.end method

.method public static isKnownMode(Ljava/lang/String;)Z
    .locals 1
    .param p0, "value"    # Ljava/lang/String;

    .line 69
    const-string v0, "mp"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "zm"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

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

.method public static load(Ljava/io/File;)Lorg/wiiucoop/bo2android/T6Config;
    .locals 6
    .param p0, "file"    # Ljava/io/File;

    .line 162
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 166
    :cond_0
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 167
    .local v0, "in":Ljava/io/InputStream;
    :try_start_1
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v1

    long-to-int v1, v1

    new-array v1, v1, [B

    .line 168
    .local v1, "buffer":[B
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .line 169
    .local v2, "read":I
    if-gtz v2, :cond_1

    .line 170
    new-instance v3, Lorg/wiiucoop/bo2android/T6Config;

    invoke-direct {v3}, Lorg/wiiucoop/bo2android/T6Config;-><init>()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 173
    :try_start_2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 170
    return-object v3

    .line 172
    :cond_1
    :try_start_3
    new-instance v3, Ljava/lang/String;

    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    const/4 v5, 0x0

    invoke-direct {v3, v1, v5, v2, v4}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6Config;->parse(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6Config;

    move-result-object v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 173
    :try_start_4
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 172
    return-object v3

    .line 166
    .end local v1    # "buffer":[B
    .end local v2    # "read":I
    :catchall_0
    move-exception v1

    :try_start_5
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    :try_start_6
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p0    # "file":Ljava/io/File;
    :goto_0
    throw v1
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    .line 173
    .end local v0    # "in":Ljava/io/InputStream;
    .restart local p0    # "file":Ljava/io/File;
    :catch_0
    move-exception v0

    .line 174
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/wiiucoop/bo2android/T6Config;

    invoke-direct {v1}, Lorg/wiiucoop/bo2android/T6Config;-><init>()V

    return-object v1

    .line 163
    .end local v0    # "e":Ljava/io/IOException;
    :cond_2
    :goto_1
    new-instance v0, Lorg/wiiucoop/bo2android/T6Config;

    invoke-direct {v0}, Lorg/wiiucoop/bo2android/T6Config;-><init>()V

    return-object v0
.end method

.method public static modeFromLabel(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "label"    # Ljava/lang/String;

    .line 84
    const-string v0, "MULTIPLAYER"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 85
    const-string v0, "mp"

    return-object v0

    .line 87
    :cond_0
    const-string v0, "ZOMBIES"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 88
    const-string v0, "zm"

    return-object v0

    .line 90
    :cond_1
    const-string v0, ""

    return-object v0
.end method

.method public static modeLabel(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "value"    # Ljava/lang/String;

    .line 73
    const-string v0, "mp"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 74
    const-string v0, "MULTIPLAYER"

    return-object v0

    .line 76
    :cond_0
    const-string v0, "zm"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 77
    const-string v0, "ZOMBIES"

    return-object v0

    .line 79
    :cond_1
    const-string v0, "nenhum"

    return-object v0
.end method

.method private static oneLine(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "text"    # Ljava/lang/String;

    .line 184
    if-nez p0, :cond_0

    .line 185
    const-string v0, ""

    return-object v0

    .line 187
    :cond_0
    const/16 v0, 0xa

    const/16 v1, 0x20

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0xd

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6Config;
    .locals 11
    .param p0, "text"    # Ljava/lang/String;

    .line 109
    new-instance v0, Lorg/wiiucoop/bo2android/T6Config;

    invoke-direct {v0}, Lorg/wiiucoop/bo2android/T6Config;-><init>()V

    .line 110
    .local v0, "config":Lorg/wiiucoop/bo2android/T6Config;
    if-nez p0, :cond_0

    .line 111
    return-object v0

    .line 114
    :cond_0
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 116
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

    .line 117
    .local v6, "rawLine":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    .line 118
    .local v7, "line":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_3

    const-string v8, "#"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 119
    goto :goto_1

    .line 122
    :cond_1
    const/16 v8, 0x3d

    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    .line 123
    .local v8, "separator":I
    if-gtz v8, :cond_2

    .line 124
    goto :goto_1

    .line 127
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

    .line 116
    .end local v6    # "rawLine":Ljava/lang/String;
    .end local v7    # "line":Ljava/lang/String;
    .end local v8    # "separator":I
    :cond_3
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 130
    :cond_4
    const-string v2, "version"

    invoke-static {v1, v2}, Lorg/wiiucoop/bo2android/T6Config;->value(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lorg/wiiucoop/bo2android/T6Config;->version:Ljava/lang/String;

    .line 131
    const-string v2, "mode"

    invoke-static {v1, v2}, Lorg/wiiucoop/bo2android/T6Config;->value(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lorg/wiiucoop/bo2android/T6Config;->mode:Ljava/lang/String;

    .line 132
    const-string v2, "game_dir_path"

    invoke-static {v1, v2}, Lorg/wiiucoop/bo2android/T6Config;->value(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lorg/wiiucoop/bo2android/T6Config;->gameDirPath:Ljava/lang/String;

    .line 133
    const-string v2, "game_dir_uri"

    invoke-static {v1, v2}, Lorg/wiiucoop/bo2android/T6Config;->value(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lorg/wiiucoop/bo2android/T6Config;->gameDirUri:Ljava/lang/String;

    .line 134
    const-string v2, "game_dir_display"

    invoke-static {v1, v2}, Lorg/wiiucoop/bo2android/T6Config;->value(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lorg/wiiucoop/bo2android/T6Config;->gameDirDisplay:Ljava/lang/String;

    .line 135
    const-string v2, "game_dir_state"

    invoke-static {v1, v2}, Lorg/wiiucoop/bo2android/T6Config;->value(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lorg/wiiucoop/bo2android/T6Config;->gameDirState:Ljava/lang/String;

    .line 136
    const-string v2, "game_dir_detail"

    invoke-static {v1, v2}, Lorg/wiiucoop/bo2android/T6Config;->value(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lorg/wiiucoop/bo2android/T6Config;->gameDirDetail:Ljava/lang/String;

    .line 137
    const-string v2, "updated_at"

    invoke-static {v1, v2}, Lorg/wiiucoop/bo2android/T6Config;->value(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lorg/wiiucoop/bo2android/T6Config;->updatedAt:Ljava/lang/String;

    .line 141
    iget-object v2, v0, Lorg/wiiucoop/bo2android/T6Config;->version:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_5

    .line 142
    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    iget-object v5, v0, Lorg/wiiucoop/bo2android/T6Config;->version:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    move v4, v2

    goto :goto_2

    :cond_5
    nop

    :goto_2
    iput-boolean v4, v0, Lorg/wiiucoop/bo2android/T6Config;->versionMismatch:Z

    .line 143
    iget-boolean v2, v0, Lorg/wiiucoop/bo2android/T6Config;->versionMismatch:Z

    const-string v3, ""

    if-eqz v2, :cond_6

    .line 144
    iput-object v3, v0, Lorg/wiiucoop/bo2android/T6Config;->mode:Ljava/lang/String;

    .line 147
    :cond_6
    iget-object v2, v0, Lorg/wiiucoop/bo2android/T6Config;->mode:Ljava/lang/String;

    invoke-static {v2}, Lorg/wiiucoop/bo2android/T6Config;->isKnownMode(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 148
    iput-object v3, v0, Lorg/wiiucoop/bo2android/T6Config;->mode:Ljava/lang/String;

    .line 151
    :cond_7
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

    .line 179
    .local p0, "values":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 180
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
.method public format()Ljava/lang/String;
    .locals 4

    .line 94
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .local v0, "text":Ljava/lang/StringBuilder;
    const-string v1, "# T6 Rebuild Android configuration.\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    const-string v1, "# Written by the menu activity, read by libt6host.so.\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    const-string v1, "version="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 98
    const-string v1, "mode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lorg/wiiucoop/bo2android/T6Config;->mode:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 99
    const-string v1, "game_dir_path="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lorg/wiiucoop/bo2android/T6Config;->gameDirPath:Ljava/lang/String;

    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6Config;->oneLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 100
    const-string v1, "game_dir_uri="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lorg/wiiucoop/bo2android/T6Config;->gameDirUri:Ljava/lang/String;

    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6Config;->oneLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 101
    const-string v1, "game_dir_display="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lorg/wiiucoop/bo2android/T6Config;->gameDirDisplay:Ljava/lang/String;

    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6Config;->oneLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 102
    const-string v1, "game_dir_state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lorg/wiiucoop/bo2android/T6Config;->gameDirState:Ljava/lang/String;

    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6Config;->oneLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 103
    const-string v1, "game_dir_detail="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lorg/wiiucoop/bo2android/T6Config;->gameDirDetail:Ljava/lang/String;

    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6Config;->oneLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 104
    const-string v1, "updated_at="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lorg/wiiucoop/bo2android/T6Config;->updatedAt:Ljava/lang/String;

    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6Config;->oneLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 105
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public hasFolder()Z
    .locals 1

    .line 61
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6Config;->gameDirUri:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6Config;->gameDirPath:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

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

.method public hasMode()Z
    .locals 1

    .line 65
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6Config;->mode:Ljava/lang/String;

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6Config;->isKnownMode(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public save(Ljava/io/File;)V
    .locals 3
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 155
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6Config;->updatedAt:Ljava/lang/String;

    .line 156
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 157
    .local v0, "out":Ljava/io/OutputStream;
    :try_start_0
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6Config;->format()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 158
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 159
    .end local v0    # "out":Ljava/io/OutputStream;
    return-void

    .line 156
    .restart local v0    # "out":Ljava/io/OutputStream;
    :catchall_0
    move-exception v1

    :try_start_1
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw v1
.end method
