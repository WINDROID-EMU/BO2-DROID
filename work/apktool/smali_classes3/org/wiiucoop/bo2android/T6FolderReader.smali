.class final Lorg/wiiucoop/bo2android/T6FolderReader;
.super Ljava/lang/Object;
.source "T6FolderReader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;
    }
.end annotation


# static fields
.field static final ZONE_ALL:Ljava/lang/String; = "all"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    return-void
.end method

.method private static addRawZoneAll(Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)V
    .locals 3
    .param p0, "zonePath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 190
    .local p1, "zoneEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p2, "out":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v0, "all"

    invoke-static {p1, v0}, Lorg/wiiucoop/bo2android/T6FolderReader;->findEntryName(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 191
    .local v0, "allName":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 192
    return-void

    .line 194
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6TreeAccess;->listRawDirectory(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    .line 195
    .local v1, "allEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v1, :cond_1

    .line 196
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {p2, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 198
    :cond_1
    return-void
.end method

.method static describe(Landroid/content/Context;Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;)Ljava/lang/String;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "snapshot"    # Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;

    .line 143
    if-nez p1, :cond_0

    .line 144
    const-string v0, ""

    return-object v0

    .line 147
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p1, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;->result:Lorg/wiiucoop/bo2android/T6GameData$Result;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6GameData$Result;->detail:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 149
    .local v0, "detail":Ljava/lang/StringBuilder;
    iget-boolean v1, p1, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;->rawReadable:Z

    if-nez v1, :cond_3

    .line 150
    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 151
    iget-object v1, p1, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;->rawPath:Ljava/lang/String;

    if-eqz v1, :cond_2

    iget-object v1, p1, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;->rawPath:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    .line 154
    :cond_1
    const-string v1, "O caminho "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;->rawPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 155
    const-string v2, " n\u00e3o est\u00e1 leg\u00edvel para o aplicativo: o motor n\u00e3o consegue abrir os "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 156
    const-string v2, "arquivos ainda. Use \"Conceder acesso a arquivos\"."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 152
    :cond_2
    :goto_0
    sget v1, Lorg/wiiucoop/bo2android/R$string;->folder_no_raw_path:I

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    :cond_3
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static evaluateFromRaw(Ljava/lang/String;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6GameData$Result;
    .locals 6
    .param p0, "rawPath"    # Ljava/lang/String;
    .param p1, "mode"    # Ljava/lang/String;

    .line 164
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6TreeAccess;->listRawDirectory(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    .line 165
    .local v0, "entries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez v0, :cond_0

    .line 166
    const-string v1, "A pasta selecionada n\u00e3o est\u00e1 acess\u00edvel."

    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6FolderReader;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6GameData$Result;

    move-result-object v1

    return-object v1

    .line 169
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 170
    .local v1, "zoneFastfiles":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v2, "zone"

    invoke-static {v0, v2}, Lorg/wiiucoop/bo2android/T6FolderReader;->findEntryName(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 171
    .local v2, "zoneName":Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 172
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6TreeAccess;->listRawDirectory(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v3

    .line 173
    .local v3, "zoneEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v3, :cond_1

    .line 174
    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 175
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v3, v1}, Lorg/wiiucoop/bo2android/T6FolderReader;->addRawZoneAll(Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)V

    .line 179
    .end local v3    # "zoneEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    new-instance v3, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const/4 v4, 0x1

    invoke-static {v4, v3, v1, p1}, Lorg/wiiucoop/bo2android/T6GameData;->evaluate(ZLjava/util/Collection;Ljava/util/Collection;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6GameData$Result;

    move-result-object v3

    return-object v3
.end method

.method private static fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6GameData$Result;
    .locals 4
    .param p0, "detail"    # Ljava/lang/String;

    .line 201
    new-instance v0, Lorg/wiiucoop/bo2android/T6GameData$Result;

    sget-object v1, Lorg/wiiucoop/bo2android/T6GameData$Level;->FAIL:Lorg/wiiucoop/bo2android/T6GameData$Level;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {v0, v1, p0, v2, v3}, Lorg/wiiucoop/bo2android/T6GameData$Result;-><init>(Lorg/wiiucoop/bo2android/T6GameData$Level;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    return-object v0
.end method

.method private static findEntryName(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
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

    .line 206
    .local p0, "entries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 207
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 208
    return-object v1

    .line 210
    .end local v1    # "key":Ljava/lang/String;
    :cond_0
    goto :goto_0

    .line 211
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method static inspect(Landroid/content/Context;Lorg/wiiucoop/bo2android/T6Config;)Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;
    .locals 14
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "config"    # Lorg/wiiucoop/bo2android/T6Config;

    .line 55
    if-eqz p1, :cond_9

    invoke-virtual {p1}, Lorg/wiiucoop/bo2android/T6Config;->hasFolder()Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_3

    .line 59
    :cond_0
    iget-object v0, p1, Lorg/wiiucoop/bo2android/T6Config;->gameDirUri:Ljava/lang/String;

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6TreeAccess;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 61
    .local v0, "treeUri":Landroid/net/Uri;
    const-string v1, "A pasta selecionada n\u00e3o est\u00e1 acess\u00edvel."

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v0, :cond_2

    .line 65
    iget-object v4, p1, Lorg/wiiucoop/bo2android/T6Config;->gameDirPath:Ljava/lang/String;

    .line 66
    .local v4, "raw":Ljava/lang/String;
    invoke-static {v4}, Lorg/wiiucoop/bo2android/T6TreeAccess;->isReadable(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 67
    new-instance v1, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;

    iget-object v5, p1, Lorg/wiiucoop/bo2android/T6Config;->mode:Ljava/lang/String;

    invoke-static {v4, v5}, Lorg/wiiucoop/bo2android/T6FolderReader;->evaluateFromRaw(Ljava/lang/String;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6GameData$Result;

    move-result-object v5

    invoke-direct {v1, v5, v4, v2, v3}, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;-><init>(Lorg/wiiucoop/bo2android/T6GameData$Result;Ljava/lang/String;ZZ)V

    return-object v1

    .line 69
    :cond_1
    new-instance v2, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;

    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6FolderReader;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6GameData$Result;

    move-result-object v1

    invoke-direct {v2, v1, v4, v3, v3}, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;-><init>(Lorg/wiiucoop/bo2android/T6GameData$Result;Ljava/lang/String;ZZ)V

    return-object v2

    .line 72
    .end local v4    # "raw":Ljava/lang/String;
    :cond_2
    invoke-static {p0, v0}, Lorg/wiiucoop/bo2android/T6TreeAccess;->hasPersistedReadPermission(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 74
    new-instance v1, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;

    sget v4, Lorg/wiiucoop/bo2android/R$string;->folder_permission_revoked:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/wiiucoop/bo2android/T6FolderReader;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6GameData$Result;

    move-result-object v4

    const/4 v5, 0x0

    invoke-direct {v1, v4, v5, v3, v2}, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;-><init>(Lorg/wiiucoop/bo2android/T6GameData$Result;Ljava/lang/String;ZZ)V

    return-object v1

    .line 78
    :cond_3
    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6TreeAccess;->rawPathFor(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v4

    .line 79
    .local v4, "rawPath":Ljava/lang/String;
    invoke-static {v4}, Lorg/wiiucoop/bo2android/T6TreeAccess;->isReadable(Ljava/lang/String;)Z

    move-result v5

    .line 81
    .local v5, "rawReadable":Z
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 82
    .local v6, "rootNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 85
    .local v7, "zoneFastfiles":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v8, "zone"

    if-eqz v5, :cond_6

    .line 86
    invoke-static {v4}, Lorg/wiiucoop/bo2android/T6TreeAccess;->listRawDirectory(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    .line 87
    .local v1, "rawEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v1, :cond_4

    goto :goto_0

    :cond_4
    move v2, v3

    .line 89
    .local v2, "readable":Z
    :goto_0
    if-eqz v1, :cond_5

    .line 90
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v6, v9}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 91
    invoke-static {v1, v8}, Lorg/wiiucoop/bo2android/T6FolderReader;->findEntryName(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 92
    .local v8, "zoneName":Ljava/lang/String;
    if-eqz v8, :cond_5

    .line 93
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 94
    invoke-static {v9}, Lorg/wiiucoop/bo2android/T6TreeAccess;->listRawDirectory(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v9

    .line 95
    .local v9, "zoneEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v9, :cond_5

    .line 96
    invoke-interface {v9}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v11

    invoke-interface {v7, v11}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 97
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10, v9, v7}, Lorg/wiiucoop/bo2android/T6FolderReader;->addRawZoneAll(Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)V

    .line 101
    .end local v1    # "rawEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v8    # "zoneName":Ljava/lang/String;
    .end local v9    # "zoneEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_5
    goto :goto_2

    .line 104
    .end local v2    # "readable":Z
    :cond_6
    :try_start_0
    invoke-static {v0}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 107
    .local v1, "rootDocumentId":Ljava/lang/String;
    nop

    .line 109
    nop

    .line 110
    invoke-static {p0, v0, v1}, Lorg/wiiucoop/bo2android/T6TreeAccess;->listTreeDirectory(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v9

    .line 111
    .local v9, "entries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v9, :cond_7

    goto :goto_1

    :cond_7
    move v2, v3

    .line 113
    .restart local v2    # "readable":Z
    :goto_1
    if-eqz v9, :cond_8

    .line 114
    invoke-interface {v9}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v10

    invoke-interface {v6, v10}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 115
    invoke-static {v9, v8}, Lorg/wiiucoop/bo2android/T6TreeAccess;->findDocumentId(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 116
    .local v8, "zoneDocumentId":Ljava/lang/String;
    if-eqz v8, :cond_8

    .line 117
    nop

    .line 118
    invoke-static {p0, v0, v8}, Lorg/wiiucoop/bo2android/T6TreeAccess;->listTreeDirectory(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v10

    .line 119
    .local v10, "zoneEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v10, :cond_8

    .line 120
    invoke-interface {v10}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v11

    invoke-interface {v7, v11}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 121
    const-string v11, "all"

    invoke-static {v10, v11}, Lorg/wiiucoop/bo2android/T6TreeAccess;->findDocumentId(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 122
    .local v11, "allDocumentId":Ljava/lang/String;
    if-eqz v11, :cond_8

    .line 123
    nop

    .line 124
    invoke-static {p0, v0, v11}, Lorg/wiiucoop/bo2android/T6TreeAccess;->listTreeDirectory(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v12

    .line 125
    .local v12, "allEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v12, :cond_8

    .line 126
    invoke-interface {v12}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v13

    invoke-interface {v7, v13}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 134
    .end local v1    # "rootDocumentId":Ljava/lang/String;
    .end local v8    # "zoneDocumentId":Ljava/lang/String;
    .end local v9    # "entries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v10    # "zoneEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v11    # "allDocumentId":Ljava/lang/String;
    .end local v12    # "allEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_8
    :goto_2
    iget-object v1, p1, Lorg/wiiucoop/bo2android/T6Config;->mode:Ljava/lang/String;

    invoke-static {v2, v6, v7, v1}, Lorg/wiiucoop/bo2android/T6GameData;->evaluate(ZLjava/util/Collection;Ljava/util/Collection;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6GameData$Result;

    move-result-object v1

    .line 135
    .local v1, "result":Lorg/wiiucoop/bo2android/T6GameData$Result;
    new-instance v8, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;

    invoke-direct {v8, v1, v4, v5, v3}, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;-><init>(Lorg/wiiucoop/bo2android/T6GameData$Result;Ljava/lang/String;ZZ)V

    return-object v8

    .line 105
    .end local v1    # "result":Lorg/wiiucoop/bo2android/T6GameData$Result;
    .end local v2    # "readable":Z
    :catch_0
    move-exception v2

    .line 106
    .local v2, "e":Ljava/lang/RuntimeException;
    new-instance v8, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;

    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6FolderReader;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6GameData$Result;

    move-result-object v1

    invoke-direct {v8, v1, v4, v3, v3}, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;-><init>(Lorg/wiiucoop/bo2android/T6GameData$Result;Ljava/lang/String;ZZ)V

    return-object v8

    .line 56
    .end local v0    # "treeUri":Landroid/net/Uri;
    .end local v2    # "e":Ljava/lang/RuntimeException;
    .end local v4    # "rawPath":Ljava/lang/String;
    .end local v5    # "rawReadable":Z
    .end local v6    # "rootNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v7    # "zoneFastfiles":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_9
    :goto_3
    invoke-static {}, Lorg/wiiucoop/bo2android/T6FolderReader;->none()Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;

    move-result-object v0

    return-object v0
.end method

.method static none()Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;
    .locals 4

    .line 51
    new-instance v0, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;

    const-string v1, "Nenhuma pasta do jogo foi selecionada."

    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6FolderReader;->fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6GameData$Result;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3, v3}, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;-><init>(Lorg/wiiucoop/bo2android/T6GameData$Result;Ljava/lang/String;ZZ)V

    return-object v0
.end method
