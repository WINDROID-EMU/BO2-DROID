.class final Lorg/wiiucoop/bo2android/T6TreeAccess;
.super Ljava/lang/Object;
.source "T6TreeAccess.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    return-void
.end method

.method static displayNameFor(Landroid/net/Uri;)Ljava/lang/String;
    .locals 5
    .param p0, "treeUri"    # Landroid/net/Uri;

    .line 232
    if-nez p0, :cond_0

    .line 233
    const-string v0, ""

    return-object v0

    .line 237
    :cond_0
    const/16 v0, 0x3a

    :try_start_0
    invoke-static {p0}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    .line 238
    .local v1, "documentId":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 239
    .local v2, "separator":I
    if-ltz v2, :cond_1

    add-int/lit8 v3, v2, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    :cond_1
    move-object v3, v1

    .line 240
    .local v3, "name":Ljava/lang/String;
    :goto_0
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v4, :cond_2

    .line 241
    return-object v3

    .line 245
    .end local v1    # "documentId":Ljava/lang/String;
    .end local v2    # "separator":I
    .end local v3    # "name":Ljava/lang/String;
    :cond_2
    goto :goto_1

    .line 243
    :catch_0
    move-exception v1

    .line 247
    :goto_1
    invoke-virtual {p0}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v1

    .line 248
    .local v1, "last":Ljava/lang/String;
    if-nez v1, :cond_3

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :cond_3
    const/16 v2, 0x2f

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_2
    return-object v0
.end method

.method static findDocumentId(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
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

    .line 218
    .local p0, "entries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v0, 0x0

    if-eqz p0, :cond_3

    if-nez p1, :cond_0

    goto :goto_1

    .line 222
    :cond_0
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 223
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 224
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0

    .line 226
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    goto :goto_0

    .line 228
    :cond_2
    return-object v0

    .line 219
    :cond_3
    :goto_1
    return-object v0
.end method

.method static hasAllFilesAccess()Z
    .locals 2

    .line 148
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-ge v0, v1, :cond_0

    .line 149
    const/4 v0, 0x1

    return v0

    .line 153
    :cond_0
    :try_start_0
    invoke-static {}, Landroid/os/Environment;->isExternalStorageManager()Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 154
    :catch_0
    move-exception v0

    .line 155
    .local v0, "e":Ljava/lang/RuntimeException;
    const/4 v1, 0x0

    return v1
.end method

.method static hasPersistedReadPermission(Landroid/content/Context;Landroid/net/Uri;)Z
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "treeUri"    # Landroid/net/Uri;

    .line 57
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 58
    return v0

    .line 61
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/ContentResolver;->getPersistedUriPermissions()Ljava/util/List;

    move-result-object v1

    .line 62
    .local v1, "permissions":Ljava/util/List;, "Ljava/util/List<Landroid/content/UriPermission;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/UriPermission;

    .line 63
    .local v3, "permission":Landroid/content/UriPermission;
    invoke-virtual {v3}, Landroid/content/UriPermission;->isReadPermission()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v3}, Landroid/content/UriPermission;->getUri()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4, p1}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 64
    const/4 v0, 0x1

    return v0

    .line 66
    .end local v3    # "permission":Landroid/content/UriPermission;
    :cond_1
    goto :goto_0

    .line 68
    :cond_2
    return v0
.end method

.method static isReadable(Ljava/lang/String;)Z
    .locals 3
    .param p0, "path"    # Ljava/lang/String;

    .line 138
    const/4 v0, 0x0

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 142
    :cond_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 143
    .local v1, "directory":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Ljava/io/File;->canRead()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0

    .line 139
    .end local v1    # "directory":Ljava/io/File;
    :cond_2
    :goto_0
    return v0
.end method

