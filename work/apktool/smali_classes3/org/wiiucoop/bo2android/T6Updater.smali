.class final Lorg/wiiucoop/bo2android/T6Updater;
.super Ljava/lang/Object;
.source "T6Updater.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/wiiucoop/bo2android/T6Updater$Bytes;,
        Lorg/wiiucoop/bo2android/T6Updater$Progress;,
        Lorg/wiiucoop/bo2android/T6Updater$Check;,
        Lorg/wiiucoop/bo2android/T6Updater$Component;,
        Lorg/wiiucoop/bo2android/T6Updater$Result;
    }
.end annotation


# static fields
.field private static final DOWNLOAD_ATTEMPTS:I = 0x8

.field private static final GATEWAY:Ljava/lang/String; = "https://t6requiem-update.soldadoghostzm.workers.dev/v1/public"

.field static final SOURCE_MANIFEST:Ljava/lang/String; = "guest_images.update.properties"

.field private static final STALL_BYTES_PER_SECOND:J = 0x40000L

.field private static final STALL_GRACE_MS:J = 0xbb8L

.field private static final STALL_WINDOW_MS:J = 0xfa0L


# instance fields
.field private final cacheDir:Ljava/io/File;

.field private final filesDir:Ljava/io/File;

.field private final installedApkCode:I


# direct methods
.method constructor <init>(Ljava/io/File;Ljava/io/File;I)V
    .locals 0
    .param p1, "filesDir"    # Ljava/io/File;
    .param p2, "cacheDir"    # Ljava/io/File;
    .param p3, "installedApkCode"    # I

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6Updater;->filesDir:Ljava/io/File;

    .line 80
    iput-object p2, p0, Lorg/wiiucoop/bo2android/T6Updater;->cacheDir:Ljava/io/File;

    .line 81
    iput p3, p0, Lorg/wiiucoop/bo2android/T6Updater;->installedApkCode:I

    .line 82
    return-void
.end method

