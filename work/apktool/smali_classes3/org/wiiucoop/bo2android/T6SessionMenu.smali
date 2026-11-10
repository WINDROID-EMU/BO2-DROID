.class public final Lorg/wiiucoop/bo2android/T6SessionMenu;
.super Ljava/lang/Object;
.source "T6SessionMenu.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;,
        Lorg/wiiucoop/bo2android/T6SessionMenu$Snapshot;
    }
.end annotation


# static fields
.field public static final ACTION_DOWN:I = 0x0

.field public static final ACTION_UP:I = 0x1

.field public static final FLAG_FALLBACK:I = 0x400

.field public static final KEY_CODE_BACK:I = 0x4

.field public static final SOURCE_GAMEPAD:I = 0x401

.field public static final SOURCE_JOYSTICK:I = 0x1000010


# instance fields
.field private visible:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isBackKey(I)Z
    .locals 1
    .param p0, "keyCode"    # I

    .line 68
    const/4 v0, 0x4

    if-ne p0, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isBackPress(II)Z
    .locals 1
    .param p0, "keyCode"    # I
    .param p1, "action"    # I

    .line 76
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6SessionMenu;->isBackKey(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isPanelBack(III)Z
    .locals 3
    .param p0, "keyCode"    # I
    .param p1, "source"    # I
    .param p2, "flags"    # I

    .line 90
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6SessionMenu;->isBackKey(I)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 91
    :cond_0
    and-int/lit16 v0, p2, 0x400

    if-eqz v0, :cond_1

    return v1

    .line 92
    :cond_1
    and-int/lit16 v0, p1, 0x401

    const/16 v2, 0x401

    if-eq v0, v2, :cond_2

    const v0, 0x1000010

    and-int v2, p1, v0

    if-eq v2, v0, :cond_2

    const/4 v1, 0x1

    :cond_2
    return v1
.end method

.method public static snapshot(Lorg/wiiucoop/bo2android/T6Config;Lorg/wiiucoop/bo2android/T6SessionState;Lorg/wiiucoop/bo2android/T6EngineCommand$Result;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6SessionMenu$Snapshot;
    .locals 12
    .param p0, "config"    # Lorg/wiiucoop/bo2android/T6Config;
    .param p1, "state"    # Lorg/wiiucoop/bo2android/T6SessionState;
    .param p2, "lastFps"    # Lorg/wiiucoop/bo2android/T6EngineCommand$Result;
    .param p3, "fpsRequested"    # Ljava/lang/String;

    .line 166
    if-nez p1, :cond_0

    sget-object v0, Lorg/wiiucoop/bo2android/T6SessionState;->UNAVAILABLE:Lorg/wiiucoop/bo2android/T6SessionState;

    goto :goto_0

    :cond_0
    move-object v0, p1

    .line 171
    .local v0, "session":Lorg/wiiucoop/bo2android/T6SessionState;
    :goto_0
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6Config;->hasMode()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_1

    .line 174
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cliente: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/wiiucoop/bo2android/T6Config;->mode:Ljava/lang/String;

    invoke-static {v2}, Lorg/wiiucoop/bo2android/T6Config;->modeLabel(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/wiiucoop/bo2android/T6Config;->mode:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .local v1, "client":Ljava/lang/String;
    goto :goto_2

    .line 172
    .end local v1    # "client":Ljava/lang/String;
    :cond_2
    :goto_1
    const-string v1, "Cliente: nenhum selecionado"

    .line 177
    .restart local v1    # "client":Ljava/lang/String;
    :goto_2
    if-eqz p0, :cond_5

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6Config;->hasFolder()Z

    move-result v2

    if-nez v2, :cond_3

    goto :goto_4

    .line 180
    :cond_3
    iget-object v2, p0, Lorg/wiiucoop/bo2android/T6Config;->gameDirDisplay:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object v2, p0, Lorg/wiiucoop/bo2android/T6Config;->gameDirUri:Ljava/lang/String;

    goto :goto_3

    :cond_4
    iget-object v2, p0, Lorg/wiiucoop/bo2android/T6Config;->gameDirDisplay:Ljava/lang/String;

    .line 181
    .local v2, "display":Ljava/lang/String;
    :goto_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Pasta do jogo: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v8, v3

    .local v3, "folder":Ljava/lang/String;
    goto :goto_5

    .line 178
    .end local v2    # "display":Ljava/lang/String;
    .end local v3    # "folder":Ljava/lang/String;
    :cond_5
    :goto_4
    const-string v3, "Pasta do jogo: nenhuma selecionada"

    move-object v8, v3

    .line 185
    .local v8, "folder":Ljava/lang/String;
    :goto_5
    iget-boolean v2, v0, Lorg/wiiucoop/bo2android/T6SessionState;->answered:Z

    if-nez v2, :cond_6

    .line 186
    const-string v2, "Sess\u00e3o: o host n\u00e3o respondeu sobre esta execu\u00e7\u00e3o"

    move-object v9, v2

    .local v2, "sessionLine":Ljava/lang/String;
    goto :goto_6

    .line 188
    .end local v2    # "sessionLine":Ljava/lang/String;
    :cond_6
    sget-object v2, Lorg/wiiucoop/bo2android/T6SessionMenu$1;->$SwitchMap$org$wiiucoop$bo2android$T6SessionState$State:[I

    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6SessionState;->state:Lorg/wiiucoop/bo2android/T6SessionState$State;

    invoke-virtual {v3}, Lorg/wiiucoop/bo2android/T6SessionState$State;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 200
    const-string v2, "Sess\u00e3o: estado desconhecido"

    move-object v9, v2

    .restart local v2    # "sessionLine":Ljava/lang/String;
    goto :goto_6

    .line 197
    .end local v2    # "sessionLine":Ljava/lang/String;
    :pswitch_0
    const-string v2, "Sess\u00e3o: o host encerrou a apresenta\u00e7\u00e3o"

    .line 198
    .restart local v2    # "sessionLine":Ljava/lang/String;
    move-object v9, v2

    goto :goto_6

    .line 194
    .end local v2    # "sessionLine":Ljava/lang/String;
    :pswitch_1
    const-string v2, "Sess\u00e3o: o host ainda n\u00e3o come\u00e7ou a apresentar"

    .line 195
    .restart local v2    # "sessionLine":Ljava/lang/String;
    move-object v9, v2

    goto :goto_6

    .line 190
    .end local v2    # "sessionLine":Ljava/lang/String;
    :pswitch_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Sess\u00e3o: host gr\u00e1fico ativo, "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, v0, Lorg/wiiucoop/bo2android/T6SessionState;->frames:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " frames apresentados"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 192
    .restart local v2    # "sessionLine":Ljava/lang/String;
    move-object v9, v2

    .line 205
    .end local v2    # "sessionLine":Ljava/lang/String;
    .local v9, "sessionLine":Ljava/lang/String;
    :goto_6
    iget-boolean v2, v0, Lorg/wiiucoop/bo2android/T6SessionState;->engineAttached:Z

    if-eqz v2, :cond_7

    .line 206
    const-string v2, "Motor do jogo: inicializado"

    move-object v6, v2

    goto :goto_7

    .line 207
    :cond_7
    const-string v2, "Motor do jogo: n\u00e3o inicializado \u2014 nenhum cliente MP/ZM foi carregado"

    move-object v6, v2

    :goto_7
    nop

    .line 210
    .local v6, "engineLine":Ljava/lang/String;
    if-nez p2, :cond_8

    .line 211
    const-string v2, "cg_drawfps: n\u00e3o solicitado nesta sess\u00e3o"

    move-object v10, v2

    .local v2, "fpsLine":Ljava/lang/String;
    goto :goto_a

    .line 213
    .end local v2    # "fpsLine":Ljava/lang/String;
    :cond_8
    if-eqz p3, :cond_a

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_9

    goto :goto_8

    .line 214
    :cond_9
    move-object v2, p3

    goto :goto_9

    :cond_a
    :goto_8
    const-string v2, "0"

    .line 215
    .local v2, "value":Ljava/lang/String;
    :goto_9
    const-string v3, "cg_drawfps"

    invoke-static {p2, v3, v2}, Lorg/wiiucoop/bo2android/T6EngineCommand;->describe(Lorg/wiiucoop/bo2android/T6EngineCommand$Result;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object v10, v3

    .line 218
    .end local v2    # "value":Ljava/lang/String;
    .local v10, "fpsLine":Ljava/lang/String;
    :goto_a
    new-instance v11, Lorg/wiiucoop/bo2android/T6SessionMenu$Snapshot;

    move-object v2, v11

    move-object v3, v1

    move-object v4, v8

    move-object v5, v9

    move-object v7, v10

    invoke-direct/range {v2 .. v7}, Lorg/wiiucoop/bo2android/T6SessionMenu$Snapshot;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v11

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static statusLine(Lorg/wiiucoop/bo2android/T6SessionState;Z)Ljava/lang/String;
    .locals 5
    .param p0, "state"    # Lorg/wiiucoop/bo2android/T6SessionState;
    .param p1, "panelOpen"    # Z

    .line 241
    if-nez p0, :cond_0

    sget-object v0, Lorg/wiiucoop/bo2android/T6SessionState;->UNAVAILABLE:Lorg/wiiucoop/bo2android/T6SessionState;

    goto :goto_0

    :cond_0
    move-object v0, p0

    .line 243
    .local v0, "session":Lorg/wiiucoop/bo2android/T6SessionState;
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 245
    .local v1, "line":Ljava/lang/StringBuilder;
    iget-boolean v2, v0, Lorg/wiiucoop/bo2android/T6SessionState;->answered:Z

    if-nez v2, :cond_1

    .line 246
    const-string v2, "Host gr\u00e1fico: o host nativo n\u00e3o respondeu"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 248
    :cond_1
    sget-object v2, Lorg/wiiucoop/bo2android/T6SessionMenu$1;->$SwitchMap$org$wiiucoop$bo2android$T6SessionState$State:[I

    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6SessionState;->state:Lorg/wiiucoop/bo2android/T6SessionState$State;

    invoke-virtual {v3}, Lorg/wiiucoop/bo2android/T6SessionState$State;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 262
    const-string v2, "Host gr\u00e1fico: estado desconhecido"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 259
    :pswitch_0
    const-string v2, "Host gr\u00e1fico: encerrou a apresenta\u00e7\u00e3o"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    goto :goto_2

    .line 256
    :pswitch_1
    const-string v2, "Host gr\u00e1fico: ainda n\u00e3o come\u00e7ou a apresentar"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 257
    goto :goto_2

    .line 252
    :pswitch_2
    const-string v2, "Host gr\u00e1fico ativo \u00b7 "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, v0, Lorg/wiiucoop/bo2android/T6SessionState;->frames:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 253
    iget-boolean v3, v0, Lorg/wiiucoop/bo2android/T6SessionState;->engineAttached:Z

    if-eqz v3, :cond_2

    const-string v3, " Present() do motor contados pelo host"

    goto :goto_1

    :cond_2
    const-string v3, " frames apresentados"

    :goto_1
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 254
    nop

    .line 267
    :goto_2
    iget-boolean v2, v0, Lorg/wiiucoop/bo2android/T6SessionState;->engineAttached:Z

    if-eqz v2, :cond_3

    .line 268
    const-string v2, " \u00b7 motor do jogo: em execu\u00e7\u00e3o (o FPS na tela \u00e9 o contador do pr\u00f3prio motor)"

    goto :goto_3

    .line 269
    :cond_3
    const-string v2, " \u00b7 motor do jogo: n\u00e3o inicializado (runtime ILP32 ausente)"

    .line 267
    :goto_3
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    if-eqz p1, :cond_4

    .line 272
    const-string v2, " \u00b7 Voltar fecha o menu"

    goto :goto_4

    .line 273
    :cond_4
    const-string v2, " \u00b7 Voltar abre o menu do T6-Recomp"

    .line 271
    :goto_4
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 106
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/wiiucoop/bo2android/T6SessionMenu;->visible:Z

    .line 107
    return-void
.end method

.method public isVisible()Z
    .locals 1

    .line 98
    iget-boolean v0, p0, Lorg/wiiucoop/bo2android/T6SessionMenu;->visible:Z

    return v0
.end method

.method public onBack(Z)Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;
    .locals 1
    .param p1, "hostRunning"    # Z

    .line 123
    iget-boolean v0, p0, Lorg/wiiucoop/bo2android/T6SessionMenu;->visible:Z

    if-eqz v0, :cond_0

    .line 124
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/wiiucoop/bo2android/T6SessionMenu;->visible:Z

    .line 125
    sget-object v0, Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;->CLOSE_PANEL:Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;

    return-object v0

    .line 128
    :cond_0
    if-eqz p1, :cond_1

    .line 129
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/wiiucoop/bo2android/T6SessionMenu;->visible:Z

    .line 130
    sget-object v0, Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;->OPEN_PANEL:Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;

    return-object v0

    .line 134
    :cond_1
    sget-object v0, Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;->LEAVE_SESSION:Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;

    return-object v0
.end method

.method public open()V
    .locals 1

    .line 102
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/wiiucoop/bo2android/T6SessionMenu;->visible:Z

    .line 103
    return-void
.end method
