.class public final Lorg/wiiucoop/bo2android/T6EnvVars;
.super Ljava/lang/Object;
.source "T6EnvVars.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/wiiucoop/bo2android/T6EnvVars$Problem;,
        Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    }
.end annotation


# static fields
.field public static final APPLIED_FILE_NAME:Ljava/lang/String; = "env_vars_applied.txt"

.field public static final FILE_NAME:Ljava/lang/String; = "env_vars.cfg"

.field public static final MAX_NAME:I = 0x40

.field public static final MAX_VALUE:I = 0x400

.field public static final MAX_VARS:I = 0x40


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    return-void
.end method

.method public static applied(Ljava/io/File;)Ljava/util/Map;
    .locals 7
    .param p0, "filesDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 150
    new-instance v0, Ljava/io/File;

    const-string v1, "env_vars_applied.txt"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 151
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return-object v2

    .line 153
    :cond_0
    :try_start_0
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 154
    .local v1, "out":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v3, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object v4

    invoke-static {v4}, Ljava/nio/file/Files;->readAllBytes(Ljava/nio/file/Path;)[B

    move-result-object v4

    sget-object v5, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v3, v4, v5}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6EnvVars;->parse(Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/wiiucoop/bo2android/T6EnvVars$Var;

    .local v4, "v":Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    iget-object v5, v4, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->name:Ljava/lang/String;

    iget-object v6, v4, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->value:Ljava/lang/String;

    invoke-interface {v1, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 155
    .end local v4    # "v":Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    :cond_1
    return-object v1

    .line 156
    .end local v1    # "out":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_0
    move-exception v1

    .line 157
    .local v1, "e":Ljava/io/IOException;
    return-object v2
.end method

.method public static effective(Ljava/util/List;)Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/wiiucoop/bo2android/T6EnvVars$Var;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 140
    .local p0, "vars":Ljava/util/List;, "Ljava/util/List<Lorg/wiiucoop/bo2android/T6EnvVars$Var;>;"
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 141
    .local v0, "out":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/wiiucoop/bo2android/T6EnvVars$Var;

    .line 142
    .local v2, "v":Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    iget-boolean v3, v2, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->enabled:Z

    if-eqz v3, :cond_0

    iget-object v3, v2, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->name:Ljava/lang/String;

    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6EnvVars;->nameProblem(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    move-result-object v3

    sget-object v4, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->OK:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    if-ne v3, v4, :cond_0

    iget-object v3, v2, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->value:Ljava/lang/String;

    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6EnvVars;->valueProblem(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    move-result-object v3

    sget-object v4, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->OK:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    if-eq v3, v4, :cond_1

    goto :goto_0

    .line 143
    :cond_1
    iget-object v3, v2, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->name:Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    iget-object v3, v2, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->name:Ljava/lang/String;

    iget-object v4, v2, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->value:Ljava/lang/String;

    if-nez v4, :cond_2

    const-string v4, ""

    goto :goto_1

    :cond_2
    iget-object v4, v2, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->value:Ljava/lang/String;

    :goto_1
    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    .end local v2    # "v":Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    :cond_3
    goto :goto_0

    .line 145
    :cond_4
    return-object v0
.end method

.method public static listProblem(Ljava/util/List;[I)Lorg/wiiucoop/bo2android/T6EnvVars$Problem;
    .locals 6
    .param p1, "at"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/wiiucoop/bo2android/T6EnvVars$Var;",
            ">;[I)",
            "Lorg/wiiucoop/bo2android/T6EnvVars$Problem;"
        }
    .end annotation

    .line 79
    .local p0, "vars":Ljava/util/List;, "Ljava/util/List<Lorg/wiiucoop/bo2android/T6EnvVars$Var;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_5

    .line 80
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/wiiucoop/bo2android/T6EnvVars$Var;

    .line 81
    .local v1, "v":Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    iget-object v2, v1, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->name:Ljava/lang/String;

    invoke-static {v2}, Lorg/wiiucoop/bo2android/T6EnvVars;->nameProblem(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    move-result-object v2

    .line 82
    .local v2, "p":Lorg/wiiucoop/bo2android/T6EnvVars$Problem;
    sget-object v3, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->OK:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    if-ne v2, v3, :cond_0

    iget-object v3, v1, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->value:Ljava/lang/String;

    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6EnvVars;->valueProblem(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    move-result-object v2

    .line 83
    :cond_0
    sget-object v3, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->OK:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    if-ne v2, v3, :cond_2

    .line 84
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1
    if-ge v3, v0, :cond_2

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/wiiucoop/bo2android/T6EnvVars$Var;

    iget-object v4, v4, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->name:Ljava/lang/String;

    iget-object v5, v1, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    sget-object v2, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->DUPLICATE:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 86
    .end local v3    # "j":I
    :cond_2
    sget-object v3, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->OK:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    if-eq v2, v3, :cond_4

    .line 87
    if-eqz p1, :cond_3

    array-length v3, p1

    if-lez v3, :cond_3

    const/4 v3, 0x0

    aput v0, p1, v3

    .line 88
    :cond_3
    return-object v2

    .line 79
    .end local v1    # "v":Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    .end local v2    # "p":Lorg/wiiucoop/bo2android/T6EnvVars$Problem;
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 91
    .end local v0    # "i":I
    :cond_5
    sget-object v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->OK:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    return-object v0
.end method

.method public static load(Ljava/io/File;)Ljava/util/List;
    .locals 4
    .param p0, "filesDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Ljava/util/List<",
            "Lorg/wiiucoop/bo2android/T6EnvVars$Var;",
            ">;"
        }
    .end annotation

    .line 115
    new-instance v0, Ljava/io/File;

    const-string v1, "env_vars.cfg"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 116
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    return-object v1

    .line 118
    :cond_0
    :try_start_0
    new-instance v1, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object v2

    invoke-static {v2}, Ljava/nio/file/Files;->readAllBytes(Ljava/nio/file/Path;)[B

    move-result-object v2

    sget-object v3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v1, v2, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6EnvVars;->parse(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 119
    :catch_0
    move-exception v1

    .line 120
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    return-object v2
.end method

.method public static nameProblem(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6EnvVars$Problem;
    .locals 4
    .param p0, "name"    # Ljava/lang/String;

    .line 54
    if-eqz p0, :cond_c

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_4

    .line 55
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x40

    if-le v0, v1, :cond_1

    sget-object v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->NAME_TOO_LONG:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    return-object v0

    .line 56
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_7

    .line 57
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 58
    .local v1, "c":C
    const/16 v2, 0x41

    if-lt v1, v2, :cond_2

    const/16 v2, 0x5a

    if-le v1, v2, :cond_5

    :cond_2
    const/16 v2, 0x61

    if-lt v1, v2, :cond_3

    const/16 v2, 0x7a

    if-le v1, v2, :cond_5

    :cond_3
    const/16 v2, 0x5f

    if-eq v1, v2, :cond_5

    if-lez v0, :cond_4

    const/16 v2, 0x30

    if-lt v1, v2, :cond_4

    const/16 v2, 0x39

    if-gt v1, v2, :cond_4

    goto :goto_1

    :cond_4
    const/4 v2, 0x0

    goto :goto_2

    :cond_5
    :goto_1
    const/4 v2, 0x1

    .line 59
    .local v2, "ok":Z
    :goto_2
    if-nez v2, :cond_6

    sget-object v3, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->NAME_SYNTAX:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    return-object v3

    .line 56
    .end local v1    # "c":C
    .end local v2    # "ok":Z
    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 63
    .end local v0    # "i":I
    :cond_7
    const-string v0, "LD_"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    sget-object v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->LINKER:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    return-object v0

    .line 64
    :cond_8
    const-string v0, "ANDROID_"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_b

    const-string v0, "PATH"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    const-string v0, "CLASSPATH"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_b

    const-string v0, "EXTERNAL_STORAGE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_3

    .line 66
    :cond_9
    const-string v0, "DXVK_WSI_DRIVER"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    sget-object v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->DXVK_WSI:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    return-object v0

    .line 67
    :cond_a
    sget-object v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->OK:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    return-object v0

    .line 65
    :cond_b
    :goto_3
    sget-object v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->ANDROID_RUNTIME:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    return-object v0

    .line 54
    :cond_c
    :goto_4
    sget-object v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->EMPTY_NAME:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    return-object v0
.end method

.method public static parse(Ljava/lang/String;)Ljava/util/List;
    .locals 13
    .param p0, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lorg/wiiucoop/bo2android/T6EnvVars$Var;",
            ">;"
        }
    .end annotation

    .line 95
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 96
    .local v0, "out":Ljava/util/List;, "Ljava/util/List<Lorg/wiiucoop/bo2android/T6EnvVars$Var;>;"
    if-nez p0, :cond_0

    return-object v0

    .line 97
    :cond_0
    const-string v1, "\n"

    const/4 v2, -0x1

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_7

    aget-object v5, v1, v4

    .line 98
    .local v5, "line":Ljava/lang/String;
    const-string v6, "\r"

    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    const/4 v7, 0x1

    if-eqz v6, :cond_1

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v6, v7

    invoke-virtual {v5, v3, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 99
    :cond_1
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_6

    invoke-virtual {v5, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v8, 0x23

    if-ne v6, v8, :cond_2

    goto :goto_2

    .line 100
    :cond_2
    invoke-virtual {v5, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 101
    .local v6, "sw":C
    const/16 v8, 0x3d

    invoke-virtual {v5, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    .line 102
    .local v8, "eq":I
    const/16 v9, 0x2b

    if-eq v6, v9, :cond_3

    const/16 v10, 0x2d

    if-ne v6, v10, :cond_6

    :cond_3
    if-ge v8, v7, :cond_4

    goto :goto_2

    .line 103
    :cond_4
    new-instance v10, Lorg/wiiucoop/bo2android/T6EnvVars$Var;

    invoke-virtual {v5, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    add-int/lit8 v12, v8, 0x1

    invoke-virtual {v5, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v12

    if-ne v6, v9, :cond_5

    goto :goto_1

    :cond_5
    move v7, v3

    :goto_1
    invoke-direct {v10, v11, v12, v7}, Lorg/wiiucoop/bo2android/T6EnvVars$Var;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-interface {v0, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    .end local v5    # "line":Ljava/lang/String;
    .end local v6    # "sw":C
    .end local v8    # "eq":I
    :cond_6
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 105
    :cond_7
    return-object v0
.end method

.method public static pendingRestart(ZLjava/util/Map;Ljava/util/List;)Z
    .locals 4
    .param p0, "gameRunning"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Lorg/wiiucoop/bo2android/T6EnvVars$Var;",
            ">;)Z"
        }
    .end annotation

    .line 163
    .local p1, "applied":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p2, "saved":Ljava/util/List;, "Ljava/util/List<Lorg/wiiucoop/bo2android/T6EnvVars$Var;>;"
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 164
    :cond_0
    invoke-static {p2}, Lorg/wiiucoop/bo2android/T6EnvVars;->effective(Ljava/util/List;)Ljava/util/Map;

    move-result-object v1

    .line 165
    .local v1, "next":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v2, 0x1

    if-nez p1, :cond_1

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    goto :goto_0

    :cond_1
    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    :goto_0
    move v0, v2

    :cond_2
    return v0
.end method

.method public static save(Ljava/io/File;Ljava/util/List;)V
    .locals 5
    .param p0, "filesDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ljava/util/List<",
            "Lorg/wiiucoop/bo2android/T6EnvVars$Var;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 126
    .local p1, "vars":Ljava/util/List;, "Ljava/util/List<Lorg/wiiucoop/bo2android/T6EnvVars$Var;>;"
    new-instance v0, Ljava/io/File;

    const-string v1, "env_vars.cfg"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 127
    .local v0, "f":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    const-string v2, "env_vars.cfg.tmp"

    invoke-direct {v1, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 128
    .local v1, "tmp":Ljava/io/File;
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 129
    .local v2, "out":Ljava/io/FileOutputStream;
    :try_start_0
    invoke-static {p1}, Lorg/wiiucoop/bo2android/T6EnvVars;->serialize(Ljava/util/List;)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/FileOutputStream;->write([B)V

    .line 130
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/FileDescriptor;->sync()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 131
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    .line 132
    .end local v2    # "out":Ljava/io/FileOutputStream;
    invoke-virtual {v1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 136
    return-void

    .line 133
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 134
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "could not replace "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 128
    .restart local v2    # "out":Ljava/io/FileOutputStream;
    :catchall_0
    move-exception v3

    :try_start_1
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v4

    invoke-virtual {v3, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw v3
.end method

.method public static serialize(Ljava/util/List;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/wiiucoop/bo2android/T6EnvVars$Var;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 109
    .local p0, "vars":Ljava/util/List;, "Ljava/util/List<Lorg/wiiucoop/bo2android/T6EnvVars$Var;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "# Settings > Environment variables. +NAME=value is applied at the next game start, -NAME=value is not.\n"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 110
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/wiiucoop/bo2android/T6EnvVars$Var;

    .local v2, "v":Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    iget-boolean v3, v2, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->enabled:Z

    if-eqz v3, :cond_0

    const/16 v3, 0x2b

    goto :goto_1

    :cond_0
    const/16 v3, 0x2d

    :goto_1
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v2, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x3d

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v2, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->value:Ljava/lang/String;

    if-nez v4, :cond_1

    const-string v4, ""

    goto :goto_2

    :cond_1
    iget-object v4, v2, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->value:Ljava/lang/String;

    :goto_2
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 111
    .end local v2    # "v":Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static valueProblem(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6EnvVars$Problem;
    .locals 2
    .param p0, "value"    # Ljava/lang/String;

    .line 71
    if-nez p0, :cond_0

    sget-object v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->OK:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    return-object v0

    .line 72
    :cond_0
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    array-length v0, v0

    const/16 v1, 0x400

    if-le v0, v1, :cond_1

    sget-object v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->VALUE_TOO_LONG:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    return-object v0

    .line 73
    :cond_1
    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_3

    const/16 v0, 0xd

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_3

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_2

    goto :goto_0

    .line 74
    :cond_2
    sget-object v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->OK:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    return-object v0

    .line 73
    :cond_3
    :goto_0
    sget-object v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->VALUE_LINE_BREAK:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    return-object v0
.end method
