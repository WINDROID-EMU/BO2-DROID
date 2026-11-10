.class final Lorg/wiiucoop/bo2android/T6KennelPackage;
.super Ljava/lang/Object;
.source "T6KennelPackage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;,
        Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;,
        Lorg/wiiucoop/bo2android/T6KennelPackage$State;
    }
.end annotation


# static fields
.field static final PREF_VERSION:Ljava/lang/String; = "kennel_version"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static copyHashing(Ljava/io/InputStream;Ljava/io/OutputStream;J)Ljava/lang/String;
    .locals 15
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "limit"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 180
    :try_start_0
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 181
    .local v0, "md":Ljava/security/MessageDigest;
    const/high16 v1, 0x10000

    new-array v1, v1, [B
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_2

    .line 182
    .local v1, "buf":[B
    const-wide/16 v2, 0x0

    .line 184
    .local v2, "total":J
    :goto_0
    move-object v4, p0

    :try_start_1
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v5

    move v6, v5

    .local v6, "n":I
    const/4 v7, 0x0

    if-lez v5, :cond_1

    .line 185
    int-to-long v8, v6

    add-long/2addr v2, v8

    .line 186
    cmp-long v5, v2, p2

    if-gtz v5, :cond_0

    .line 187
    invoke-virtual {v0, v1, v7, v6}, Ljava/security/MessageDigest;->update([BII)V
    :try_end_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_1

    .line 188
    move-object/from16 v5, p1

    :try_start_2
    invoke-virtual {v5, v1, v7, v6}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    .line 186
    :cond_0
    move-object/from16 v5, p1

    new-instance v7, Ljava/io/IOException;

    const-string v8, "entrada maior que o manifesto"

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local p0    # "in":Ljava/io/InputStream;
    .end local p1    # "out":Ljava/io/OutputStream;
    .end local p2    # "limit":J
    throw v7

    .line 190
    .restart local p0    # "in":Ljava/io/InputStream;
    .restart local p1    # "out":Ljava/io/OutputStream;
    .restart local p2    # "limit":J
    :cond_1
    move-object/from16 v5, p1

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 191
    .local v8, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v9

    array-length v10, v9

    :goto_1
    if-ge v7, v10, :cond_2

    aget-byte v11, v9, v7

    .local v11, "b":B
    sget-object v12, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v13, "%02x"

    invoke-static {v11}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v14

    filled-new-array {v14}, [Ljava/lang/Object;

    move-result-object v14

    invoke-static {v12, v13, v14}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .end local v11    # "b":B
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 192
    :cond_2
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7
    :try_end_2
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2 .. :try_end_2} :catch_0

    return-object v7

    .line 193
    .end local v0    # "md":Ljava/security/MessageDigest;
    .end local v1    # "buf":[B
    .end local v2    # "total":J
    .end local v6    # "n":I
    .end local v8    # "sb":Ljava/lang/StringBuilder;
    :catch_0
    move-exception v0

    goto :goto_3

    :catch_1
    move-exception v0

    goto :goto_2

    :catch_2
    move-exception v0

    move-object v4, p0

    :goto_2
    move-object/from16 v5, p1

    .line 194
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    :goto_3
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method static install(Ljava/io/File;Ljava/io/File;Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;)V
    .locals 17
    .param p0, "zip"    # Ljava/io/File;
    .param p1, "gameDir"    # Ljava/io/File;
    .param p2, "manifest"    # Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 142
    move-object/from16 v1, p2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    move-object v2, v0

    .line 143
    .local v2, "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    iget-object v0, v1, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;->files:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;

    .local v3, "e":Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;
    iget-object v4, v3, Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;->path:Ljava/lang/String;

    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 144
    .end local v3    # "e":Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v3, v0

    .line 145
    .local v3, "temps":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    :try_start_0
    new-instance v0, Ljava/util/zip/ZipFile;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_d

    move-object/from16 v4, p0

    :try_start_1
    invoke-direct {v0, v4}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_c

    move-object v5, v0

    .line 146
    .local v5, "zf":Ljava/util/zip/ZipFile;
    :try_start_2
    invoke-virtual {v5}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v0

    move-object v6, v0

    .line 147
    .local v6, "it":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    :goto_1
    invoke-interface {v6}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_9

    if-eqz v0, :cond_3

    .line 148
    :try_start_3
    invoke-interface {v6}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/zip/ZipEntry;

    .line 149
    .local v0, "z":Ljava/util/zip/ZipEntry;
    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v7

    if-eqz v7, :cond_1

    goto :goto_1

    .line 150
    :cond_1
    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v2, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 151
    .end local v0    # "z":Ljava/util/zip/ZipEntry;
    goto :goto_1

    .line 150
    .restart local v0    # "z":Ljava/util/zip/ZipEntry;
    :cond_2
    new-instance v7, Ljava/io/IOException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "entrada inesperada no pacote: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v2    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .end local v3    # "temps":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v5    # "zf":Ljava/util/zip/ZipFile;
    .end local p0    # "zip":Ljava/io/File;
    .end local p1    # "gameDir":Ljava/io/File;
    .end local p2    # "manifest":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    throw v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 145
    .end local v0    # "z":Ljava/util/zip/ZipEntry;
    .end local v6    # "it":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .restart local v2    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .restart local v3    # "temps":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .restart local v5    # "zf":Ljava/util/zip/ZipFile;
    .restart local p0    # "zip":Ljava/io/File;
    .restart local p1    # "gameDir":Ljava/io/File;
    .restart local p2    # "manifest":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    :catchall_0
    move-exception v0

    move-object/from16 v11, p1

    :goto_2
    move-object v1, v0

    move-object/from16 v16, v2

    goto/16 :goto_b

    .line 152
    .restart local v6    # "it":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    :cond_3
    :try_start_4
    iget-object v0, v1, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;->files:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;

    .line 153
    .local v7, "e":Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;
    iget-object v8, v7, Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;->path:Ljava/lang/String;

    invoke-virtual {v5, v8}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v8

    .line 154
    .local v8, "z":Ljava/util/zip/ZipEntry;
    if-eqz v8, :cond_d

    .line 155
    new-instance v9, Ljava/io/File;

    iget-object v10, v7, Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;->path:Ljava/lang/String;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_9

    move-object/from16 v11, p1

    :try_start_5
    invoke-direct {v9, v11, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 156
    .local v9, "target":Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v10

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    sget-object v13, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_c

    .line 159
    invoke-virtual {v9}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v10
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_7

    .line 160
    .local v10, "dir":Ljava/io/File;
    if-eqz v10, :cond_5

    :try_start_6
    invoke-virtual {v10}, Ljava/io/File;->isDirectory()Z

    move-result v12

    if-nez v12, :cond_5

    invoke-virtual {v10}, Ljava/io/File;->mkdirs()Z

    move-result v12

    if-eqz v12, :cond_4

    goto :goto_4

    :cond_4
    new-instance v0, Ljava/io/IOException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "n\u00e3o foi poss\u00edvel criar "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v0, v12}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v2    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .end local v3    # "temps":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v5    # "zf":Ljava/util/zip/ZipFile;
    .end local p0    # "zip":Ljava/io/File;
    .end local p1    # "gameDir":Ljava/io/File;
    .end local p2    # "manifest":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 145
    .end local v6    # "it":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .end local v7    # "e":Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;
    .end local v8    # "z":Ljava/util/zip/ZipEntry;
    .end local v9    # "target":Ljava/io/File;
    .end local v10    # "dir":Ljava/io/File;
    .restart local v2    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .restart local v3    # "temps":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .restart local v5    # "zf":Ljava/util/zip/ZipFile;
    .restart local p0    # "zip":Ljava/io/File;
    .restart local p1    # "gameDir":Ljava/io/File;
    .restart local p2    # "manifest":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    :catchall_1
    move-exception v0

    goto :goto_2

    .line 161
    .restart local v6    # "it":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .restart local v7    # "e":Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;
    .restart local v8    # "z":Ljava/util/zip/ZipEntry;
    .restart local v9    # "target":Ljava/io/File;
    .restart local v10    # "dir":Ljava/io/File;
    :cond_5
    :goto_4
    :try_start_7
    new-instance v12, Ljava/io/File;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".kennel.tmp"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 162
    .local v12, "tmp":Ljava/io/File;
    invoke-interface {v3, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 164
    invoke-virtual {v5, v8}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v13
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_7

    .local v13, "in":Ljava/io/InputStream;
    :try_start_8
    new-instance v14, Ljava/io/FileOutputStream;

    invoke-direct {v14, v12}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    .line 165
    .local v14, "out":Ljava/io/OutputStream;
    move-object v15, v0

    :try_start_9
    iget-wide v0, v7, Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;->size:J

    invoke-static {v13, v14, v0, v1}, Lorg/wiiucoop/bo2android/T6KennelPackage;->copyHashing(Ljava/io/InputStream;Ljava/io/OutputStream;J)Ljava/lang/String;

    move-result-object v0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 166
    .local v0, "got":Ljava/lang/String;
    :try_start_a
    invoke-virtual {v14}, Ljava/io/OutputStream;->close()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    .end local v14    # "out":Ljava/io/OutputStream;
    if-eqz v13, :cond_6

    :try_start_b
    invoke-virtual {v13}, Ljava/io/InputStream;->close()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 167
    .end local v13    # "in":Ljava/io/InputStream;
    :cond_6
    :try_start_c
    invoke-virtual {v12}, Ljava/io/File;->length()J

    move-result-wide v13
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_7

    move-object/from16 v16, v2

    .end local v2    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .local v16, "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    :try_start_d
    iget-wide v1, v7, Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;->size:J

    cmp-long v1, v13, v1

    if-nez v1, :cond_a

    iget-object v1, v7, Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;->sha256:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 170
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    move-result v1

    if-eqz v1, :cond_7

    goto :goto_5

    :cond_7
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "n\u00e3o foi poss\u00edvel substituir "

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v3    # "temps":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v5    # "zf":Ljava/util/zip/ZipFile;
    .end local v16    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .end local p0    # "zip":Ljava/io/File;
    .end local p1    # "gameDir":Ljava/io/File;
    .end local p2    # "manifest":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    throw v1

    .line 171
    .restart local v3    # "temps":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .restart local v5    # "zf":Ljava/util/zip/ZipFile;
    .restart local v16    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .restart local p0    # "zip":Ljava/io/File;
    .restart local p1    # "gameDir":Ljava/io/File;
    .restart local p2    # "manifest":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    :cond_8
    :goto_5
    invoke-virtual {v12, v9}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 172
    .end local v0    # "got":Ljava/lang/String;
    .end local v7    # "e":Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;
    .end local v8    # "z":Ljava/util/zip/ZipEntry;
    .end local v9    # "target":Ljava/io/File;
    .end local v10    # "dir":Ljava/io/File;
    .end local v12    # "tmp":Ljava/io/File;
    move-object/from16 v1, p2

    move-object v0, v15

    move-object/from16 v2, v16

    goto/16 :goto_3

    .line 171
    .restart local v0    # "got":Ljava/lang/String;
    .restart local v7    # "e":Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;
    .restart local v8    # "z":Ljava/util/zip/ZipEntry;
    .restart local v9    # "target":Ljava/io/File;
    .restart local v10    # "dir":Ljava/io/File;
    .restart local v12    # "tmp":Ljava/io/File;
    :cond_9
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "n\u00e3o foi poss\u00edvel instalar "

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v3    # "temps":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v5    # "zf":Ljava/util/zip/ZipFile;
    .end local v16    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .end local p0    # "zip":Ljava/io/File;
    .end local p1    # "gameDir":Ljava/io/File;
    .end local p2    # "manifest":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    throw v1

    .line 168
    .restart local v3    # "temps":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .restart local v5    # "zf":Ljava/util/zip/ZipFile;
    .restart local v16    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .restart local p0    # "zip":Ljava/io/File;
    .restart local p1    # "gameDir":Ljava/io/File;
    .restart local p2    # "manifest":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    :cond_a
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v13, v7, Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;->path:Ljava/lang/String;

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v13, ": tamanho ou sha256 n\u00e3o confere"

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v3    # "temps":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v5    # "zf":Ljava/util/zip/ZipFile;
    .end local v16    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .end local p0    # "zip":Ljava/io/File;
    .end local p1    # "gameDir":Ljava/io/File;
    .end local p2    # "manifest":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    throw v1
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_8

    .line 164
    .end local v0    # "got":Ljava/lang/String;
    .restart local v2    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .restart local v3    # "temps":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .restart local v5    # "zf":Ljava/util/zip/ZipFile;
    .restart local v13    # "in":Ljava/io/InputStream;
    .restart local v14    # "out":Ljava/io/OutputStream;
    .restart local p0    # "zip":Ljava/io/File;
    .restart local p1    # "gameDir":Ljava/io/File;
    .restart local p2    # "manifest":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    :catchall_2
    move-exception v0

    move-object/from16 v16, v2

    move-object v1, v0

    .end local v2    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .restart local v16    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    :try_start_e
    invoke-virtual {v14}, Ljava/io/OutputStream;->close()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_3

    goto :goto_6

    :catchall_3
    move-exception v0

    move-object v2, v0

    :try_start_f
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v3    # "temps":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v5    # "zf":Ljava/util/zip/ZipFile;
    .end local v6    # "it":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .end local v7    # "e":Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;
    .end local v8    # "z":Ljava/util/zip/ZipEntry;
    .end local v9    # "target":Ljava/io/File;
    .end local v10    # "dir":Ljava/io/File;
    .end local v12    # "tmp":Ljava/io/File;
    .end local v13    # "in":Ljava/io/InputStream;
    .end local v16    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .end local p0    # "zip":Ljava/io/File;
    .end local p1    # "gameDir":Ljava/io/File;
    .end local p2    # "manifest":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    :goto_6
    throw v1
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_4

    .end local v14    # "out":Ljava/io/OutputStream;
    .restart local v3    # "temps":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .restart local v5    # "zf":Ljava/util/zip/ZipFile;
    .restart local v6    # "it":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .restart local v7    # "e":Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;
    .restart local v8    # "z":Ljava/util/zip/ZipEntry;
    .restart local v9    # "target":Ljava/io/File;
    .restart local v10    # "dir":Ljava/io/File;
    .restart local v12    # "tmp":Ljava/io/File;
    .restart local v13    # "in":Ljava/io/InputStream;
    .restart local v16    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .restart local p0    # "zip":Ljava/io/File;
    .restart local p1    # "gameDir":Ljava/io/File;
    .restart local p2    # "manifest":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    :catchall_4
    move-exception v0

    move-object v1, v0

    goto :goto_7

    .end local v16    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .restart local v2    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    :catchall_5
    move-exception v0

    move-object/from16 v16, v2

    move-object v1, v0

    .end local v2    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .restart local v16    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    :goto_7
    if-eqz v13, :cond_b

    :try_start_10
    invoke-virtual {v13}, Ljava/io/InputStream;->close()V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_6

    goto :goto_8

    :catchall_6
    move-exception v0

    move-object v2, v0

    :try_start_11
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v3    # "temps":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v5    # "zf":Ljava/util/zip/ZipFile;
    .end local v16    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .end local p0    # "zip":Ljava/io/File;
    .end local p1    # "gameDir":Ljava/io/File;
    .end local p2    # "manifest":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    :cond_b
    :goto_8
    throw v1

    .line 157
    .end local v10    # "dir":Ljava/io/File;
    .end local v12    # "tmp":Ljava/io/File;
    .end local v13    # "in":Ljava/io/InputStream;
    .restart local v2    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .restart local v3    # "temps":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .restart local v5    # "zf":Ljava/util/zip/ZipFile;
    .restart local p0    # "zip":Ljava/io/File;
    .restart local p1    # "gameDir":Ljava/io/File;
    .restart local p2    # "manifest":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    :cond_c
    move-object/from16 v16, v2

    .end local v2    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .restart local v16    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "caminho fora da pasta do jogo: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v7, Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;->path:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v3    # "temps":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v5    # "zf":Ljava/util/zip/ZipFile;
    .end local v16    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .end local p0    # "zip":Ljava/io/File;
    .end local p1    # "gameDir":Ljava/io/File;
    .end local p2    # "manifest":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    throw v0

    .line 145
    .end local v6    # "it":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .end local v7    # "e":Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;
    .end local v8    # "z":Ljava/util/zip/ZipEntry;
    .end local v9    # "target":Ljava/io/File;
    .restart local v2    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .restart local v3    # "temps":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .restart local v5    # "zf":Ljava/util/zip/ZipFile;
    .restart local p0    # "zip":Ljava/io/File;
    .restart local p1    # "gameDir":Ljava/io/File;
    .restart local p2    # "manifest":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    :catchall_7
    move-exception v0

    goto :goto_a

    .line 154
    .restart local v6    # "it":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .restart local v7    # "e":Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;
    .restart local v8    # "z":Ljava/util/zip/ZipEntry;
    :cond_d
    move-object/from16 v11, p1

    move-object/from16 v16, v2

    .end local v2    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .restart local v16    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "arquivo ausente no pacote: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v7, Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;->path:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v3    # "temps":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v5    # "zf":Ljava/util/zip/ZipFile;
    .end local v16    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .end local p0    # "zip":Ljava/io/File;
    .end local p1    # "gameDir":Ljava/io/File;
    .end local p2    # "manifest":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    throw v0
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_8

    .line 145
    .end local v6    # "it":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .end local v7    # "e":Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;
    .end local v8    # "z":Ljava/util/zip/ZipEntry;
    .restart local v3    # "temps":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .restart local v5    # "zf":Ljava/util/zip/ZipFile;
    .restart local v16    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .restart local p0    # "zip":Ljava/io/File;
    .restart local p1    # "gameDir":Ljava/io/File;
    .restart local p2    # "manifest":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    :catchall_8
    move-exception v0

    move-object v1, v0

    goto :goto_b

    .line 152
    .end local v16    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .restart local v2    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .restart local v6    # "it":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    :cond_e
    move-object/from16 v11, p1

    move-object/from16 v16, v2

    .line 173
    .end local v2    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .end local v6    # "it":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .restart local v16    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    :try_start_12
    invoke-virtual {v5}, Ljava/util/zip/ZipFile;->close()V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_b

    .line 174
    .end local v5    # "zf":Ljava/util/zip/ZipFile;
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    .local v1, "t":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    goto :goto_9

    .line 175
    .end local v1    # "t":Ljava/io/File;
    :cond_f
    nop

    .line 176
    return-void

    .line 145
    .end local v16    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .restart local v2    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .restart local v5    # "zf":Ljava/util/zip/ZipFile;
    :catchall_9
    move-exception v0

    move-object/from16 v11, p1

    :goto_a
    move-object/from16 v16, v2

    move-object v1, v0

    .end local v2    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .restart local v16    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    :goto_b
    :try_start_13
    invoke-virtual {v5}, Ljava/util/zip/ZipFile;->close()V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_a

    goto :goto_c

    :catchall_a
    move-exception v0

    move-object v2, v0

    :try_start_14
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v3    # "temps":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v16    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .end local p0    # "zip":Ljava/io/File;
    .end local p1    # "gameDir":Ljava/io/File;
    .end local p2    # "manifest":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    :goto_c
    throw v1
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_b

    .line 174
    .end local v5    # "zf":Ljava/util/zip/ZipFile;
    .restart local v3    # "temps":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .restart local v16    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .restart local p0    # "zip":Ljava/io/File;
    .restart local p1    # "gameDir":Ljava/io/File;
    .restart local p2    # "manifest":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    :catchall_b
    move-exception v0

    goto :goto_e

    .end local v16    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .restart local v2    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    :catchall_c
    move-exception v0

    goto :goto_d

    :catchall_d
    move-exception v0

    move-object/from16 v4, p0

    :goto_d
    move-object/from16 v11, p1

    move-object/from16 v16, v2

    .end local v2    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .restart local v16    # "wanted":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    :goto_e
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_10

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/File;

    .local v2, "t":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    goto :goto_f

    .line 175
    .end local v2    # "t":Ljava/io/File;
    :cond_10
    throw v0
.end method

.method static parse(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    .locals 12
    .param p0, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 66
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 67
    .local v0, "o":Lorg/json/JSONObject;
    const-string v1, "files"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 68
    .local v1, "a":Lorg/json/JSONArray;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .local v2, "files":Ljava/util/List;, "Ljava/util/List<Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v4
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v5, "sha256"

    const-string v6, "size"

    if-ge v3, v4, :cond_1

    .line 70
    :try_start_1
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 71
    .local v4, "f":Lorg/json/JSONObject;
    const-string v7, "path"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 72
    .local v7, "path":Ljava/lang/String;
    invoke-static {v7}, Lorg/wiiucoop/bo2android/T6KennelPackage;->safePath(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 73
    new-instance v8, Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v9

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v5, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v8, v7, v9, v10, v5}, Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;-><init>(Ljava/lang/String;JLjava/lang/String;)V

    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    nop

    .end local v4    # "f":Lorg/json/JSONObject;
    .end local v7    # "path":Ljava/lang/String;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 72
    .restart local v4    # "f":Lorg/json/JSONObject;
    .restart local v7    # "path":Ljava/lang/String;
    :cond_0
    new-instance v5, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "caminho inv\u00e1lido no manifesto: "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local p0    # "json":Ljava/lang/String;
    throw v5

    .line 75
    .end local v3    # "i":I
    .end local v4    # "f":Lorg/json/JSONObject;
    .end local v7    # "path":Ljava/lang/String;
    .restart local p0    # "json":Ljava/lang/String;
    :cond_1
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    .line 76
    new-instance v10, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;

    const-string v3, "version"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    const-string v3, "asset"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v8

    .line 77
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v3, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v11

    move-object v3, v10

    move-object v5, v7

    move-wide v6, v8

    move-object v8, v11

    move-object v9, v2

    invoke-direct/range {v3 .. v9}, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;-><init>(ILjava/lang/String;JLjava/lang/String;Ljava/util/List;)V

    .line 76
    return-object v10

    .line 75
    :cond_2
    new-instance v3, Ljava/io/IOException;

    const-string v4, "manifesto sem arquivos"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local p0    # "json":Ljava/lang/String;
    throw v3
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 78
    .end local v0    # "o":Lorg/json/JSONObject;
    .end local v1    # "a":Lorg/json/JSONArray;
    .end local v2    # "files":Ljava/util/List;, "Ljava/util/List<Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    .restart local p0    # "json":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 79
    .local v0, "e":Lorg/json/JSONException;
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "manifesto inv\u00e1lido: "

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

.method static safePath(Ljava/lang/String;)Z
    .locals 6
    .param p0, "path"    # Ljava/lang/String;

    .line 85
    const/4 v0, 0x0

    if-eqz p0, :cond_4

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    const-string v2, "\\"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4

    const-string v2, ":"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_2

    .line 88
    :cond_0
    const/4 v2, -0x1

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    move v3, v0

    :goto_0
    if-ge v3, v2, :cond_3

    aget-object v4, v1, v3

    .line 89
    .local v4, "part":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2

    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    const-string v5, ".."

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    goto :goto_1

    .line 88
    .end local v4    # "part":Ljava/lang/String;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 89
    .restart local v4    # "part":Ljava/lang/String;
    :cond_2
    :goto_1
    return v0

    .line 91
    .end local v4    # "part":Ljava/lang/String;
    :cond_3
    const/4 v0, 0x1

    return v0

    .line 86
    :cond_4
    :goto_2
    return v0
.end method

.method static state(Ljava/io/File;ILorg/wiiucoop/bo2android/T6KennelPackage$Manifest;)Lorg/wiiucoop/bo2android/T6KennelPackage$State;
    .locals 9
    .param p0, "gameDir"    # Ljava/io/File;
    .param p1, "installedVersion"    # I
    .param p2, "manifest"    # Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;

    .line 99
    const/4 v0, 0x0

    .line 100
    .local v0, "any":Z
    const/4 v1, 0x1

    .line 101
    .local v1, "all":Z
    iget-object v2, p2, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;->files:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;

    .line 102
    .local v3, "e":Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;
    new-instance v4, Ljava/io/File;

    iget-object v5, v3, Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;->path:Ljava/lang/String;

    invoke-direct {v4, p0, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 103
    .local v4, "f":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->isFile()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v5

    iget-wide v7, v3, Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;->size:J

    cmp-long v5, v5, v7

    if-nez v5, :cond_0

    const/4 v0, 0x1

    goto :goto_1

    .line 104
    :cond_0
    const/4 v1, 0x0

    .line 105
    .end local v3    # "e":Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;
    .end local v4    # "f":Ljava/io/File;
    :goto_1
    goto :goto_0

    .line 106
    :cond_1
    if-nez v0, :cond_2

    if-gez p1, :cond_2

    sget-object v2, Lorg/wiiucoop/bo2android/T6KennelPackage$State;->MISSING:Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    return-object v2

    .line 107
    :cond_2
    if-nez v1, :cond_3

    sget-object v2, Lorg/wiiucoop/bo2android/T6KennelPackage$State;->INCOMPLETE:Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    return-object v2

    .line 108
    :cond_3
    iget v2, p2, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;->version:I

    if-ge p1, v2, :cond_4

    sget-object v2, Lorg/wiiucoop/bo2android/T6KennelPackage$State;->OUTDATED:Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    goto :goto_2

    :cond_4
    sget-object v2, Lorg/wiiucoop/bo2android/T6KennelPackage$State;->INSTALLED:Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    :goto_2
    return-object v2
.end method

.method static verify(Ljava/io/File;Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;Landroid/content/SharedPreferences;)Z
    .locals 11
    .param p0, "gameDir"    # Ljava/io/File;
    .param p1, "manifest"    # Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    .param p2, "cache"    # Landroid/content/SharedPreferences;

    .line 117
    iget-object v0, p1, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;->files:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;

    .line 118
    .local v1, "e":Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;
    new-instance v2, Ljava/io/File;

    iget-object v3, v1, Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;->path:Ljava/lang/String;

    invoke-direct {v2, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 119
    .local v2, "f":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_3

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v5

    iget-wide v7, v1, Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;->size:J

    cmp-long v3, v5, v7

    if-eqz v3, :cond_0

    goto/16 :goto_3

    .line 120
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "kennel_sha:"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, v1, Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;->path:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 121
    .local v3, "key":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/io/File;->lastModified()J

    move-result-wide v7

    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 122
    .local v5, "stamp":Ljava/lang/String;
    const-string v6, ""

    invoke-interface {p2, v3, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 124
    .local v6, "cached":Ljava/lang/String;
    invoke-virtual {v6, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 125
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    .local v7, "sha":Ljava/lang/String;
    goto :goto_1

    .line 127
    .end local v7    # "sha":Ljava/lang/String;
    :cond_1
    :try_start_0
    new-instance v7, Ljava/io/FileInputStream;

    invoke-direct {v7, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 128
    .local v7, "in":Ljava/io/InputStream;
    :try_start_1
    new-instance v8, Lorg/wiiucoop/bo2android/T6KennelPackage$1;

    invoke-direct {v8}, Lorg/wiiucoop/bo2android/T6KennelPackage$1;-><init>()V

    const-wide v9, 0x7fffffffffffffffL

    invoke-static {v7, v8, v9, v10}, Lorg/wiiucoop/bo2android/T6KennelPackage;->copyHashing(Ljava/io/InputStream;Ljava/io/OutputStream;J)Ljava/lang/String;

    move-result-object v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 130
    .local v8, "sha":Ljava/lang/String;
    :try_start_2
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 132
    .end local v7    # "in":Ljava/io/InputStream;
    nop

    .line 133
    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v7, v3, v9}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->apply()V

    move-object v7, v8

    .line 135
    .end local v8    # "sha":Ljava/lang/String;
    .local v7, "sha":Ljava/lang/String;
    :goto_1
    iget-object v8, v1, Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;->sha256:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2

    return v4

    .line 136
    .end local v1    # "e":Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;
    .end local v2    # "f":Ljava/io/File;
    .end local v3    # "key":Ljava/lang/String;
    .end local v5    # "stamp":Ljava/lang/String;
    .end local v6    # "cached":Ljava/lang/String;
    .end local v7    # "sha":Ljava/lang/String;
    :cond_2
    goto/16 :goto_0

    .line 127
    .restart local v1    # "e":Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;
    .restart local v2    # "f":Ljava/io/File;
    .restart local v3    # "key":Ljava/lang/String;
    .restart local v5    # "stamp":Ljava/lang/String;
    .restart local v6    # "cached":Ljava/lang/String;
    .local v7, "in":Ljava/io/InputStream;
    :catchall_0
    move-exception v0

    :try_start_3
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v8

    :try_start_4
    invoke-virtual {v0, v8}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v1    # "e":Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;
    .end local v2    # "f":Ljava/io/File;
    .end local v3    # "key":Ljava/lang/String;
    .end local v5    # "stamp":Ljava/lang/String;
    .end local v6    # "cached":Ljava/lang/String;
    .end local p0    # "gameDir":Ljava/io/File;
    .end local p1    # "manifest":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    .end local p2    # "cache":Landroid/content/SharedPreferences;
    :goto_2
    throw v0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 130
    .end local v7    # "in":Ljava/io/InputStream;
    .restart local v1    # "e":Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;
    .restart local v2    # "f":Ljava/io/File;
    .restart local v3    # "key":Ljava/lang/String;
    .restart local v5    # "stamp":Ljava/lang/String;
    .restart local v6    # "cached":Ljava/lang/String;
    .restart local p0    # "gameDir":Ljava/io/File;
    .restart local p1    # "manifest":Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
    .restart local p2    # "cache":Landroid/content/SharedPreferences;
    :catch_0
    move-exception v0

    .line 131
    .local v0, "x":Ljava/io/IOException;
    return v4

    .line 119
    .end local v0    # "x":Ljava/io/IOException;
    .end local v3    # "key":Ljava/lang/String;
    .end local v5    # "stamp":Ljava/lang/String;
    .end local v6    # "cached":Ljava/lang/String;
    :cond_3
    :goto_3
    return v4

    .line 137
    .end local v1    # "e":Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;
    .end local v2    # "f":Ljava/io/File;
    :cond_4
    const/4 v0, 0x1

    return v0
.end method
