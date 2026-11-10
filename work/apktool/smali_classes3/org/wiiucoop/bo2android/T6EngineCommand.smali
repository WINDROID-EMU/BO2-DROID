.class public final Lorg/wiiucoop/bo2android/T6EngineCommand;
.super Ljava/lang/Object;
.source "T6EngineCommand.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/wiiucoop/bo2android/T6EngineCommand$Result;
    }
.end annotation


# static fields
.field public static final DVAR_FPS_OVERLAY:Ljava/lang/String; = "cg_drawfps"

.field public static final VALUE_OFF:Ljava/lang/String; = "0"

.field public static final VALUE_ON:Ljava/lang/String; = "1"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    return-void
.end method

.method public static describe(Lorg/wiiucoop/bo2android/T6EngineCommand$Result;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "result"    # Lorg/wiiucoop/bo2android/T6EngineCommand$Result;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 134
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 135
    .local v0, "text":Ljava/lang/StringBuilder;
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u2014 "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    iget-boolean v1, p0, Lorg/wiiucoop/bo2android/T6EngineCommand$Result;->applied:Z

    if-eqz v1, :cond_0

    .line 138
    const-string v1, "aplicado pelo motor"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 139
    :cond_0
    iget-boolean v1, p0, Lorg/wiiucoop/bo2android/T6EngineCommand$Result;->accepted:Z

    if-eqz v1, :cond_1

    .line 140
    const-string v1, "N\u00c3O aplicado ao motor (aguardando o motor)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 144
    :cond_1
    const-string v1, "N\u00c3O aplicado ao motor"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    :goto_0
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6EngineCommand$Result;->reason:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 148
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/wiiucoop/bo2android/T6EngineCommand$Result;->reason:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static parse(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6EngineCommand$Result;
    .locals 18
    .param p0, "text"    # Ljava/lang/String;

    .line 91
    move-object/from16 v0, p0

    if-eqz v0, :cond_8

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_3

    .line 95
    :cond_0
    const/4 v1, 0x0

    .line 96
    .local v1, "sawAccepted":Z
    const/4 v2, 0x0

    .line 97
    .local v2, "accepted":Z
    const/4 v3, 0x0

    .line 98
    .local v3, "applied":Z
    const/4 v4, 0x0

    .line 99
    .local v4, "pending":I
    const-string v5, ""

    .line 101
    .local v5, "reason":Ljava/lang/String;
    const-string v6, "\n"

    invoke-virtual {v0, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    array-length v7, v6

    const/4 v8, 0x0

    move v9, v8

    :goto_0
    if-ge v9, v7, :cond_6

    aget-object v10, v6, v9

    .line 102
    .local v10, "rawLine":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v11

    .line 103
    .local v11, "line":Ljava/lang/String;
    const/16 v12, 0x3d

    invoke-virtual {v11, v12}, Ljava/lang/String;->indexOf(I)I

    move-result v12

    .line 105
    .local v12, "separator":I
    if-gtz v12, :cond_1

    .line 106
    goto :goto_1

    .line 109
    :cond_1
    invoke-virtual {v11, v8, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v13

    .line 110
    .local v13, "key":Ljava/lang/String;
    add-int/lit8 v14, v12, 0x1

    invoke-virtual {v11, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v14

    .line 112
    .local v14, "value":Ljava/lang/String;
    const-string v15, "accepted"

    invoke-virtual {v15, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    const-string v8, "true"

    if-eqz v15, :cond_2

    .line 113
    const/4 v1, 0x1

    .line 114
    invoke-virtual {v8, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_1

    .line 115
    :cond_2
    const-string v15, "applied"

    invoke-virtual {v15, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_3

    .line 116
    invoke-virtual {v8, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    goto :goto_1

    .line 117
    :cond_3
    const-string v8, "pending"

    invoke-virtual {v8, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 118
    invoke-static {v14}, Lorg/wiiucoop/bo2android/T6EngineCommand;->parseCount(Ljava/lang/String;)I

    move-result v4

    goto :goto_1

    .line 119
    :cond_4
    const-string v8, "reason"

    invoke-virtual {v8, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 120
    move-object v5, v14

    .line 101
    .end local v10    # "rawLine":Ljava/lang/String;
    .end local v11    # "line":Ljava/lang/String;
    .end local v12    # "separator":I
    .end local v13    # "key":Ljava/lang/String;
    .end local v14    # "value":Ljava/lang/String;
    :cond_5
    :goto_1
    add-int/lit8 v9, v9, 0x1

    const/4 v8, 0x0

    goto :goto_0

    .line 126
    :cond_6
    new-instance v6, Lorg/wiiucoop/bo2android/T6EngineCommand$Result;

    if-eqz v3, :cond_7

    if-eqz v2, :cond_7

    const/4 v8, 0x1

    move v11, v8

    goto :goto_2

    :cond_7
    const/4 v11, 0x0

    :goto_2
    move-object v9, v6

    move v10, v2

    move v12, v4

    move-object v13, v5

    move v14, v1

    invoke-direct/range {v9 .. v14}, Lorg/wiiucoop/bo2android/T6EngineCommand$Result;-><init>(ZZILjava/lang/String;Z)V

    return-object v6

    .line 92
    .end local v1    # "sawAccepted":Z
    .end local v2    # "accepted":Z
    .end local v3    # "applied":Z
    .end local v4    # "pending":I
    .end local v5    # "reason":Ljava/lang/String;
    :cond_8
    :goto_3
    new-instance v1, Lorg/wiiucoop/bo2android/T6EngineCommand$Result;

    const-string v16, ""

    const/16 v17, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object v12, v1

    invoke-direct/range {v12 .. v17}, Lorg/wiiucoop/bo2android/T6EngineCommand$Result;-><init>(ZZILjava/lang/String;Z)V

    return-object v1
.end method

.method private static parseCount(Ljava/lang/String;)I
    .locals 2
    .param p0, "value"    # Ljava/lang/String;

    .line 161
    const/4 v0, 0x0

    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    .local v1, "count":I
    if-gez v1, :cond_0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    return v0

    .line 163
    .end local v1    # "count":I
    :catch_0
    move-exception v1

    .line 164
    .local v1, "e":Ljava/lang/NumberFormatException;
    return v0
.end method

.method public static queuedForEngine(Lorg/wiiucoop/bo2android/T6EngineCommand$Result;)Z
    .locals 1
    .param p0, "result"    # Lorg/wiiucoop/bo2android/T6EngineCommand$Result;

    .line 156
    iget-boolean v0, p0, Lorg/wiiucoop/bo2android/T6EngineCommand$Result;->accepted:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/wiiucoop/bo2android/T6EngineCommand$Result;->applied:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static requestDvar(Ljava/lang/String;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6EngineCommand$Result;
    .locals 9
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .line 75
    invoke-static {p0, p1}, Lorg/wiiucoop/bo2android/T6Native;->submitDvar(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 76
    .local v0, "answer":Ljava/lang/String;
    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6EngineCommand;->parse(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6EngineCommand$Result;

    move-result-object v1

    .line 78
    .local v1, "result":Lorg/wiiucoop/bo2android/T6EngineCommand$Result;
    iget-boolean v2, v1, Lorg/wiiucoop/bo2android/T6EngineCommand$Result;->answered:Z

    if-eqz v2, :cond_0

    .line 79
    return-object v1

    .line 82
    :cond_0
    new-instance v2, Lorg/wiiucoop/bo2android/T6EngineCommand$Result;

    .line 83
    invoke-static {}, Lorg/wiiucoop/bo2android/T6Native;->isLibraryLoaded()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 84
    const-string v3, "a libt6host.so n\u00e3o respondeu ao pedido; nada foi enviado ao motor"

    move-object v7, v3

    goto :goto_0

    .line 85
    :cond_1
    const-string v3, "a libt6host.so n\u00e3o est\u00e1 carregada neste processo; nada foi enviado ao motor"

    move-object v7, v3

    :goto_0
    const/4 v8, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v3, v2

    invoke-direct/range {v3 .. v8}, Lorg/wiiucoop/bo2android/T6EngineCommand$Result;-><init>(ZZILjava/lang/String;Z)V

    .line 82
    return-object v2
.end method

.method public static setFpsOverlay(Z)Lorg/wiiucoop/bo2android/T6EngineCommand$Result;
    .locals 2
    .param p0, "enabled"    # Z

    .line 67
    if-eqz p0, :cond_0

    const-string v0, "1"

    goto :goto_0

    :cond_0
    const-string v0, "0"

    :goto_0
    const-string v1, "cg_drawfps"

    invoke-static {v1, v0}, Lorg/wiiucoop/bo2android/T6EngineCommand;->requestDvar(Ljava/lang/String;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6EngineCommand$Result;

    move-result-object v0

    return-object v0
.end method
