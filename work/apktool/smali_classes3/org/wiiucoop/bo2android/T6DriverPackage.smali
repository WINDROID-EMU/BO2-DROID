.class public final Lorg/wiiucoop/bo2android/T6DriverPackage;
.super Ljava/lang/Object;
.source "T6DriverPackage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/wiiucoop/bo2android/T6DriverPackage$Result;,
        Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;,
        Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    }
.end annotation


# static fields
.field public static final MAX_ENTRIES:I = 0x40

.field public static final MAX_LIBRARY_BYTES:J = 0x8000000L

.field public static final MAX_META_BYTES:J = 0x4000L

.field public static final MAX_TOTAL_BYTES:J = 0x10000000L

.field public static final MAX_ZIP_BYTES:J = 0x4000000L


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    return-void
.end method

.method static copyHashed(Ljava/io/InputStream;Ljava/io/File;J)Ljava/lang/String;
    .locals 10
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "out"    # Ljava/io/File;
    .param p2, "limit"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 277
    invoke-static {}, Lorg/wiiucoop/bo2android/T6DriverPackage;->digest()Ljava/security/MessageDigest;

    move-result-object v0

    .line 278
    .local v0, "md":Ljava/security/MessageDigest;
    const-wide/16 v1, 0x0

    .line 279
    .local v1, "total":J
    move-object v3, p0

    .local v3, "src":Ljava/io/InputStream;
    :try_start_0
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 280
    .local v4, "dst":Ljava/io/OutputStream;
    const/high16 v5, 0x10000

    :try_start_1
    new-array v5, v5, [B

    .line 281
    .local v5, "buf":[B
    :goto_0
    invoke-virtual {v3, v5}, Ljava/io/InputStream;->read([B)I

    move-result v6

    move v7, v6

    .local v7, "n":I
    if-lez v6, :cond_1

    .line 282
    int-to-long v8, v7

    add-long/2addr v1, v8

    .line 283
    cmp-long v6, v1, p2

    if-gtz v6, :cond_0

    .line 284
    const/4 v6, 0x0

    invoke-virtual {v0, v5, v6, v7}, Ljava/security/MessageDigest;->update([BII)V

    .line 285
    invoke-virtual {v4, v5, v6, v7}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    .line 283
    :cond_0
    new-instance v6, Ljava/io/IOException;

    const-string v8, "entrada maior que o limite"

    invoke-direct {v6, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v0    # "md":Ljava/security/MessageDigest;
    .end local v1    # "total":J
    .end local v3    # "src":Ljava/io/InputStream;
    .end local v4    # "dst":Ljava/io/OutputStream;
    .end local p0    # "in":Ljava/io/InputStream;
    .end local p1    # "out":Ljava/io/File;
    .end local p2    # "limit":J
    throw v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 287
    .end local v5    # "buf":[B
    .end local v7    # "n":I
    .restart local v0    # "md":Ljava/security/MessageDigest;
    .restart local v1    # "total":J
    .restart local v3    # "src":Ljava/io/InputStream;
    .restart local v4    # "dst":Ljava/io/OutputStream;
    .restart local p0    # "in":Ljava/io/InputStream;
    .restart local p1    # "out":Ljava/io/File;
    .restart local p2    # "limit":J
    :cond_1
    :try_start_2
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .end local v4    # "dst":Ljava/io/OutputStream;
    if-eqz v3, :cond_2

    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 288
    .end local v3    # "src":Ljava/io/InputStream;
    :cond_2
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v3

    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6DriverPackage;->hex([B)Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 279
    .restart local v3    # "src":Ljava/io/InputStream;
    .restart local v4    # "dst":Ljava/io/OutputStream;
    :catchall_0
    move-exception v5

    :try_start_3
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v6

    :try_start_4
    invoke-virtual {v5, v6}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "md":Ljava/security/MessageDigest;
    .end local v1    # "total":J
    .end local v3    # "src":Ljava/io/InputStream;
    .end local p0    # "in":Ljava/io/InputStream;
    .end local p1    # "out":Ljava/io/File;
    .end local p2    # "limit":J
    :goto_1
    throw v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .end local v4    # "dst":Ljava/io/OutputStream;
    .restart local v0    # "md":Ljava/security/MessageDigest;
    .restart local v1    # "total":J
    .restart local v3    # "src":Ljava/io/InputStream;
    .restart local p0    # "in":Ljava/io/InputStream;
    .restart local p1    # "out":Ljava/io/File;
    .restart local p2    # "limit":J
    :catchall_2
    move-exception v4

    if-eqz v3, :cond_3

    :try_start_5
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    goto :goto_2

    :catchall_3
    move-exception v5

    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_3
    :goto_2
    throw v4
.end method

.method static deleteTree(Ljava/io/File;)V
    .locals 4
    .param p0, "f"    # Ljava/io/File;

    .line 331
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 332
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 333
    .local v0, "children":[Ljava/io/File;
    if-eqz v0, :cond_1

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .local v3, "c":Ljava/io/File;
    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6DriverPackage;->deleteTree(Ljava/io/File;)V

    .end local v3    # "c":Ljava/io/File;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 335
    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 336
    return-void

    .line 331
    .end local v0    # "children":[Ljava/io/File;
    :cond_2
    :goto_1
    return-void
.end method

.method private static digest()Ljava/security/MessageDigest;
    .locals 2

    .line 314
    :try_start_0
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 315
    :catch_0
    move-exception v0

    .line 316
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method static driverId(Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "meta"    # Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    .param p1, "zipSha256"    # Ljava/lang/String;

    .line 269
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->libraryName:Ljava/lang/String;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->name:Ljava/lang/String;

    :goto_0
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 270
    const-string v1, "[^a-z0-9._-]+"

    const-string v2, "-"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "^[-.]+|[-.]+$"

    const-string v3, ""

    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 271
    .local v0, "base":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v3, 0x0

    const/16 v4, 0x28

    if-le v1, v4, :cond_1

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 272
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v0, "driver"

    .line 273
    :cond_2
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

.method static duplicateLocalEntry(Ljava/io/File;)Ljava/lang/String;
    .locals 6
    .param p0, "zip"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 217
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 218
    .local v0, "seen":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v1, Ljava/util/zip/ZipInputStream;

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    .line 219
    .local v1, "in":Ljava/util/zip/ZipInputStream;
    const/4 v2, 0x0

    .line 220
    .local v2, "n":I
    :cond_0
    :try_start_0
    invoke-virtual {v1}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v4, v3

    .local v4, "e":Ljava/util/zip/ZipEntry;
    const/4 v5, 0x0

    if-eqz v3, :cond_2

    .line 221
    add-int/lit8 v2, v2, 0x1

    const/16 v3, 0x40

    if-le v2, v3, :cond_1

    .line 224
    invoke-virtual {v1}, Ljava/util/zip/ZipInputStream;->close()V

    .line 221
    return-object v5

    .line 222
    :cond_1
    :try_start_1
    invoke-virtual {v4}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v4}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 224
    invoke-virtual {v1}, Ljava/util/zip/ZipInputStream;->close()V

    .line 222
    return-object v3

    .line 224
    .end local v2    # "n":I
    .end local v4    # "e":Ljava/util/zip/ZipEntry;
    :cond_2
    invoke-virtual {v1}, Ljava/util/zip/ZipInputStream;->close()V

    .line 225
    .end local v1    # "in":Ljava/util/zip/ZipInputStream;
    return-object v5

    .line 218
    .restart local v1    # "in":Ljava/util/zip/ZipInputStream;
    :catchall_0
    move-exception v2

    :try_start_2
    invoke-virtual {v1}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v3

    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw v2
.end method

.method static elfProblem(Ljava/io/File;)Ljava/lang/String;
    .locals 6
    .param p0, "lib"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 230
    const/16 v0, 0x14

    new-array v0, v0, [B

    .line 231
    .local v0, "h":[B
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 232
    .local v1, "in":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    array-length v3, v0

    if-eq v2, v3, :cond_0

    const-string v2, "arquivo curto demais"
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 233
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 232
    return-object v2

    .line 233
    :cond_0
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 234
    .end local v1    # "in":Ljava/io/InputStream;
    const/4 v1, 0x0

    aget-byte v1, v0, v1

    const/16 v2, 0x7f

    if-ne v1, v2, :cond_6

    const/4 v1, 0x1

    aget-byte v2, v0, v1

    const/16 v3, 0x45

    if-ne v2, v3, :cond_6

    const/4 v2, 0x2

    aget-byte v3, v0, v2

    const/16 v4, 0x4c

    if-ne v3, v4, :cond_6

    const/4 v3, 0x3

    aget-byte v4, v0, v3

    const/16 v5, 0x46

    if-eq v4, v5, :cond_1

    goto :goto_0

    .line 235
    :cond_1
    const/4 v4, 0x4

    aget-byte v4, v0, v4

    if-eq v4, v2, :cond_2

    const-string v1, "n\u00e3o \u00e9 ELF64"

    return-object v1

    .line 236
    :cond_2
    const/4 v2, 0x5

    aget-byte v2, v0, v2

    if-eq v2, v1, :cond_3

    const-string v1, "n\u00e3o \u00e9 little-endian"

    return-object v1

    .line 237
    :cond_3
    const/16 v1, 0x10

    aget-byte v1, v0, v1

    and-int/lit16 v1, v1, 0xff

    const/16 v2, 0x11

    aget-byte v2, v0, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v1, v2

    .line 238
    .local v1, "type":I
    const/16 v2, 0x12

    aget-byte v2, v0, v2

    and-int/lit16 v2, v2, 0xff

    const/16 v4, 0x13

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x8

    or-int/2addr v2, v4

    .line 239
    .local v2, "machine":I
    if-eq v1, v3, :cond_4

    const-string v3, "n\u00e3o \u00e9 biblioteca compartilhada (ET_DYN)"

    return-object v3

    .line 240
    :cond_4
    const/16 v3, 0xb7

    if-eq v2, v3, :cond_5

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ABI incompat\u00edvel (e_machine "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", esperado AArch64 = 183)"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 241
    :cond_5
    const/4 v3, 0x0

    return-object v3

    .line 234
    .end local v1    # "type":I
    .end local v2    # "machine":I
    :cond_6
    :goto_0
    const-string v1, "n\u00e3o \u00e9 ELF"

    return-object v1

    .line 231
    .local v1, "in":Ljava/io/InputStream;
    :catchall_0
    move-exception v2

    :try_start_1
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v3

    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw v2
.end method

.method private static hex([B)Ljava/lang/String;
    .locals 6
    .param p0, "b"    # [B

    .line 321
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 322
    .local v0, "s":Ljava/lang/StringBuilder;
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-byte v3, p0, v2

    .local v3, "x":B
    and-int/lit16 v4, v3, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const-string v5, "%02x"

    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .end local v3    # "x":B
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 323
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static importZip(Ljava/io/File;Ljava/io/File;I)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;
    .locals 1
    .param p0, "zip"    # Ljava/io/File;
    .param p1, "driversDir"    # Ljava/io/File;
    .param p2, "deviceApi"    # I

    .line 105
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lorg/wiiucoop/bo2android/T6DriverPackage;->importZip(Ljava/io/File;Ljava/io/File;ILjava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v0

    return-object v0
.end method

.method public static importZip(Ljava/io/File;Ljava/io/File;ILjava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;
    .locals 29
    .param p0, "zip"    # Ljava/io/File;
    .param p1, "driversDir"    # Ljava/io/File;
    .param p2, "deviceApi"    # I
    .param p3, "sourceName"    # Ljava/lang/String;

    .line 110
    move-object/from16 v1, p1

    move/from16 v2, p2

    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->CANNOT_READ:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    const-string v3, "arquivo n\u00e3o encontrado"

    invoke-static {v0, v3}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->fail(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v0

    return-object v0

    .line 111
    :cond_0
    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->length()J

    move-result-wide v3

    const-wide/32 v5, 0x4000000

    cmp-long v0, v3, v5

    if-lez v0, :cond_1

    sget-object v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->TOO_LARGE:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    const-string v3, "ZIP maior que 64 MB"

    invoke-static {v0, v3}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->fail(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v0

    return-object v0

    .line 115
    :cond_1
    :try_start_0
    new-instance v0, Ljava/util/zip/ZipFile;

    move-object/from16 v3, p0

    invoke-direct {v0, v3}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/util/zip/ZipException; {:try_start_0 .. :try_end_0} :catch_7
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_6

    move-object v4, v0

    .line 117
    .local v4, "file":Ljava/util/zip/ZipFile;
    :try_start_1
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    move-object v5, v0

    .line 118
    .local v5, "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 119
    .local v0, "count":I
    const-wide/16 v6, 0x0

    .line 120
    .local v6, "total":J
    const/4 v8, 0x0

    .line 121
    .local v8, "metaEntry":Ljava/util/zip/ZipEntry;
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v9

    move-object v10, v8

    move-wide v7, v6

    move v6, v0

    .end local v0    # "count":I
    .end local v8    # "metaEntry":Ljava/util/zip/ZipEntry;
    .local v6, "count":I
    .local v7, "total":J
    .local v9, "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .local v10, "metaEntry":Ljava/util/zip/ZipEntry;
    :goto_0
    invoke-interface {v9}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    const-string v11, "meta.json"

    const-string v12, "\'"

    const-string v13, "entrada duplicada \'"

    if-eqz v0, :cond_8

    .line 122
    :try_start_2
    invoke-interface {v9}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/zip/ZipEntry;

    .line 123
    .local v0, "entry":Ljava/util/zip/ZipEntry;
    add-int/lit8 v6, v6, 0x1

    const/16 v14, 0x40

    if-le v6, v14, :cond_2

    sget-object v11, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->BAD_ENTRIES:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    const-string v12, "mais de 64 entradas no ZIP"

    invoke-static {v11, v12}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->fail(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v11
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    .line 191
    :try_start_3
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V
    :try_end_3
    .catch Ljava/util/zip/ZipException; {:try_start_3 .. :try_end_3} :catch_7
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_6

    .line 123
    return-object v11

    .line 124
    :cond_2
    :try_start_4
    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v14

    .line 125
    .local v14, "name":Ljava/lang/String;
    invoke-static {v14}, Lorg/wiiucoop/bo2android/T6DriverPackage;->unsafeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 126
    .local v15, "why":Ljava/lang/String;
    if-eqz v15, :cond_3

    sget-object v11, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->BAD_ENTRIES:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "entrada recusada \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "\': "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->fail(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v11
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 191
    :try_start_5
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V
    :try_end_5
    .catch Ljava/util/zip/ZipException; {:try_start_5 .. :try_end_5} :catch_7
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_6

    .line 126
    return-object v11

    .line 127
    :cond_3
    :try_start_6
    invoke-interface {v5, v14}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_4

    sget-object v11, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->BAD_ENTRIES:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v11, v3}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->fail(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 191
    :try_start_7
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V
    :try_end_7
    .catch Ljava/util/zip/ZipException; {:try_start_7 .. :try_end_7} :catch_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_6

    .line 127
    return-object v3

    .line 128
    :cond_4
    :try_start_8
    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v12

    const-wide/16 v16, 0x0

    cmp-long v3, v12, v16

    if-lez v3, :cond_5

    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v12

    add-long/2addr v7, v12

    .line 129
    :cond_5
    const-wide/32 v12, 0x10000000

    cmp-long v3, v7, v12

    if-lez v3, :cond_6

    sget-object v3, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->TOO_LARGE:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    const-string v11, "conte\u00fado descompactado maior que 256 MB"

    invoke-static {v3, v11}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->fail(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v3
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 191
    :try_start_9
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V
    :try_end_9
    .catch Ljava/util/zip/ZipException; {:try_start_9 .. :try_end_9} :catch_7
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_6

    .line 129
    return-object v3

    .line 130
    :cond_6
    :try_start_a
    invoke-virtual {v14, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    move-object v3, v0

    move-object v10, v3

    .line 131
    .end local v0    # "entry":Ljava/util/zip/ZipEntry;
    .end local v14    # "name":Ljava/lang/String;
    .end local v15    # "why":Ljava/lang/String;
    :cond_7
    move-object/from16 v3, p0

    goto/16 :goto_0

    .line 132
    .end local v9    # "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    :cond_8
    if-nez v10, :cond_9

    sget-object v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->NOT_A_DRIVER:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    const-string v3, "meta.json ausente na raiz (n\u00e3o \u00e9 um pacote AdrenoTools)"

    invoke-static {v0, v3}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->fail(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    .line 191
    :try_start_b
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V
    :try_end_b
    .catch Ljava/util/zip/ZipException; {:try_start_b .. :try_end_b} :catch_7
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_6

    .line 132
    return-object v0

    .line 134
    :cond_9
    :try_start_c
    invoke-static/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6DriverPackage;->duplicateLocalEntry(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    move-object v3, v0

    .line 135
    .local v3, "dup":Ljava/lang/String;
    if-eqz v3, :cond_a

    sget-object v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->BAD_ENTRIES:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v0, v9}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->fail(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    .line 191
    :try_start_d
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V
    :try_end_d
    .catch Ljava/util/zip/ZipException; {:try_start_d .. :try_end_d} :catch_7
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_6

    .line 135
    return-object v0

    .line 138
    :cond_a
    :try_start_e
    invoke-virtual {v10}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v12

    const-wide/16 v14, 0x4000

    cmp-long v0, v12, v14

    if-lez v0, :cond_b

    sget-object v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->NOT_A_DRIVER:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    const-string v9, "meta.json grande demais"

    invoke-static {v0, v9}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->fail(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_4

    .line 191
    :try_start_f
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V
    :try_end_f
    .catch Ljava/util/zip/ZipException; {:try_start_f .. :try_end_f} :catch_7
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_6

    .line 138
    return-object v0

    .line 139
    :cond_b
    :try_start_10
    new-instance v0, Ljava/lang/String;

    invoke-virtual {v4, v10}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v9

    invoke-static {v9, v14, v15}, Lorg/wiiucoop/bo2android/T6DriverPackage;->readAll(Ljava/io/InputStream;J)[B

    move-result-object v9

    sget-object v12, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, v9, v12}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    move-object v9, v0

    .line 140
    .local v9, "metaText":Ljava/lang/String;
    invoke-static {v9}, Lorg/wiiucoop/bo2android/T6DriverPackage;->parseMeta(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;

    move-result-object v0

    move-object v15, v0

    .line 141
    .local v15, "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    iget v0, v15, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->schemaVersion:I

    const/4 v12, 0x1

    if-eq v0, v12, :cond_c

    sget-object v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->NOT_A_DRIVER:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "schemaVersion "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget v12, v15, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->schemaVersion:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " n\u00e3o suportado (esperado 1)"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v0, v11}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->fail(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v0
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_4

    .line 191
    :try_start_11
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V
    :try_end_11
    .catch Ljava/util/zip/ZipException; {:try_start_11 .. :try_end_11} :catch_7
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_6

    .line 141
    return-object v0

    .line 142
    :cond_c
    :try_start_12
    iget-object v0, v15, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->libraryName:Ljava/lang/String;

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6DriverPackage;->safeLibraryName(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_d

    sget-object v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->NOT_A_DRIVER:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    const-string v11, "libraryName ausente ou inv\u00e1lido em meta.json"

    invoke-static {v0, v11}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->fail(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v0
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_4

    .line 191
    :try_start_13
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V
    :try_end_13
    .catch Ljava/util/zip/ZipException; {:try_start_13 .. :try_end_13} :catch_7
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_13} :catch_6

    .line 142
    return-object v0

    .line 143
    :cond_d
    :try_start_14
    iget v0, v15, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->minApi:I

    if-le v0, v2, :cond_e

    sget-object v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->NEEDS_NEWER_ANDROID:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "o pacote exige Android API "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget v12, v15, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->minApi:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " (aparelho: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ")"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v0, v11}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->fail(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v0
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_4

    .line 191
    :try_start_15
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V
    :try_end_15
    .catch Ljava/util/zip/ZipException; {:try_start_15 .. :try_end_15} :catch_7
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_15} :catch_6

    .line 143
    return-object v0

    .line 144
    :cond_e
    :try_start_16
    iget-object v0, v15, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->libraryName:Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v0

    move-object v14, v0

    .line 145
    .local v14, "lib":Ljava/util/zip/ZipEntry;
    if-eqz v14, :cond_18

    invoke-virtual {v14}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_f

    move-object/from16 v20, v3

    move-object/from16 v21, v5

    move/from16 v22, v6

    move-wide/from16 v23, v7

    move-object/from16 v27, v14

    move-object/from16 v28, v15

    goto/16 :goto_5

    .line 146
    :cond_f
    invoke-virtual {v14}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v12

    move-object/from16 v20, v3

    .end local v3    # "dup":Ljava/lang/String;
    .local v20, "dup":Ljava/lang/String;
    const-wide/32 v2, 0x8000000

    cmp-long v0, v12, v2

    if-lez v0, :cond_10

    sget-object v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->TOO_LARGE:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    const-string v2, "biblioteca maior que 128 MB"

    invoke-static {v0, v2}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->fail(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v0
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_4

    .line 191
    :try_start_17
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V
    :try_end_17
    .catch Ljava/util/zip/ZipException; {:try_start_17 .. :try_end_17} :catch_7
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_17} :catch_6

    .line 146
    return-object v0

    .line 149
    :cond_10
    :try_start_18
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_11

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_11

    sget-object v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->INSTALL_FAILED:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "n\u00e3o foi poss\u00edvel criar "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->fail(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v0
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_4

    .line 191
    :try_start_19
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V
    :try_end_19
    .catch Ljava/util/zip/ZipException; {:try_start_19 .. :try_end_19} :catch_7
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_19} :catch_6

    .line 149
    return-object v0

    .line 150
    :cond_11
    :try_start_1a
    invoke-static/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6DriverPackage;->sha256(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v15, v0}, Lorg/wiiucoop/bo2android/T6DriverPackage;->driverId(Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v13, v0

    .line 151
    .local v13, "id":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ".staging-"

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v2, v0

    .line 152
    .local v2, "staging":Ljava/io/File;
    invoke-static {v2}, Lorg/wiiucoop/bo2android/T6DriverPackage;->deleteTree(Ljava/io/File;)V

    .line 153
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_12

    sget-object v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->INSTALL_FAILED:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    const-string v3, "n\u00e3o foi poss\u00edvel criar o diret\u00f3rio tempor\u00e1rio"

    invoke-static {v0, v3}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->fail(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v0
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_4

    .line 191
    :try_start_1b
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V
    :try_end_1b
    .catch Ljava/util/zip/ZipException; {:try_start_1b .. :try_end_1b} :catch_7
    .catch Ljava/io/IOException; {:try_start_1b .. :try_end_1b} :catch_6

    .line 153
    return-object v0

    .line 156
    :cond_12
    :try_start_1c
    new-instance v0, Ljava/io/File;

    iget-object v3, v15, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->libraryName:Ljava/lang/String;

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v3, v0

    .line 157
    .local v3, "libOut":Ljava/io/File;
    invoke-virtual {v4, v14}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v0
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_1c} :catch_5
    .catchall {:try_start_1c .. :try_end_1c} :catchall_4

    move-object/from16 v21, v5

    move/from16 v22, v6

    const-wide/32 v5, 0x8000000

    .end local v5    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v6    # "count":I
    .local v21, "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .local v22, "count":I
    :try_start_1d
    invoke-static {v0, v3, v5, v6}, Lorg/wiiucoop/bo2android/T6DriverPackage;->copyHashed(Ljava/io/InputStream;Ljava/io/File;J)Ljava/lang/String;

    move-result-object v0

    move-object v5, v0

    .line 158
    .local v5, "libHash":Ljava/lang/String;
    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6DriverPackage;->elfProblem(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0
    :try_end_1d
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_1d} :catch_4
    .catchall {:try_start_1d .. :try_end_1d} :catchall_4

    move-object v6, v0

    .line 159
    .local v6, "abi":Ljava/lang/String;
    if-eqz v6, :cond_13

    .line 160
    :try_start_1e
    invoke-static {v2}, Lorg/wiiucoop/bo2android/T6DriverPackage;->deleteTree(Ljava/io/File;)V

    .line 161
    sget-object v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->BAD_LIBRARY:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "biblioteca inv\u00e1lida: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v0, v11}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->fail(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v0
    :try_end_1e
    .catch Ljava/io/IOException; {:try_start_1e .. :try_end_1e} :catch_0
    .catchall {:try_start_1e .. :try_end_1e} :catchall_4

    .line 191
    :try_start_1f
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V
    :try_end_1f
    .catch Ljava/util/zip/ZipException; {:try_start_1f .. :try_end_1f} :catch_7
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_1f} :catch_6

    .line 161
    return-object v0

    .line 187
    .end local v3    # "libOut":Ljava/io/File;
    .end local v5    # "libHash":Ljava/lang/String;
    .end local v6    # "abi":Ljava/lang/String;
    :catch_0
    move-exception v0

    move-wide/from16 v23, v7

    move-object/from16 v26, v13

    move-object/from16 v27, v14

    move-object/from16 v28, v15

    goto/16 :goto_4

    .line 163
    .restart local v3    # "libOut":Ljava/io/File;
    .restart local v5    # "libHash":Ljava/lang/String;
    .restart local v6    # "abi":Ljava/lang/String;
    :cond_13
    :try_start_20
    new-instance v0, Ljava/io/FileOutputStream;

    new-instance v12, Ljava/io/File;

    invoke-direct {v12, v2, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v0, v12}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_20} :catch_4
    .catchall {:try_start_20 .. :try_end_20} :catchall_4

    move-object v11, v0

    .line 164
    .local v11, "out":Ljava/io/OutputStream;
    :try_start_21
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v9, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    invoke-virtual {v11, v0}, Ljava/io/OutputStream;->write([B)V
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_2

    .line 165
    :try_start_22
    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V

    .line 166
    .end local v11    # "out":Ljava/io/OutputStream;
    invoke-static/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6DriverPackage;->sha256(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    move-object v11, v0

    .line 167
    .local v11, "zipHash":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "{\n  \"id\": \""

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v12, "\",\n  \"librarySha256\": \""

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v12, "\",\n  \"zipSha256\": \""

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v12, "\",\n  \"zipName\": \""

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0
    :try_end_22
    .catch Ljava/io/IOException; {:try_start_22 .. :try_end_22} :catch_4
    .catchall {:try_start_22 .. :try_end_22} :catchall_4

    .line 168
    if-nez p3, :cond_14

    :try_start_23
    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v12
    :try_end_23
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_23} :catch_0
    .catchall {:try_start_23 .. :try_end_23} :catchall_4

    goto :goto_1

    :cond_14
    move-object/from16 v12, p3

    :goto_1
    :try_start_24
    invoke-static {v12}, Lorg/wiiucoop/bo2android/T6DriverPackage;->jsonEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v12, "\",\n  \"importedAt\": "

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0
    :try_end_24
    .catch Ljava/io/IOException; {:try_start_24 .. :try_end_24} :catch_4
    .catchall {:try_start_24 .. :try_end_24} :catchall_4

    move-wide/from16 v23, v7

    move-object v8, v6

    .end local v6    # "abi":Ljava/lang/String;
    .end local v7    # "total":J
    .local v8, "abi":Ljava/lang/String;
    .local v23, "total":J
    :try_start_25
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v6, "\n}\n"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v6, v0

    .line 169
    .local v6, "record":Ljava/lang/String;
    new-instance v0, Ljava/io/FileOutputStream;

    new-instance v7, Ljava/io/File;

    const-string v12, "import.json"

    invoke-direct {v7, v2, v12}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v0, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_25 .. :try_end_25} :catch_2
    .catchall {:try_start_25 .. :try_end_25} :catchall_4

    move-object v7, v0

    .line 170
    .local v7, "out":Ljava/io/OutputStream;
    :try_start_26
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v6, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/io/OutputStream;->write([B)V
    :try_end_26
    .catchall {:try_start_26 .. :try_end_26} :catchall_0

    .line 171
    :try_start_27
    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V

    .line 173
    .end local v7    # "out":Ljava/io/OutputStream;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1, v13}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 174
    .local v0, "target":Ljava/io/File;
    new-instance v7, Ljava/io/File;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v25, v3

    .end local v3    # "libOut":Ljava/io/File;
    .local v25, "libOut":Ljava/io/File;
    const-string v3, ".old-"

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v7, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v3, v7

    .line 175
    .local v3, "old":Ljava/io/File;
    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6DriverPackage;->deleteTree(Ljava/io/File;)V

    .line 176
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v7
    :try_end_27
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_27} :catch_2
    .catchall {:try_start_27 .. :try_end_27} :catchall_4

    if-eqz v7, :cond_15

    :try_start_28
    invoke-virtual {v0, v3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v7

    if-nez v7, :cond_15

    .line 177
    invoke-static {v2}, Lorg/wiiucoop/bo2android/T6DriverPackage;->deleteTree(Ljava/io/File;)V

    .line 178
    sget-object v7, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->INSTALL_FAILED:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    const-string v12, "n\u00e3o foi poss\u00edvel substituir a vers\u00e3o anterior"

    invoke-static {v7, v12}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->fail(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v7
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_28 .. :try_end_28} :catch_1
    .catchall {:try_start_28 .. :try_end_28} :catchall_4

    .line 191
    :try_start_29
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V
    :try_end_29
    .catch Ljava/util/zip/ZipException; {:try_start_29 .. :try_end_29} :catch_7
    .catch Ljava/io/IOException; {:try_start_29 .. :try_end_29} :catch_6

    .line 178
    return-object v7

    .line 187
    .end local v0    # "target":Ljava/io/File;
    .end local v3    # "old":Ljava/io/File;
    .end local v5    # "libHash":Ljava/lang/String;
    .end local v6    # "record":Ljava/lang/String;
    .end local v8    # "abi":Ljava/lang/String;
    .end local v11    # "zipHash":Ljava/lang/String;
    .end local v25    # "libOut":Ljava/io/File;
    :catch_1
    move-exception v0

    move-object/from16 v26, v13

    move-object/from16 v27, v14

    move-object/from16 v28, v15

    goto/16 :goto_4

    .line 180
    .restart local v0    # "target":Ljava/io/File;
    .restart local v3    # "old":Ljava/io/File;
    .restart local v5    # "libHash":Ljava/lang/String;
    .restart local v6    # "record":Ljava/lang/String;
    .restart local v8    # "abi":Ljava/lang/String;
    .restart local v11    # "zipHash":Ljava/lang/String;
    .restart local v25    # "libOut":Ljava/io/File;
    :cond_15
    :try_start_2a
    invoke-virtual {v2, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v7
    :try_end_2a
    .catch Ljava/io/IOException; {:try_start_2a .. :try_end_2a} :catch_2
    .catchall {:try_start_2a .. :try_end_2a} :catchall_4

    if-nez v7, :cond_17

    .line 181
    :try_start_2b
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_16

    invoke-virtual {v3, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 182
    :cond_16
    invoke-static {v2}, Lorg/wiiucoop/bo2android/T6DriverPackage;->deleteTree(Ljava/io/File;)V

    .line 183
    sget-object v7, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->INSTALL_FAILED:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    const-string v12, "n\u00e3o foi poss\u00edvel instalar o driver"

    invoke-static {v7, v12}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->fail(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v7
    :try_end_2b
    .catch Ljava/io/IOException; {:try_start_2b .. :try_end_2b} :catch_1
    .catchall {:try_start_2b .. :try_end_2b} :catchall_4

    .line 191
    :try_start_2c
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V
    :try_end_2c
    .catch Ljava/util/zip/ZipException; {:try_start_2c .. :try_end_2c} :catch_7
    .catch Ljava/io/IOException; {:try_start_2c .. :try_end_2c} :catch_6

    .line 183
    return-object v7

    .line 185
    :cond_17
    :try_start_2d
    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6DriverPackage;->deleteTree(Ljava/io/File;)V

    .line 186
    new-instance v7, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    const-string v16, ""
    :try_end_2d
    .catch Ljava/io/IOException; {:try_start_2d .. :try_end_2d} :catch_2
    .catchall {:try_start_2d .. :try_end_2d} :catchall_4

    const/16 v19, 0x0

    const/16 v17, 0x1

    move-object v12, v7

    move-object/from16 v26, v13

    .end local v13    # "id":Ljava/lang/String;
    .local v26, "id":Ljava/lang/String;
    move/from16 v13, v17

    move-object/from16 v27, v14

    .end local v14    # "lib":Ljava/util/zip/ZipEntry;
    .local v27, "lib":Ljava/util/zip/ZipEntry;
    move-object/from16 v14, v16

    move-object/from16 v28, v15

    .end local v15    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    .local v28, "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    move-object/from16 v15, v26

    move-object/from16 v16, v28

    move-object/from16 v17, v5

    move-object/from16 v18, v11

    :try_start_2e
    invoke-direct/range {v12 .. v19}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;-><init>(ZLjava/lang/String;Ljava/lang/String;Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;Ljava/lang/String;Ljava/lang/String;Lorg/wiiucoop/bo2android/T6DriverPackage$1;)V
    :try_end_2e
    .catch Ljava/io/IOException; {:try_start_2e .. :try_end_2e} :catch_3
    .catchall {:try_start_2e .. :try_end_2e} :catchall_4

    .line 191
    :try_start_2f
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V
    :try_end_2f
    .catch Ljava/util/zip/ZipException; {:try_start_2f .. :try_end_2f} :catch_7
    .catch Ljava/io/IOException; {:try_start_2f .. :try_end_2f} :catch_6

    .line 186
    return-object v7

    .line 169
    .end local v0    # "target":Ljava/io/File;
    .end local v25    # "libOut":Ljava/io/File;
    .end local v26    # "id":Ljava/lang/String;
    .end local v27    # "lib":Ljava/util/zip/ZipEntry;
    .end local v28    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    .local v3, "libOut":Ljava/io/File;
    .restart local v7    # "out":Ljava/io/OutputStream;
    .restart local v13    # "id":Ljava/lang/String;
    .restart local v14    # "lib":Ljava/util/zip/ZipEntry;
    .restart local v15    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    :catchall_0
    move-exception v0

    move-object/from16 v25, v3

    move-object/from16 v26, v13

    move-object/from16 v27, v14

    move-object/from16 v28, v15

    move-object v3, v0

    .end local v3    # "libOut":Ljava/io/File;
    .end local v13    # "id":Ljava/lang/String;
    .end local v14    # "lib":Ljava/util/zip/ZipEntry;
    .end local v15    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    .restart local v25    # "libOut":Ljava/io/File;
    .restart local v26    # "id":Ljava/lang/String;
    .restart local v27    # "lib":Ljava/util/zip/ZipEntry;
    .restart local v28    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    :try_start_30
    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V
    :try_end_30
    .catchall {:try_start_30 .. :try_end_30} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v0

    move-object v12, v0

    :try_start_31
    invoke-virtual {v3, v12}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v2    # "staging":Ljava/io/File;
    .end local v4    # "file":Ljava/util/zip/ZipFile;
    .end local v9    # "metaText":Ljava/lang/String;
    .end local v10    # "metaEntry":Ljava/util/zip/ZipEntry;
    .end local v20    # "dup":Ljava/lang/String;
    .end local v21    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v22    # "count":I
    .end local v23    # "total":J
    .end local v26    # "id":Ljava/lang/String;
    .end local v27    # "lib":Ljava/util/zip/ZipEntry;
    .end local v28    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    .end local p0    # "zip":Ljava/io/File;
    .end local p1    # "driversDir":Ljava/io/File;
    .end local p2    # "deviceApi":I
    .end local p3    # "sourceName":Ljava/lang/String;
    :goto_2
    throw v3
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_31} :catch_3
    .catchall {:try_start_31 .. :try_end_31} :catchall_4

    .line 187
    .end local v5    # "libHash":Ljava/lang/String;
    .end local v6    # "record":Ljava/lang/String;
    .end local v7    # "out":Ljava/io/OutputStream;
    .end local v8    # "abi":Ljava/lang/String;
    .end local v11    # "zipHash":Ljava/lang/String;
    .end local v25    # "libOut":Ljava/io/File;
    .restart local v2    # "staging":Ljava/io/File;
    .restart local v4    # "file":Ljava/util/zip/ZipFile;
    .restart local v9    # "metaText":Ljava/lang/String;
    .restart local v10    # "metaEntry":Ljava/util/zip/ZipEntry;
    .restart local v13    # "id":Ljava/lang/String;
    .restart local v14    # "lib":Ljava/util/zip/ZipEntry;
    .restart local v15    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    .restart local v20    # "dup":Ljava/lang/String;
    .restart local v21    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v22    # "count":I
    .restart local v23    # "total":J
    .restart local p0    # "zip":Ljava/io/File;
    .restart local p1    # "driversDir":Ljava/io/File;
    .restart local p2    # "deviceApi":I
    .restart local p3    # "sourceName":Ljava/lang/String;
    :catch_2
    move-exception v0

    move-object/from16 v26, v13

    move-object/from16 v27, v14

    move-object/from16 v28, v15

    .end local v13    # "id":Ljava/lang/String;
    .end local v14    # "lib":Ljava/util/zip/ZipEntry;
    .end local v15    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    .restart local v26    # "id":Ljava/lang/String;
    .restart local v27    # "lib":Ljava/util/zip/ZipEntry;
    .restart local v28    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    goto :goto_4

    .line 163
    .end local v23    # "total":J
    .end local v26    # "id":Ljava/lang/String;
    .end local v27    # "lib":Ljava/util/zip/ZipEntry;
    .end local v28    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    .restart local v3    # "libOut":Ljava/io/File;
    .restart local v5    # "libHash":Ljava/lang/String;
    .local v6, "abi":Ljava/lang/String;
    .local v7, "total":J
    .local v11, "out":Ljava/io/OutputStream;
    .restart local v13    # "id":Ljava/lang/String;
    .restart local v14    # "lib":Ljava/util/zip/ZipEntry;
    .restart local v15    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    :catchall_2
    move-exception v0

    move-object/from16 v25, v3

    move-wide/from16 v23, v7

    move-object/from16 v26, v13

    move-object/from16 v27, v14

    move-object/from16 v28, v15

    move-object v8, v6

    move-object v3, v0

    .end local v3    # "libOut":Ljava/io/File;
    .end local v6    # "abi":Ljava/lang/String;
    .end local v7    # "total":J
    .end local v13    # "id":Ljava/lang/String;
    .end local v14    # "lib":Ljava/util/zip/ZipEntry;
    .end local v15    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    .restart local v8    # "abi":Ljava/lang/String;
    .restart local v23    # "total":J
    .restart local v25    # "libOut":Ljava/io/File;
    .restart local v26    # "id":Ljava/lang/String;
    .restart local v27    # "lib":Ljava/util/zip/ZipEntry;
    .restart local v28    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    :try_start_32
    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V
    :try_end_32
    .catchall {:try_start_32 .. :try_end_32} :catchall_3

    goto :goto_3

    :catchall_3
    move-exception v0

    move-object v6, v0

    :try_start_33
    invoke-virtual {v3, v6}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v2    # "staging":Ljava/io/File;
    .end local v4    # "file":Ljava/util/zip/ZipFile;
    .end local v9    # "metaText":Ljava/lang/String;
    .end local v10    # "metaEntry":Ljava/util/zip/ZipEntry;
    .end local v20    # "dup":Ljava/lang/String;
    .end local v21    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v22    # "count":I
    .end local v23    # "total":J
    .end local v26    # "id":Ljava/lang/String;
    .end local v27    # "lib":Ljava/util/zip/ZipEntry;
    .end local v28    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    .end local p0    # "zip":Ljava/io/File;
    .end local p1    # "driversDir":Ljava/io/File;
    .end local p2    # "deviceApi":I
    .end local p3    # "sourceName":Ljava/lang/String;
    :goto_3
    throw v3
    :try_end_33
    .catch Ljava/io/IOException; {:try_start_33 .. :try_end_33} :catch_3
    .catchall {:try_start_33 .. :try_end_33} :catchall_4

    .line 187
    .end local v5    # "libHash":Ljava/lang/String;
    .end local v8    # "abi":Ljava/lang/String;
    .end local v11    # "out":Ljava/io/OutputStream;
    .end local v25    # "libOut":Ljava/io/File;
    .restart local v2    # "staging":Ljava/io/File;
    .restart local v4    # "file":Ljava/util/zip/ZipFile;
    .restart local v9    # "metaText":Ljava/lang/String;
    .restart local v10    # "metaEntry":Ljava/util/zip/ZipEntry;
    .restart local v20    # "dup":Ljava/lang/String;
    .restart local v21    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v22    # "count":I
    .restart local v23    # "total":J
    .restart local v26    # "id":Ljava/lang/String;
    .restart local v27    # "lib":Ljava/util/zip/ZipEntry;
    .restart local v28    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    .restart local p0    # "zip":Ljava/io/File;
    .restart local p1    # "driversDir":Ljava/io/File;
    .restart local p2    # "deviceApi":I
    .restart local p3    # "sourceName":Ljava/lang/String;
    :catch_3
    move-exception v0

    goto :goto_4

    .end local v23    # "total":J
    .end local v26    # "id":Ljava/lang/String;
    .end local v27    # "lib":Ljava/util/zip/ZipEntry;
    .end local v28    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    .restart local v7    # "total":J
    .restart local v13    # "id":Ljava/lang/String;
    .restart local v14    # "lib":Ljava/util/zip/ZipEntry;
    .restart local v15    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    :catch_4
    move-exception v0

    move-wide/from16 v23, v7

    move-object/from16 v26, v13

    move-object/from16 v27, v14

    move-object/from16 v28, v15

    .end local v7    # "total":J
    .end local v13    # "id":Ljava/lang/String;
    .end local v14    # "lib":Ljava/util/zip/ZipEntry;
    .end local v15    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    .restart local v23    # "total":J
    .restart local v26    # "id":Ljava/lang/String;
    .restart local v27    # "lib":Ljava/util/zip/ZipEntry;
    .restart local v28    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    goto :goto_4

    .end local v21    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v22    # "count":I
    .end local v23    # "total":J
    .end local v26    # "id":Ljava/lang/String;
    .end local v27    # "lib":Ljava/util/zip/ZipEntry;
    .end local v28    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    .local v5, "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .local v6, "count":I
    .restart local v7    # "total":J
    .restart local v13    # "id":Ljava/lang/String;
    .restart local v14    # "lib":Ljava/util/zip/ZipEntry;
    .restart local v15    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    :catch_5
    move-exception v0

    move-object/from16 v21, v5

    move/from16 v22, v6

    move-wide/from16 v23, v7

    move-object/from16 v26, v13

    move-object/from16 v27, v14

    move-object/from16 v28, v15

    .line 188
    .end local v5    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v6    # "count":I
    .end local v7    # "total":J
    .end local v13    # "id":Ljava/lang/String;
    .end local v14    # "lib":Ljava/util/zip/ZipEntry;
    .end local v15    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    .local v0, "e":Ljava/io/IOException;
    .restart local v21    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v22    # "count":I
    .restart local v23    # "total":J
    .restart local v26    # "id":Ljava/lang/String;
    .restart local v27    # "lib":Ljava/util/zip/ZipEntry;
    .restart local v28    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    :goto_4
    :try_start_34
    invoke-static {v2}, Lorg/wiiucoop/bo2android/T6DriverPackage;->deleteTree(Ljava/io/File;)V

    .line 189
    sget-object v3, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->INSTALL_FAILED:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "falha ao extrair: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->fail(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v3
    :try_end_34
    .catchall {:try_start_34 .. :try_end_34} :catchall_4

    .line 191
    :try_start_35
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V
    :try_end_35
    .catch Ljava/util/zip/ZipException; {:try_start_35 .. :try_end_35} :catch_7
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_35} :catch_6

    .line 189
    return-object v3

    .line 145
    .end local v0    # "e":Ljava/io/IOException;
    .end local v2    # "staging":Ljava/io/File;
    .end local v20    # "dup":Ljava/lang/String;
    .end local v21    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v22    # "count":I
    .end local v23    # "total":J
    .end local v26    # "id":Ljava/lang/String;
    .end local v27    # "lib":Ljava/util/zip/ZipEntry;
    .end local v28    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    .local v3, "dup":Ljava/lang/String;
    .restart local v5    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v6    # "count":I
    .restart local v7    # "total":J
    .restart local v14    # "lib":Ljava/util/zip/ZipEntry;
    .restart local v15    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    :cond_18
    move-object/from16 v20, v3

    move-object/from16 v21, v5

    move/from16 v22, v6

    move-wide/from16 v23, v7

    move-object/from16 v27, v14

    move-object/from16 v28, v15

    .end local v3    # "dup":Ljava/lang/String;
    .end local v5    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v6    # "count":I
    .end local v7    # "total":J
    .end local v14    # "lib":Ljava/util/zip/ZipEntry;
    .end local v15    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    .restart local v20    # "dup":Ljava/lang/String;
    .restart local v21    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v22    # "count":I
    .restart local v23    # "total":J
    .restart local v27    # "lib":Ljava/util/zip/ZipEntry;
    .restart local v28    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    :goto_5
    :try_start_36
    sget-object v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->BAD_LIBRARY:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "a biblioteca \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v3, v28

    .end local v28    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    .local v3, "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    iget-object v5, v3, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->libraryName:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, "\' n\u00e3o est\u00e1 no ZIP"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->fail(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v0
    :try_end_36
    .catchall {:try_start_36 .. :try_end_36} :catchall_4

    .line 191
    :try_start_37
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V
    :try_end_37
    .catch Ljava/util/zip/ZipException; {:try_start_37 .. :try_end_37} :catch_7
    .catch Ljava/io/IOException; {:try_start_37 .. :try_end_37} :catch_6

    .line 145
    return-object v0

    .line 115
    .end local v3    # "meta":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    .end local v9    # "metaText":Ljava/lang/String;
    .end local v10    # "metaEntry":Ljava/util/zip/ZipEntry;
    .end local v20    # "dup":Ljava/lang/String;
    .end local v21    # "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v22    # "count":I
    .end local v23    # "total":J
    .end local v27    # "lib":Ljava/util/zip/ZipEntry;
    :catchall_4
    move-exception v0

    move-object v2, v0

    :try_start_38
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V
    :try_end_38
    .catchall {:try_start_38 .. :try_end_38} :catchall_5

    goto :goto_6

    :catchall_5
    move-exception v0

    move-object v3, v0

    :try_start_39
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p0    # "zip":Ljava/io/File;
    .end local p1    # "driversDir":Ljava/io/File;
    .end local p2    # "deviceApi":I
    .end local p3    # "sourceName":Ljava/lang/String;
    :goto_6
    throw v2
    :try_end_39
    .catch Ljava/util/zip/ZipException; {:try_start_39 .. :try_end_39} :catch_7
    .catch Ljava/io/IOException; {:try_start_39 .. :try_end_39} :catch_6

    .line 193
    .end local v4    # "file":Ljava/util/zip/ZipFile;
    .restart local p0    # "zip":Ljava/io/File;
    .restart local p1    # "driversDir":Ljava/io/File;
    .restart local p2    # "deviceApi":I
    .restart local p3    # "sourceName":Ljava/lang/String;
    :catch_6
    move-exception v0

    .line 194
    .restart local v0    # "e":Ljava/io/IOException;
    sget-object v2, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->CORRUPT:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "falha ao ler o ZIP: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->fail(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v2

    return-object v2

    .line 191
    .end local v0    # "e":Ljava/io/IOException;
    :catch_7
    move-exception v0

    .line 192
    .local v0, "e":Ljava/util/zip/ZipException;
    sget-object v2, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->CORRUPT:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ZIP corrompido ou inv\u00e1lido: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/util/zip/ZipException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->fail(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v2

    return-object v2
.end method

.method static intField(Ljava/lang/String;Ljava/lang/String;I)I
    .locals 2
    .param p0, "json"    # Ljava/lang/String;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "fallback"    # I

    .line 263
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\"\\s*:\\s*\"?(-?\\d{1,9})\"?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 264
    .local v0, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    goto :goto_0

    :cond_0
    move v1, p2

    :goto_0
    return v1
.end method

.method private static jsonEscape(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "s"    # Ljava/lang/String;

    .line 327
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

.method static parseMeta(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    .locals 3
    .param p0, "json"    # Ljava/lang/String;

    .line 245
    new-instance v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;

    invoke-direct {v0}, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;-><init>()V

    .line 246
    .local v0, "m":Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    const-string v1, "schemaVersion"

    const/4 v2, -0x1

    invoke-static {p0, v1, v2}, Lorg/wiiucoop/bo2android/T6DriverPackage;->intField(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->schemaVersion:I

    .line 247
    const-string v1, "minApi"

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Lorg/wiiucoop/bo2android/T6DriverPackage;->intField(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->minApi:I

    .line 248
    const-string v1, "name"

    invoke-static {p0, v1}, Lorg/wiiucoop/bo2android/T6DriverPackage;->stringField(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->name:Ljava/lang/String;

    .line 249
    const-string v1, "description"

    invoke-static {p0, v1}, Lorg/wiiucoop/bo2android/T6DriverPackage;->stringField(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->description:Ljava/lang/String;

    .line 250
    const-string v1, "author"

    invoke-static {p0, v1}, Lorg/wiiucoop/bo2android/T6DriverPackage;->stringField(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->author:Ljava/lang/String;

    .line 251
    const-string v1, "vendor"

    invoke-static {p0, v1}, Lorg/wiiucoop/bo2android/T6DriverPackage;->stringField(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->vendor:Ljava/lang/String;

    .line 252
    const-string v1, "driverVersion"

    invoke-static {p0, v1}, Lorg/wiiucoop/bo2android/T6DriverPackage;->stringField(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->driverVersion:Ljava/lang/String;

    .line 253
    const-string v1, "libraryName"

    invoke-static {p0, v1}, Lorg/wiiucoop/bo2android/T6DriverPackage;->stringField(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->libraryName:Ljava/lang/String;

    .line 254
    return-object v0
.end method

.method private static readAll(Ljava/io/InputStream;J)[B
    .locals 7
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "limit"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 301
    move-object v0, p0

    .line 302
    .local v0, "src":Ljava/io/InputStream;
    :try_start_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 303
    .local v1, "out":Ljava/io/ByteArrayOutputStream;
    const/16 v2, 0x1000

    new-array v2, v2, [B

    .line 304
    .local v2, "buf":[B
    :goto_0
    invoke-virtual {v0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    move v4, v3

    .local v4, "n":I
    if-lez v3, :cond_1

    .line 305
    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 306
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v3

    int-to-long v5, v3

    cmp-long v3, v5, p1

    if-gtz v3, :cond_0

    goto :goto_0

    :cond_0
    new-instance v3, Ljava/io/IOException;

    const-string v5, "meta.json grande demais"

    invoke-direct {v3, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v0    # "src":Ljava/io/InputStream;
    .end local p0    # "in":Ljava/io/InputStream;
    .end local p1    # "limit":J
    throw v3

    .line 308
    .end local v4    # "n":I
    .restart local v0    # "src":Ljava/io/InputStream;
    .restart local p0    # "in":Ljava/io/InputStream;
    .restart local p1    # "limit":J
    :cond_1
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 309
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 308
    :cond_2
    return-object v3

    .line 301
    .end local v1    # "out":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "buf":[B
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_3

    :try_start_1
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_3
    :goto_1
    throw v1
.end method

.method public static refused(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;
    .locals 1
    .param p0, "problem"    # Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;
    .param p1, "reason"    # Ljava/lang/String;

    .line 96
    invoke-static {p0, p1}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->fail(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v0

    return-object v0
.end method

.method static safeLibraryName(Ljava/lang/String;)Z
    .locals 1
    .param p0, "n"    # Ljava/lang/String;

    .line 212
    if-eqz p0, :cond_0

    const-string v0, "[A-Za-z0-9._+-]{1,96}"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ".so"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ".."

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static sha256(Ljava/io/File;)Ljava/lang/String;
    .locals 5
    .param p0, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 292
    invoke-static {}, Lorg/wiiucoop/bo2android/T6DriverPackage;->digest()Ljava/security/MessageDigest;

    move-result-object v0

    .line 293
    .local v0, "md":Ljava/security/MessageDigest;
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 294
    .local v1, "in":Ljava/io/InputStream;
    const/high16 v2, 0x10000

    :try_start_0
    new-array v2, v2, [B

    .line 295
    .local v2, "buf":[B
    :goto_0
    invoke-virtual {v1, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    move v4, v3

    .local v4, "n":I
    if-lez v3, :cond_0

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v4}, Ljava/security/MessageDigest;->update([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 296
    .end local v2    # "buf":[B
    .end local v4    # "n":I
    :cond_0
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 297
    .end local v1    # "in":Ljava/io/InputStream;
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6DriverPackage;->hex([B)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 293
    .restart local v1    # "in":Ljava/io/InputStream;
    :catchall_0
    move-exception v2

    :try_start_1
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v3

    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw v2
.end method

.method static stringField(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "json"    # Ljava/lang/String;
    .param p1, "key"    # Ljava/lang/String;

    .line 258
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\"\\s*:\\s*\"((?:[^\"\\\\]|\\\\.){0,512})\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 259
    .local v0, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "\\\""

    invoke-virtual {v2, v3, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "\\\\"

    const-string v3, "\\"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const-string v1, ""

    :goto_0
    return-object v1
.end method

.method static unsafeName(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "name"    # Ljava/lang/String;

    .line 200
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    .line 201
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-le v0, v1, :cond_1

    const-string v0, "nome longo demais"

    return-object v0

    .line 202
    :cond_1
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_7

    const-string v1, "\\"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_7

    const-string v2, "^[A-Za-z]:.*"

    invoke-virtual {p0, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_1

    .line 203
    :cond_2
    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v0, "barra invertida"

    return-object v0

    .line 204
    :cond_3
    const-string v1, "\u0000"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string v0, "caractere nulo"

    return-object v0

    .line 205
    :cond_4
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_6

    aget-object v3, v0, v2

    .line 206
    .local v3, "part":Ljava/lang/String;
    const-string v4, ".."

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    const-string v0, "travessia de diret\u00f3rio (..)"

    return-object v0

    .line 205
    .end local v3    # "part":Ljava/lang/String;
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 208
    :cond_6
    const/4 v0, 0x0

    return-object v0

    .line 202
    :cond_7
    :goto_1
    const-string v0, "caminho absoluto"

    return-object v0

    .line 200
    :cond_8
    :goto_2
    const-string v0, "nome vazio"

    return-object v0
.end method
