.class public final Lorg/wiiucoop/bo2android/T6DxvkStore;
.super Ljava/lang/Object;
.source "T6DxvkStore.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/wiiucoop/bo2android/T6DxvkStore$Entry;,
        Lorg/wiiucoop/bo2android/T6DxvkStore$Result;
    }
.end annotation


# static fields
.field public static final BUILTIN:Ljava/lang/String; = "builtin"

.field public static final BUILTIN_VERSION:Ljava/lang/String; = "2.6.0"

.field static final BUNDLED_ASSETS:Ljava/lang/String; = "dxvk/legacy-1.9.2/"

.field public static final BUNDLED_ID:Ljava/lang/String; = "dxvk-1.9.2-legacy"

.field public static final BUNDLED_VERSION:Ljava/lang/String; = "1.9.2"

.field public static final D3D11:Ljava/lang/String; = "libdxvk_d3d11.so"

.field public static final DXGI:Ljava/lang/String; = "libdxvk_dxgi.so"

.field static final MAX_ENTRIES:I = 0x40

.field static final MAX_LIBRARY_BYTES:J = 0x8000000L

.field static final MAX_ZIP_BYTES:J = 0x4000000L

.field static final UPSTREAM3_ASSETS:Ljava/lang/String; = "dxvk/upstream-3.1.1/"

.field public static final UPSTREAM3_ID:Ljava/lang/String; = "dxvk-3.1.1"

.field public static final UPSTREAM3_VERSION:Ljava/lang/String; = "3.1.1"

.field private static final VERSION:Ljava/util/regex/Pattern;


# instance fields
.field private apkStamp:J

.field private final filesDir:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 386
    const-string v0, "DXVK v?([0-9]+\\.[0-9]+(?:\\.[0-9]+)?(?:[-+][A-Za-z0-9._-]{1,24})?)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/wiiucoop/bo2android/T6DxvkStore;->VERSION:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 0
    .param p1, "filesDir"    # Ljava/io/File;

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6DxvkStore;->filesDir:Ljava/io/File;

    .line 114
    return-void
.end method

.method public static apkStamp(Landroid/content/Context;)J
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 131
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iget-wide v0, v0, Landroid/content/pm/PackageInfo;->lastUpdateTime:J
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    .line 132
    :catch_0
    move-exception v0

    .line 133
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-wide/16 v1, 0x0

    return-wide v1
.end method

