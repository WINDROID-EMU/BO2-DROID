.class final Lorg/wiiucoop/bo2android/T6GuestImage;
.super Ljava/lang/Object;
.source "T6GuestImage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/wiiucoop/bo2android/T6GuestImage$Entry;,
        Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    }
.end annotation


# static fields
.field static final MANIFEST:Ljava/lang/String; = "guest/guest_images.properties"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    return-void
.end method

.method static fileName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "mode"    # Ljava/lang/String;

    .line 62
    const-string v0, "mp"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 63
    const-string v0, "t6mp_guest.elf"

    return-object v0

    .line 65
    :cond_0
    const-string v0, "zm"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 66
    const-string v0, "t6zm_guest.elf"

    return-object v0

    .line 68
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method static install(Landroid/content/res/AssetManager;Ljava/io/File;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    .locals 18
    .param p0, "assets"    # Landroid/content/res/AssetManager;
    .param p1, "filesDir"    # Ljava/io/File;
    .param p2, "mode"    # Ljava/lang/String;

    .line 114
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    invoke-static/range {p2 .. p2}, Lorg/wiiucoop/bo2android/T6GuestImage;->fileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 115
    .local v3, "name":Ljava/lang/String;
    const/4 v4, 0x0

    if-nez v3, :cond_0

    .line 116
    new-instance v0, Lorg/wiiucoop/bo2android/T6GuestImage$Result;

    const-string v5, "nenhum cliente selecionado; nenhuma imagem guest copiada"

    invoke-direct {v0, v4, v5}, Lorg/wiiucoop/bo2android/T6GuestImage$Result;-><init>(ZLjava/lang/String;)V

    return-object v0

    .line 120
    :cond_0
    invoke-static {v2, v3}, Lorg/wiiucoop/bo2android/T6GuestImage;->installedUpdate(Ljava/io/File;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6GuestImage$Result;

    move-result-object v5

    .line 121
    .local v5, "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    if-eqz v5, :cond_1

    .line 122
    return-object v5

    .line 126
    :cond_1
    :try_start_0
    const-string v0, "guest/guest_images.properties"
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_8
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_7

    :try_start_1
    invoke-virtual {v1, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_6
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_7

    move-object v6, v0

    .line 127
    .local v6, "in":Ljava/io/InputStream;
    :try_start_2
    new-instance v0, Ljava/lang/String;

    invoke-static {v6}, Lorg/wiiucoop/bo2android/T6GuestImage;->readAll(Ljava/io/InputStream;)[B

    move-result-object v7

    sget-object v8, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, v7, v8}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6GuestImage;->parseManifest(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    move-object v7, v0

    .line 128
    .local v7, "manifest":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6GuestImage$Entry;>;"
    if-eqz v6, :cond_2

    :try_start_3
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 130
    .end local v6    # "in":Ljava/io/InputStream;
    .end local v7    # "manifest":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6GuestImage$Entry;>;"
    :catch_0
    move-exception v0

    move-object/from16 v16, v5

    goto/16 :goto_6

    .line 128
    :catch_1
    move-exception v0

    move-object/from16 v16, v5

    goto/16 :goto_7

    .line 132
    .restart local v7    # "manifest":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6GuestImage$Entry;>;"
    :cond_2
    :goto_0
    nop

    .line 134
    invoke-interface {v7, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lorg/wiiucoop/bo2android/T6GuestImage$Entry;

    .line 135
    .local v6, "entry":Lorg/wiiucoop/bo2android/T6GuestImage$Entry;
    if-nez v6, :cond_3

    .line 136
    new-instance v0, Lorg/wiiucoop/bo2android/T6GuestImage$Result;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "guest/guest_images.properties n\u00e3o descreve "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v0, v4, v8}, Lorg/wiiucoop/bo2android/T6GuestImage$Result;-><init>(ZLjava/lang/String;)V

    return-object v0

    .line 139
    :cond_3
    new-instance v0, Ljava/io/File;

    const-string v8, "guest"

    invoke-direct {v0, v2, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v8, v0

    .line 140
    .local v8, "dir":Ljava/io/File;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v8, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v9, v0

    .line 141
    .local v9, "target":Ljava/io/File;
    new-instance v0, Ljava/io/File;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ".partial"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v0, v8, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v10, v0

    .line 144
    .local v10, "partial":Ljava/io/File;
    :try_start_4
    invoke-static {v9, v6}, Lorg/wiiucoop/bo2android/T6GuestImage;->matches(Ljava/io/File;Lorg/wiiucoop/bo2android/T6GuestImage$Entry;)Z

    move-result v0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    const/4 v11, 0x1

    const-string v12, ")"

    const-string v13, " bytes, sha256="

    if-eqz v0, :cond_4

    .line 145
    :try_start_5
    new-instance v0, Lorg/wiiucoop/bo2android/T6GuestImage$Result;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " j\u00e1 corresponde ao APK ("

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    move-object/from16 v16, v5

    .end local v5    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    .local v16, "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    :try_start_6
    iget-wide v4, v6, Lorg/wiiucoop/bo2android/T6GuestImage$Entry;->size:J

    invoke-virtual {v14, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v6, Lorg/wiiucoop/bo2android/T6GuestImage$Entry;->sha256:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v11, v4}, Lorg/wiiucoop/bo2android/T6GuestImage$Result;-><init>(ZLjava/lang/String;)V

    return-object v0

    .line 149
    .end local v16    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    .restart local v5    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    :cond_4
    move-object/from16 v16, v5

    .end local v5    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    .restart local v16    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    invoke-virtual {v8}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_5

    invoke-virtual {v8}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_5

    .line 150
    new-instance v0, Lorg/wiiucoop/bo2android/T6GuestImage$Result;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "n\u00e3o foi poss\u00edvel criar "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-direct {v0, v5, v4}, Lorg/wiiucoop/bo2android/T6GuestImage$Result;-><init>(ZLjava/lang/String;)V

    return-object v0

    .line 154
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "guest/"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    move-object v4, v0

    .line 155
    .local v4, "in":Ljava/io/InputStream;
    :try_start_7
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    move-object v5, v0

    .line 156
    .local v5, "out":Ljava/io/OutputStream;
    :try_start_8
    invoke-static {v4, v5}, Lorg/wiiucoop/bo2android/T6GuestImage;->sha256(Ljava/io/InputStream;Ljava/io/OutputStream;)Ljava/lang/String;

    move-result-object v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 157
    .local v0, "copied":Ljava/lang/String;
    :try_start_9
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .end local v5    # "out":Ljava/io/OutputStream;
    if-eqz v4, :cond_6

    :try_start_a
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 159
    .end local v4    # "in":Ljava/io/InputStream;
    :cond_6
    invoke-virtual {v10}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 160
    .local v4, "length":J
    move-object/from16 v17, v12

    iget-wide v11, v6, Lorg/wiiucoop/bo2android/T6GuestImage$Entry;->size:J

    cmp-long v11, v4, v11

    if-nez v11, :cond_9

    iget-object v11, v6, Lorg/wiiucoop/bo2android/T6GuestImage$Entry;->sha256:Ljava/lang/String;

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_7

    move-object/from16 v2, v17

    goto :goto_1

    .line 167
    :cond_7
    invoke-virtual {v10, v9}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v11

    if-nez v11, :cond_8

    .line 168
    invoke-virtual {v10}, Ljava/io/File;->delete()Z

    .line 169
    new-instance v11, Lorg/wiiucoop/bo2android/T6GuestImage$Result;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "n\u00e3o foi poss\u00edvel mover a imagem para "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    invoke-direct {v11, v13, v12}, Lorg/wiiucoop/bo2android/T6GuestImage$Result;-><init>(ZLjava/lang/String;)V

    return-object v11

    .line 172
    :cond_8
    new-instance v11, Lorg/wiiucoop/bo2android/T6GuestImage$Result;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v14, " copiada do APK e verificada ("

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-wide v1, v6, Lorg/wiiucoop/bo2android/T6GuestImage$Entry;->size:J

    invoke-virtual {v12, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v6, Lorg/wiiucoop/bo2android/T6GuestImage$Entry;->sha256:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v2, v17

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {v11, v2, v1}, Lorg/wiiucoop/bo2android/T6GuestImage$Result;-><init>(ZLjava/lang/String;)V

    return-object v11

    .line 160
    :cond_9
    move-object/from16 v2, v17

    .line 161
    :goto_1
    invoke-virtual {v10}, Ljava/io/File;->delete()Z

    .line 162
    new-instance v1, Lorg/wiiucoop/bo2android/T6GuestImage$Result;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "a c\u00f3pia de assets/guest/"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " n\u00e3o confere com o manifesto ("

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v11, 0x0

    invoke-direct {v1, v11, v2}, Lorg/wiiucoop/bo2android/T6GuestImage$Result;-><init>(ZLjava/lang/String;)V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_2

    return-object v1

    .line 154
    .end local v0    # "copied":Ljava/lang/String;
    .local v4, "in":Ljava/io/InputStream;
    .restart local v5    # "out":Ljava/io/OutputStream;
    :catchall_0
    move-exception v0

    move-object v1, v0

    :try_start_b
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v0

    move-object v2, v0

    :try_start_c
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "in":Ljava/io/InputStream;
    .end local v6    # "entry":Lorg/wiiucoop/bo2android/T6GuestImage$Entry;
    .end local v7    # "manifest":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6GuestImage$Entry;>;"
    .end local v8    # "dir":Ljava/io/File;
    .end local v9    # "target":Ljava/io/File;
    .end local v10    # "partial":Ljava/io/File;
    .end local v16    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    .end local p0    # "assets":Landroid/content/res/AssetManager;
    .end local p1    # "filesDir":Ljava/io/File;
    .end local p2    # "mode":Ljava/lang/String;
    :goto_2
    throw v1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .end local v5    # "out":Ljava/io/OutputStream;
    .restart local v3    # "name":Ljava/lang/String;
    .restart local v4    # "in":Ljava/io/InputStream;
    .restart local v6    # "entry":Lorg/wiiucoop/bo2android/T6GuestImage$Entry;
    .restart local v7    # "manifest":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6GuestImage$Entry;>;"
    .restart local v8    # "dir":Ljava/io/File;
    .restart local v9    # "target":Ljava/io/File;
    .restart local v10    # "partial":Ljava/io/File;
    .restart local v16    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    .restart local p0    # "assets":Landroid/content/res/AssetManager;
    .restart local p1    # "filesDir":Ljava/io/File;
    .restart local p2    # "mode":Ljava/lang/String;
    :catchall_2
    move-exception v0

    move-object v1, v0

    if-eqz v4, :cond_a

    :try_start_d
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    goto :goto_3

    :catchall_3
    move-exception v0

    move-object v2, v0

    :try_start_e
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v3    # "name":Ljava/lang/String;
    .end local v6    # "entry":Lorg/wiiucoop/bo2android/T6GuestImage$Entry;
    .end local v7    # "manifest":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6GuestImage$Entry;>;"
    .end local v8    # "dir":Ljava/io/File;
    .end local v9    # "target":Ljava/io/File;
    .end local v10    # "partial":Ljava/io/File;
    .end local v16    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    .end local p0    # "assets":Landroid/content/res/AssetManager;
    .end local p1    # "filesDir":Ljava/io/File;
    .end local p2    # "mode":Ljava/lang/String;
    :cond_a
    :goto_3
    throw v1
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_2

    .line 174
    .end local v4    # "in":Ljava/io/InputStream;
    .restart local v3    # "name":Ljava/lang/String;
    .restart local v6    # "entry":Lorg/wiiucoop/bo2android/T6GuestImage$Entry;
    .restart local v7    # "manifest":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6GuestImage$Entry;>;"
    .restart local v8    # "dir":Ljava/io/File;
    .restart local v9    # "target":Ljava/io/File;
    .restart local v10    # "partial":Ljava/io/File;
    .restart local v16    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    .restart local p0    # "assets":Landroid/content/res/AssetManager;
    .restart local p1    # "filesDir":Ljava/io/File;
    .restart local p2    # "mode":Ljava/lang/String;
    :catch_2
    move-exception v0

    goto :goto_4

    .end local v16    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    .local v5, "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    :catch_3
    move-exception v0

    move-object/from16 v16, v5

    .line 175
    .end local v5    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    .local v0, "e":Ljava/io/IOException;
    .restart local v16    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    :goto_4
    invoke-virtual {v10}, Ljava/io/File;->delete()Z

    .line 176
    new-instance v1, Lorg/wiiucoop/bo2android/T6GuestImage$Result;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "falha ao copiar "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ": "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x0

    invoke-direct {v1, v4, v2}, Lorg/wiiucoop/bo2android/T6GuestImage$Result;-><init>(ZLjava/lang/String;)V

    return-object v1

    .line 126
    .end local v0    # "e":Ljava/io/IOException;
    .end local v7    # "manifest":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6GuestImage$Entry;>;"
    .end local v8    # "dir":Ljava/io/File;
    .end local v9    # "target":Ljava/io/File;
    .end local v10    # "partial":Ljava/io/File;
    .end local v16    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    .restart local v5    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    .local v6, "in":Ljava/io/InputStream;
    :catchall_4
    move-exception v0

    move-object/from16 v16, v5

    move-object v1, v0

    .end local v5    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    .restart local v16    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    if-eqz v6, :cond_b

    :try_start_f
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_5

    goto :goto_5

    :catchall_5
    move-exception v0

    move-object v2, v0

    :try_start_10
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v3    # "name":Ljava/lang/String;
    .end local v16    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    .end local p0    # "assets":Landroid/content/res/AssetManager;
    .end local p1    # "filesDir":Ljava/io/File;
    .end local p2    # "mode":Ljava/lang/String;
    :cond_b
    :goto_5
    throw v1
    :try_end_10
    .catch Ljava/io/FileNotFoundException; {:try_start_10 .. :try_end_10} :catch_5
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_4

    .line 130
    .end local v6    # "in":Ljava/io/InputStream;
    .restart local v3    # "name":Ljava/lang/String;
    .restart local v16    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    .restart local p0    # "assets":Landroid/content/res/AssetManager;
    .restart local p1    # "filesDir":Ljava/io/File;
    .restart local p2    # "mode":Ljava/lang/String;
    :catch_4
    move-exception v0

    goto :goto_6

    .line 128
    :catch_5
    move-exception v0

    const/4 v4, 0x0

    goto :goto_7

    .end local v16    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    .restart local v5    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    :catch_6
    move-exception v0

    move-object/from16 v16, v5

    const/4 v4, 0x0

    goto :goto_7

    .line 130
    :catch_7
    move-exception v0

    move-object/from16 v16, v5

    .line 131
    .end local v5    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    .restart local v0    # "e":Ljava/io/IOException;
    .restart local v16    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    :goto_6
    new-instance v1, Lorg/wiiucoop/bo2android/T6GuestImage$Result;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "n\u00e3o foi poss\u00edvel ler guest/guest_images.properties: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x0

    invoke-direct {v1, v4, v2}, Lorg/wiiucoop/bo2android/T6GuestImage$Result;-><init>(ZLjava/lang/String;)V

    return-object v1

    .line 128
    .end local v0    # "e":Ljava/io/IOException;
    .end local v16    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    .restart local v5    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    :catch_8
    move-exception v0

    move-object/from16 v16, v5

    .line 129
    .end local v5    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    .local v0, "e":Ljava/io/FileNotFoundException;
    .restart local v16    # "updated":Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    :goto_7
    new-instance v1, Lorg/wiiucoop/bo2android/T6GuestImage$Result;

    const-string v2, "esta compila\u00e7\u00e3o n\u00e3o empacota imagens guest (sem -Pt6GuestLoadcheck)"

    invoke-direct {v1, v4, v2}, Lorg/wiiucoop/bo2android/T6GuestImage$Result;-><init>(ZLjava/lang/String;)V

    return-object v1
.end method

.method private static installedUpdate(Ljava/io/File;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6GuestImage$Result;
    .locals 11
    .param p0, "filesDir"    # Ljava/io/File;
    .param p1, "name"    # Ljava/lang/String;

    .line 197
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Updater;->sourceManifest(Ljava/io/File;)Ljava/util/Properties;

    move-result-object v0

    .line 198
    .local v0, "update":Ljava/util/Properties;
    const/4 v1, 0x0

    .line 200
    .local v1, "updateCode":I
    const/4 v2, 0x0

    if-nez v0, :cond_0

    move v3, v2

    goto :goto_0

    :cond_0
    :try_start_0
    const-string v3, "sourceCode"

    const-string v4, "0"

    invoke-virtual {v0, v3, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    move v1, v3

    .line 203
    goto :goto_1

    .line 201
    :catch_0
    move-exception v3

    .line 202
    .local v3, "e":Ljava/lang/NumberFormatException;
    const/4 v1, 0x0

    .line 204
    .end local v3    # "e":Ljava/lang/NumberFormatException;
    :goto_1
    const/4 v3, 0x1

    if-lez v1, :cond_1

    move v2, v3

    :cond_1
    const/16 v4, 0x8

    invoke-static {v1, v2, v4}, Lorg/wiiucoop/bo2android/T6SourceState;->useUpdate(IZI)Z

    move-result v2

    const/4 v4, 0x0

    if-nez v2, :cond_2

    .line 205
    return-object v4

    .line 207
    :cond_2
    new-instance v2, Ljava/io/File;

    const-string v5, "guest"

    invoke-direct {v2, p0, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 208
    .local v2, "dir":Ljava/io/File;
    :try_start_1
    new-instance v5, Ljava/io/FileInputStream;

    new-instance v6, Ljava/io/File;

    const-string v7, "guest_images.update.list"

    invoke-direct {v6, v2, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v5, v6}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 209
    .local v5, "in":Ljava/io/InputStream;
    :try_start_2
    new-instance v6, Ljava/lang/String;

    invoke-static {v5}, Lorg/wiiucoop/bo2android/T6GuestImage;->readAll(Ljava/io/InputStream;)[B

    move-result-object v7

    sget-object v8, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v6, v7, v8}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-static {v6}, Lorg/wiiucoop/bo2android/T6GuestImage;->parseManifest(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/wiiucoop/bo2android/T6GuestImage$Entry;

    .line 210
    .local v6, "entry":Lorg/wiiucoop/bo2android/T6GuestImage$Entry;
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, v2, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 211
    .local v7, "target":Ljava/io/File;
    if-eqz v6, :cond_3

    invoke-static {v7, v6}, Lorg/wiiucoop/bo2android/T6GuestImage;->matches(Ljava/io/File;Lorg/wiiucoop/bo2android/T6GuestImage$Entry;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 212
    new-instance v8, Lorg/wiiucoop/bo2android/T6GuestImage$Result;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " da source "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "sourceVersion"

    .line 213
    invoke-virtual {v0, v10}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " verificada (sha256="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, v6, Lorg/wiiucoop/bo2android/T6GuestImage$Entry;->sha256:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ")"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v3, v9}, Lorg/wiiucoop/bo2android/T6GuestImage$Result;-><init>(ZLjava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 215
    :try_start_3
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 212
    return-object v8

    .line 215
    .end local v6    # "entry":Lorg/wiiucoop/bo2android/T6GuestImage$Entry;
    .end local v7    # "target":Ljava/io/File;
    :cond_3
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 217
    .end local v5    # "in":Ljava/io/InputStream;
    goto :goto_3

    .line 208
    .restart local v5    # "in":Ljava/io/InputStream;
    :catchall_0
    move-exception v3

    :try_start_4
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v6

    :try_start_5
    invoke-virtual {v3, v6}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "update":Ljava/util/Properties;
    .end local v1    # "updateCode":I
    .end local v2    # "dir":Ljava/io/File;
    .end local p0    # "filesDir":Ljava/io/File;
    .end local p1    # "name":Ljava/lang/String;
    :goto_2
    throw v3
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    .line 215
    .end local v5    # "in":Ljava/io/InputStream;
    .restart local v0    # "update":Ljava/util/Properties;
    .restart local v1    # "updateCode":I
    .restart local v2    # "dir":Ljava/io/File;
    .restart local p0    # "filesDir":Ljava/io/File;
    .restart local p1    # "name":Ljava/lang/String;
    :catch_1
    move-exception v3

    .line 218
    :goto_3
    return-object v4
.end method

.method static matches(Ljava/io/File;Lorg/wiiucoop/bo2android/T6GuestImage$Entry;)Z
    .locals 4
    .param p0, "file"    # Ljava/io/File;
    .param p1, "entry"    # Lorg/wiiucoop/bo2android/T6GuestImage$Entry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 101
    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v0

    iget-wide v2, p1, Lorg/wiiucoop/bo2android/T6GuestImage$Entry;->size:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    goto :goto_1

    .line 104
    :cond_0
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 105
    .local v0, "in":Ljava/io/InputStream;
    :try_start_0
    iget-object v1, p1, Lorg/wiiucoop/bo2android/T6GuestImage$Entry;->sha256:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lorg/wiiucoop/bo2android/T6GuestImage;->sha256(Ljava/io/InputStream;Ljava/io/OutputStream;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 106
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 105
    return v1

    .line 104
    :catchall_0
    move-exception v1

    :try_start_1
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw v1

    .line 102
    .end local v0    # "in":Ljava/io/InputStream;
    :cond_1
    :goto_1
    const/4 v0, 0x0

    return v0
.end method

.method static parseManifest(Ljava/lang/String;)Ljava/util/Map;
    .locals 14
    .param p0, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/wiiucoop/bo2android/T6GuestImage$Entry;",
            ">;"
        }
    .end annotation

    .line 73
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 74
    .local v0, "entries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6GuestImage$Entry;>;"
    if-nez p0, :cond_0

    .line 75
    return-object v0

    .line 78
    :cond_0
    const-string v1, "\n"

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_4

    aget-object v5, v1, v4

    .line 79
    .local v5, "raw":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    .line 80
    .local v6, "line":Ljava/lang/String;
    const/16 v7, 0x3d

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    .line 81
    .local v7, "equals":I
    add-int/lit8 v8, v7, 0x1

    const/16 v9, 0x2c

    invoke-virtual {v6, v9, v8}, Ljava/lang/String;->indexOf(II)I

    move-result v8

    .line 82
    .local v8, "comma":I
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_3

    const-string v9, "#"

    invoke-virtual {v6, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_3

    if-lez v7, :cond_3

    if-gez v8, :cond_1

    .line 83
    goto :goto_1

    .line 86
    :cond_1
    add-int/lit8 v9, v8, 0x1

    invoke-virtual {v6, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    sget-object v10, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v9, v10}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v9

    .line 88
    .local v9, "sha":Ljava/lang/String;
    add-int/lit8 v10, v7, 0x1

    :try_start_0
    invoke-virtual {v6, v10, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v10

    .line 89
    .local v10, "size":J
    const-wide/16 v12, 0x0

    cmp-long v12, v10, v12

    if-lez v12, :cond_2

    const-string v12, "[0-9a-f]{64}"

    invoke-virtual {v9, v12}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 90
    invoke-virtual {v6, v3, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12

    new-instance v13, Lorg/wiiucoop/bo2android/T6GuestImage$Entry;

    invoke-direct {v13, v10, v11, v9}, Lorg/wiiucoop/bo2android/T6GuestImage$Entry;-><init>(JLjava/lang/String;)V

    invoke-interface {v0, v12, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 94
    .end local v10    # "size":J
    :cond_2
    goto :goto_1

    .line 92
    :catch_0
    move-exception v10

    .line 78
    .end local v5    # "raw":Ljava/lang/String;
    .end local v6    # "line":Ljava/lang/String;
    .end local v7    # "equals":I
    .end local v8    # "comma":I
    .end local v9    # "sha":Ljava/lang/String;
    :cond_3
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 96
    :cond_4
    return-object v0
.end method

.method private static readAll(Ljava/io/InputStream;)[B
    .locals 4
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 246
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 247
    .local v0, "out":Ljava/io/ByteArrayOutputStream;
    const/16 v1, 0x1000

    new-array v1, v1, [B

    .line 249
    .local v1, "buffer":[B
    :goto_0
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    move v3, v2

    .local v3, "count":I
    if-lez v2, :cond_0

    .line 250
    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 252
    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    return-object v2
.end method

.method private static sha256(Ljava/io/InputStream;Ljava/io/OutputStream;)Ljava/lang/String;
    .locals 11
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "copy"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 224
    :try_start_0
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 227
    .local v0, "digest":Ljava/security/MessageDigest;
    nop

    .line 229
    const/high16 v1, 0x10000

    new-array v1, v1, [B

    .line 231
    .local v1, "buffer":[B
    :cond_0
    :goto_0
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    move v3, v2

    .local v3, "count":I
    const/4 v4, 0x0

    if-lez v2, :cond_1

    .line 232
    invoke-virtual {v0, v1, v4, v3}, Ljava/security/MessageDigest;->update([BII)V

    .line 233
    if-eqz p1, :cond_0

    .line 234
    invoke-virtual {p1, v1, v4, v3}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    .line 238
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 239
    .local v2, "hex":Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v5

    array-length v6, v5

    :goto_1
    if-ge v4, v6, :cond_2

    aget-byte v7, v5, v4

    .line 240
    .local v7, "b":B
    sget-object v8, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-static {v7}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v9

    filled-new-array {v9}, [Ljava/lang/Object;

    move-result-object v9

    const-string v10, "%02x"

    invoke-static {v8, v10, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    .end local v7    # "b":B
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 242
    :cond_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 225
    .end local v0    # "digest":Ljava/security/MessageDigest;
    .end local v1    # "buffer":[B
    .end local v2    # "hex":Ljava/lang/StringBuilder;
    .end local v3    # "count":I
    :catch_0
    move-exception v0

    .line 226
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v1, Ljava/io/IOException;

    const-string v2, "SHA-256 indispon\u00edvel"

    invoke-direct {v1, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method static updateVerifies(Ljava/io/File;)Z
    .locals 8
    .param p0, "filesDir"    # Ljava/io/File;

    .line 182
    new-instance v0, Ljava/io/File;

    const-string v1, "guest"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 183
    .local v0, "dir":Ljava/io/File;
    const/4 v1, 0x0

    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    new-instance v3, Ljava/io/File;

    const-string v4, "guest_images.update.list"

    invoke-direct {v3, v0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 184
    .local v2, "in":Ljava/io/InputStream;
    :try_start_1
    new-instance v3, Ljava/lang/String;

    invoke-static {v2}, Lorg/wiiucoop/bo2android/T6GuestImage;->readAll(Ljava/io/InputStream;)[B

    move-result-object v4

    sget-object v5, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v3, v4, v5}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6GuestImage;->parseManifest(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v3

    .line 185
    .local v3, "entries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6GuestImage$Entry;>;"
    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v4, :cond_0

    .line 190
    :try_start_2
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 185
    return v1

    .line 186
    :cond_0
    :try_start_3
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 187
    .local v5, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6GuestImage$Entry;>;"
    new-instance v6, Ljava/io/File;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-direct {v6, v0, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/wiiucoop/bo2android/T6GuestImage$Entry;

    invoke-static {v6, v7}, Lorg/wiiucoop/bo2android/T6GuestImage;->matches(Ljava/io/File;Lorg/wiiucoop/bo2android/T6GuestImage$Entry;)Z

    move-result v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-nez v6, :cond_1

    .line 190
    :try_start_4
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 187
    return v1

    .line 188
    .end local v5    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6GuestImage$Entry;>;"
    :cond_1
    goto :goto_0

    .line 189
    :cond_2
    nop

    .line 190
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 189
    const/4 v1, 0x1

    return v1

    .line 183
    .end local v3    # "entries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/wiiucoop/bo2android/T6GuestImage$Entry;>;"
    :catchall_0
    move-exception v3

    :try_start_5
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v4

    :try_start_6
    invoke-virtual {v3, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "dir":Ljava/io/File;
    .end local p0    # "filesDir":Ljava/io/File;
    :goto_1
    throw v3
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    .line 190
    .end local v2    # "in":Ljava/io/InputStream;
    .restart local v0    # "dir":Ljava/io/File;
    .restart local p0    # "filesDir":Ljava/io/File;
    :catch_0
    move-exception v2

    .line 191
    .local v2, "e":Ljava/io/IOException;
    return v1
.end method
