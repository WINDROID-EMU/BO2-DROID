.class public final Lorg/wiiucoop/bo2android/T6DriverStore;
.super Ljava/lang/Object;
.source "T6DriverStore.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/wiiucoop/bo2android/T6DriverStore$Entry;
    }
.end annotation


# static fields
.field public static final SYSTEM:Ljava/lang/String; = "system"


# instance fields
.field private final filesDir:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 0
    .param p1, "filesDir"    # Ljava/io/File;

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6DriverStore;->filesDir:Ljava/io/File;

    .line 46
    return-void
.end method

.method private load(Ljava/io/File;)Lorg/wiiucoop/bo2android/T6DriverStore$Entry;
    .locals 6
    .param p1, "dir"    # Ljava/io/File;

    .line 116
    new-instance v0, Ljava/io/File;

    const-string v1, "meta.json"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-wide/16 v1, 0x4000

    invoke-static {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6DriverStore;->read(Ljava/io/File;J)Ljava/lang/String;

    move-result-object v0

    .line 117
    .local v0, "metaText":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return-object v2

    .line 118
    :cond_0
    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6DriverPackage;->parseMeta(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;

    move-result-object v1

    .line 119
    .local v1, "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    iget-object v3, v1, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->libraryName:Ljava/lang/String;

    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6DriverPackage;->safeLibraryName(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    new-instance v3, Ljava/io/File;

    iget-object v4, v1, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->libraryName:Ljava/lang/String;

    invoke-direct {v3, p1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v3

    if-nez v3, :cond_1

    goto :goto_0

    .line 120
    :cond_1
    new-instance v2, Ljava/io/File;

    const-string v3, "import.json"

    invoke-direct {v2, p1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-wide/16 v3, 0x1000

    invoke-static {v2, v3, v4}, Lorg/wiiucoop/bo2android/T6DriverStore;->read(Ljava/io/File;J)Ljava/lang/String;

    move-result-object v2

    .line 121
    .local v2, "record":Ljava/lang/String;
    new-instance v3, Lorg/wiiucoop/bo2android/T6DriverStore$Entry;

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "librarySha256"

    invoke-static {v2, v5}, Lorg/wiiucoop/bo2android/T6DriverPackage;->stringField(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v1, v5}, Lorg/wiiucoop/bo2android/T6DriverStore$Entry;-><init>(Ljava/lang/String;Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;Ljava/lang/String;)V

    return-object v3

    .line 119
    .end local v2    # "record":Ljava/lang/String;
    :cond_2
    :goto_0
    return-object v2
.end method

.method private static read(Ljava/io/File;J)Ljava/lang/String;
    .locals 7
    .param p0, "f"    # Ljava/io/File;
    .param p1, "limit"    # J

    .line 125
    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v0

    const-string v1, ""

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v2

    cmp-long v0, v2, p1

    if-lez v0, :cond_0

    goto :goto_3

    .line 126
    :cond_0
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    .local v0, "in":Ljava/io/InputStream;
    :try_start_1
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v2

    long-to-int v2, v2

    new-array v2, v2, [B

    .line 128
    .local v2, "b":[B
    const/4 v3, 0x0

    .line 129
    .local v3, "n":I
    :goto_0
    array-length v4, v2

    if-ge v3, v4, :cond_2

    .line 130
    array-length v4, v2

    sub-int/2addr v4, v3

    invoke-virtual {v0, v2, v3, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v4

    .line 131
    .local v4, "r":I
    if-gez v4, :cond_1

    goto :goto_1

    .line 132
    :cond_1
    add-int/2addr v3, v4

    .line 133
    .end local v4    # "r":I
    goto :goto_0

    .line 134
    :cond_2
    :goto_1
    new-instance v4, Ljava/lang/String;

    sget-object v5, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    const/4 v6, 0x0

    invoke-direct {v4, v2, v6, v3, v5}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 135
    :try_start_2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 134
    return-object v4

    .line 126
    .end local v2    # "b":[B
    .end local v3    # "n":I
    :catchall_0
    move-exception v2

    :try_start_3
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v3

    :try_start_4
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p0    # "f":Ljava/io/File;
    .end local p1    # "limit":J
    :goto_2
    throw v2
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 135
    .end local v0    # "in":Ljava/io/InputStream;
    .restart local p0    # "f":Ljava/io/File;
    .restart local p1    # "limit":J
    :catch_0
    move-exception v0

    .line 136
    .local v0, "e":Ljava/io/IOException;
    return-object v1

    .line 125
    .end local v0    # "e":Ljava/io/IOException;
    :cond_3
    :goto_3
    return-object v1
.end method


# virtual methods
.method public driversDir()Ljava/io/File;
    .locals 3

    .line 49
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6DriverStore;->filesDir:Ljava/io/File;

    const-string v2, "vulkan_drivers"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public find(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverStore$Entry;
    .locals 3
    .param p1, "id"    # Ljava/lang/String;

    .line 92
    const/4 v0, 0x0

    if-eqz p1, :cond_2

    const-string v1, "[A-Za-z0-9._-]{1,64}"

    invoke-virtual {p1, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "."

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 93
    :cond_0
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6DriverStore;->driversDir()Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 94
    .local v1, "d":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/T6DriverStore;->load(Ljava/io/File;)Lorg/wiiucoop/bo2android/T6DriverStore$Entry;

    move-result-object v0

    :cond_1
    return-object v0

    .line 92
    .end local v1    # "d":Ljava/io/File;
    :cond_2
    :goto_0
    return-object v0
.end method

.method public lastStatus()Ljava/util/Map;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 107
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 108
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lorg/wiiucoop/bo2android/T6DriverStore;->filesDir:Ljava/io/File;

    const-string v3, "vulkan_driver_status.txt"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-wide/16 v2, 0x2000

    invoke-static {v1, v2, v3}, Lorg/wiiucoop/bo2android/T6DriverStore;->read(Ljava/io/File;J)Ljava/lang/String;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_1

    aget-object v5, v1, v4

    .line 109
    .local v5, "line":Ljava/lang/String;
    const/16 v6, 0x3d

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    .line 110
    .local v6, "eq":I
    if-lez v6, :cond_0

    invoke-virtual {v5, v3, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    add-int/lit8 v8, v6, 0x1

    invoke-virtual {v5, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v0, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .end local v5    # "line":Ljava/lang/String;
    .end local v6    # "eq":I
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 112
    :cond_1
    return-object v0
.end method

.method public list()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/wiiucoop/bo2android/T6DriverStore$Entry;",
            ">;"
        }
    .end annotation

    .line 79
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 80
    .local v0, "out":Ljava/util/List;, "Ljava/util/List<Lorg/wiiucoop/bo2android/T6DriverStore$Entry;>;"
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6DriverStore;->driversDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 81
    .local v1, "dirs":[Ljava/io/File;
    if-nez v1, :cond_0

    return-object v0

    .line 82
    :cond_0
    invoke-static {v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 83
    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_3

    aget-object v4, v1, v3

    .line 84
    .local v4, "d":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    goto :goto_1

    .line 85
    :cond_1
    invoke-direct {p0, v4}, Lorg/wiiucoop/bo2android/T6DriverStore;->load(Ljava/io/File;)Lorg/wiiucoop/bo2android/T6DriverStore$Entry;

    move-result-object v5

    .line 86
    .local v5, "e":Lorg/wiiucoop/bo2android/T6DriverStore$Entry;
    if-eqz v5, :cond_2

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    .end local v4    # "d":Ljava/io/File;
    .end local v5    # "e":Lorg/wiiucoop/bo2android/T6DriverStore$Entry;
    :cond_2
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 88
    :cond_3
    return-object v0
.end method

.method public remove(Ljava/lang/String;)Z
    .locals 3
    .param p1, "id"    # Ljava/lang/String;

    .line 99
    invoke-virtual {p0, p1}, Lorg/wiiucoop/bo2android/T6DriverStore;->find(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverStore$Entry;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 100
    :cond_0
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6DriverStore;->filesDir:Ljava/io/File;

    const-string v2, "vulkan_driver.cfg"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-wide/16 v1, 0x80

    invoke-static {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6DriverStore;->read(Ljava/io/File;J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "system"

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/T6DriverStore;->select(Ljava/lang/String;)Z

    .line 101
    :cond_1
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6DriverStore;->driversDir()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6DriverPackage;->deleteTree(Ljava/io/File;)V

    .line 102
    const/4 v0, 0x1

    return v0
.end method

.method public select(Ljava/lang/String;)Z
    .locals 8
    .param p1, "id"    # Ljava/lang/String;

    .line 61
    const-string v0, "system"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lorg/wiiucoop/bo2android/T6DriverStore;->find(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverStore$Entry;

    move-result-object v0

    if-nez v0, :cond_0

    return v1

    .line 62
    :cond_0
    new-instance v0, Ljava/io/File;

    iget-object v2, p0, Lorg/wiiucoop/bo2android/T6DriverStore;->filesDir:Ljava/io/File;

    const-string v3, "vulkan_driver.cfg"

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 63
    .local v0, "cfg":Ljava/io/File;
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lorg/wiiucoop/bo2android/T6DriverStore;->filesDir:Ljava/io/File;

    const-string v4, "vulkan_driver.cfg.tmp"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 64
    .local v2, "tmp":Ljava/io/File;
    :try_start_0
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 65
    .local v3, "out":Ljava/io/OutputStream;
    :try_start_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/OutputStream;->write([B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    :try_start_2
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 68
    .end local v3    # "out":Ljava/io/OutputStream;
    nop

    .line 70
    :try_start_3
    invoke-virtual {v2}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object v4

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/nio/file/CopyOption;

    sget-object v6, Ljava/nio/file/StandardCopyOption;->REPLACE_EXISTING:Ljava/nio/file/StandardCopyOption;

    aput-object v6, v5, v1

    sget-object v6, Ljava/nio/file/StandardCopyOption;->ATOMIC_MOVE:Ljava/nio/file/StandardCopyOption;

    const/4 v7, 0x1

    aput-object v6, v5, v7

    invoke-static {v3, v4, v5}, Ljava/nio/file/Files;->move(Ljava/nio/file/Path;Ljava/nio/file/Path;[Ljava/nio/file/CopyOption;)Ljava/nio/file/Path;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 72
    return v7

    .line 73
    :catch_0
    move-exception v3

    .line 74
    .local v3, "e":Ljava/io/IOException;
    return v1

    .line 64
    .local v3, "out":Ljava/io/OutputStream;
    :catchall_0
    move-exception v4

    :try_start_4
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v5

    :try_start_5
    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "cfg":Ljava/io/File;
    .end local v2    # "tmp":Ljava/io/File;
    .end local p1    # "id":Ljava/lang/String;
    :goto_0
    throw v4
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    .line 66
    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v0    # "cfg":Ljava/io/File;
    .restart local v2    # "tmp":Ljava/io/File;
    .restart local p1    # "id":Ljava/lang/String;
    :catch_1
    move-exception v3

    .line 67
    .local v3, "e":Ljava/io/IOException;
    return v1
.end method

.method public selected()Ljava/lang/String;
    .locals 3

    .line 54
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6DriverStore;->filesDir:Ljava/io/File;

    const-string v2, "vulkan_driver.cfg"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-wide/16 v1, 0x80

    invoke-static {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6DriverStore;->read(Ljava/io/File;J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 55
    .local v0, "id":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const-string v2, "system"

    if-nez v1, :cond_2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 56
    :cond_0
    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/T6DriverStore;->find(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverStore$Entry;

    move-result-object v1

    if-eqz v1, :cond_1

    move-object v2, v0

    :cond_1
    return-object v2

    .line 55
    :cond_2
    :goto_0
    return-object v2
.end method