.method private static contains(Ljava/io/File;Ljava/lang/String;)Z
    .locals 1
    .param p0, "lib"    # Ljava/io/File;
    .param p1, "symbol"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 403
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6DxvkStore;->latin1(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method

.method static dxvkVersion(Ljava/io/File;)Ljava/lang/String;
    .locals 3
    .param p0, "lib"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 390
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6DxvkStore;->latin1(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    .line 391
    .local v0, "text":Ljava/lang/String;
    sget-object v1, Lorg/wiiucoop/bo2android/T6DxvkStore;->VERSION:Ljava/util/regex/Pattern;

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 392
    .local v1, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_0
    const-string v2, ""

    :goto_0
    return-object v2
.end method

.method private ensureApkSet(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 19
    .param p1, "assets"    # Landroid/content/res/AssetManager;
    .param p2, "setId"    # Ljava/lang/String;
    .param p3, "setVersion"    # Ljava/lang/String;
    .param p4, "setAssets"    # Ljava/lang/String;

    .line 333
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-string v3, "import.json"

    const-string v4, "libdxvk_d3d11.so"

    const-string v5, "libdxvk_dxgi.so"

    move-object/from16 v6, p2

    .line 334
    .local v6, "BUNDLED_ID":Ljava/lang/String;
    move-object/from16 v7, p3

    .line 335
    .local v7, "BUNDLED_VERSION":Ljava/lang/String;
    move-object/from16 v8, p4

    .line 336
    .local v8, "BUNDLED_ASSETS":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-virtual/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6DxvkStore;->versionsDir()Ljava/io/File;

    move-result-object v9

    invoke-direct {v0, v9, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v9, v0

    .line 338
    .local v9, "dir":Ljava/io/File;
    const/4 v0, 0x1

    .line 339
    .local v0, "current":Z
    const/4 v10, 0x2

    :try_start_0
    new-array v11, v10, [Ljava/lang/String;

    const/4 v12, 0x0

    aput-object v5, v11, v12

    const/4 v13, 0x1

    aput-object v4, v11, v13

    move v13, v12

    move v12, v0

    .end local v0    # "current":Z
    .local v12, "current":Z
    :goto_0
    if-ge v13, v10, :cond_4

    aget-object v0, v11, v13
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4

    move-object/from16 v16, v0

    .line 341
    .local v16, "name":Ljava/lang/String;
    :try_start_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-object/from16 v10, v16

    .end local v16    # "name":Ljava/lang/String;
    .local v10, "name":Ljava/lang/String;
    :try_start_2
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    move-object/from16 v16, v0

    .line 342
    .local v16, "fd":Landroid/content/res/AssetFileDescriptor;
    :try_start_3
    invoke-virtual/range {v16 .. v16}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v17
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 343
    .local v17, "size":J
    if-eqz v16, :cond_0

    :try_start_4
    invoke-virtual/range {v16 .. v16}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 345
    .end local v16    # "fd":Landroid/content/res/AssetFileDescriptor;
    :cond_0
    move-wide/from16 v14, v17

    goto :goto_3

    .line 341
    .end local v17    # "size":J
    .restart local v16    # "fd":Landroid/content/res/AssetFileDescriptor;
    :catchall_0
    move-exception v0

    move-object v14, v0

    if-eqz v16, :cond_1

    :try_start_5
    invoke-virtual/range {v16 .. v16}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    move-object v15, v0

    :try_start_6
    invoke-virtual {v14, v15}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v6    # "BUNDLED_ID":Ljava/lang/String;
    .end local v7    # "BUNDLED_VERSION":Ljava/lang/String;
    .end local v8    # "BUNDLED_ASSETS":Ljava/lang/String;
    .end local v9    # "dir":Ljava/io/File;
    .end local v10    # "name":Ljava/lang/String;
    .end local v12    # "current":Z
    .end local p1    # "assets":Landroid/content/res/AssetManager;
    .end local p2    # "setId":Ljava/lang/String;
    .end local p3    # "setVersion":Ljava/lang/String;
    .end local p4    # "setAssets":Ljava/lang/String;
    :cond_1
    :goto_1
    throw v14
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    .line 343
    .end local v16    # "fd":Landroid/content/res/AssetFileDescriptor;
    .restart local v6    # "BUNDLED_ID":Ljava/lang/String;
    .restart local v7    # "BUNDLED_VERSION":Ljava/lang/String;
    .restart local v8    # "BUNDLED_ASSETS":Ljava/lang/String;
    .restart local v9    # "dir":Ljava/io/File;
    .restart local v10    # "name":Ljava/lang/String;
    .restart local v12    # "current":Z
    .restart local p1    # "assets":Landroid/content/res/AssetManager;
    .restart local p2    # "setId":Ljava/lang/String;
    .restart local p3    # "setVersion":Ljava/lang/String;
    .restart local p4    # "setAssets":Ljava/lang/String;
    :catch_0
    move-exception v0

    goto :goto_2

    .end local v10    # "name":Ljava/lang/String;
    .local v16, "name":Ljava/lang/String;
    :catch_1
    move-exception v0

    move-object/from16 v10, v16

    .line 344
    .end local v16    # "name":Ljava/lang/String;
    .local v0, "compressed":Ljava/io/IOException;
    .restart local v10    # "name":Ljava/lang/String;
    :goto_2
    const-wide/16 v14, -0x1

    .line 346
    .end local v0    # "compressed":Ljava/io/IOException;
    .local v14, "size":J
    :goto_3
    :try_start_7
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v9, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 347
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v16

    if-eqz v16, :cond_2

    const-wide/16 v17, 0x0

    cmp-long v16, v14, v17

    if-ltz v16, :cond_2

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v17

    cmp-long v16, v17, v14

    if-eqz v16, :cond_3

    :cond_2
    const/4 v12, 0x0

    .line 339
    .end local v0    # "f":Ljava/io/File;
    .end local v10    # "name":Ljava/lang/String;
    .end local v14    # "size":J
    :cond_3
    add-int/lit8 v13, v13, 0x1

    const/4 v10, 0x2

    goto :goto_0

    .line 349
    :cond_4
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v9, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v10, v0

    .line 350
    .local v10, "record0":Ljava/io/File;
    const/4 v0, 0x0

    if-eqz v12, :cond_6

    invoke-virtual {v10}, Ljava/io/File;->isFile()Z

    move-result v11

    if-eqz v11, :cond_6

    iget-wide v13, v1, Lorg/wiiucoop/bo2android/T6DxvkStore;->apkStamp:J

    const-wide/16 v15, 0x0

    cmp-long v11, v13, v15

    if-eqz v11, :cond_5

    const-wide/16 v13, 0x1000

    invoke-static {v10, v13, v14}, Lorg/wiiucoop/bo2android/T6DxvkStore;->read(Ljava/io/File;J)Ljava/lang/String;

    move-result-object v11

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "\"apkStamp\": "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-wide v14, v1, Lorg/wiiucoop/bo2android/T6DxvkStore;->apkStamp:J

    invoke-virtual {v13, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ","

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 351
    :cond_5
    return-object v0

    .line 353
    :cond_6
    new-instance v11, Ljava/io/File;

    invoke-virtual/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6DxvkStore;->versionsDir()Ljava/io/File;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, ".staging-"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v11, v13, v14}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 354
    .local v11, "staging":Ljava/io/File;
    invoke-static {v11}, Lorg/wiiucoop/bo2android/T6DriverPackage;->deleteTree(Ljava/io/File;)V

    .line 355
    invoke-virtual {v11}, Ljava/io/File;->mkdirs()Z

    move-result v13

    if-nez v13, :cond_7

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "n\u00e3o foi poss\u00edvel criar "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 356
    :cond_7
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v2, v13}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v13

    new-instance v14, Ljava/io/File;

    invoke-direct {v14, v11, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4

    const-wide/32 v0, 0x8000000

    :try_start_8
    invoke-static {v13, v14, v0, v1}, Lorg/wiiucoop/bo2android/T6DriverPackage;->copyHashed(Ljava/io/InputStream;Ljava/io/File;J)Ljava/lang/String;

    move-result-object v13

    .line 357
    .local v13, "dxgiHash":Ljava/lang/String;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v14}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v14

    new-instance v15, Ljava/io/File;

    invoke-direct {v15, v11, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v14, v15, v0, v1}, Lorg/wiiucoop/bo2android/T6DriverPackage;->copyHashed(Ljava/io/InputStream;Ljava/io/File;J)Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    .line 358
    .local v1, "d3d11Hash":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "{\n  \"id\": \""

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "\",\n  \"version\": \""

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "\",\n  \"dxgiSha256\": \""

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "\",\n  \"d3d11Sha256\": \""

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "\",\n  \"zipName\": \"APK assets/"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "\",\n  \"apkStamp\": "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_3

    move-object/from16 v4, p0

    :try_start_9
    iget-wide v14, v4, Lorg/wiiucoop/bo2android/T6DxvkStore;->apkStamp:J

    invoke-virtual {v0, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v14, ",\n  \"bundled\": true\n}\n"

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v14, v0

    .line 361
    .local v14, "record":Ljava/lang/String;
    new-instance v0, Ljava/io/FileOutputStream;

    new-instance v15, Ljava/io/File;

    invoke-direct {v15, v11, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v0, v15}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_2

    move-object v3, v0

    .line 362
    .local v3, "out":Ljava/io/OutputStream;
    :try_start_a
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v14, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/io/OutputStream;->write([B)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 363
    :try_start_b
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 364
    .end local v3    # "out":Ljava/io/OutputStream;
    invoke-static {v9}, Lorg/wiiucoop/bo2android/T6DriverPackage;->deleteTree(Ljava/io/File;)V

    .line 365
    invoke-virtual {v11, v9}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 366
    invoke-static {v11}, Lorg/wiiucoop/bo2android/T6DriverPackage;->deleteTree(Ljava/io/File;)V

    .line 367
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "n\u00e3o foi poss\u00edvel instalar "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_2

    return-object v0

    .line 369
    :cond_8
    const/4 v0, 0x0

    return-object v0

    .line 361
    .restart local v3    # "out":Ljava/io/OutputStream;
    :catchall_2
    move-exception v0

    move-object v5, v0

    :try_start_c
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    goto :goto_4

    :catchall_3
    move-exception v0

    move-object v15, v0

    :try_start_d
    invoke-virtual {v5, v15}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v6    # "BUNDLED_ID":Ljava/lang/String;
    .end local v7    # "BUNDLED_VERSION":Ljava/lang/String;
    .end local v8    # "BUNDLED_ASSETS":Ljava/lang/String;
    .end local v9    # "dir":Ljava/io/File;
    .end local p1    # "assets":Landroid/content/res/AssetManager;
    .end local p2    # "setId":Ljava/lang/String;
    .end local p3    # "setVersion":Ljava/lang/String;
    .end local p4    # "setAssets":Ljava/lang/String;
    :goto_4
    throw v5
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_2

    .line 370
    .end local v1    # "d3d11Hash":Ljava/lang/String;
    .end local v3    # "out":Ljava/io/OutputStream;
    .end local v10    # "record0":Ljava/io/File;
    .end local v11    # "staging":Ljava/io/File;
    .end local v12    # "current":Z
    .end local v13    # "dxgiHash":Ljava/lang/String;
    .end local v14    # "record":Ljava/lang/String;
    .restart local v6    # "BUNDLED_ID":Ljava/lang/String;
    .restart local v7    # "BUNDLED_VERSION":Ljava/lang/String;
    .restart local v8    # "BUNDLED_ASSETS":Ljava/lang/String;
    .restart local v9    # "dir":Ljava/io/File;
    .restart local p1    # "assets":Landroid/content/res/AssetManager;
    .restart local p2    # "setId":Ljava/lang/String;
    .restart local p3    # "setVersion":Ljava/lang/String;
    .restart local p4    # "setAssets":Ljava/lang/String;
    :catch_2
    move-exception v0

    goto :goto_5

    :catch_3
    move-exception v0

    move-object/from16 v4, p0

    goto :goto_5

    :catch_4
    move-exception v0

    move-object v4, v1

    .line 371
    .local v0, "e":Ljava/io/IOException;
    :goto_5
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "falha ao copiar o DXVK do APK: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static escape(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "s"    # Ljava/lang/String;

    .line 427
    const-string v0, "\\"

    const-string v1, "\\\\"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\""

    const-string v2, "\\\""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static isApkSet(Ljava/lang/String;)Z
    .locals 1
    .param p0, "id"    # Ljava/lang/String;

    .line 66
    const-string v0, "dxvk-1.9.2-legacy"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "dxvk-3.1.1"

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

.method private static latin1(Ljava/io/File;)Ljava/lang/String;
    .locals 6
    .param p0, "lib"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 407
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v0

    .line 408
    .local v0, "n":J
    const-wide/32 v2, 0x8000000

    cmp-long v2, v0, v2

    if-gtz v2, :cond_2

    .line 409
    long-to-int v2, v0

    new-array v2, v2, [B

    .line 410
    .local v2, "b":[B
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 411
    .local v3, "in":Ljava/io/InputStream;
    const/4 v4, 0x0

    .line 412
    .local v4, "off":I
    :goto_0
    :try_start_0
    array-length v5, v2

    if-ge v4, v5, :cond_1

    .line 413
    array-length v5, v2

    sub-int/2addr v5, v4

    invoke-virtual {v3, v2, v4, v5}, Ljava/io/InputStream;->read([BII)I

    move-result v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 414
    .local v5, "r":I
    if-gez v5, :cond_0

    goto :goto_1

    .line 415
    :cond_0
    add-int/2addr v4, v5

    .line 416
    .end local v5    # "r":I
    goto :goto_0

    .line 417
    .end local v4    # "off":I
    :cond_1
    :goto_1
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 418
    .end local v3    # "in":Ljava/io/InputStream;
    new-instance v3, Ljava/lang/String;

    sget-object v4, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-direct {v3, v2, v4}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v3

    .line 410
    .restart local v3    # "in":Ljava/io/InputStream;
    :catchall_0
    move-exception v4

    :try_start_1
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v5

    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_2
    throw v4

    .line 408
    .end local v2    # "b":[B
    .end local v3    # "in":Ljava/io/InputStream;
    :cond_2
    new-instance v2, Ljava/io/IOException;

    const-string v3, "biblioteca grande demais"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method static libraryProblem(Ljava/io/File;)Ljava/lang/String;
    .locals 4
    .param p0, "lib"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 377
    const/4 v0, 0x2

    new-array v1, v0, [B

    .line 378
    .local v1, "h":[B
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 379
    .local v2, "in":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {v2, v1}, Ljava/io/InputStream;->read([B)I

    move-result v3

    if-eq v3, v0, :cond_0

    const-string v0, "arquivo curto demais"
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 380
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 379
    return-object v0

    .line 380
    :cond_0
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 381
    .end local v2    # "in":Ljava/io/InputStream;
    const/4 v0, 0x0

    aget-byte v0, v1, v0

    const/16 v2, 0x4d

    if-ne v0, v2, :cond_1

    const/4 v0, 0x1

    aget-byte v0, v1, v0

    const/16 v2, 0x5a

    if-ne v0, v2, :cond_1

    const-string v0, "\u00e9 uma DLL do Windows (PE), que este processo Android n\u00e3o carrega"

    return-object v0

    .line 382
    :cond_1
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6DriverPackage;->elfProblem(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    .line 383
    .local v0, "elf":Ljava/lang/String;
    if-nez v0, :cond_2

    const/4 v2, 0x0

    goto :goto_0

    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "biblioteca inv\u00e1lida: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_0
    return-object v2

    .line 378
    .end local v0    # "elf":Ljava/lang/String;
    .restart local v2    # "in":Ljava/io/InputStream;
    :catchall_0
    move-exception v0

    :try_start_1
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v3

    invoke-virtual {v0, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw v0
.end method

.method private load(Ljava/io/File;)Lorg/wiiucoop/bo2android/T6DxvkStore$Entry;
    .locals 5
    .param p1, "dir"    # Ljava/io/File;

    .line 431
    new-instance v0, Ljava/io/File;

    const-string v1, "libdxvk_dxgi.so"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    new-instance v0, Ljava/io/File;

    const-string v2, "libdxvk_d3d11.so"

    invoke-direct {v0, p1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 432
    :cond_0
    new-instance v0, Ljava/io/File;

    const-string v2, "import.json"

    invoke-direct {v0, p1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-wide/16 v2, 0x1000

    invoke-static {v0, v2, v3}, Lorg/wiiucoop/bo2android/T6DxvkStore;->read(Ljava/io/File;J)Ljava/lang/String;

    move-result-object v0

    .line 433
    .local v0, "record":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    return-object v1

    .line 434
    :cond_1
    new-instance v1, Lorg/wiiucoop/bo2android/T6DxvkStore$Entry;

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "version"

    invoke-static {v0, v3}, Lorg/wiiucoop/bo2android/T6DriverPackage;->stringField(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 435
    const-string v4, "zipName"

    invoke-static {v0, v4}, Lorg/wiiucoop/bo2android/T6DriverPackage;->stringField(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lorg/wiiucoop/bo2android/T6DxvkStore$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 434
    return-object v1

    .line 431
    .end local v0    # "record":Ljava/lang/String;
    :cond_2
    :goto_0
    return-object v1
.end method

.method private static parent(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "name"    # Ljava/lang/String;

    .line 422
    const/16 v0, 0x2f

    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 423
    .local v0, "slash":I
    if-gez v0, :cond_0

    const-string v1, ""

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1
.end method

.method private static read(Ljava/io/File;J)Ljava/lang/String;
    .locals 7
    .param p0, "f"    # Ljava/io/File;
    .param p1, "limit"    # J

    .line 439
    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v0

    const-string v1, ""

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v2

    cmp-long v0, v2, p1

    if-lez v0, :cond_0

    goto :goto_3

    .line 440
    :cond_0
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 441
    .local v0, "in":Ljava/io/InputStream;
    :try_start_1
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v2

    long-to-int v2, v2

    new-array v2, v2, [B

    .line 442
    .local v2, "b":[B
    const/4 v3, 0x0

    .line 443
    .local v3, "n":I
    :goto_0
    array-length v4, v2

    if-ge v3, v4, :cond_2

    .line 444
    array-length v4, v2

    sub-int/2addr v4, v3

    invoke-virtual {v0, v2, v3, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v4

    .line 445
    .local v4, "r":I
    if-gez v4, :cond_1

    goto :goto_1

    .line 446
    :cond_1
    add-int/2addr v3, v4

    .line 447
    .end local v4    # "r":I
    goto :goto_0

    .line 448
    :cond_2
    :goto_1
    new-instance v4, Ljava/lang/String;

    sget-object v5, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    const/4 v6, 0x0

    invoke-direct {v4, v2, v6, v3, v5}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 449
    :try_start_2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 448
    return-object v4

    .line 440
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

    .line 449
    .end local v0    # "in":Ljava/io/InputStream;
    .restart local p0    # "f":Ljava/io/File;
    .restart local p1    # "limit":J
    :catch_0
    move-exception v0

    .line 450
    .local v0, "e":Ljava/io/IOException;
    return-object v1

    .line 439
    .end local v0    # "e":Ljava/io/IOException;
    :cond_3
    :goto_3
    return-object v1
.end method

.method static setId(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "version"    # Ljava/lang/String;
    .param p1, "zipSha256"    # Ljava/lang/String;

    .line 396
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "dxvk-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "unknown"

    goto :goto_0

    :cond_0
    move-object v1, p0

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 397
    const-string v1, "[^a-z0-9._-]+"

    const-string v2, "-"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 398
    .local v0, "base":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v3, 0x0

    const/16 v4, 0x28

    if-le v1, v4, :cond_1

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 399
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x8

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public ensureBundled(Landroid/content/res/AssetManager;)Ljava/lang/String;
    .locals 3
    .param p1, "assets"    # Landroid/content/res/AssetManager;

    .line 324
    const-string v0, "1.9.2"

    const-string v1, "dxvk/legacy-1.9.2/"

    const-string v2, "dxvk-1.9.2-legacy"

    invoke-direct {p0, p1, v2, v0, v1}, Lorg/wiiucoop/bo2android/T6DxvkStore;->ensureApkSet(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public ensureUpstream3(Landroid/content/res/AssetManager;)Ljava/lang/String;
    .locals 3
    .param p1, "assets"    # Landroid/content/res/AssetManager;

    .line 329
    const-string v0, "3.1.1"

    const-string v1, "dxvk/upstream-3.1.1/"

    const-string v2, "dxvk-3.1.1"

    invoke-direct {p0, p1, v2, v0, v1}, Lorg/wiiucoop/bo2android/T6DxvkStore;->ensureApkSet(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public find(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Entry;
    .locals 3
    .param p1, "id"    # Ljava/lang/String;

    .line 182
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

    .line 183
    :cond_0
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6DxvkStore;->versionsDir()Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 184
    .local v1, "d":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/T6DxvkStore;->load(Ljava/io/File;)Lorg/wiiucoop/bo2android/T6DxvkStore$Entry;

    move-result-object v0

    :cond_1
    return-object v0

    .line 182
    .end local v1    # "d":Ljava/io/File;
    :cond_2
    :goto_0
    return-object v0
.end method

.method public importZip(Ljava/io/File;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Result;
    .locals 23
    .param p1, "zip"    # Ljava/io/File;
    .param p2, "sourceName"    # Ljava/lang/String;

    .line 220
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->isFile()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "arquivo n\u00e3o encontrado"

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Result;

    move-result-object v0

    return-object v0

    .line 221
    :cond_0
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->length()J

    move-result-wide v0

    const-wide/32 v2, 0x4000000

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    const-string v0, "ZIP maior que 64 MB"

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Result;

    move-result-object v0

    return-object v0

    .line 222
    :cond_1
    :try_start_0
    new-instance v0, Ljava/util/zip/ZipFile;

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/util/zip/ZipException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5

    move-object v2, v0

    .line 223
    .local v2, "file":Ljava/util/zip/ZipFile;
    :try_start_1
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    move-object v3, v0

    .line 224
    .local v3, "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 225
    .local v0, "count":I
    const/4 v4, 0x0

    .local v4, "dxgi":Ljava/util/zip/ZipEntry;
    const/4 v5, 0x0

    .line 226
    .local v5, "d3d11":Ljava/util/zip/ZipEntry;
    const/4 v6, 0x0

    .line 227
    .local v6, "windowsDll":Z
    invoke-virtual {v2}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v7

    move v8, v6

    move-object v6, v5

    move-object v5, v4

    move v4, v0

    .end local v0    # "count":I
    .local v4, "count":I
    .local v5, "dxgi":Ljava/util/zip/ZipEntry;
    .local v6, "d3d11":Ljava/util/zip/ZipEntry;
    .local v7, "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .local v8, "windowsDll":Z
    :goto_0
    invoke-interface {v7}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    const-string v9, "libdxvk_d3d11.so"

    const-string v10, "libdxvk_dxgi.so"

    const-string v11, "\'"

    const-string v12, "entrada duplicada \'"

    const/4 v13, 0x1

    if-eqz v0, :cond_c

    .line 228
    :try_start_2
    invoke-interface {v7}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/zip/ZipEntry;

    .line 229
    .local v0, "entry":Ljava/util/zip/ZipEntry;
    add-int/lit8 v4, v4, 0x1

    const/16 v14, 0x40

    if-le v4, v14, :cond_2

    const-string v9, "mais de 64 entradas no ZIP"

    invoke-static {v9}, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Result;

    move-result-object v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 312
    :try_start_3
    invoke-virtual {v2}, Ljava/util/zip/ZipFile;->close()V
    :try_end_3
    .catch Ljava/util/zip/ZipException; {:try_start_3 .. :try_end_3} :catch_6
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_5

    .line 229
    return-object v9

    .line 230
    :cond_2
    :try_start_4
    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v14

    .line 231
    .local v14, "name":Ljava/lang/String;
    invoke-static {v14}, Lorg/wiiucoop/bo2android/T6DriverPackage;->unsafeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 232
    .local v15, "why":Ljava/lang/String;
    if-eqz v15, :cond_3

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "entrada recusada \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\': "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Result;

    move-result-object v9
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 312
    :try_start_5
    invoke-virtual {v2}, Ljava/util/zip/ZipFile;->close()V
    :try_end_5
    .catch Ljava/util/zip/ZipException; {:try_start_5 .. :try_end_5} :catch_6
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_5

    .line 232
    return-object v9

    .line 233
    :cond_3
    :try_start_6
    invoke-interface {v3, v14}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_4

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Result;

    move-result-object v9
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 312
    :try_start_7
    invoke-virtual {v2}, Ljava/util/zip/ZipFile;->close()V
    :try_end_7
    .catch Ljava/util/zip/ZipException; {:try_start_7 .. :try_end_7} :catch_6
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5

    .line 233
    return-object v9

    .line 234
    :cond_4
    :try_start_8
    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v11

    if-eqz v11, :cond_5

    goto :goto_0

    .line 235
    :cond_5
    const/16 v11, 0x2f

    invoke-virtual {v14, v11}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v11

    add-int/2addr v11, v13

    invoke-virtual {v14, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v11

    sget-object v12, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v11, v12}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v11

    .line 236
    .local v11, "base":Ljava/lang/String;
    const-string v12, "dxgi.dll"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_6

    const-string v12, "d3d11.dll"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_7

    :cond_6
    const/4 v8, 0x1

    .line 237
    :cond_7
    invoke-virtual {v11, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_9

    .line 238
    if-eqz v5, :cond_8

    const-string v9, "mais de um libdxvk_dxgi.so no ZIP"

    invoke-static {v9}, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Result;

    move-result-object v9
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 312
    :try_start_9
    invoke-virtual {v2}, Ljava/util/zip/ZipFile;->close()V
    :try_end_9
    .catch Ljava/util/zip/ZipException; {:try_start_9 .. :try_end_9} :catch_6
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_5

    .line 238
    return-object v9

    .line 239
    :cond_8
    move-object v5, v0

    goto :goto_1

    .line 240
    :cond_9
    :try_start_a
    invoke-virtual {v11, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_b

    .line 241
    if-eqz v6, :cond_a

    const-string v9, "mais de um libdxvk_d3d11.so no ZIP"

    invoke-static {v9}, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Result;

    move-result-object v9
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 312
    :try_start_b
    invoke-virtual {v2}, Ljava/util/zip/ZipFile;->close()V
    :try_end_b
    .catch Ljava/util/zip/ZipException; {:try_start_b .. :try_end_b} :catch_6
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_5

    .line 241
    return-object v9

    .line 242
    :cond_a
    move-object v6, v0

    .line 244
    .end local v0    # "entry":Ljava/util/zip/ZipEntry;
    .end local v11    # "base":Ljava/lang/String;
    .end local v14    # "name":Ljava/lang/String;
    .end local v15    # "why":Ljava/lang/String;
    :cond_b
    :goto_1
    goto/16 :goto_0

    .line 245
    .end local v7    # "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    :cond_c
    if-eqz v5, :cond_1c

    if-nez v6, :cond_d

    move-object v14, v3

    move/from16 v19, v4

    move-object/from16 v18, v5

    move-object/from16 v20, v6

    goto/16 :goto_7

    .line 251
    :cond_d
    :try_start_c
    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6DxvkStore;->parent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/wiiucoop/bo2android/T6DxvkStore;->parent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    .line 252
    const-string v0, "libdxvk_dxgi.so e libdxvk_d3d11.so est\u00e3o em pastas diferentes; precisam ser do mesmo build"

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Result;

    move-result-object v0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 312
    :try_start_d
    invoke-virtual {v2}, Ljava/util/zip/ZipFile;->close()V
    :try_end_d
    .catch Ljava/util/zip/ZipException; {:try_start_d .. :try_end_d} :catch_6
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_5

    .line 252
    return-object v0

    .line 254
    :cond_e
    :try_start_e
    invoke-static/range {p1 .. p1}, Lorg/wiiucoop/bo2android/T6DriverPackage;->duplicateLocalEntry(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    move-object v7, v0

    .line 255
    .local v7, "dup":Ljava/lang/String;
    if-eqz v7, :cond_f

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Result;

    move-result-object v0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    .line 312
    :try_start_f
    invoke-virtual {v2}, Ljava/util/zip/ZipFile;->close()V
    :try_end_f
    .catch Ljava/util/zip/ZipException; {:try_start_f .. :try_end_f} :catch_6
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_5

    .line 255
    return-object v0

    .line 256
    :cond_f
    :try_start_10
    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v11

    const-wide/32 v14, 0x8000000

    cmp-long v0, v11, v14

    if-gtz v0, :cond_1b

    invoke-virtual {v6}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v11

    cmp-long v0, v11, v14

    if-lez v0, :cond_10

    move-object v14, v3

    move/from16 v19, v4

    move-object/from16 v18, v5

    move-object/from16 v20, v6

    goto/16 :goto_6

    .line 260
    :cond_10
    invoke-virtual/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6DxvkStore;->versionsDir()Ljava/io/File;

    move-result-object v0

    move-object v11, v0

    .line 261
    .local v11, "dir":Ljava/io/File;
    invoke-virtual {v11}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_11

    invoke-virtual {v11}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_11

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "n\u00e3o foi poss\u00edvel criar "

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Result;

    move-result-object v0
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_2

    .line 312
    :try_start_11
    invoke-virtual {v2}, Ljava/util/zip/ZipFile;->close()V
    :try_end_11
    .catch Ljava/util/zip/ZipException; {:try_start_11 .. :try_end_11} :catch_6
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_5

    .line 261
    return-object v0

    .line 262
    :cond_11
    :try_start_12
    invoke-static/range {p1 .. p1}, Lorg/wiiucoop/bo2android/T6DriverPackage;->sha256(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    move-object v12, v0

    .line 263
    .local v12, "zipHash":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, ".staging-"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const/16 v14, 0xc

    const/4 v15, 0x0

    invoke-virtual {v12, v15, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v0, v11, v13}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v13, v0

    .line 264
    .local v13, "staging":Ljava/io/File;
    invoke-static {v13}, Lorg/wiiucoop/bo2android/T6DriverPackage;->deleteTree(Ljava/io/File;)V

    .line 265
    invoke-virtual {v13}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_12

    const-string v0, "n\u00e3o foi poss\u00edvel criar o diret\u00f3rio tempor\u00e1rio"

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Result;

    move-result-object v0
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_2

    .line 312
    :try_start_13
    invoke-virtual {v2}, Ljava/util/zip/ZipFile;->close()V
    :try_end_13
    .catch Ljava/util/zip/ZipException; {:try_start_13 .. :try_end_13} :catch_6
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_13} :catch_5

    .line 265
    return-object v0

    .line 267
    :cond_12
    :try_start_14
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v13, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v10, v0

    .local v10, "dxgiOut":Ljava/io/File;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v13, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v9, v0

    .line 268
    .local v9, "d3d11Out":Ljava/io/File;
    invoke-virtual {v2, v5}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v0
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_14} :catch_4
    .catchall {:try_start_14 .. :try_end_14} :catchall_2

    move-object v14, v3

    move/from16 v19, v4

    const-wide/32 v3, 0x8000000

    .end local v3    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v4    # "count":I
    .local v14, "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .local v19, "count":I
    :try_start_15
    invoke-static {v0, v10, v3, v4}, Lorg/wiiucoop/bo2android/T6DriverPackage;->copyHashed(Ljava/io/InputStream;Ljava/io/File;J)Ljava/lang/String;

    move-result-object v0

    move-object/from16 v17, v0

    .line 269
    .local v17, "dxgiHash":Ljava/lang/String;
    invoke-virtual {v2, v6}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0, v9, v3, v4}, Lorg/wiiucoop/bo2android/T6DriverPackage;->copyHashed(Ljava/io/InputStream;Ljava/io/File;J)Ljava/lang/String;

    move-result-object v0

    move-object v3, v0

    .line 270
    .local v3, "d3d11Hash":Ljava/lang/String;
    const/4 v0, 0x2

    new-array v4, v0, [Ljava/io/File;

    aput-object v10, v4, v15

    const/16 v16, 0x1

    aput-object v9, v4, v16
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_15} :catch_3
    .catchall {:try_start_15 .. :try_end_15} :catchall_2

    :goto_2
    if-ge v15, v0, :cond_14

    :try_start_16
    aget-object v18, v4, v15

    .line 271
    .local v18, "lib":Ljava/io/File;
    invoke-static/range {v18 .. v18}, Lorg/wiiucoop/bo2android/T6DxvkStore;->libraryProblem(Ljava/io/File;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v21, v20

    .line 272
    .local v21, "problem":Ljava/lang/String;
    move-object/from16 v0, v21

    .end local v21    # "problem":Ljava/lang/String;
    .local v0, "problem":Ljava/lang/String;
    if-eqz v0, :cond_13

    .line 273
    invoke-static {v13}, Lorg/wiiucoop/bo2android/T6DriverPackage;->deleteTree(Ljava/io/File;)V

    .line 274
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v15, ": "

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Result;

    move-result-object v4
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_16} :catch_0
    .catchall {:try_start_16 .. :try_end_16} :catchall_2

    .line 312
    :try_start_17
    invoke-virtual {v2}, Ljava/util/zip/ZipFile;->close()V
    :try_end_17
    .catch Ljava/util/zip/ZipException; {:try_start_17 .. :try_end_17} :catch_6
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_17} :catch_5

    .line 274
    return-object v4

    .line 270
    .end local v0    # "problem":Ljava/lang/String;
    .end local v18    # "lib":Ljava/io/File;
    :cond_13
    add-int/lit8 v15, v15, 0x1

    const/4 v0, 0x2

    goto :goto_2

    .line 308
    .end local v3    # "d3d11Hash":Ljava/lang/String;
    .end local v9    # "d3d11Out":Ljava/io/File;
    .end local v10    # "dxgiOut":Ljava/io/File;
    .end local v17    # "dxgiHash":Ljava/lang/String;
    :catch_0
    move-exception v0

    move-object/from16 v18, v5

    move-object/from16 v20, v6

    goto/16 :goto_5

    .line 277
    .restart local v3    # "d3d11Hash":Ljava/lang/String;
    .restart local v9    # "d3d11Out":Ljava/io/File;
    .restart local v10    # "dxgiOut":Ljava/io/File;
    .restart local v17    # "dxgiHash":Ljava/lang/String;
    :cond_14
    :try_start_18
    const-string v0, "CreateDXGIFactory1"

    invoke-static {v10, v0}, Lorg/wiiucoop/bo2android/T6DxvkStore;->contains(Ljava/io/File;Ljava/lang/String;)Z

    move-result v0
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_18} :catch_3
    .catchall {:try_start_18 .. :try_end_18} :catchall_2

    if-nez v0, :cond_15

    .line 278
    :try_start_19
    invoke-static {v13}, Lorg/wiiucoop/bo2android/T6DriverPackage;->deleteTree(Ljava/io/File;)V

    .line 279
    const-string v0, "libdxvk_dxgi.so n\u00e3o exporta CreateDXGIFactory1"

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Result;

    move-result-object v0
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_19} :catch_0
    .catchall {:try_start_19 .. :try_end_19} :catchall_2

    .line 312
    :try_start_1a
    invoke-virtual {v2}, Ljava/util/zip/ZipFile;->close()V
    :try_end_1a
    .catch Ljava/util/zip/ZipException; {:try_start_1a .. :try_end_1a} :catch_6
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_1a} :catch_5

    .line 279
    return-object v0

    .line 281
    :cond_15
    :try_start_1b
    const-string v0, "D3D11CreateDeviceAndSwapChain"

    invoke-static {v9, v0}, Lorg/wiiucoop/bo2android/T6DxvkStore;->contains(Ljava/io/File;Ljava/lang/String;)Z

    move-result v0
    :try_end_1b
    .catch Ljava/io/IOException; {:try_start_1b .. :try_end_1b} :catch_3
    .catchall {:try_start_1b .. :try_end_1b} :catchall_2

    if-nez v0, :cond_16

    .line 282
    :try_start_1c
    invoke-static {v13}, Lorg/wiiucoop/bo2android/T6DriverPackage;->deleteTree(Ljava/io/File;)V

    .line 283
    const-string v0, "libdxvk_d3d11.so n\u00e3o exporta D3D11CreateDeviceAndSwapChain"

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Result;

    move-result-object v0
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_1c} :catch_0
    .catchall {:try_start_1c .. :try_end_1c} :catchall_2

    .line 312
    :try_start_1d
    invoke-virtual {v2}, Ljava/util/zip/ZipFile;->close()V
    :try_end_1d
    .catch Ljava/util/zip/ZipException; {:try_start_1d .. :try_end_1d} :catch_6
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_1d} :catch_5

    .line 283
    return-object v0

    .line 285
    :cond_16
    :try_start_1e
    invoke-static {v9}, Lorg/wiiucoop/bo2android/T6DxvkStore;->dxvkVersion(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    move-object v4, v0

    .line 286
    .local v4, "version":Ljava/lang/String;
    invoke-static {v4, v12}, Lorg/wiiucoop/bo2android/T6DxvkStore;->setId(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v15, v0

    .line 287
    .local v15, "id":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{\n  \"id\": \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\",\n  \"version\": \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\",\n  \"dxgiSha256\": \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    move-object/from16 v1, v17

    .end local v17    # "dxgiHash":Ljava/lang/String;
    .local v1, "dxgiHash":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    move-object/from16 v17, v1

    .end local v1    # "dxgiHash":Ljava/lang/String;
    .restart local v17    # "dxgiHash":Ljava/lang/String;
    const-string v1, "\",\n  \"d3d11Sha256\": \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\",\n  \"zipSha256\": \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\",\n  \"zipName\": \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0
    :try_end_1e
    .catch Ljava/io/IOException; {:try_start_1e .. :try_end_1e} :catch_3
    .catchall {:try_start_1e .. :try_end_1e} :catchall_2

    .line 289
    if-nez p2, :cond_17

    :try_start_1f
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1
    :try_end_1f
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_1f} :catch_0
    .catchall {:try_start_1f .. :try_end_1f} :catchall_2

    goto :goto_3

    :cond_17
    move-object/from16 v1, p2

    :goto_3
    :try_start_20
    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6DxvkStore;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\",\n  \"importedAt\": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_20} :catch_3
    .catchall {:try_start_20 .. :try_end_20} :catchall_2

    .line 290
    move-object/from16 v18, v5

    move-object v1, v6

    .end local v5    # "dxgi":Ljava/util/zip/ZipEntry;
    .end local v6    # "d3d11":Ljava/util/zip/ZipEntry;
    .local v1, "d3d11":Ljava/util/zip/ZipEntry;
    .local v18, "dxgi":Ljava/util/zip/ZipEntry;
    :try_start_21
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-virtual {v0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, "\n}\n"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v5, v0

    .line 291
    .local v5, "record":Ljava/lang/String;
    new-instance v0, Ljava/io/FileOutputStream;

    new-instance v6, Ljava/io/File;
    :try_end_21
    .catch Ljava/io/IOException; {:try_start_21 .. :try_end_21} :catch_2
    .catchall {:try_start_21 .. :try_end_21} :catchall_2

    move-object/from16 v20, v1

    .end local v1    # "d3d11":Ljava/util/zip/ZipEntry;
    .local v20, "d3d11":Ljava/util/zip/ZipEntry;
    :try_start_22
    const-string v1, "import.json"

    invoke-direct {v6, v13, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v0, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_22
    .catch Ljava/io/IOException; {:try_start_22 .. :try_end_22} :catch_1
    .catchall {:try_start_22 .. :try_end_22} :catchall_2

    move-object v1, v0

    .line 292
    .local v1, "out":Ljava/io/OutputStream;
    :try_start_23
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v5, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_0

    .line 293
    :try_start_24
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 294
    .end local v1    # "out":Ljava/io/OutputStream;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v11, v15}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 295
    .local v0, "target":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v21, v3

    .end local v3    # "d3d11Hash":Ljava/lang/String;
    .local v21, "d3d11Hash":Ljava/lang/String;
    const-string v3, ".old-"

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v11, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 296
    .local v1, "old":Ljava/io/File;
    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6DriverPackage;->deleteTree(Ljava/io/File;)V

    .line 297
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_18

    invoke-virtual {v0, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v3

    if-nez v3, :cond_18

    .line 298
    invoke-static {v13}, Lorg/wiiucoop/bo2android/T6DriverPackage;->deleteTree(Ljava/io/File;)V

    .line 299
    const-string v3, "n\u00e3o foi poss\u00edvel substituir a vers\u00e3o anterior"

    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Result;

    move-result-object v3
    :try_end_24
    .catch Ljava/io/IOException; {:try_start_24 .. :try_end_24} :catch_1
    .catchall {:try_start_24 .. :try_end_24} :catchall_2

    .line 312
    :try_start_25
    invoke-virtual {v2}, Ljava/util/zip/ZipFile;->close()V
    :try_end_25
    .catch Ljava/util/zip/ZipException; {:try_start_25 .. :try_end_25} :catch_6
    .catch Ljava/io/IOException; {:try_start_25 .. :try_end_25} :catch_5

    .line 299
    return-object v3

    .line 301
    :cond_18
    :try_start_26
    invoke-virtual {v13, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v3

    if-nez v3, :cond_1a

    .line 302
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_19

    invoke-virtual {v1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 303
    :cond_19
    invoke-static {v13}, Lorg/wiiucoop/bo2android/T6DriverPackage;->deleteTree(Ljava/io/File;)V

    .line 304
    const-string v3, "n\u00e3o foi poss\u00edvel instalar o DXVK"

    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Result;

    move-result-object v3
    :try_end_26
    .catch Ljava/io/IOException; {:try_start_26 .. :try_end_26} :catch_1
    .catchall {:try_start_26 .. :try_end_26} :catchall_2

    .line 312
    :try_start_27
    invoke-virtual {v2}, Ljava/util/zip/ZipFile;->close()V
    :try_end_27
    .catch Ljava/util/zip/ZipException; {:try_start_27 .. :try_end_27} :catch_6
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_27} :catch_5

    .line 304
    return-object v3

    .line 306
    :cond_1a
    :try_start_28
    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6DriverPackage;->deleteTree(Ljava/io/File;)V

    .line 307
    new-instance v3, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;

    const-string v6, ""

    move-object/from16 v22, v0

    const/4 v0, 0x1

    .end local v0    # "target":Ljava/io/File;
    .local v22, "target":Ljava/io/File;
    invoke-direct {v3, v0, v6, v15, v4}, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;-><init>(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_28 .. :try_end_28} :catch_1
    .catchall {:try_start_28 .. :try_end_28} :catchall_2

    .line 312
    :try_start_29
    invoke-virtual {v2}, Ljava/util/zip/ZipFile;->close()V
    :try_end_29
    .catch Ljava/util/zip/ZipException; {:try_start_29 .. :try_end_29} :catch_6
    .catch Ljava/io/IOException; {:try_start_29 .. :try_end_29} :catch_5

    .line 307
    return-object v3

    .line 291
    .end local v21    # "d3d11Hash":Ljava/lang/String;
    .end local v22    # "target":Ljava/io/File;
    .local v1, "out":Ljava/io/OutputStream;
    .restart local v3    # "d3d11Hash":Ljava/lang/String;
    :catchall_0
    move-exception v0

    move-object/from16 v21, v3

    move-object v3, v0

    .end local v3    # "d3d11Hash":Ljava/lang/String;
    .restart local v21    # "d3d11Hash":Ljava/lang/String;
    :try_start_2a
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_2a
    .catchall {:try_start_2a .. :try_end_2a} :catchall_1

    goto :goto_4

    :catchall_1
    move-exception v0

    move-object v6, v0

    :try_start_2b
    invoke-virtual {v3, v6}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v2    # "file":Ljava/util/zip/ZipFile;
    .end local v7    # "dup":Ljava/lang/String;
    .end local v8    # "windowsDll":Z
    .end local v11    # "dir":Ljava/io/File;
    .end local v12    # "zipHash":Ljava/lang/String;
    .end local v13    # "staging":Ljava/io/File;
    .end local v14    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v18    # "dxgi":Ljava/util/zip/ZipEntry;
    .end local v19    # "count":I
    .end local v20    # "d3d11":Ljava/util/zip/ZipEntry;
    .end local p1    # "zip":Ljava/io/File;
    .end local p2    # "sourceName":Ljava/lang/String;
    :goto_4
    throw v3
    :try_end_2b
    .catch Ljava/io/IOException; {:try_start_2b .. :try_end_2b} :catch_1
    .catchall {:try_start_2b .. :try_end_2b} :catchall_2

    .line 308
    .end local v1    # "out":Ljava/io/OutputStream;
    .end local v4    # "version":Ljava/lang/String;
    .end local v5    # "record":Ljava/lang/String;
    .end local v9    # "d3d11Out":Ljava/io/File;
    .end local v10    # "dxgiOut":Ljava/io/File;
    .end local v15    # "id":Ljava/lang/String;
    .end local v17    # "dxgiHash":Ljava/lang/String;
    .end local v21    # "d3d11Hash":Ljava/lang/String;
    .restart local v2    # "file":Ljava/util/zip/ZipFile;
    .restart local v7    # "dup":Ljava/lang/String;
    .restart local v8    # "windowsDll":Z
    .restart local v11    # "dir":Ljava/io/File;
    .restart local v12    # "zipHash":Ljava/lang/String;
    .restart local v13    # "staging":Ljava/io/File;
    .restart local v14    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v18    # "dxgi":Ljava/util/zip/ZipEntry;
    .restart local v19    # "count":I
    .restart local v20    # "d3d11":Ljava/util/zip/ZipEntry;
    .restart local p1    # "zip":Ljava/io/File;
    .restart local p2    # "sourceName":Ljava/lang/String;
    :catch_1
    move-exception v0

    goto :goto_5

    .end local v20    # "d3d11":Ljava/util/zip/ZipEntry;
    .local v1, "d3d11":Ljava/util/zip/ZipEntry;
    :catch_2
    move-exception v0

    move-object/from16 v20, v1

    .end local v1    # "d3d11":Ljava/util/zip/ZipEntry;
    .restart local v20    # "d3d11":Ljava/util/zip/ZipEntry;
    goto :goto_5

    .end local v18    # "dxgi":Ljava/util/zip/ZipEntry;
    .end local v20    # "d3d11":Ljava/util/zip/ZipEntry;
    .local v5, "dxgi":Ljava/util/zip/ZipEntry;
    .restart local v6    # "d3d11":Ljava/util/zip/ZipEntry;
    :catch_3
    move-exception v0

    move-object/from16 v18, v5

    move-object/from16 v20, v6

    .end local v5    # "dxgi":Ljava/util/zip/ZipEntry;
    .end local v6    # "d3d11":Ljava/util/zip/ZipEntry;
    .restart local v18    # "dxgi":Ljava/util/zip/ZipEntry;
    .restart local v20    # "d3d11":Ljava/util/zip/ZipEntry;
    goto :goto_5

    .end local v14    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v18    # "dxgi":Ljava/util/zip/ZipEntry;
    .end local v19    # "count":I
    .end local v20    # "d3d11":Ljava/util/zip/ZipEntry;
    .local v3, "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .local v4, "count":I
    .restart local v5    # "dxgi":Ljava/util/zip/ZipEntry;
    .restart local v6    # "d3d11":Ljava/util/zip/ZipEntry;
    :catch_4
    move-exception v0

    move-object v14, v3

    move/from16 v19, v4

    move-object/from16 v18, v5

    move-object/from16 v20, v6

    .line 309
    .end local v3    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v4    # "count":I
    .end local v5    # "dxgi":Ljava/util/zip/ZipEntry;
    .end local v6    # "d3d11":Ljava/util/zip/ZipEntry;
    .local v0, "e":Ljava/io/IOException;
    .restart local v14    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v18    # "dxgi":Ljava/util/zip/ZipEntry;
    .restart local v19    # "count":I
    .restart local v20    # "d3d11":Ljava/util/zip/ZipEntry;
    :goto_5
    :try_start_2c
    invoke-static {v13}, Lorg/wiiucoop/bo2android/T6DriverPackage;->deleteTree(Ljava/io/File;)V

    .line 310
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "falha ao extrair: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Result;

    move-result-object v1
    :try_end_2c
    .catchall {:try_start_2c .. :try_end_2c} :catchall_2

    .line 312
    :try_start_2d
    invoke-virtual {v2}, Ljava/util/zip/ZipFile;->close()V
    :try_end_2d
    .catch Ljava/util/zip/ZipException; {:try_start_2d .. :try_end_2d} :catch_6
    .catch Ljava/io/IOException; {:try_start_2d .. :try_end_2d} :catch_5

    .line 310
    return-object v1

    .line 256
    .end local v0    # "e":Ljava/io/IOException;
    .end local v11    # "dir":Ljava/io/File;
    .end local v12    # "zipHash":Ljava/lang/String;
    .end local v13    # "staging":Ljava/io/File;
    .end local v14    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v18    # "dxgi":Ljava/util/zip/ZipEntry;
    .end local v19    # "count":I
    .end local v20    # "d3d11":Ljava/util/zip/ZipEntry;
    .restart local v3    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v4    # "count":I
    .restart local v5    # "dxgi":Ljava/util/zip/ZipEntry;
    .restart local v6    # "d3d11":Ljava/util/zip/ZipEntry;
    :cond_1b
    move-object v14, v3

    move/from16 v19, v4

    move-object/from16 v18, v5

    move-object/from16 v20, v6

    .line 257
    .end local v3    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v4    # "count":I
    .end local v5    # "dxgi":Ljava/util/zip/ZipEntry;
    .end local v6    # "d3d11":Ljava/util/zip/ZipEntry;
    .restart local v14    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v18    # "dxgi":Ljava/util/zip/ZipEntry;
    .restart local v19    # "count":I
    .restart local v20    # "d3d11":Ljava/util/zip/ZipEntry;
    :goto_6
    :try_start_2e
    const-string v0, "biblioteca maior que 128 MB"

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Result;

    move-result-object v0
    :try_end_2e
    .catchall {:try_start_2e .. :try_end_2e} :catchall_2

    .line 312
    :try_start_2f
    invoke-virtual {v2}, Ljava/util/zip/ZipFile;->close()V
    :try_end_2f
    .catch Ljava/util/zip/ZipException; {:try_start_2f .. :try_end_2f} :catch_6
    .catch Ljava/io/IOException; {:try_start_2f .. :try_end_2f} :catch_5

    .line 257
    return-object v0

    .line 245
    .end local v7    # "dup":Ljava/lang/String;
    .end local v14    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v18    # "dxgi":Ljava/util/zip/ZipEntry;
    .end local v19    # "count":I
    .end local v20    # "d3d11":Ljava/util/zip/ZipEntry;
    .restart local v3    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v4    # "count":I
    .restart local v5    # "dxgi":Ljava/util/zip/ZipEntry;
    .restart local v6    # "d3d11":Ljava/util/zip/ZipEntry;
    :cond_1c
    move-object v14, v3

    move/from16 v19, v4

    move-object/from16 v18, v5

    move-object/from16 v20, v6

    .line 246
    .end local v3    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v4    # "count":I
    .end local v5    # "dxgi":Ljava/util/zip/ZipEntry;
    .end local v6    # "d3d11":Ljava/util/zip/ZipEntry;
    .restart local v14    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v18    # "dxgi":Ljava/util/zip/ZipEntry;
    .restart local v19    # "count":I
    .restart local v20    # "d3d11":Ljava/util/zip/ZipEntry;
    :goto_7
    if-eqz v8, :cond_1d

    .line 248
    :try_start_30
    const-string v0, "o ZIP traz DLLs do Windows (dxgi.dll/d3d11.dll, para Wine); este jogo carrega s\u00f3 bibliotecas Android ARM64 nativas (libdxvk_dxgi.so + libdxvk_d3d11.so)"

    goto :goto_8

    .line 249
    :cond_1d
    const-string v0, "o ZIP precisa ter libdxvk_dxgi.so e libdxvk_d3d11.so"

    .line 246
    :goto_8
    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Result;

    move-result-object v0
    :try_end_30
    .catchall {:try_start_30 .. :try_end_30} :catchall_2

    .line 312
    :try_start_31
    invoke-virtual {v2}, Ljava/util/zip/ZipFile;->close()V
    :try_end_31
    .catch Ljava/util/zip/ZipException; {:try_start_31 .. :try_end_31} :catch_6
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_31} :catch_5

    .line 246
    return-object v0

    .line 222
    .end local v8    # "windowsDll":Z
    .end local v14    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v18    # "dxgi":Ljava/util/zip/ZipEntry;
    .end local v19    # "count":I
    .end local v20    # "d3d11":Ljava/util/zip/ZipEntry;
    :catchall_2
    move-exception v0

    move-object v1, v0

    :try_start_32
    invoke-virtual {v2}, Ljava/util/zip/ZipFile;->close()V
    :try_end_32
    .catchall {:try_start_32 .. :try_end_32} :catchall_3

    goto :goto_9

    :catchall_3
    move-exception v0

    move-object v3, v0

    :try_start_33
    invoke-virtual {v1, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p1    # "zip":Ljava/io/File;
    .end local p2    # "sourceName":Ljava/lang/String;
    :goto_9
    throw v1
    :try_end_33
    .catch Ljava/util/zip/ZipException; {:try_start_33 .. :try_end_33} :catch_6
    .catch Ljava/io/IOException; {:try_start_33 .. :try_end_33} :catch_5

    .line 314
    .end local v2    # "file":Ljava/util/zip/ZipFile;
    .restart local p1    # "zip":Ljava/io/File;
    .restart local p2    # "sourceName":Ljava/lang/String;
    :catch_5
    move-exception v0

    .line 315
    .restart local v0    # "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "falha ao ler o ZIP: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Result;

    move-result-object v1

    return-object v1

    .line 312
    .end local v0    # "e":Ljava/io/IOException;
    :catch_6
    move-exception v0

    .line 313
    .local v0, "e":Ljava/util/zip/ZipException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ZIP corrompido ou inv\u00e1lido: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/util/zip/ZipException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Result;

    move-result-object v1

    return-object v1
.end method

.method public label(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "id"    # Ljava/lang/String;

    .line 197
    const-string v0, "builtin"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "DXVK 2.6.0"

    return-object v0

    .line 198
    :cond_0
    const-string v0, "dxvk-1.9.2-legacy"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "DXVK 1.9.2"

    return-object v0

    .line 199
    :cond_1
    const-string v0, "dxvk-3.1.1"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "DXVK 3.1.1"

    return-object v0

    .line 200
    :cond_2
    invoke-virtual {p0, p1}, Lorg/wiiucoop/bo2android/T6DxvkStore;->find(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Entry;

    move-result-object v0

    .line 201
    .local v0, "e":Lorg/wiiucoop/bo2android/T6DxvkStore$Entry;
    if-nez v0, :cond_3

    move-object v1, p1

    goto :goto_0

    :cond_3
    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6DxvkStore$Entry;->label()Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1
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

    .line 206
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 207
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lorg/wiiucoop/bo2android/T6DxvkStore;->filesDir:Ljava/io/File;

    const-string v3, "dxvk_status.txt"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-wide/16 v2, 0x2000

    invoke-static {v1, v2, v3}, Lorg/wiiucoop/bo2android/T6DxvkStore;->read(Ljava/io/File;J)Ljava/lang/String;

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

    .line 208
    .local v5, "line":Ljava/lang/String;
    const/16 v6, 0x3d

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    .line 209
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

    .line 207
    .end local v5    # "line":Ljava/lang/String;
    .end local v6    # "eq":I
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 211
    :cond_1
    return-object v0
.end method

.method public list()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/wiiucoop/bo2android/T6DxvkStore$Entry;",
            ">;"
        }
    .end annotation

    .line 169
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 170
    .local v0, "out":Ljava/util/List;, "Ljava/util/List<Lorg/wiiucoop/bo2android/T6DxvkStore$Entry;>;"
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6DxvkStore;->versionsDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 171
    .local v1, "dirs":[Ljava/io/File;
    if-nez v1, :cond_0

    return-object v0

    .line 172
    :cond_0
    invoke-static {v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 173
    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_3

    aget-object v4, v1, v3

    .line 174
    .local v4, "d":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/wiiucoop/bo2android/T6DxvkStore;->isApkSet(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    goto :goto_1

    .line 175
    :cond_1
    invoke-direct {p0, v4}, Lorg/wiiucoop/bo2android/T6DxvkStore;->load(Ljava/io/File;)Lorg/wiiucoop/bo2android/T6DxvkStore$Entry;

    move-result-object v5

    .line 176
    .local v5, "e":Lorg/wiiucoop/bo2android/T6DxvkStore$Entry;
    if-eqz v5, :cond_2

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 173
    .end local v4    # "d":Ljava/io/File;
    .end local v5    # "e":Lorg/wiiucoop/bo2android/T6DxvkStore$Entry;
    :cond_2
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 178
    :cond_3
    return-object v0
.end method

.method public remove(Ljava/lang/String;)Z
    .locals 3
    .param p1, "id"    # Ljava/lang/String;

    .line 189
    invoke-static {p1}, Lorg/wiiucoop/bo2android/T6DxvkStore;->isApkSet(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0, p1}, Lorg/wiiucoop/bo2android/T6DxvkStore;->find(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Entry;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 190
    :cond_0
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6DxvkStore;->filesDir:Ljava/io/File;

    const-string v2, "dxvk_version.cfg"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-wide/16 v1, 0x80

    invoke-static {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6DxvkStore;->read(Ljava/io/File;J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "builtin"

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/T6DxvkStore;->select(Ljava/lang/String;)Z

    .line 191
    :cond_1
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6DxvkStore;->versionsDir()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6DriverPackage;->deleteTree(Ljava/io/File;)V

    .line 192
    const/4 v0, 0x1

    return v0

    .line 189
    :cond_2
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public select(Ljava/lang/String;)Z
    .locals 8
    .param p1, "id"    # Ljava/lang/String;

    .line 150
    const-string v0, "builtin"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lorg/wiiucoop/bo2android/T6DxvkStore;->find(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Entry;

    move-result-object v0

    if-nez v0, :cond_0

    return v1

    .line 151
    :cond_0
    new-instance v0, Ljava/io/File;

    iget-object v2, p0, Lorg/wiiucoop/bo2android/T6DxvkStore;->filesDir:Ljava/io/File;

    const-string v3, "dxvk_version.cfg"

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 152
    .local v0, "cfg":Ljava/io/File;
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lorg/wiiucoop/bo2android/T6DxvkStore;->filesDir:Ljava/io/File;

    const-string v4, "dxvk_version.cfg.tmp"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 153
    .local v2, "tmp":Ljava/io/File;
    :try_start_0
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 154
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

    .line 155
    :try_start_2
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 157
    .end local v3    # "out":Ljava/io/OutputStream;
    nop

    .line 159
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

    .line 161
    return v7

    .line 162
    :catch_0
    move-exception v3

    .line 163
    .local v3, "e":Ljava/io/IOException;
    return v1

    .line 153
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

    .line 155
    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v0    # "cfg":Ljava/io/File;
    .restart local v2    # "tmp":Ljava/io/File;
    .restart local p1    # "id":Ljava/lang/String;
    :catch_1
    move-exception v3

    .line 156
    .local v3, "e":Ljava/io/IOException;
    return v1
.end method

.method public selected()Ljava/lang/String;
    .locals 3

    .line 143
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6DxvkStore;->filesDir:Ljava/io/File;

    const-string v2, "dxvk_version.cfg"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-wide/16 v1, 0x80

    invoke-static {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6DxvkStore;->read(Ljava/io/File;J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 144
    .local v0, "id":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const-string v2, "builtin"

    if-nez v1, :cond_2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 145
    :cond_0
    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/T6DxvkStore;->find(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Entry;

    move-result-object v1

    if-eqz v1, :cond_1

    move-object v2, v0

    :cond_1
    return-object v2

    .line 144
    :cond_2
    :goto_0
    return-object v2
.end method

.method public versionsDir()Ljava/io/File;
    .locals 3

    .line 138
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6DxvkStore;->filesDir:Ljava/io/File;

    const-string v2, "dxvk_versions"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public withApkStamp(J)Lorg/wiiucoop/bo2android/T6DxvkStore;
    .locals 0
    .param p1, "stamp"    # J

    .line 125
    iput-wide p1, p0, Lorg/wiiucoop/bo2android/T6DxvkStore;->apkStamp:J

    .line 126
    return-object p0
.end method