.method static listRawDirectory(Ljava/lang/String;)Ljava/util/Map;
    .locals 6
    .param p0, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 161
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 162
    .local v0, "directory":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v1

    .line 164
    .local v1, "names":[Ljava/lang/String;
    if-nez v1, :cond_0

    .line 165
    const/4 v2, 0x0

    return-object v2

    .line 168
    :cond_0
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    .line 169
    .local v2, "entries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    array-length v3, v1

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_1

    aget-object v5, v1, v4

    .line 170
    .local v5, "name":Ljava/lang/String;
    invoke-interface {v2, v5, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    .end local v5    # "name":Ljava/lang/String;
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 172
    :cond_1
    return-object v2
.end method

.method static listTreeDirectory(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Ljava/util/Map;
    .locals 11
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "treeUri"    # Landroid/net/Uri;
    .param p2, "parentDocumentId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 181
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 182
    .local v0, "entries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    .line 186
    .local v7, "resolver":Landroid/content/ContentResolver;
    const/4 v8, 0x0

    :try_start_0
    invoke-static {p1, p2}, Landroid/provider/DocumentsContract;->buildChildDocumentsUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    .line 189
    .local v2, "children":Landroid/net/Uri;
    nop

    .line 191
    const/4 v1, 0x2

    new-array v3, v1, [Ljava/lang/String;

    const-string v1, "_display_name"

    const/4 v9, 0x0

    aput-object v1, v3, v9

    const-string v1, "document_id"

    const/4 v10, 0x1

    aput-object v1, v3, v10

    .line 196
    .local v3, "columns":[Ljava/lang/String;
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object v1, v7

    :try_start_1
    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 197
    .local v1, "cursor":Landroid/database/Cursor;
    if-nez v1, :cond_1

    .line 198
    nop

    .line 209
    if-eqz v1, :cond_0

    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    .line 198
    :cond_0
    return-object v8

    .line 201
    :cond_1
    :goto_0
    :try_start_2
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 202
    invoke-interface {v1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 203
    .local v4, "name":Ljava/lang/String;
    invoke-interface {v1, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 205
    .local v5, "id":Ljava/lang/String;
    if-eqz v4, :cond_2

    if-eqz v5, :cond_2

    .line 206
    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 208
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "id":Ljava/lang/String;
    :cond_2
    goto :goto_0

    .line 209
    :cond_3
    if-eqz v1, :cond_4

    :try_start_3
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_0

    .line 211
    .end local v1    # "cursor":Landroid/database/Cursor;
    :cond_4
    nop

    .line 213
    return-object v0

    .line 196
    .restart local v1    # "cursor":Landroid/database/Cursor;
    :catchall_0
    move-exception v4

    if-eqz v1, :cond_5

    :try_start_4
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v5

    :try_start_5
    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "entries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2    # "children":Landroid/net/Uri;
    .end local v3    # "columns":[Ljava/lang/String;
    .end local v7    # "resolver":Landroid/content/ContentResolver;
    .end local p0    # "context":Landroid/content/Context;
    .end local p1    # "treeUri":Landroid/net/Uri;
    .end local p2    # "parentDocumentId":Ljava/lang/String;
    :cond_5
    :goto_1
    throw v4
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_0

    .line 209
    .end local v1    # "cursor":Landroid/database/Cursor;
    .restart local v0    # "entries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v2    # "children":Landroid/net/Uri;
    .restart local v3    # "columns":[Ljava/lang/String;
    .restart local v7    # "resolver":Landroid/content/ContentResolver;
    .restart local p0    # "context":Landroid/content/Context;
    .restart local p1    # "treeUri":Landroid/net/Uri;
    .restart local p2    # "parentDocumentId":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 210
    .local v1, "e":Ljava/lang/RuntimeException;
    return-object v8

    .line 187
    .end local v1    # "e":Ljava/lang/RuntimeException;
    .end local v2    # "children":Landroid/net/Uri;
    .end local v3    # "columns":[Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 188
    .restart local v1    # "e":Ljava/lang/RuntimeException;
    return-object v8
.end method

.method static lower(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "text"    # Ljava/lang/String;

    .line 252
    if-nez p0, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method static parse(Ljava/lang/String;)Landroid/net/Uri;
    .locals 3
    .param p0, "uriText"    # Ljava/lang/String;

    .line 72
    const/4 v0, 0x0

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 77
    :cond_0
    :try_start_0
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 78
    .local v1, "uri":Landroid/net/Uri;
    invoke-static {v1}, Landroid/provider/DocumentsContract;->isTreeUri(Landroid/net/Uri;)Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v2, :cond_1

    move-object v0, v1

    :cond_1
    return-object v0

    .line 79
    .end local v1    # "uri":Landroid/net/Uri;
    :catch_0
    move-exception v1

    .line 80
    .local v1, "e":Ljava/lang/RuntimeException;
    return-object v0

    .line 73
    .end local v1    # "e":Ljava/lang/RuntimeException;
    :cond_2
    :goto_0
    return-object v0
.end method

.method static rawPathFor(Landroid/net/Uri;)Ljava/lang/String;
    .locals 7
    .param p0, "treeUri"    # Landroid/net/Uri;

    .line 90
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 91
    return-object v0

    .line 96
    :cond_0
    :try_start_0
    invoke-static {p0}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    .local v1, "documentId":Ljava/lang/String;
    nop

    .line 101
    if-eqz v1, :cond_9

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    goto/16 :goto_1

    .line 105
    :cond_1
    const-string v2, "raw:"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    const-string v4, "/"

    if-eqz v3, :cond_3

    .line 106
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 107
    .local v2, "raw":Ljava/lang/String;
    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    move-object v0, v2

    :cond_2
    return-object v0

    .line 110
    .end local v2    # "raw":Ljava/lang/String;
    :cond_3
    const/16 v2, 0x3a

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 111
    .local v2, "separator":I
    if-gtz v2, :cond_4

    .line 112
    return-object v0

    .line 115
    :cond_4
    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 116
    .local v3, "volume":Ljava/lang/String;
    add-int/lit8 v5, v2, 0x1

    invoke-virtual {v1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 119
    .local v5, "relative":Ljava/lang/String;
    const-string v6, "primary"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 120
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .local v0, "root":Ljava/lang/String;
    goto :goto_0

    .line 121
    .end local v0    # "root":Ljava/lang/String;
    :cond_5
    const-string v6, "home"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 122
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v6, "/Documents"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "root":Ljava/lang/String;
    goto :goto_0

    .line 123
    .end local v0    # "root":Ljava/lang/String;
    :cond_6
    const-string v6, "[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}"

    invoke-virtual {v3, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 124
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "/storage/"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 129
    .restart local v0    # "root":Ljava/lang/String;
    :goto_0
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 130
    return-object v0

    .line 133
    :cond_7
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 126
    .end local v0    # "root":Ljava/lang/String;
    :cond_8
    return-object v0

    .line 102
    .end local v2    # "separator":I
    .end local v3    # "volume":Ljava/lang/String;
    .end local v5    # "relative":Ljava/lang/String;
    :cond_9
    :goto_1
    return-object v0

    .line 97
    .end local v1    # "documentId":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 98
    .local v1, "e":Ljava/lang/RuntimeException;
    return-object v0
.end method

.method static takePersistableReadPermission(Landroid/content/Context;Landroid/net/Uri;I)Z
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "treeUri"    # Landroid/net/Uri;
    .param p2, "resultFlags"    # I

    .line 41
    const/4 v0, 0x1

    .line 42
    .local v0, "readFlag":I
    and-int v1, p2, v0

    .line 44
    .local v1, "takeFlags":I
    if-nez v1, :cond_0

    .line 45
    move v1, v0

    .line 49
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, p1, v1}, Landroid/content/ContentResolver;->takePersistableUriPermission(Landroid/net/Uri;I)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    const/4 v2, 0x1

    return v2

    .line 51
    :catch_0
    move-exception v2

    goto :goto_0

    :catch_1
    move-exception v2

    .line 52
    .local v2, "e":Ljava/lang/RuntimeException;
    :goto_0
    const/4 v3, 0x0

    return v3
.end method
