.class final Lorg/wiiucoop/bo2android/T6SafStore;
.super Ljava/lang/Object;
.source "T6SafStore.java"

# interfaces
.implements Lorg/wiiucoop/bo2android/T6PlayerName$Store;


# static fields
.field private static final TAG:Ljava/lang/String; = "t6android"


# instance fields
.field private cachedFile:Landroid/net/Uri;

.field private final description:Ljava/lang/String;

.field private lookedUp:Z

.field private final resolver:Landroid/content/ContentResolver;

.field private final tree:Landroid/net/Uri;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "tree"    # Landroid/net/Uri;
    .param p3, "description"    # Ljava/lang/String;

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6SafStore;->resolver:Landroid/content/ContentResolver;

    .line 44
    iput-object p2, p0, Lorg/wiiucoop/bo2android/T6SafStore;->tree:Landroid/net/Uri;

    .line 45
    if-eqz p3, :cond_1

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 46
    :cond_0
    move-object v0, p3

    goto :goto_1

    :cond_1
    :goto_0
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_1
    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6SafStore;->description:Ljava/lang/String;

    .line 47
    return-void
.end method

.method private create()Landroid/net/Uri;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 186
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/T6SafStore;->directoryId()Ljava/lang/String;

    move-result-object v0

    .line 188
    .local v0, "directory":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 192
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6SafStore;->tree:Landroid/net/Uri;

    invoke-static {v1, v0}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 195
    .local v1, "parent":Landroid/net/Uri;
    :try_start_0
    iget-object v2, p0, Lorg/wiiucoop/bo2android/T6SafStore;->resolver:Landroid/content/ContentResolver;

    const-string v3, "text/plain"

    const-string v4, "playername.txt"

    invoke-static {v2, v1, v3, v4}, Landroid/provider/DocumentsContract;->createDocument(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 198
    .local v2, "created":Landroid/net/Uri;
    if-eqz v2, :cond_0

    .line 202
    const-string v3, "t6android"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "playername: playername.txt criado em "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/wiiucoop/bo2android/T6SafStore;->description:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    iput-object v2, p0, Lorg/wiiucoop/bo2android/T6SafStore;->cachedFile:Landroid/net/Uri;

    .line 204
    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/wiiucoop/bo2android/T6SafStore;->lookedUp:Z

    .line 205
    return-object v2

    .line 199
    :cond_0
    new-instance v3, Ljava/io/IOException;

    const-string v4, "o provedor n\u00e3o criou playername.txt"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v0    # "directory":Ljava/lang/String;
    .end local v1    # "parent":Landroid/net/Uri;
    throw v3
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 206
    .end local v2    # "created":Landroid/net/Uri;
    .restart local v0    # "directory":Ljava/lang/String;
    .restart local v1    # "parent":Landroid/net/Uri;
    :catch_0
    move-exception v2

    .line 207
    .local v2, "e":Ljava/lang/SecurityException;
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sem permiss\u00e3o para criar playername.txt na pasta do jogo: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 189
    .end local v1    # "parent":Landroid/net/Uri;
    .end local v2    # "e":Ljava/lang/SecurityException;
    :cond_1
    new-instance v1, Ljava/io/IOException;

    const-string v2, "a pasta do jogo n\u00e3o \u00e9 um diret\u00f3rio utiliz\u00e1vel"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private directoryId()Ljava/lang/String;
    .locals 2

    .line 137
    :try_start_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6SafStore;->tree:Landroid/net/Uri;

    invoke-static {v0}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 138
    :catch_0
    move-exception v0

    .line 139
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    const/4 v1, 0x0

    return-object v1
.end method

.method private document()Landroid/net/Uri;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 145
    iget-boolean v0, p0, Lorg/wiiucoop/bo2android/T6SafStore;->lookedUp:Z

    if-eqz v0, :cond_0

    .line 146
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6SafStore;->cachedFile:Landroid/net/Uri;

    return-object v0

    .line 149
    :cond_0
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/T6SafStore;->directoryId()Ljava/lang/String;

    move-result-object v0

    .line 151
    .local v0, "directory":Ljava/lang/String;
    if-eqz v0, :cond_7

    .line 155
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6SafStore;->tree:Landroid/net/Uri;

    invoke-static {v1, v0}, Landroid/provider/DocumentsContract;->buildChildDocumentsUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 157
    .local v1, "children":Landroid/net/Uri;
    :try_start_0
    iget-object v2, p0, Lorg/wiiucoop/bo2android/T6SafStore;->resolver:Landroid/content/ContentResolver;

    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/String;

    const-string v3, "_display_name"

    const/4 v8, 0x0

    aput-object v3, v4, v8

    const-string v3, "document_id"

    const/4 v9, 0x1

    aput-object v3, v4, v9

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v5, 0x0

    move-object v3, v1

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 164
    .local v2, "cursor":Landroid/database/Cursor;
    if-eqz v2, :cond_5

    .line 168
    :cond_1
    :try_start_1
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 169
    const-string v3, "playername.txt"

    invoke-interface {v2, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 170
    iget-object v3, p0, Lorg/wiiucoop/bo2android/T6SafStore;->tree:Landroid/net/Uri;

    invoke-interface {v2, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    iput-object v3, p0, Lorg/wiiucoop/bo2android/T6SafStore;->cachedFile:Landroid/net/Uri;

    .line 171
    iput-boolean v9, p0, Lorg/wiiucoop/bo2android/T6SafStore;->lookedUp:Z

    .line 172
    iget-object v3, p0, Lorg/wiiucoop/bo2android/T6SafStore;->cachedFile:Landroid/net/Uri;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 175
    if-eqz v2, :cond_2

    :try_start_2
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 172
    :cond_2
    return-object v3

    .line 175
    :cond_3
    if-eqz v2, :cond_4

    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_0

    .line 177
    .end local v2    # "cursor":Landroid/database/Cursor;
    :cond_4
    nop

    .line 179
    iput-boolean v9, p0, Lorg/wiiucoop/bo2android/T6SafStore;->lookedUp:Z

    .line 180
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/wiiucoop/bo2android/T6SafStore;->cachedFile:Landroid/net/Uri;

    .line 181
    return-object v2

    .line 157
    .restart local v2    # "cursor":Landroid/database/Cursor;
    :catchall_0
    move-exception v3

    goto :goto_0

    .line 165
    :cond_5
    :try_start_3
    new-instance v3, Ljava/io/IOException;

    const-string v4, "o provedor n\u00e3o listou a pasta do jogo"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v0    # "directory":Ljava/lang/String;
    .end local v1    # "children":Landroid/net/Uri;
    .end local v2    # "cursor":Landroid/database/Cursor;
    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 157
    .restart local v0    # "directory":Ljava/lang/String;
    .restart local v1    # "children":Landroid/net/Uri;
    .restart local v2    # "cursor":Landroid/database/Cursor;
    :goto_0
    if-eqz v2, :cond_6

    :try_start_4
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v4

    :try_start_5
    invoke-virtual {v3, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "directory":Ljava/lang/String;
    .end local v1    # "children":Landroid/net/Uri;
    :cond_6
    :goto_1
    throw v3
    :try_end_5
    .catch Ljava/lang/SecurityException; {:try_start_5 .. :try_end_5} :catch_0

    .line 175
    .end local v2    # "cursor":Landroid/database/Cursor;
    .restart local v0    # "directory":Ljava/lang/String;
    .restart local v1    # "children":Landroid/net/Uri;
    :catch_0
    move-exception v2

    .line 176
    .local v2, "e":Ljava/lang/SecurityException;
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sem permiss\u00e3o para ler a pasta do jogo: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 152
    .end local v1    # "children":Landroid/net/Uri;
    .end local v2    # "e":Ljava/lang/SecurityException;
    :cond_7
    new-instance v1, Ljava/io/IOException;

    const-string v2, "a pasta do jogo n\u00e3o \u00e9 um diret\u00f3rio utiliz\u00e1vel"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method static forTree(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6SafStore;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "treeUri"    # Ljava/lang/String;
    .param p2, "display"    # Ljava/lang/String;

    .line 51
    invoke-static {p1}, Lorg/wiiucoop/bo2android/T6TreeAccess;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 53
    .local v0, "parsed":Landroid/net/Uri;
    if-nez v0, :cond_0

    .line 54
    const/4 v1, 0x0

    return-object v1

    .line 57
    :cond_0
    new-instance v1, Lorg/wiiucoop/bo2android/T6SafStore;

    invoke-direct {v1, p0, v0, p2}, Lorg/wiiucoop/bo2android/T6SafStore;-><init>(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)V

    return-object v1
.end method

.method static syncInto(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "treeUri"    # Ljava/lang/String;
    .param p2, "display"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;

    .line 217
    if-eqz p3, :cond_2

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 221
    :cond_0
    invoke-static {p0, p1, p2}, Lorg/wiiucoop/bo2android/T6SafStore;->forTree(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6SafStore;

    move-result-object v0

    .line 223
    .local v0, "store":Lorg/wiiucoop/bo2android/T6SafStore;
    if-nez v0, :cond_1

    .line 224
    return-void

    .line 227
    :cond_1
    invoke-static {v0, p3}, Lorg/wiiucoop/bo2android/T6PlayerName;->save(Lorg/wiiucoop/bo2android/T6PlayerName$Store;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6PlayerName$Result;

    move-result-object v1

    .line 228
    .local v1, "result":Lorg/wiiucoop/bo2android/T6PlayerName$Result;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "playername: sincroniza\u00e7\u00e3o com a nova pasta -> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v1, Lorg/wiiucoop/bo2android/T6PlayerName$Result;->message:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "t6android"

    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 229
    return-void

    .line 218
    .end local v0    # "store":Lorg/wiiucoop/bo2android/T6SafStore;
    .end local v1    # "result":Lorg/wiiucoop/bo2android/T6PlayerName$Result;
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public describe()Ljava/lang/String;
    .locals 1

    .line 131
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6SafStore;->description:Ljava/lang/String;

    return-object v0
.end method

.method public exists()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 81
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/T6SafStore;->document()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public openRead()Ljava/io/InputStream;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 86
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/T6SafStore;->document()Landroid/net/Uri;

    move-result-object v0

    .line 88
    .local v0, "document":Landroid/net/Uri;
    if-eqz v0, :cond_1

    .line 92
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6SafStore;->resolver:Landroid/content/ContentResolver;

    invoke-virtual {v1, v0}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v1

    .line 93
    .local v1, "in":Ljava/io/InputStream;
    if-eqz v1, :cond_0

    .line 97
    return-object v1

    .line 94
    :cond_0
    new-instance v2, Ljava/io/IOException;

    const-string v3, "o provedor n\u00e3o abriu playername.txt para leitura"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 89
    .end local v1    # "in":Ljava/io/InputStream;
    :cond_1
    new-instance v1, Ljava/io/FileNotFoundException;

    const-string v2, "playername.txt"

    invoke-direct {v1, v2}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public openWrite()Ljava/io/OutputStream;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 102
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/T6SafStore;->document()Landroid/net/Uri;

    move-result-object v0

    .line 104
    .local v0, "document":Landroid/net/Uri;
    if-nez v0, :cond_0

    .line 105
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/T6SafStore;->create()Landroid/net/Uri;

    move-result-object v0

    .line 110
    :cond_0
    :try_start_0
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6SafStore;->resolver:Landroid/content/ContentResolver;

    const-string v2, "wt"

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    .local v1, "out":Ljava/io/OutputStream;
    if-eqz v1, :cond_1

    .line 112
    return-object v1

    .line 118
    .end local v1    # "out":Ljava/io/OutputStream;
    :cond_1
    goto :goto_1

    .line 114
    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v1

    .line 117
    .local v1, "e":Ljava/lang/RuntimeException;
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "playername: o provedor recusou \"wt\", tentando \"w\": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "t6android"

    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    .end local v1    # "e":Ljava/lang/RuntimeException;
    :goto_1
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6SafStore;->resolver:Landroid/content/ContentResolver;

    const-string v2, "w"

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v1

    .line 121
    .local v1, "out":Ljava/io/OutputStream;
    if-eqz v1, :cond_2

    .line 126
    return-object v1

    .line 122
    :cond_2
    new-instance v2, Ljava/io/IOException;

    const-string v3, "o provedor n\u00e3o abriu playername.txt para escrita"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public ready()Z
    .locals 5

    .line 62
    const-string v0, "t6android"

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6SafStore;->tree:Landroid/net/Uri;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6SafStore;->tree:Landroid/net/Uri;

    invoke-static {v1}, Landroid/provider/DocumentsContract;->isTreeUri(Landroid/net/Uri;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 69
    :cond_0
    :try_start_0
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/T6SafStore;->directoryId()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_1

    const/4 v2, 0x1

    :cond_1
    return v2

    .line 73
    :catch_0
    move-exception v1

    .line 74
    .local v1, "e":Ljava/lang/RuntimeException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "playername: a pasta do jogo n\u00e3o respondeu: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    return v2

    .line 70
    .end local v1    # "e":Ljava/lang/RuntimeException;
    :catch_1
    move-exception v1

    .line 71
    .local v1, "e":Ljava/lang/SecurityException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "playername: sem permiss\u00e3o para a pasta do jogo: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    return v2

    .line 63
    .end local v1    # "e":Ljava/lang/SecurityException;
    :cond_2
    :goto_0
    return v2
.end method