.method private assetUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "asset"    # Ljava/lang/String;

    .line 243
    const-string v0, "latest"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "https://t6requiem-update.soldadoghostzm.workers.dev/v1/public/version.json"

    return-object v0

    .line 244
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "https://t6requiem-update.soldadoghostzm.workers.dev/v1/public/asset/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p2}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static configured()Z
    .locals 1

    .line 102
    const-string v0, "https://t6requiem-update.soldadoghostzm.workers.dev"

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private static deleteTree(Ljava/io/File;)V
    .locals 4
    .param p0, "f"    # Ljava/io/File;

    .line 465
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 466
    .local v0, "children":[Ljava/io/File;
    if-eqz v0, :cond_0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .local v3, "c":Ljava/io/File;
    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6Updater;->deleteTree(Ljava/io/File;)V

    .end local v3    # "c":Ljava/io/File;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 467
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 468
    return-void
.end method

.method private static download(Ljava/lang/String;Ljava/io/OutputStream;Lorg/wiiucoop/bo2android/T6Updater$Bytes;)[B
    .locals 16
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "sink"    # Ljava/io/OutputStream;
    .param p2, "bytes"    # Lorg/wiiucoop/bo2android/T6Updater$Bytes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 385
    move-object/from16 v1, p2

    const/4 v0, 0x0

    if-nez p1, :cond_0

    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    goto :goto_0

    :cond_0
    move-object v2, v0

    .line 386
    .local v2, "memory":Ljava/io/ByteArrayOutputStream;
    :goto_0
    if-nez p1, :cond_1

    move-object v3, v2

    goto :goto_1

    :cond_1
    move-object/from16 v3, p1

    .line 387
    .local v3, "out":Ljava/io/OutputStream;
    :goto_1
    const/4 v4, 0x0

    move v5, v4

    move-object/from16 v4, p0

    .end local p0    # "url":Ljava/lang/String;
    .local v4, "url":Ljava/lang/String;
    .local v5, "hop":I
    :goto_2
    const/4 v6, 0x5

    if-ge v5, v6, :cond_c

    .line 388
    new-instance v6, Ljava/net/URL;

    invoke-direct {v6, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v6

    check-cast v6, Ljava/net/HttpURLConnection;

    .line 389
    .local v6, "c":Ljava/net/HttpURLConnection;
    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 390
    const/16 v8, 0x3a98

    invoke-virtual {v6, v8}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 391
    const/16 v8, 0x7530

    invoke-virtual {v6, v8}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 394
    const-string v8, "Accept-Encoding"

    const-string v9, "identity"

    invoke-virtual {v6, v8, v9}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 396
    const-string v8, "https://t6requiem-update.soldadoghostzm.workers.dev/v1/public"

    invoke-virtual {v4, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    const-string v9, ""

    if-eqz v8, :cond_2

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_2

    .line 397
    const-string v8, "X-T6-Channel-Key"

    invoke-virtual {v6, v8, v9}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 399
    :cond_2
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v8

    .line 400
    .local v8, "code":I
    const/16 v10, 0x12c

    if-lt v8, v10, :cond_4

    const/16 v10, 0x190

    if-ge v8, v10, :cond_4

    .line 401
    const-string v7, "Location"

    invoke-virtual {v6, v7}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 402
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 403
    if-eqz v4, :cond_3

    .line 387
    .end local v6    # "c":Ljava/net/HttpURLConnection;
    .end local v8    # "code":I
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 403
    .restart local v6    # "c":Ljava/net/HttpURLConnection;
    .restart local v8    # "code":I
    :cond_3
    new-instance v0, Ljava/io/IOException;

    const-string v7, "redirecionamento sem destino"

    invoke-direct {v0, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 406
    :cond_4
    const/16 v10, 0xc8

    if-eq v8, v10, :cond_6

    .line 407
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 408
    new-instance v0, Ljava/io/IOException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "HTTP "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v10, 0x194

    if-ne v8, v10, :cond_5

    const-string v9, " (canal, release ou chave inv\u00e1lida)"

    :cond_5
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v0, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 410
    :cond_6
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getContentLengthLong()J

    move-result-wide v9

    .line 411
    .local v9, "total":J
    :try_start_0
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v11
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 412
    .local v11, "in":Ljava/io/InputStream;
    const/high16 v12, 0x40000

    :try_start_1
    new-array v12, v12, [B

    .line 413
    .local v12, "buf":[B
    const-wide/16 v13, 0x0

    .line 415
    .local v13, "done":J
    :goto_3
    invoke-virtual {v11, v12}, Ljava/io/InputStream;->read([B)I

    move-result v15

    move/from16 p0, v15

    .local p0, "n":I
    if-lez v15, :cond_8

    .line 416
    move/from16 v15, p0

    .end local p0    # "n":I
    .local v15, "n":I
    invoke-virtual {v3, v12, v7, v15}, Ljava/io/OutputStream;->write([BII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 417
    move/from16 p0, v8

    .end local v8    # "code":I
    .local p0, "code":I
    int-to-long v7, v15

    add-long/2addr v13, v7

    .line 418
    if-eqz v1, :cond_7

    :try_start_2
    invoke-interface {v1, v13, v14, v9, v10}, Lorg/wiiucoop/bo2android/T6Updater$Bytes;->on(JJ)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_4

    .line 411
    .end local v12    # "buf":[B
    .end local v13    # "done":J
    .end local v15    # "n":I
    :catchall_0
    move-exception v0

    move-object v7, v0

    goto :goto_6

    .line 415
    .restart local v12    # "buf":[B
    .restart local v13    # "done":J
    :cond_7
    :goto_4
    const/4 v7, 0x0

    move/from16 v8, p0

    goto :goto_3

    .restart local v8    # "code":I
    .local p0, "n":I
    :cond_8
    move/from16 v15, p0

    move/from16 p0, v8

    .line 420
    .end local v8    # "code":I
    .end local v12    # "buf":[B
    .end local v13    # "done":J
    .local p0, "code":I
    if-eqz v11, :cond_9

    :try_start_3
    invoke-virtual {v11}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 421
    .end local v11    # "in":Ljava/io/InputStream;
    :cond_9
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 422
    nop

    .line 423
    if-nez v2, :cond_a

    goto :goto_5

    :cond_a
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    :goto_5
    return-object v0

    .line 411
    .end local p0    # "code":I
    .restart local v8    # "code":I
    .restart local v11    # "in":Ljava/io/InputStream;
    :catchall_1
    move-exception v0

    move/from16 p0, v8

    move-object v7, v0

    .end local v8    # "code":I
    .restart local p0    # "code":I
    :goto_6
    if-eqz v11, :cond_b

    :try_start_4
    invoke-virtual {v11}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_7

    :catchall_2
    move-exception v0

    move-object v8, v0

    :try_start_5
    invoke-virtual {v7, v8}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v2    # "memory":Ljava/io/ByteArrayOutputStream;
    .end local v3    # "out":Ljava/io/OutputStream;
    .end local v4    # "url":Ljava/lang/String;
    .end local v5    # "hop":I
    .end local v6    # "c":Ljava/net/HttpURLConnection;
    .end local v9    # "total":J
    .end local p0    # "code":I
    .end local p1    # "sink":Ljava/io/OutputStream;
    .end local p2    # "bytes":Lorg/wiiucoop/bo2android/T6Updater$Bytes;
    :cond_b
    :goto_7
    throw v7
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 421
    .end local v11    # "in":Ljava/io/InputStream;
    .restart local v2    # "memory":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "out":Ljava/io/OutputStream;
    .restart local v4    # "url":Ljava/lang/String;
    .restart local v5    # "hop":I
    .restart local v6    # "c":Ljava/net/HttpURLConnection;
    .restart local v9    # "total":J
    .restart local p0    # "code":I
    .restart local p1    # "sink":Ljava/io/OutputStream;
    .restart local p2    # "bytes":Lorg/wiiucoop/bo2android/T6Updater$Bytes;
    :catchall_3
    move-exception v0

    goto :goto_8

    .end local p0    # "code":I
    .restart local v8    # "code":I
    :catchall_4
    move-exception v0

    move/from16 p0, v8

    .end local v8    # "code":I
    .restart local p0    # "code":I
    :goto_8
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 422
    throw v0

    .line 425
    .end local v5    # "hop":I
    .end local v6    # "c":Ljava/net/HttpURLConnection;
    .end local v9    # "total":J
    .end local p0    # "code":I
    :cond_c
    new-instance v0, Ljava/io/IOException;

    const-string v5, "redirecionamentos demais"

    invoke-direct {v0, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private downloadTo(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Lorg/wiiucoop/bo2android/T6Updater$Progress;Ljava/lang/String;)V
    .locals 26
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/io/File;
    .param p3, "sha256"    # Ljava/lang/String;
    .param p4, "progress"    # Lorg/wiiucoop/bo2android/T6Updater$Progress;
    .param p5, "what"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 266
    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v9, p5

    const-string v3, "update: "

    const-string v10, "t6android"

    new-instance v0, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    const/4 v6, 0x0

    if-eqz v5, :cond_0

    const-string v5, "x"

    goto :goto_0

    :cond_0
    const/16 v5, 0xc

    invoke-virtual {v2, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    :goto_0
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".partial"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object v8, v0

    .line 267
    .local v8, "partial":Ljava/io/File;
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v7

    .line 268
    .local v7, "dir":Ljava/io/File;
    if-eqz v7, :cond_1

    .line 270
    new-instance v0, Lorg/wiiucoop/bo2android/T6Updater$$ExternalSyntheticLambda0;

    invoke-direct {v0, v1, v8}, Lorg/wiiucoop/bo2android/T6Updater$$ExternalSyntheticLambda0;-><init>(Ljava/io/File;Ljava/io/File;)V

    invoke-virtual {v7, v0}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v0

    .line 272
    .local v0, "old":[Ljava/io/File;
    if-eqz v0, :cond_1

    array-length v4, v0

    move v5, v6

    :goto_1
    if-ge v5, v4, :cond_1

    aget-object v11, v0, v5

    .local v11, "f":Ljava/io/File;
    invoke-virtual {v11}, Ljava/io/File;->delete()Z

    .end local v11    # "f":Ljava/io/File;
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 274
    .end local v0    # "old":[Ljava/io/File;
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v17

    .line 275
    .local v17, "started":J
    const/4 v4, 0x1

    new-array v0, v4, [J

    const-wide/16 v19, 0x0

    aput-wide v19, v0, v6

    move-object v6, v0

    .line 276
    .local v6, "lastReport":[J
    const/4 v0, 0x0

    .line 277
    .local v0, "attempt":I
    const/4 v5, 0x0

    move/from16 v21, v5

    .line 279
    .local v21, "stalls":I
    :goto_2
    add-int/lit8 v5, v0, 0x1

    .line 280
    .end local v0    # "attempt":I
    .local v5, "attempt":I
    invoke-virtual {v8}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {v8}, Ljava/io/File;->length()J

    move-result-wide v11

    move-wide v14, v11

    goto :goto_3

    :cond_2
    move-wide/from16 v14, v19

    .line 282
    .local v14, "have":J
    :goto_3
    const/16 v13, 0x8

    :try_start_0
    new-instance v0, Lorg/wiiucoop/bo2android/T6Updater$$ExternalSyntheticLambda1;

    move-object/from16 v12, p4

    invoke-direct {v0, v12, v6, v9}, Lorg/wiiucoop/bo2android/T6Updater$$ExternalSyntheticLambda1;-><init>(Lorg/wiiucoop/bo2android/T6Updater$Progress;[JLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    move-object/from16 v11, p0

    move-object/from16 v12, p1

    move v4, v13

    move-object v13, v8

    move-object/from16 v16, v0

    :try_start_1
    invoke-direct/range {v11 .. v16}, Lorg/wiiucoop/bo2android/T6Updater;->fetchInto(Ljava/lang/String;Ljava/io/File;JLorg/wiiucoop/bo2android/T6Updater$Bytes;)Lorg/wiiucoop/bo2android/T6Updater$Result;

    move-result-object v0

    .line 289
    .local v0, "r":Lorg/wiiucoop/bo2android/T6Updater$Result;
    sget-object v11, Lorg/wiiucoop/bo2android/T6Updater$Result;->DONE:Lorg/wiiucoop/bo2android/T6Updater$Result;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    const-string v12, ")"

    if-ne v0, v11, :cond_6

    .line 300
    .end local v0    # "r":Lorg/wiiucoop/bo2android/T6Updater$Result;
    .end local v14    # "have":J
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    sub-long v3, v3, v17

    const-wide/16 v13, 0x1

    invoke-static {v13, v14, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v13

    .line 301
    .local v13, "ms":J
    invoke-virtual {v8}, Ljava/io/File;->length()J

    move-result-wide v3

    .line 302
    .local v3, "size":J
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 304
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    move-object/from16 v22, v6

    move-object/from16 v16, v7

    .end local v6    # "lastReport":[J
    .end local v7    # "dir":Ljava/io/File;
    .local v16, "dir":Ljava/io/File;
    .local v22, "lastReport":[J
    long-to-double v6, v13

    const-wide v19, 0x408f400000000000L    # 1000.0

    div-double v6, v6, v19

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    move-object/from16 v23, v8

    .end local v8    # "partial":Ljava/io/File;
    .local v23, "partial":Ljava/io/File;
    long-to-double v7, v3

    const-wide/high16 v24, 0x4130000000000000L    # 1048576.0

    div-double v7, v7, v24

    move-wide/from16 v24, v3

    .end local v3    # "size":J
    .local v24, "size":J
    long-to-double v3, v13

    div-double v3, v3, v19

    div-double/2addr v7, v3

    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v7

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    move-wide/from16 v19, v24

    .end local v24    # "size":J
    .local v19, "size":J
    move-object/from16 v3, p5

    move-object v4, v11

    move v11, v5

    .end local v5    # "attempt":I
    .local v11, "attempt":I
    move-object v5, v6

    move-object v6, v7

    move-object v7, v8

    move-object/from16 v24, v23

    .end local v23    # "partial":Ljava/io/File;
    .local v24, "partial":Ljava/io/File;
    move-object v8, v15

    filled-new-array/range {v3 .. v8}, [Ljava/lang/Object;

    move-result-object v3

    .line 302
    const-string v4, "update: %s baixado: %d bytes em %.1f s (%.2f MB/s, %d conex\u00e3o(\u00f5es), %d lenta(s) retomada(s))"

    invoke-static {v0, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v10, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 305
    invoke-static/range {v24 .. v24}, Lorg/wiiucoop/bo2android/T6Updater;->sha256(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    .line 306
    .local v0, "got":Ljava/lang/String;
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_4

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    goto :goto_4

    .line 307
    :cond_3
    invoke-virtual/range {v24 .. v24}, Ljava/io/File;->delete()Z

    .line 308
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": sha256 n\u00e3o confere ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 310
    :cond_4
    :goto_4
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->delete()Z

    .line 311
    move-object/from16 v5, v24

    .end local v24    # "partial":Ljava/io/File;
    .local v5, "partial":Ljava/io/File;
    invoke-virtual {v5, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 312
    return-void

    .line 311
    :cond_5
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "n\u00e3o foi poss\u00edvel mover "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 290
    .end local v11    # "attempt":I
    .end local v13    # "ms":J
    .end local v16    # "dir":Ljava/io/File;
    .end local v19    # "size":J
    .end local v22    # "lastReport":[J
    .local v0, "r":Lorg/wiiucoop/bo2android/T6Updater$Result;
    .local v5, "attempt":I
    .restart local v6    # "lastReport":[J
    .restart local v7    # "dir":Ljava/io/File;
    .restart local v8    # "partial":Ljava/io/File;
    .restart local v14    # "have":J
    :cond_6
    move v11, v5

    move-object/from16 v22, v6

    move-object/from16 v16, v7

    move-object v5, v8

    .end local v6    # "lastReport":[J
    .end local v7    # "dir":Ljava/io/File;
    .end local v8    # "partial":Ljava/io/File;
    .local v5, "partial":Ljava/io/File;
    .restart local v11    # "attempt":I
    .restart local v16    # "dir":Ljava/io/File;
    .restart local v22    # "lastReport":[J
    add-int/lit8 v21, v21, 0x1

    .line 291
    :try_start_2
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ": conex\u00e3o lenta, retomando em "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 292
    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v7

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " bytes (tentativa "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    add-int/lit8 v7, v11, 0x1

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 291
    invoke-static {v10, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 297
    nop

    .end local v0    # "r":Lorg/wiiucoop/bo2android/T6Updater$Result;
    goto :goto_7

    .line 293
    :catch_0
    move-exception v0

    goto :goto_5

    .end local v11    # "attempt":I
    .end local v16    # "dir":Ljava/io/File;
    .end local v22    # "lastReport":[J
    .local v5, "attempt":I
    .restart local v6    # "lastReport":[J
    .restart local v7    # "dir":Ljava/io/File;
    .restart local v8    # "partial":Ljava/io/File;
    :catch_1
    move-exception v0

    move v11, v5

    move-object/from16 v22, v6

    move-object/from16 v16, v7

    move-object v5, v8

    goto :goto_5

    :catch_2
    move-exception v0

    move v11, v5

    move-object/from16 v22, v6

    move-object/from16 v16, v7

    move-object v5, v8

    move v4, v13

    .line 294
    .end local v6    # "lastReport":[J
    .end local v7    # "dir":Ljava/io/File;
    .end local v8    # "partial":Ljava/io/File;
    .local v0, "e":Ljava/io/IOException;
    .local v5, "partial":Ljava/io/File;
    .restart local v11    # "attempt":I
    .restart local v16    # "dir":Ljava/io/File;
    .restart local v22    # "lastReport":[J
    :goto_5
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ": "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "; retomando em "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 295
    invoke-virtual {v5}, Ljava/io/File;->isFile()Z

    move-result v7

    if-eqz v7, :cond_7

    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v7

    goto :goto_6

    :cond_7
    move-wide/from16 v7, v19

    :goto_6
    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " bytes"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 294
    invoke-static {v10, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    if-ge v11, v4, :cond_9

    .line 298
    .end local v0    # "e":Ljava/io/IOException;
    :goto_7
    if-ge v11, v4, :cond_8

    .line 299
    .end local v14    # "have":J
    move-object v8, v5

    move v0, v11

    move-object/from16 v7, v16

    move-object/from16 v6, v22

    const/4 v4, 0x1

    goto/16 :goto_2

    .line 298
    .restart local v14    # "have":J
    :cond_8
    new-instance v0, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": download n\u00e3o conclu\u00eddo"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 296
    .restart local v0    # "e":Ljava/io/IOException;
    :cond_9
    throw v0
.end method

.method private fetchInto(Ljava/lang/String;Ljava/io/File;JLorg/wiiucoop/bo2android/T6Updater$Bytes;)Lorg/wiiucoop/bo2android/T6Updater$Result;
    .locals 28
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "partial"    # Ljava/io/File;
    .param p3, "have"    # J
    .param p5, "bytes"    # Lorg/wiiucoop/bo2android/T6Updater$Bytes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 318
    move-object/from16 v1, p1

    move-wide/from16 v2, p3

    move-object/from16 v4, p5

    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Ljava/net/HttpURLConnection;

    .line 319
    .local v5, "c":Ljava/net/HttpURLConnection;
    const/16 v0, 0x3a98

    invoke-virtual {v5, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 320
    const/16 v0, 0x4e20

    invoke-virtual {v5, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 321
    const-string v0, "Accept-Encoding"

    const-string v6, "identity"

    invoke-virtual {v5, v0, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 322
    const-string v0, "https://t6requiem-update.soldadoghostzm.workers.dev/v1/public"

    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const-string v6, ""

    if-eqz v0, :cond_0

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 323
    const-string v0, "X-T6-Channel-Key"

    invoke-virtual {v5, v0, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 325
    :cond_0
    const-wide/16 v7, 0x0

    cmp-long v0, v2, v7

    const-string v9, "-"

    if-lez v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "bytes="

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v10, "Range"

    invoke-virtual {v5, v10, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 327
    :cond_1
    :try_start_0
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    move v10, v0

    .line 330
    .local v10, "code":I
    cmp-long v0, v2, v7

    const/4 v11, 0x1

    if-lez v0, :cond_3

    const/16 v0, 0xce

    if-ne v10, v0, :cond_3

    .line 331
    const/4 v0, 0x1

    .line 332
    .local v0, "append":Z
    const-string v6, "Content-Range"

    invoke-virtual {v5, v6}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 333
    .local v6, "range":Ljava/lang/String;
    if-eqz v6, :cond_2

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "bytes "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 336
    const/16 v9, 0x2f

    invoke-virtual {v6, v9}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v9

    add-int/2addr v9, v11

    invoke-virtual {v6, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v12

    .line 337
    .end local v6    # "range":Ljava/lang/String;
    .local v12, "total":J
    move v6, v0

    goto :goto_0

    .line 334
    .end local v12    # "total":J
    .restart local v6    # "range":Ljava/lang/String;
    :cond_2
    new-instance v7, Ljava/io/IOException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Content-Range inesperado: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v5    # "c":Ljava/net/HttpURLConnection;
    .end local p1    # "url":Ljava/lang/String;
    .end local p2    # "partial":Ljava/io/File;
    .end local p3    # "have":J
    .end local p5    # "bytes":Lorg/wiiucoop/bo2android/T6Updater$Bytes;
    throw v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_a

    .line 337
    .end local v0    # "append":Z
    .end local v6    # "range":Ljava/lang/String;
    .restart local v5    # "c":Ljava/net/HttpURLConnection;
    .restart local p1    # "url":Ljava/lang/String;
    .restart local p2    # "partial":Ljava/io/File;
    .restart local p3    # "have":J
    .restart local p5    # "bytes":Lorg/wiiucoop/bo2android/T6Updater$Bytes;
    :cond_3
    const/16 v0, 0xc8

    if-ne v10, v0, :cond_e

    .line 338
    const/4 v0, 0x0

    .line 339
    .restart local v0    # "append":Z
    const-wide/16 v2, 0x0

    .line 340
    .end local p3    # "have":J
    .local v2, "have":J
    :try_start_1
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getContentLengthLong()J

    move-result-wide v12

    move v6, v0

    .line 347
    .end local v0    # "append":Z
    .local v6, "append":Z
    .restart local v12    # "total":J
    :goto_0
    move-wide v14, v2

    .line 348
    .local v14, "done":J
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v16

    .line 349
    .local v16, "windowStart":J
    move-wide/from16 v18, v16

    .line 350
    .local v18, "connStart":J
    const-wide/16 v20, 0x0

    .line 351
    .local v20, "windowBytes":J
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_8

    move-object v9, v0

    .line 352
    .local v9, "in":Ljava/io/InputStream;
    :try_start_2
    new-instance v0, Ljava/io/BufferedOutputStream;

    new-instance v11, Ljava/io/FileOutputStream;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_5

    move-object/from16 v7, p2

    :try_start_3
    invoke-direct {v11, v7, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    const/high16 v8, 0x40000

    invoke-direct {v0, v11, v8}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    move-object v11, v0

    .line 353
    .local v11, "out":Ljava/io/OutputStream;
    :try_start_4
    new-array v0, v8, [B

    .line 355
    .local v0, "buf":[B
    :goto_1
    invoke-virtual {v9, v0}, Ljava/io/InputStream;->read([B)I

    move-result v8

    move/from16 p3, v8

    .local p3, "n":I
    if-lez v8, :cond_9

    .line 356
    const/4 v8, 0x0

    move/from16 v1, p3

    .end local p3    # "n":I
    .local v1, "n":I
    invoke-virtual {v11, v0, v8, v1}, Ljava/io/OutputStream;->write([BII)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 357
    move-object/from16 p3, v9

    .end local v9    # "in":Ljava/io/InputStream;
    .local p3, "in":Ljava/io/InputStream;
    int-to-long v8, v1

    add-long/2addr v14, v8

    .line 358
    int-to-long v8, v1

    add-long v20, v20, v8

    .line 359
    if-eqz v4, :cond_4

    :try_start_5
    invoke-interface {v4, v14, v15, v12, v13}, Lorg/wiiucoop/bo2android/T6Updater$Bytes;->on(JJ)V

    .line 360
    :cond_4
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    .line 361
    .local v8, "now":J
    sub-long v23, v8, v16

    const-wide/16 v25, 0xfa0

    cmp-long v23, v23, v25

    if-ltz v23, :cond_8

    .line 362
    const-wide/16 v23, 0x3e8

    mul-long v23, v23, v20

    sub-long v25, v8, v16

    div-long v23, v23, v25

    const-wide/32 v25, 0x40000

    cmp-long v23, v23, v25

    if-gez v23, :cond_5

    const/16 v23, 0x1

    goto :goto_2

    :cond_5
    const/16 v23, 0x0

    .line 363
    .local v23, "slow":Z
    :goto_2
    if-eqz v23, :cond_7

    sub-long v24, v8, v18

    const-wide/16 v26, 0xbb8

    cmp-long v24, v24, v26

    if-ltz v24, :cond_7

    sub-long v24, v12, v14

    const-wide/32 v26, 0x100000

    cmp-long v24, v24, v26

    if-lez v24, :cond_7

    .line 364
    sget-object v22, Lorg/wiiucoop/bo2android/T6Updater$Result;->STALLED:Lorg/wiiucoop/bo2android/T6Updater$Result;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 370
    :try_start_6
    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    if-eqz p3, :cond_6

    :try_start_7
    invoke-virtual/range {p3 .. p3}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_7

    .line 374
    :cond_6
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 364
    return-object v22

    .line 366
    :cond_7
    move-wide/from16 v16, v8

    .line 367
    const-wide/16 v20, 0x0

    .line 369
    .end local v8    # "now":J
    .end local v23    # "slow":Z
    :cond_8
    move-object/from16 v1, p1

    move-object/from16 v9, p3

    goto :goto_1

    .line 351
    .end local v0    # "buf":[B
    .end local v1    # "n":I
    :catchall_0
    move-exception v0

    move-object v1, v0

    goto :goto_4

    .line 355
    .restart local v0    # "buf":[B
    .restart local v9    # "in":Ljava/io/InputStream;
    .local p3, "n":I
    :cond_9
    move/from16 v1, p3

    move-object/from16 p3, v9

    .line 370
    .end local v0    # "buf":[B
    .end local v9    # "in":Ljava/io/InputStream;
    .local p3, "in":Ljava/io/InputStream;
    :try_start_8
    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .end local v11    # "out":Ljava/io/OutputStream;
    if-eqz p3, :cond_a

    :try_start_9
    invoke-virtual/range {p3 .. p3}, Ljava/io/InputStream;->close()V

    .line 371
    .end local p3    # "in":Ljava/io/InputStream;
    :cond_a
    const-wide/16 v0, 0x0

    cmp-long v0, v12, v0

    if-lez v0, :cond_c

    cmp-long v0, v14, v12

    if-nez v0, :cond_b

    goto :goto_3

    :cond_b
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "conex\u00e3o encerrada em "

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v8, " de "

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v2    # "have":J
    .end local v5    # "c":Ljava/net/HttpURLConnection;
    .end local p1    # "url":Ljava/lang/String;
    .end local p2    # "partial":Ljava/io/File;
    .end local p5    # "bytes":Lorg/wiiucoop/bo2android/T6Updater$Bytes;
    throw v0

    .line 372
    .restart local v2    # "have":J
    .restart local v5    # "c":Ljava/net/HttpURLConnection;
    .restart local p1    # "url":Ljava/lang/String;
    .restart local p2    # "partial":Ljava/io/File;
    .restart local p5    # "bytes":Lorg/wiiucoop/bo2android/T6Updater$Bytes;
    :cond_c
    :goto_3
    sget-object v0, Lorg/wiiucoop/bo2android/T6Updater$Result;->DONE:Lorg/wiiucoop/bo2android/T6Updater$Result;
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_7

    .line 374
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 372
    return-object v0

    .line 351
    .restart local p3    # "in":Ljava/io/InputStream;
    :catchall_1
    move-exception v0

    move-object v1, v0

    goto :goto_7

    .end local p3    # "in":Ljava/io/InputStream;
    .restart local v9    # "in":Ljava/io/InputStream;
    .restart local v11    # "out":Ljava/io/OutputStream;
    :catchall_2
    move-exception v0

    move-object/from16 p3, v9

    move-object v1, v0

    .end local v9    # "in":Ljava/io/InputStream;
    .restart local p3    # "in":Ljava/io/InputStream;
    :goto_4
    :try_start_a
    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    goto :goto_5

    :catchall_3
    move-exception v0

    move-object v8, v0

    :try_start_b
    invoke-virtual {v1, v8}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v2    # "have":J
    .end local v5    # "c":Ljava/net/HttpURLConnection;
    .end local v6    # "append":Z
    .end local v10    # "code":I
    .end local v12    # "total":J
    .end local v14    # "done":J
    .end local v16    # "windowStart":J
    .end local v18    # "connStart":J
    .end local v20    # "windowBytes":J
    .end local p1    # "url":Ljava/lang/String;
    .end local p2    # "partial":Ljava/io/File;
    .end local p3    # "in":Ljava/io/InputStream;
    .end local p5    # "bytes":Lorg/wiiucoop/bo2android/T6Updater$Bytes;
    :goto_5
    throw v1
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .end local v11    # "out":Ljava/io/OutputStream;
    .restart local v2    # "have":J
    .restart local v5    # "c":Ljava/net/HttpURLConnection;
    .restart local v6    # "append":Z
    .restart local v9    # "in":Ljava/io/InputStream;
    .restart local v10    # "code":I
    .restart local v12    # "total":J
    .restart local v14    # "done":J
    .restart local v16    # "windowStart":J
    .restart local v18    # "connStart":J
    .restart local v20    # "windowBytes":J
    .restart local p1    # "url":Ljava/lang/String;
    .restart local p2    # "partial":Ljava/io/File;
    .restart local p5    # "bytes":Lorg/wiiucoop/bo2android/T6Updater$Bytes;
    :catchall_4
    move-exception v0

    goto :goto_6

    :catchall_5
    move-exception v0

    move-object/from16 v7, p2

    :goto_6
    move-object/from16 p3, v9

    move-object v1, v0

    .end local v9    # "in":Ljava/io/InputStream;
    .restart local p3    # "in":Ljava/io/InputStream;
    :goto_7
    if-eqz p3, :cond_d

    :try_start_c
    invoke-virtual/range {p3 .. p3}, Ljava/io/InputStream;->close()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_6

    goto :goto_8

    :catchall_6
    move-exception v0

    move-object v8, v0

    :try_start_d
    invoke-virtual {v1, v8}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v2    # "have":J
    .end local v5    # "c":Ljava/net/HttpURLConnection;
    .end local p1    # "url":Ljava/lang/String;
    .end local p2    # "partial":Ljava/io/File;
    .end local p5    # "bytes":Lorg/wiiucoop/bo2android/T6Updater$Bytes;
    :cond_d
    :goto_8
    throw v1
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_7

    .line 374
    .end local v6    # "append":Z
    .end local v10    # "code":I
    .end local v12    # "total":J
    .end local v14    # "done":J
    .end local v16    # "windowStart":J
    .end local v18    # "connStart":J
    .end local v20    # "windowBytes":J
    .end local p3    # "in":Ljava/io/InputStream;
    .restart local v2    # "have":J
    .restart local v5    # "c":Ljava/net/HttpURLConnection;
    .restart local p1    # "url":Ljava/lang/String;
    .restart local p2    # "partial":Ljava/io/File;
    .restart local p5    # "bytes":Lorg/wiiucoop/bo2android/T6Updater$Bytes;
    :catchall_7
    move-exception v0

    goto :goto_9

    :catchall_8
    move-exception v0

    move-object/from16 v7, p2

    goto :goto_9

    .line 341
    .end local v2    # "have":J
    .restart local v10    # "code":I
    .local p3, "have":J
    :cond_e
    move-object/from16 v7, p2

    const/16 v0, 0x1a0

    if-eq v10, v0, :cond_10

    .line 345
    :try_start_e
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "HTTP "

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v8, 0x194

    if-ne v10, v8, :cond_f

    const-string v6, " (canal, release ou chave inv\u00e1lida)"

    :cond_f
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v5    # "c":Ljava/net/HttpURLConnection;
    .end local p1    # "url":Ljava/lang/String;
    .end local p2    # "partial":Ljava/io/File;
    .end local p3    # "have":J
    .end local p5    # "bytes":Lorg/wiiucoop/bo2android/T6Updater$Bytes;
    throw v0

    .line 374
    .end local v10    # "code":I
    .restart local v5    # "c":Ljava/net/HttpURLConnection;
    .restart local p1    # "url":Ljava/lang/String;
    .restart local p2    # "partial":Ljava/io/File;
    .restart local p3    # "have":J
    .restart local p5    # "bytes":Lorg/wiiucoop/bo2android/T6Updater$Bytes;
    :catchall_9
    move-exception v0

    goto :goto_9

    .line 342
    .restart local v10    # "code":I
    :cond_10
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->delete()Z

    .line 343
    new-instance v0, Ljava/io/IOException;

    const-string v1, "intervalo inv\u00e1lido; recome\u00e7ando"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v5    # "c":Ljava/net/HttpURLConnection;
    .end local p1    # "url":Ljava/lang/String;
    .end local p2    # "partial":Ljava/io/File;
    .end local p3    # "have":J
    .end local p5    # "bytes":Lorg/wiiucoop/bo2android/T6Updater$Bytes;
    throw v0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_9

    .line 374
    .end local v10    # "code":I
    .restart local v5    # "c":Ljava/net/HttpURLConnection;
    .restart local p1    # "url":Ljava/lang/String;
    .restart local p2    # "partial":Ljava/io/File;
    .restart local p3    # "have":J
    .restart local p5    # "bytes":Lorg/wiiucoop/bo2android/T6Updater$Bytes;
    :catchall_a
    move-exception v0

    move-object/from16 v7, p2

    .end local p3    # "have":J
    .restart local v2    # "have":J
    :goto_9
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 375
    throw v0
.end method

.method private static json(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 4
    .param p0, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 432
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 433
    :catch_0
    move-exception v0

    .line 434
    .local v0, "e":Lorg/json/JSONException;
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "JSON inv\u00e1lido: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method static synthetic lambda$downloadTo$0(Ljava/io/File;Ljava/io/File;Ljava/io/File;Ljava/lang/String;)Z
    .locals 2
    .param p0, "file"    # Ljava/io/File;
    .param p1, "partial"    # Ljava/io/File;
    .param p2, "d"    # Ljava/io/File;
    .param p3, "n"    # Ljava/lang/String;

    .line 270
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ".partial"

    invoke-virtual {p3, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 271
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 270
    :goto_0
    return v0
.end method

.method static synthetic lambda$downloadTo$1(Lorg/wiiucoop/bo2android/T6Updater$Progress;[JLjava/lang/String;JJ)V
    .locals 8
    .param p0, "progress"    # Lorg/wiiucoop/bo2android/T6Updater$Progress;
    .param p1, "lastReport"    # [J
    .param p2, "what"    # Ljava/lang/String;
    .param p3, "done"    # J
    .param p5, "total"    # J

    .line 283
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 284
    .local v0, "now":J
    if-eqz p0, :cond_1

    const/4 v2, 0x0

    aget-wide v3, p1, v2

    sub-long v3, v0, v3

    const-wide/16 v5, 0xfa

    cmp-long v3, v3, v5

    if-gez v3, :cond_0

    cmp-long v3, p3, p5

    if-nez v3, :cond_1

    .line 285
    :cond_0
    aput-wide v0, p1, v2

    .line 286
    move-object v2, p0

    move-object v3, p2

    move-wide v4, p3

    move-wide v6, p5

    invoke-interface/range {v2 .. v7}, Lorg/wiiucoop/bo2android/T6Updater$Progress;->onProgress(Ljava/lang/String;JJ)V

    .line 288
    :cond_1
    return-void
.end method

.method private static parseInt(Ljava/lang/String;)I
    .locals 2
    .param p0, "s"    # Ljava/lang/String;

    .line 439
    const/4 v0, 0x0

    if-nez p0, :cond_0

    :goto_0
    goto :goto_1

    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :goto_1
    return v0

    :catch_0
    move-exception v1

    .local v1, "e":Ljava/lang/NumberFormatException;
    return v0
.end method

.method private static readAll(Ljava/io/InputStream;)[B
    .locals 4
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 457
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 458
    .local v0, "out":Ljava/io/ByteArrayOutputStream;
    const/16 v1, 0x2000

    new-array v1, v1, [B

    .line 460
    .local v1, "buf":[B
    :goto_0
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    move v3, v2

    .local v3, "n":I
    if-lez v2, :cond_0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 461
    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    return-object v2
.end method

.method private static sha256(Ljava/io/File;)Ljava/lang/String;
    .locals 11
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 443
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 444
    .local v0, "in":Ljava/io/InputStream;
    :try_start_1
    const-string v1, "SHA-256"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    .line 445
    .local v1, "d":Ljava/security/MessageDigest;
    const/high16 v2, 0x10000

    new-array v2, v2, [B

    .line 447
    .local v2, "buf":[B
    :goto_0
    invoke-virtual {v0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    move v4, v3

    .local v4, "n":I
    const/4 v5, 0x0

    if-lez v3, :cond_0

    invoke-virtual {v1, v2, v5, v4}, Ljava/security/MessageDigest;->update([BII)V

    goto :goto_0

    .line 448
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 449
    .local v3, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v6

    array-length v7, v6

    :goto_1
    if-ge v5, v7, :cond_1

    aget-byte v8, v6, v5

    .local v8, "b":B
    const-string v9, "%02x"

    invoke-static {v8}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v10

    filled-new-array {v10}, [Ljava/lang/Object;

    move-result-object v10

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .end local v8    # "b":B
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 450
    :cond_1
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 451
    :try_start_2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2 .. :try_end_2} :catch_0

    .line 450
    return-object v5

    .line 443
    .end local v1    # "d":Ljava/security/MessageDigest;
    .end local v2    # "buf":[B
    .end local v3    # "sb":Ljava/lang/StringBuilder;
    .end local v4    # "n":I
    :catchall_0
    move-exception v1

    :try_start_3
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v2

    :try_start_4
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p0    # "file":Ljava/io/File;
    :goto_2
    throw v1
    :try_end_4
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_4 .. :try_end_4} :catch_0

    .line 451
    .end local v0    # "in":Ljava/io/InputStream;
    .restart local p0    # "file":Ljava/io/File;
    :catch_0
    move-exception v0

    .line 452
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method static sourceManifest(Ljava/io/File;)Ljava/util/Properties;
    .locals 6
    .param p0, "filesDir"    # Ljava/io/File;

    .line 155
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/io/File;

    const-string v2, "guest"

    invoke-direct {v1, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-string v2, "guest_images.update.properties"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 156
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return-object v2

    .line 157
    :cond_0
    new-instance v1, Ljava/util/Properties;

    invoke-direct {v1}, Ljava/util/Properties;-><init>()V

    .line 158
    .local v1, "p":Ljava/util/Properties;
    :try_start_0
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 159
    .local v3, "in":Ljava/io/InputStream;
    :try_start_1
    invoke-virtual {v1, v3}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 160
    nop

    .line 161
    :try_start_2
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 160
    return-object v1

    .line 158
    :catchall_0
    move-exception v4

    :try_start_3
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v5

    :try_start_4
    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "f":Ljava/io/File;
    .end local v1    # "p":Ljava/util/Properties;
    .end local p0    # "filesDir":Ljava/io/File;
    :goto_0
    throw v4
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 161
    .end local v3    # "in":Ljava/io/InputStream;
    .restart local v0    # "f":Ljava/io/File;
    .restart local v1    # "p":Ljava/util/Properties;
    .restart local p0    # "filesDir":Ljava/io/File;
    :catch_0
    move-exception v3

    .line 162
    .local v3, "e":Ljava/io/IOException;
    return-object v2
.end method


# virtual methods
.method check()Lorg/wiiucoop/bo2android/T6Updater$Check;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 108
    const-string v0, "source"

    const-string v1, "apk"

    new-instance v2, Ljava/lang/String;

    const-string v3, "latest"

    const-string v4, "version.json"

    invoke-direct {p0, v3, v4}, Lorg/wiiucoop/bo2android/T6Updater;->assetUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v3, v4, v4}, Lorg/wiiucoop/bo2android/T6Updater;->download(Ljava/lang/String;Ljava/io/OutputStream;Lorg/wiiucoop/bo2android/T6Updater$Bytes;)[B

    move-result-object v3

    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v2, v3, v4}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-static {v2}, Lorg/wiiucoop/bo2android/T6Updater;->json(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 110
    .local v2, "manifest":Lorg/json/JSONObject;
    new-instance v3, Lorg/wiiucoop/bo2android/T6Updater$Check;

    invoke-direct {v3}, Lorg/wiiucoop/bo2android/T6Updater$Check;-><init>()V

    .line 112
    .local v3, "result":Lorg/wiiucoop/bo2android/T6Updater$Check;
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6Updater;->installedSourceVersion()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lorg/wiiucoop/bo2android/T6Updater$Check;->sourceCurrent:Ljava/lang/String;

    .line 114
    :try_start_0
    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 115
    new-instance v4, Lorg/wiiucoop/bo2android/T6Updater$Component;

    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-direct {v4, v1}, Lorg/wiiucoop/bo2android/T6Updater$Component;-><init>(Lorg/json/JSONObject;)V

    move-object v1, v4

    .line 116
    .local v1, "apk":Lorg/wiiucoop/bo2android/T6Updater$Component;
    iget v4, v1, Lorg/wiiucoop/bo2android/T6Updater$Component;->code:I

    iget v5, p0, Lorg/wiiucoop/bo2android/T6Updater;->installedApkCode:I

    if-le v4, v5, :cond_0

    iput-object v1, v3, Lorg/wiiucoop/bo2android/T6Updater$Check;->apk:Lorg/wiiucoop/bo2android/T6Updater$Component;

    .line 118
    .end local v1    # "apk":Lorg/wiiucoop/bo2android/T6Updater$Component;
    :cond_0
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 119
    new-instance v1, Lorg/wiiucoop/bo2android/T6Updater$Component;

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-direct {v1, v0}, Lorg/wiiucoop/bo2android/T6Updater$Component;-><init>(Lorg/json/JSONObject;)V

    move-object v0, v1

    .line 122
    .local v0, "source":Lorg/wiiucoop/bo2android/T6Updater$Component;
    iget v1, v0, Lorg/wiiucoop/bo2android/T6Updater$Component;->minApkCode:I

    iget v4, p0, Lorg/wiiucoop/bo2android/T6Updater;->installedApkCode:I

    if-gt v1, v4, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 123
    .local v1, "apkReady":Z
    :goto_0
    iget v4, v0, Lorg/wiiucoop/bo2android/T6Updater$Component;->code:I

    iget v5, v0, Lorg/wiiucoop/bo2android/T6Updater$Component;->minApkCode:I

    iget v6, p0, Lorg/wiiucoop/bo2android/T6Updater;->installedApkCode:I

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6Updater;->installedSourceCode()I

    move-result v7

    invoke-static {v4, v5, v6, v7}, Lorg/wiiucoop/bo2android/T6SourceState;->offerRemote(IIII)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 124
    iput-object v0, v3, Lorg/wiiucoop/bo2android/T6Updater$Check;->source:Lorg/wiiucoop/bo2android/T6Updater$Component;

    .line 126
    :cond_2
    if-nez v1, :cond_4

    iget-object v4, v3, Lorg/wiiucoop/bo2android/T6Updater$Check;->apk:Lorg/wiiucoop/bo2android/T6Updater$Component;

    if-eqz v4, :cond_3

    goto :goto_1

    .line 127
    :cond_3
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "a source "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v0, Lorg/wiiucoop/bo2android/T6Updater$Component;->version:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " exige um launcher mais novo"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v2    # "manifest":Lorg/json/JSONObject;
    .end local v3    # "result":Lorg/wiiucoop/bo2android/T6Updater$Check;
    throw v4
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 132
    .end local v0    # "source":Lorg/wiiucoop/bo2android/T6Updater$Component;
    .end local v1    # "apkReady":Z
    .restart local v2    # "manifest":Lorg/json/JSONObject;
    .restart local v3    # "result":Lorg/wiiucoop/bo2android/T6Updater$Check;
    :cond_4
    :goto_1
    nop

    .line 133
    return-object v3

    .line 130
    :catch_0
    move-exception v0

    .line 131
    .local v0, "e":Lorg/json/JSONException;
    new-instance v1, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "version.json inv\u00e1lido: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method downloadApk(Lorg/wiiucoop/bo2android/T6Updater$Component;Lorg/wiiucoop/bo2android/T6Updater$Progress;)Ljava/io/File;
    .locals 9
    .param p1, "apk"    # Lorg/wiiucoop/bo2android/T6Updater$Component;
    .param p2, "progress"    # Lorg/wiiucoop/bo2android/T6Updater$Progress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 232
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6Updater;->cacheDir:Ljava/io/File;

    const-string v2, "updates"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 233
    .local v0, "dir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "n\u00e3o foi poss\u00edvel criar "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 234
    :cond_1
    :goto_0
    new-instance v1, Ljava/io/File;

    const-string v2, "launcher.apk"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 235
    .local v1, "file":Ljava/io/File;
    iget-object v2, p1, Lorg/wiiucoop/bo2android/T6Updater$Component;->tag:Ljava/lang/String;

    iget-object v3, p1, Lorg/wiiucoop/bo2android/T6Updater$Component;->asset:Ljava/lang/String;

    invoke-direct {p0, v2, v3}, Lorg/wiiucoop/bo2android/T6Updater;->assetUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v6, p1, Lorg/wiiucoop/bo2android/T6Updater$Component;->sha256:Ljava/lang/String;

    const-string v8, "launcher"

    move-object v3, p0

    move-object v5, v1

    move-object v7, p2

    invoke-direct/range {v3 .. v8}, Lorg/wiiucoop/bo2android/T6Updater;->downloadTo(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Lorg/wiiucoop/bo2android/T6Updater$Progress;Ljava/lang/String;)V

    .line 236
    return-object v1
.end method

.method downloadKennel(Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;Lorg/wiiucoop/bo2android/T6Updater$Progress;)Ljava/io/File;
    .locals 9
    .param p1, "m"    # Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    .param p2, "progress"    # Lorg/wiiucoop/bo2android/T6Updater$Progress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 91
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6Updater;->cacheDir:Ljava/io/File;

    iget-object v2, p1, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;->asset:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 92
    .local v0, "zip":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v1

    iget-wide v3, p1, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;->size:J

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    iget-object v1, p1, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;->sha256:Ljava/lang/String;

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6Updater;->sha256(Ljava/io/File;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    .line 93
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "https://t6requiem-update.soldadoghostzm.workers.dev/v1/public/kennel/asset/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;->asset:Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v6, p1, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;->sha256:Ljava/lang/String;

    iget-object v8, p1, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;->asset:Ljava/lang/String;

    move-object v3, p0

    move-object v5, v0

    move-object v7, p2

    invoke-direct/range {v3 .. v8}, Lorg/wiiucoop/bo2android/T6Updater;->downloadTo(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Lorg/wiiucoop/bo2android/T6Updater$Progress;Ljava/lang/String;)V

    .line 94
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v1

    iget-wide v3, p1, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;->size:J

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    .line 98
    return-object v0

    .line 95
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 96
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p1, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;->asset:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": tamanho n\u00e3o confere"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method installSource(Lorg/wiiucoop/bo2android/T6Updater$Component;Lorg/wiiucoop/bo2android/T6Updater$Progress;)V
    .locals 16
    .param p1, "source"    # Lorg/wiiucoop/bo2android/T6Updater$Component;
    .param p2, "progress"    # Lorg/wiiucoop/bo2android/T6Updater$Progress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 170
    move-object/from16 v7, p0

    move-object/from16 v8, p1

    new-instance v0, Ljava/io/File;

    iget-object v1, v7, Lorg/wiiucoop/bo2android/T6Updater;->cacheDir:Ljava/io/File;

    const-string v2, "update-source.zip"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v9, v0

    .line 171
    .local v9, "zip":Ljava/io/File;
    iget-object v0, v8, Lorg/wiiucoop/bo2android/T6Updater$Component;->tag:Ljava/lang/String;

    iget-object v1, v8, Lorg/wiiucoop/bo2android/T6Updater$Component;->asset:Ljava/lang/String;

    invoke-direct {v7, v0, v1}, Lorg/wiiucoop/bo2android/T6Updater;->assetUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v4, v8, Lorg/wiiucoop/bo2android/T6Updater$Component;->sha256:Ljava/lang/String;

    const-string v6, "source"

    move-object/from16 v1, p0

    move-object v3, v9

    move-object/from16 v5, p2

    invoke-direct/range {v1 .. v6}, Lorg/wiiucoop/bo2android/T6Updater;->downloadTo(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Lorg/wiiucoop/bo2android/T6Updater$Progress;Ljava/lang/String;)V

    .line 173
    new-instance v0, Ljava/io/File;

    iget-object v1, v7, Lorg/wiiucoop/bo2android/T6Updater;->filesDir:Ljava/io/File;

    const-string v2, "guest"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v1, v0

    .line 174
    .local v1, "dir":Ljava/io/File;
    new-instance v0, Ljava/io/File;

    iget-object v2, v7, Lorg/wiiucoop/bo2android/T6Updater;->filesDir:Ljava/io/File;

    const-string v3, "guest.update"

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v2, v0

    .line 175
    .local v2, "staging":Ljava/io/File;
    invoke-static {v2}, Lorg/wiiucoop/bo2android/T6Updater;->deleteTree(Ljava/io/File;)V

    .line 176
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v0

    const-string v3, "n\u00e3o foi poss\u00edvel criar "

    if-eqz v0, :cond_d

    .line 178
    :try_start_0
    new-instance v0, Ljava/util/zip/ZipInputStream;

    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, v9}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v4}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_8

    move-object v4, v0

    .line 180
    .local v4, "in":Ljava/util/zip/ZipInputStream;
    const/high16 v0, 0x10000

    :try_start_1
    new-array v0, v0, [B

    move-object v5, v0

    .line 181
    .local v5, "buf":[B
    :goto_0
    invoke-virtual {v4}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v0

    move-object v6, v0

    .local v6, "e":Ljava/util/zip/ZipEntry;
    const/4 v10, 0x0

    if-eqz v0, :cond_2

    .line 182
    invoke-virtual {v6}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 183
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-virtual {v6}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v0, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    move-object v11, v0

    .line 184
    .local v11, "name":Ljava/lang/String;
    new-instance v0, Ljava/io/FileOutputStream;

    new-instance v12, Ljava/io/File;

    invoke-direct {v12, v2, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v0, v12}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_6

    move-object v12, v0

    .line 186
    .local v12, "out":Ljava/io/OutputStream;
    :goto_1
    :try_start_2
    invoke-virtual {v4, v5}, Ljava/util/zip/ZipInputStream;->read([B)I

    move-result v0

    move v13, v0

    .local v13, "n":I
    if-lez v0, :cond_1

    invoke-virtual {v12, v5, v10, v13}, Ljava/io/OutputStream;->write([BII)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 187
    .end local v13    # "n":I
    :cond_1
    :try_start_3
    invoke-virtual {v12}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_6

    .line 188
    .end local v11    # "name":Ljava/lang/String;
    .end local v12    # "out":Ljava/io/OutputStream;
    goto :goto_0

    .line 184
    .restart local v11    # "name":Ljava/lang/String;
    .restart local v12    # "out":Ljava/io/OutputStream;
    :catchall_0
    move-exception v0

    move-object v3, v0

    :try_start_4
    invoke-virtual {v12}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v0

    move-object v10, v0

    :try_start_5
    invoke-virtual {v3, v10}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v1    # "dir":Ljava/io/File;
    .end local v2    # "staging":Ljava/io/File;
    .end local v4    # "in":Ljava/util/zip/ZipInputStream;
    .end local v9    # "zip":Ljava/io/File;
    .end local p1    # "source":Lorg/wiiucoop/bo2android/T6Updater$Component;
    .end local p2    # "progress":Lorg/wiiucoop/bo2android/T6Updater$Progress;
    :goto_2
    throw v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_6

    .line 189
    .end local v5    # "buf":[B
    .end local v6    # "e":Ljava/util/zip/ZipEntry;
    .end local v11    # "name":Ljava/lang/String;
    .end local v12    # "out":Ljava/io/OutputStream;
    .restart local v1    # "dir":Ljava/io/File;
    .restart local v2    # "staging":Ljava/io/File;
    .restart local v4    # "in":Ljava/util/zip/ZipInputStream;
    .restart local v9    # "zip":Ljava/io/File;
    .restart local p1    # "source":Lorg/wiiucoop/bo2android/T6Updater$Component;
    .restart local p2    # "progress":Lorg/wiiucoop/bo2android/T6Updater$Progress;
    :cond_2
    :try_start_6
    invoke-virtual {v4}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_8

    .line 190
    .end local v4    # "in":Ljava/util/zip/ZipInputStream;
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 191
    nop

    .line 194
    new-instance v0, Ljava/io/File;

    const-string v4, "guest_images.properties"

    invoke-direct {v0, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v5, v0

    .line 195
    .local v5, "images":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 197
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object v6, v0

    .line 198
    .local v6, "in":Ljava/io/InputStream;
    :try_start_7
    new-instance v0, Ljava/lang/String;

    invoke-static {v6}, Lorg/wiiucoop/bo2android/T6Updater;->readAll(Ljava/io/InputStream;)[B

    move-result-object v11

    sget-object v12, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, v11, v12}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6GuestImage;->parseManifest(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    move-object v11, v0

    .line 199
    .local v11, "entries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6GuestImage$Entry;>;"
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    .line 200
    .end local v6    # "in":Ljava/io/InputStream;
    invoke-interface {v11}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 201
    .local v6, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6GuestImage$Entry;>;"
    new-instance v12, Ljava/io/File;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-direct {v12, v2, v13}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/wiiucoop/bo2android/T6GuestImage$Entry;

    invoke-static {v12, v13}, Lorg/wiiucoop/bo2android/T6GuestImage;->matches(Ljava/io/File;Lorg/wiiucoop/bo2android/T6GuestImage$Entry;)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 204
    .end local v6    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6GuestImage$Entry;>;"
    goto :goto_3

    .line 202
    .restart local v6    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6GuestImage$Entry;>;"
    :cond_3
    new-instance v0, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " n\u00e3o confere com o manifesto do pacote"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 206
    .end local v6    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6GuestImage$Entry;>;"
    :cond_4
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_5

    goto :goto_4

    :cond_5
    new-instance v0, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 209
    :cond_6
    :goto_4
    new-instance v0, Ljava/io/File;

    const-string v3, "guest_images.update.properties"

    invoke-direct {v0, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v6, v0

    .line 210
    .local v6, "oldManifest":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    move-result v0

    if-eqz v0, :cond_7

    goto :goto_5

    :cond_7
    new-instance v0, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "n\u00e3o foi poss\u00edvel remover "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 211
    :cond_8
    :goto_5
    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    array-length v12, v0

    :goto_6
    if-ge v10, v12, :cond_b

    aget-object v13, v0, v10

    .line 212
    .local v13, "f":Ljava/io/File;
    new-instance v14, Ljava/io/File;

    invoke-virtual {v13}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v15, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_9

    .line 213
    const-string v15, "guest_images.update.list"

    goto :goto_7

    :cond_9
    invoke-virtual {v13}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v15

    :goto_7
    invoke-direct {v14, v1, v15}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 214
    .local v14, "target":Ljava/io/File;
    invoke-virtual {v13, v14}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v15

    if-eqz v15, :cond_a

    .line 211
    .end local v13    # "f":Ljava/io/File;
    .end local v14    # "target":Ljava/io/File;
    add-int/lit8 v10, v10, 0x1

    goto :goto_6

    .line 214
    .restart local v13    # "f":Ljava/io/File;
    .restart local v14    # "target":Ljava/io/File;
    :cond_a
    new-instance v0, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "n\u00e3o foi poss\u00edvel mover "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v13}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 216
    .end local v13    # "f":Ljava/io/File;
    .end local v14    # "target":Ljava/io/File;
    :cond_b
    invoke-static {v2}, Lorg/wiiucoop/bo2android/T6Updater;->deleteTree(Ljava/io/File;)V

    .line 219
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    move-object v4, v0

    .line 220
    .local v4, "p":Ljava/util/Properties;
    const-string v0, "sourceVersion"

    iget-object v10, v8, Lorg/wiiucoop/bo2android/T6Updater$Component;->version:Ljava/lang/String;

    invoke-virtual {v4, v0, v10}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 221
    iget v0, v8, Lorg/wiiucoop/bo2android/T6Updater$Component;->code:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    const-string v10, "sourceCode"

    invoke-virtual {v4, v10, v0}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 222
    iget v0, v7, Lorg/wiiucoop/bo2android/T6Updater;->installedApkCode:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    const-string v10, "apkCode"

    invoke-virtual {v4, v10, v0}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 223
    new-instance v0, Ljava/io/FileOutputStream;

    new-instance v10, Ljava/io/File;

    invoke-direct {v10, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v0, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    move-object v3, v0

    .line 224
    .local v3, "out":Ljava/io/OutputStream;
    :try_start_8
    const-string v0, "T6Requiem source update"

    invoke-virtual {v4, v3, v0}, Ljava/util/Properties;->store(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 225
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 226
    .end local v3    # "out":Ljava/io/OutputStream;
    return-void

    .line 223
    .restart local v3    # "out":Ljava/io/OutputStream;
    :catchall_2
    move-exception v0

    move-object v10, v0

    :try_start_9
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    goto :goto_8

    :catchall_3
    move-exception v0

    move-object v12, v0

    invoke-virtual {v10, v12}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_8
    throw v10

    .line 197
    .end local v3    # "out":Ljava/io/OutputStream;
    .end local v4    # "p":Ljava/util/Properties;
    .end local v11    # "entries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6GuestImage$Entry;>;"
    .local v6, "in":Ljava/io/InputStream;
    :catchall_4
    move-exception v0

    move-object v3, v0

    :try_start_a
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    goto :goto_9

    :catchall_5
    move-exception v0

    move-object v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_9
    throw v3

    .line 195
    .end local v6    # "in":Ljava/io/InputStream;
    :cond_c
    new-instance v0, Ljava/io/IOException;

    const-string v3, "o pacote n\u00e3o cont\u00e9m guest_images.properties"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 178
    .end local v5    # "images":Ljava/io/File;
    .local v4, "in":Ljava/util/zip/ZipInputStream;
    :catchall_6
    move-exception v0

    move-object v3, v0

    :try_start_b
    invoke-virtual {v4}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_7

    goto :goto_a

    :catchall_7
    move-exception v0

    move-object v5, v0

    :try_start_c
    invoke-virtual {v3, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v1    # "dir":Ljava/io/File;
    .end local v2    # "staging":Ljava/io/File;
    .end local v9    # "zip":Ljava/io/File;
    .end local p1    # "source":Lorg/wiiucoop/bo2android/T6Updater$Component;
    .end local p2    # "progress":Lorg/wiiucoop/bo2android/T6Updater$Progress;
    :goto_a
    throw v3
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_8

    .line 190
    .end local v4    # "in":Ljava/util/zip/ZipInputStream;
    .restart local v1    # "dir":Ljava/io/File;
    .restart local v2    # "staging":Ljava/io/File;
    .restart local v9    # "zip":Ljava/io/File;
    .restart local p1    # "source":Lorg/wiiucoop/bo2android/T6Updater$Component;
    .restart local p2    # "progress":Lorg/wiiucoop/bo2android/T6Updater$Progress;
    :catchall_8
    move-exception v0

    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 191
    throw v0

    .line 176
    :cond_d
    new-instance v0, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method installedSourceCode()I
    .locals 4

    .line 142
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6Updater;->filesDir:Ljava/io/File;

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6Updater;->sourceManifest(Ljava/io/File;)Ljava/util/Properties;

    move-result-object v0

    .line 143
    .local v0, "p":Ljava/util/Properties;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    const-string v2, "sourceCode"

    invoke-virtual {v0, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/wiiucoop/bo2android/T6Updater;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 144
    .local v2, "updateCode":I
    :goto_0
    if-lez v2, :cond_1

    iget-object v3, p0, Lorg/wiiucoop/bo2android/T6Updater;->filesDir:Ljava/io/File;

    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6GuestImage;->updateVerifies(Ljava/io/File;)Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v1, 0x1

    .line 145
    .local v1, "verifies":Z
    :cond_1
    const/16 v3, 0x8

    invoke-static {v2, v1, v3}, Lorg/wiiucoop/bo2android/T6SourceState;->installedCode(IZI)I

    move-result v3

    return v3
.end method

.method installedSourceVersion()Ljava/lang/String;
    .locals 4

    .line 149
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6Updater;->filesDir:Ljava/io/File;

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6Updater;->sourceManifest(Ljava/io/File;)Ljava/util/Properties;

    move-result-object v0

    .line 150
    .local v0, "p":Ljava/util/Properties;
    const-string v1, ""

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6Updater;->installedSourceCode()I

    move-result v2

    const-string v3, "sourceCode"

    invoke-virtual {v0, v3}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6Updater;->parseInt(Ljava/lang/String;)I

    move-result v3

    if-eq v2, v3, :cond_0

    goto :goto_0

    .line 151
    :cond_0
    const-string v2, "sourceVersion"

    invoke-virtual {v0, v2, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 150
    :cond_1
    :goto_0
    return-object v1
.end method

.method kennelManifestText()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 86
    new-instance v0, Ljava/lang/String;

    const-string v1, "https://t6requiem-update.soldadoghostzm.workers.dev/v1/public/kennel/kennel.json"

    const/4 v2, 0x0

    invoke-static {v1, v2, v2}, Lorg/wiiucoop/bo2android/T6Updater;->download(Ljava/lang/String;Ljava/io/OutputStream;Lorg/wiiucoop/bo2android/T6Updater$Bytes;)[B

    move-result-object v1

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v0
.end method
