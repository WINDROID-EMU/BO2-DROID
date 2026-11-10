.class public final Lorg/wiiucoop/bo2android/T6PlayerName;
.super Ljava/lang/Object;
.source "T6PlayerName.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;,
        Lorg/wiiucoop/bo2android/T6PlayerName$Store;,
        Lorg/wiiucoop/bo2android/T6PlayerName$Result;
    }
.end annotation


# static fields
.field public static final CLIENT_MAX_BYTES:I = 0xf

.field public static final CLIENT_MIN_LENGTH:I = 0x4

.field public static final CLIENT_PLACEHOLDER:Ljava/lang/String; = "unknown soldier"

.field public static final FILE_NAME:Ljava/lang/String; = "playername.txt"

.field public static final TRAILING_NEWLINE:Ljava/lang/String; = "\n"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 121
    return-void
.end method

.method private static capToClientBuffer(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "text"    # Ljava/lang/String;

    .line 186
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    array-length v0, v0

    const/16 v1, 0xf

    if-gt v0, v1, :cond_0

    .line 187
    return-object p0

    .line 190
    :cond_0
    const/4 v0, 0x0

    .line 191
    .local v0, "bytes":I
    const/4 v2, 0x0

    .line 193
    .local v2, "index":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 194
    invoke-virtual {p0, v2}, Ljava/lang/String;->codePointAt(I)I

    move-result v3

    .line 195
    .local v3, "codePoint":I
    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6PlayerName;->utf8Length(I)I

    move-result v4

    .line 197
    .local v4, "size":I
    add-int v5, v0, v4

    if-le v5, v1, :cond_1

    .line 198
    goto :goto_1

    .line 201
    :cond_1
    add-int/2addr v0, v4

    .line 202
    invoke-static {v3}, Ljava/lang/Character;->charCount(I)I

    move-result v5

    add-int/2addr v2, v5

    .line 203
    .end local v3    # "codePoint":I
    .end local v4    # "size":I
    goto :goto_0

    .line 206
    :cond_2
    :goto_1
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static clientRejection(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "name"    # Ljava/lang/String;

    .line 231
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6PlayerName;->countCodePoints(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x4

    if-ge v0, v1, :cond_0

    .line 232
    const-string v0, "O cliente descarta nomes com menos de 4 caracteres; nada foi gravado."

    return-object v0

    .line 236
    :cond_0
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "unknown soldier"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 237
    const-string v0, "O cliente trata \"Unknown Soldier\" como nome ausente; escolha outro nome."

    return-object v0

    .line 240
    :cond_1
    const-string v0, ""

    return-object v0
.end method

.method public static clientRejectionOutcome(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;
    .locals 2
    .param p0, "name"    # Ljava/lang/String;

    .line 224
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6PlayerName;->countCodePoints(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x4

    if-ge v0, v1, :cond_0

    sget-object v0, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->TOO_SHORT:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    return-object v0

    .line 225
    :cond_0
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "unknown soldier"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->PLACEHOLDER:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    return-object v0

    .line 226
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private static countCodePoints(Ljava/lang/String;)I
    .locals 2
    .param p0, "text"    # Ljava/lang/String;

    .line 339
    const/4 v0, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->codePointCount(II)I

    move-result v0

    return v0
.end method

.method public static engineNote()Ljava/lang/String;
    .locals 1

    .line 322
    const-string v0, "O cliente l\u00ea este arquivo na pasta do jogo (CL_PlayerNameFile_NotRetail). O motor ainda n\u00e3o executa nesta compila\u00e7\u00e3o, ent\u00e3o o nome n\u00e3o chega a uma partida."

    return-object v0
.end method

.method public static load(Lorg/wiiucoop/bo2android/T6PlayerName$Store;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "store"    # Lorg/wiiucoop/bo2android/T6PlayerName$Store;
    .param p1, "fallback"    # Ljava/lang/String;

    .line 245
    const-string v0, ""

    if-eqz p0, :cond_6

    invoke-interface {p0}, Lorg/wiiucoop/bo2android/T6PlayerName$Store;->ready()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_4

    .line 250
    :cond_0
    :try_start_0
    invoke-interface {p0}, Lorg/wiiucoop/bo2android/T6PlayerName$Store;->exists()Z

    move-result v1

    if-nez v1, :cond_2

    .line 251
    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    move-object v0, p1

    :goto_0
    return-object v0

    .line 254
    :cond_2
    new-instance v1, Ljava/lang/String;

    invoke-interface {p0}, Lorg/wiiucoop/bo2android/T6PlayerName$Store;->openRead()Ljava/io/InputStream;

    move-result-object v2

    invoke-static {v2}, Lorg/wiiucoop/bo2android/T6PlayerName;->readAll(Ljava/io/InputStream;)[B

    move-result-object v2

    sget-object v3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v1, v2, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 255
    .local v1, "text":Ljava/lang/String;
    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6PlayerName;->sanitize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 257
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v3, :cond_4

    if-nez p1, :cond_3

    goto :goto_1

    :cond_3
    move-object v0, p1

    goto :goto_1

    :cond_4
    move-object v0, v2

    :goto_1
    return-object v0

    .line 258
    .end local v1    # "text":Ljava/lang/String;
    .end local v2    # "name":Ljava/lang/String;
    :catch_0
    move-exception v1

    goto :goto_2

    :catch_1
    move-exception v1

    .line 259
    .local v1, "e":Ljava/lang/Exception;
    :goto_2
    if-nez p1, :cond_5

    goto :goto_3

    :cond_5
    move-object v0, p1

    :goto_3
    return-object v0

    .line 246
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_6
    :goto_4
    if-nez p1, :cond_7

    goto :goto_5

    :cond_7
    move-object v0, p1

    :goto_5
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

    .line 327
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 328
    .local v0, "out":Ljava/io/ByteArrayOutputStream;
    const/16 v1, 0x200

    new-array v1, v1, [B

    .line 331
    .local v1, "buffer":[B
    :goto_0
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    move v3, v2

    .local v3, "read":I
    if-lez v2, :cond_0

    .line 332
    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 335
    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    return-object v2
.end method

.method public static sanitize(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "raw"    # Ljava/lang/String;

    .line 132
    if-nez p0, :cond_0

    .line 133
    const-string v0, ""

    return-object v0

    .line 136
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 137
    .local v0, "out":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 139
    .local v1, "pendingSpace":Z
    const/4 v2, 0x0

    .local v2, "index":I
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x20

    if-ge v2, v3, :cond_8

    .line 140
    invoke-virtual {p0, v2}, Ljava/lang/String;->codePointAt(I)I

    move-result v3

    .line 141
    .local v3, "codePoint":I
    invoke-static {v3}, Ljava/lang/Character;->charCount(I)I

    move-result v5

    add-int/2addr v2, v5

    .line 147
    const/16 v5, 0xd

    if-eq v3, v5, :cond_6

    const/16 v5, 0xa

    if-eq v3, v5, :cond_6

    const/16 v5, 0x9

    if-ne v3, v5, :cond_2

    goto :goto_1

    .line 152
    :cond_2
    invoke-static {v3}, Ljava/lang/Character;->isISOControl(I)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 153
    goto :goto_0

    .line 159
    :cond_3
    const/16 v5, 0x22

    if-eq v3, v5, :cond_1

    const/16 v5, 0x5c

    if-eq v3, v5, :cond_1

    const/16 v5, 0x3b

    if-ne v3, v5, :cond_4

    .line 160
    goto :goto_0

    .line 163
    :cond_4
    if-eqz v1, :cond_5

    .line 164
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 165
    const/4 v1, 0x0

    .line 170
    :cond_5
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->appendCodePoint(I)Ljava/lang/StringBuilder;

    .line 171
    .end local v3    # "codePoint":I
    goto :goto_0

    .line 148
    .restart local v3    # "codePoint":I
    :cond_6
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_7

    const/4 v4, 0x1

    goto :goto_2

    :cond_7
    const/4 v4, 0x0

    :goto_2
    move v1, v4

    .line 149
    goto :goto_0

    .line 174
    .end local v2    # "index":I
    .end local v3    # "codePoint":I
    :cond_8
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 175
    .local v2, "text":Ljava/lang/String;
    const/16 v3, 0xa0

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 177
    invoke-static {v2}, Lorg/wiiucoop/bo2android/T6PlayerName;->capToClientBuffer(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static save(Lorg/wiiucoop/bo2android/T6PlayerName$Store;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6PlayerName$Result;
    .locals 7
    .param p0, "store"    # Lorg/wiiucoop/bo2android/T6PlayerName$Store;
    .param p1, "raw"    # Ljava/lang/String;

    .line 269
    invoke-static {p1}, Lorg/wiiucoop/bo2android/T6PlayerName;->sanitize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 271
    .local v0, "name":Ljava/lang/String;
    if-eqz p0, :cond_8

    invoke-interface {p0}, Lorg/wiiucoop/bo2android/T6PlayerName$Store;->ready()Z

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_4

    .line 276
    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 277
    new-instance v1, Lorg/wiiucoop/bo2android/T6PlayerName$Result;

    sget-object v2, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->EMPTY:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    const-string v3, ""

    const-string v4, "O nome n\u00e3o pode ficar vazio; nada foi gravado."

    invoke-direct {v1, v2, v3, v4}, Lorg/wiiucoop/bo2android/T6PlayerName$Result;-><init>(Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    .line 282
    :cond_1
    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6PlayerName;->clientRejection(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 284
    .local v1, "rejection":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 285
    new-instance v2, Lorg/wiiucoop/bo2android/T6PlayerName$Result;

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6PlayerName;->clientRejectionOutcome(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    move-result-object v3

    invoke-direct {v2, v3, v0, v1}, Lorg/wiiucoop/bo2android/T6PlayerName$Result;-><init>(Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;Ljava/lang/String;Ljava/lang/String;)V

    return-object v2

    .line 289
    :cond_2
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    .line 291
    .local v2, "bytes":[B
    invoke-interface {p0}, Lorg/wiiucoop/bo2android/T6PlayerName$Store;->openWrite()Ljava/io/OutputStream;

    move-result-object v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_2

    .line 292
    .local v3, "out":Ljava/io/OutputStream;
    :try_start_1
    invoke-virtual {v3, v2}, Ljava/io/OutputStream;->write([B)V

    .line 293
    invoke-virtual {v3}, Ljava/io/OutputStream;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 294
    if-eqz v3, :cond_3

    :try_start_2
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_2

    .line 297
    .end local v2    # "bytes":[B
    .end local v3    # "out":Ljava/io/OutputStream;
    :cond_3
    nop

    .line 301
    :try_start_3
    invoke-interface {p0}, Lorg/wiiucoop/bo2android/T6PlayerName$Store;->openRead()Ljava/io/InputStream;

    move-result-object v2
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_3 .. :try_end_3} :catch_0

    .line 302
    .local v2, "in":Ljava/io/InputStream;
    :try_start_4
    new-instance v3, Ljava/lang/String;

    invoke-static {v2}, Lorg/wiiucoop/bo2android/T6PlayerName;->readAll(Ljava/io/InputStream;)[B

    move-result-object v4

    sget-object v5, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v3, v4, v5}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6PlayerName;->sanitize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 303
    .local v3, "stored":Ljava/lang/String;
    if-eqz v2, :cond_4

    :try_start_5
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_5 .. :try_end_5} :catch_0

    .line 306
    .end local v2    # "in":Ljava/io/InputStream;
    :cond_4
    nop

    .line 308
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 309
    new-instance v2, Lorg/wiiucoop/bo2android/T6PlayerName$Result;

    sget-object v4, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->NOT_VERIFIED:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    const-string v5, "O arquivo foi gravado, mas a leitura devolveu outro conte\u00fado; n\u00e3o foi considerado salvo."

    invoke-direct {v2, v4, v0, v5}, Lorg/wiiucoop/bo2android/T6PlayerName$Result;-><init>(Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;Ljava/lang/String;Ljava/lang/String;)V

    return-object v2

    .line 313
    :cond_5
    new-instance v2, Lorg/wiiucoop/bo2android/T6PlayerName$Result;

    sget-object v4, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->SAVED:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Nome salvo em playername.txt ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {p0}, Lorg/wiiucoop/bo2android/T6PlayerName$Store;->describe()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v4, v0, v5}, Lorg/wiiucoop/bo2android/T6PlayerName$Result;-><init>(Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;Ljava/lang/String;Ljava/lang/String;)V

    return-object v2

    .line 301
    .end local v3    # "stored":Ljava/lang/String;
    .restart local v2    # "in":Ljava/io/InputStream;
    :catchall_0
    move-exception v3

    if-eqz v2, :cond_6

    :try_start_6
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v4

    :try_start_7
    invoke-virtual {v3, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "name":Ljava/lang/String;
    .end local v1    # "rejection":Ljava/lang/String;
    .end local p0    # "store":Lorg/wiiucoop/bo2android/T6PlayerName$Store;
    .end local p1    # "raw":Ljava/lang/String;
    :cond_6
    :goto_0
    throw v3
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_7 .. :try_end_7} :catch_0

    .line 303
    .end local v2    # "in":Ljava/io/InputStream;
    .restart local v0    # "name":Ljava/lang/String;
    .restart local v1    # "rejection":Ljava/lang/String;
    .restart local p0    # "store":Lorg/wiiucoop/bo2android/T6PlayerName$Store;
    .restart local p1    # "raw":Ljava/lang/String;
    :catch_0
    move-exception v2

    goto :goto_1

    :catch_1
    move-exception v2

    .line 304
    .local v2, "e":Ljava/lang/Exception;
    :goto_1
    new-instance v3, Lorg/wiiucoop/bo2android/T6PlayerName$Result;

    sget-object v4, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->NOT_VERIFIED:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "O arquivo foi criado mas n\u00e3o p\u00f4de ser lido de volta: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v0, v5}, Lorg/wiiucoop/bo2android/T6PlayerName$Result;-><init>(Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    .line 291
    .local v2, "bytes":[B
    .local v3, "out":Ljava/io/OutputStream;
    :catchall_2
    move-exception v4

    if-eqz v3, :cond_7

    :try_start_8
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    goto :goto_2

    :catchall_3
    move-exception v5

    :try_start_9
    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "name":Ljava/lang/String;
    .end local v1    # "rejection":Ljava/lang/String;
    .end local p0    # "store":Lorg/wiiucoop/bo2android/T6PlayerName$Store;
    .end local p1    # "raw":Ljava/lang/String;
    :cond_7
    :goto_2
    throw v4
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3
    .catch Ljava/lang/SecurityException; {:try_start_9 .. :try_end_9} :catch_2

    .line 295
    .end local v2    # "bytes":[B
    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v0    # "name":Ljava/lang/String;
    .restart local v1    # "rejection":Ljava/lang/String;
    .restart local p0    # "store":Lorg/wiiucoop/bo2android/T6PlayerName$Store;
    .restart local p1    # "raw":Ljava/lang/String;
    :catch_2
    move-exception v2

    goto :goto_3

    :catch_3
    move-exception v2

    .line 296
    .local v2, "e":Ljava/lang/Exception;
    :goto_3
    new-instance v3, Lorg/wiiucoop/bo2android/T6PlayerName$Result;

    sget-object v4, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->WRITE_FAILED:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "N\u00e3o foi poss\u00edvel gravar playername.txt: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v0, v5}, Lorg/wiiucoop/bo2android/T6PlayerName$Result;-><init>(Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    .line 272
    .end local v1    # "rejection":Ljava/lang/String;
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_8
    :goto_4
    new-instance v1, Lorg/wiiucoop/bo2android/T6PlayerName$Result;

    sget-object v2, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->NO_FOLDER:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    const-string v3, "A pasta do jogo n\u00e3o est\u00e1 definida ou a permiss\u00e3o foi revogada; o nome n\u00e3o foi gravado."

    invoke-direct {v1, v2, v0, v3}, Lorg/wiiucoop/bo2android/T6PlayerName$Result;-><init>(Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method private static utf8Length(I)I
    .locals 1
    .param p0, "codePoint"    # I

    .line 210
    const/16 v0, 0x80

    if-ge p0, v0, :cond_0

    .line 211
    const/4 v0, 0x1

    return v0

    .line 213
    :cond_0
    const/16 v0, 0x800

    if-ge p0, v0, :cond_1

    .line 214
    const/4 v0, 0x2

    return v0

    .line 216
    :cond_1
    const/high16 v0, 0x10000

    if-ge p0, v0, :cond_2

    .line 217
    const/4 v0, 0x3

    return v0

    .line 219
    :cond_2
    const/4 v0, 0x4

    return v0
.end method
