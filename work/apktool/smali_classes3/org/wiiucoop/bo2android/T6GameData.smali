.class public final Lorg/wiiucoop/bo2android/T6GameData;
.super Ljava/lang/Object;
.source "T6GameData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/wiiucoop/bo2android/T6GameData$Result;,
        Lorg/wiiucoop/bo2android/T6GameData$Level;
    }
.end annotation


# static fields
.field public static final DIR_MAIN:Ljava/lang/String; = "main"

.field public static final DIR_MODS:Ljava/lang/String; = "mods"

.field public static final DIR_PLAYERS:Ljava/lang/String; = "players"

.field public static final DIR_ZONE:Ljava/lang/String; = "zone"

.field private static final ROOT_MARKERS:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 54
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "zone"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "main"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "players"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "mods"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "t6mp.exe"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "t6zm.exe"

    aput-object v2, v0, v1

    sput-object v0, Lorg/wiiucoop/bo2android/T6GameData;->ROOT_MARKERS:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    return-void
.end method

.method public static describeRequirement(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "mode"    # Ljava/lang/String;

    .line 162
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6GameData;->fastfilePrefixFor(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 163
    .local v0, "prefix":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "escolha MULTIPLAYER ou ZOMBIES"

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "zone/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "*.ff"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1
.end method

.method public static evaluate(ZLjava/util/Collection;Ljava/util/Collection;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6GameData$Result;
    .locals 11
    .param p0, "readable"    # Z
    .param p3, "mode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lorg/wiiucoop/bo2android/T6GameData$Result;"
        }
    .end annotation

    .line 88
    .local p1, "rootNames":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .local p2, "zoneFastfiles":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 89
    .local v0, "found":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 91
    .local v1, "missing":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez p0, :cond_0

    .line 92
    const-string v2, "acesso de leitura \u00e0 pasta"

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    new-instance v2, Lorg/wiiucoop/bo2android/T6GameData$Result;

    sget-object v3, Lorg/wiiucoop/bo2android/T6GameData$Level;->FAIL:Lorg/wiiucoop/bo2android/T6GameData$Level;

    const-string v4, "N\u00e3o foi poss\u00edvel ler a pasta escolhida. Conceda o acesso novamente."

    invoke-direct {v2, v3, v4, v0, v1}, Lorg/wiiucoop/bo2android/T6GameData$Result;-><init>(Lorg/wiiucoop/bo2android/T6GameData$Level;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    return-object v2

    .line 97
    :cond_0
    invoke-static {p1}, Lorg/wiiucoop/bo2android/T6GameData;->lowerCase(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v2

    .line 98
    .local v2, "names":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v3, Lorg/wiiucoop/bo2android/T6GameData;->ROOT_MARKERS:[Ljava/lang/String;

    array-length v4, v3

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_2

    aget-object v6, v3, v5

    .line 99
    .local v6, "marker":Ljava/lang/String;
    sget-object v7, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v6, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v2, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 100
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    .end local v6    # "marker":Ljava/lang/String;
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 104
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v3

    const-string v4, "zone/"

    if-eqz v3, :cond_3

    .line 105
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    const-string v3, "main/"

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    const-string v3, "players/"

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    new-instance v3, Lorg/wiiucoop/bo2android/T6GameData$Result;

    sget-object v4, Lorg/wiiucoop/bo2android/T6GameData$Level;->FAIL:Lorg/wiiucoop/bo2android/T6GameData$Level;

    const-string v5, "A pasta n\u00e3o parece conter dados do Black Ops II: n\u00e3o encontrei zone/, main/, players/, mods/ nem os execut\u00e1veis t6mp.exe/t6zm.exe."

    invoke-direct {v3, v4, v5, v0, v1}, Lorg/wiiucoop/bo2android/T6GameData$Result;-><init>(Lorg/wiiucoop/bo2android/T6GameData$Level;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    return-object v3

    .line 113
    :cond_3
    const-string v3, "zone"

    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    const-string v5, ", "

    if-nez v3, :cond_4

    .line 114
    const-string v3, "zone/ (fastfiles)"

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    new-instance v3, Lorg/wiiucoop/bo2android/T6GameData$Result;

    sget-object v4, Lorg/wiiucoop/bo2android/T6GameData$Level;->WARN:Lorg/wiiucoop/bo2android/T6GameData$Level;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Reconheci dados do BO2 ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 116
    invoke-static {v5, v0}, Ljava/lang/String;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "), mas n\u00e3o h\u00e1 a pasta zone/ com os fastfiles do cliente selecionado."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5, v0, v1}, Lorg/wiiucoop/bo2android/T6GameData$Result;-><init>(Lorg/wiiucoop/bo2android/T6GameData$Level;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    .line 115
    return-object v3

    .line 120
    :cond_4
    invoke-static {p3}, Lorg/wiiucoop/bo2android/T6GameData;->fastfilePrefixFor(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 121
    .local v3, "prefix":Ljava/lang/String;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 122
    .local v6, "fastfiles":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {p2}, Lorg/wiiucoop/bo2android/T6GameData;->lowerCase(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_6

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 123
    .local v8, "name":Ljava/lang/String;
    const-string v9, ".ff"

    invoke-virtual {v8, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 124
    invoke-interface {v6, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 126
    .end local v8    # "name":Ljava/lang/String;
    :cond_5
    goto :goto_1

    .line 128
    :cond_6
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_7

    .line 129
    const-string v4, "zone/*.ff"

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    new-instance v4, Lorg/wiiucoop/bo2android/T6GameData$Result;

    sget-object v5, Lorg/wiiucoop/bo2android/T6GameData$Level;->WARN:Lorg/wiiucoop/bo2android/T6GameData$Level;

    const-string v7, "A pasta zone/ existe mas n\u00e3o vi nenhum fastfile (.ff). O cliente pode falhar ao carregar o n\u00edvel."

    invoke-direct {v4, v5, v7, v0, v1}, Lorg/wiiucoop/bo2android/T6GameData$Result;-><init>(Lorg/wiiucoop/bo2android/T6GameData$Level;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    return-object v4

    .line 135
    :cond_7
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_8

    .line 136
    new-instance v4, Lorg/wiiucoop/bo2android/T6GameData$Result;

    sget-object v5, Lorg/wiiucoop/bo2android/T6GameData$Level;->WARN:Lorg/wiiucoop/bo2android/T6GameData$Level;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Dados reconhecidos e "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 137
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " fastfiles vis\u00edveis, mas nenhum modo foi escolhido para conferi-los."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, v5, v7, v0, v1}, Lorg/wiiucoop/bo2android/T6GameData$Result;-><init>(Lorg/wiiucoop/bo2android/T6GameData$Level;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    .line 136
    return-object v4

    .line 141
    :cond_8
    const/4 v7, 0x0

    .line 142
    .local v7, "matching":I
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_a

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 143
    .local v9, "name":Ljava/lang/String;
    invoke-virtual {v9, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_9

    .line 144
    add-int/lit8 v7, v7, 0x1

    .line 146
    .end local v9    # "name":Ljava/lang/String;
    :cond_9
    goto :goto_2

    .line 148
    :cond_a
    if-nez v7, :cond_b

    .line 149
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "*.ff"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 150
    new-instance v4, Lorg/wiiucoop/bo2android/T6GameData$Result;

    sget-object v5, Lorg/wiiucoop/bo2android/T6GameData$Level;->WARN:Lorg/wiiucoop/bo2android/T6GameData$Level;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Encontrei "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 151
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " fastfiles, mas nenhum com o prefixo "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " do cliente "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 152
    invoke-static {p3}, Lorg/wiiucoop/bo2android/T6Config;->modeLabel(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " selecionado."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v4, v5, v8, v0, v1}, Lorg/wiiucoop/bo2android/T6GameData$Result;-><init>(Lorg/wiiucoop/bo2android/T6GameData$Level;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    .line 150
    return-object v4

    .line 155
    :cond_b
    new-instance v4, Lorg/wiiucoop/bo2android/T6GameData$Result;

    sget-object v8, Lorg/wiiucoop/bo2android/T6GameData$Level;->OK:Lorg/wiiucoop/bo2android/T6GameData$Level;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Dados do BO2 encontrados: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 156
    invoke-static {v5, v0}, Ljava/lang/String;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, " e "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, " fastfiles "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, "*.ff do cliente "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 157
    invoke-static {p3}, Lorg/wiiucoop/bo2android/T6Config;->modeLabel(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, "."

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v8, v5, v0, v1}, Lorg/wiiucoop/bo2android/T6GameData$Result;-><init>(Lorg/wiiucoop/bo2android/T6GameData$Level;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    .line 155
    return-object v4
.end method

.method public static fastfilePrefixFor(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "mode"    # Ljava/lang/String;

    .line 63
    const-string v0, "zm"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 64
    const-string v0, "zm_"

    return-object v0

    .line 66
    :cond_0
    const-string v0, "mp"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 67
    const-string v0, "mp_"

    return-object v0

    .line 69
    :cond_1
    const-string v0, ""

    return-object v0
.end method

.method private static lowerCase(Ljava/util/Collection;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 167
    .local p0, "names":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 168
    .local v0, "lowered":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez p0, :cond_0

    .line 169
    return-object v0

    .line 171
    :cond_0
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 172
    .local v2, "name":Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 173
    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 175
    .end local v2    # "name":Ljava/lang/String;
    :cond_1
    goto :goto_0

    .line 176
    :cond_2
    return-object v0
.end method

.method public static rootMarkers()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 73
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 74
    .local v0, "markers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v1, Lorg/wiiucoop/bo2android/T6GameData;->ROOT_MARKERS:[Ljava/lang/String;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v1, v3

    .line 75
    .local v4, "marker":Ljava/lang/String;
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    .end local v4    # "marker":Ljava/lang/String;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 77
    :cond_0
    return-object v0
.end method
