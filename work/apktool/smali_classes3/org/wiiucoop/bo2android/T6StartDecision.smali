.class public final Lorg/wiiucoop/bo2android/T6StartDecision;
.super Ljava/lang/Object;
.source "T6StartDecision.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/wiiucoop/bo2android/T6StartDecision$Decision;,
        Lorg/wiiucoop/bo2android/T6StartDecision$Code;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    return-void
.end method

.method public static describeLaunch(Lorg/wiiucoop/bo2android/T6StartDecision$Decision;Lorg/wiiucoop/bo2android/T6Config;)Ljava/lang/String;
    .locals 3
    .param p0, "decision"    # Lorg/wiiucoop/bo2android/T6StartDecision$Decision;
    .param p1, "config"    # Lorg/wiiucoop/bo2android/T6Config;

    .line 72
    if-eqz p0, :cond_2

    iget-boolean v0, p0, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;->canLaunchHost:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 76
    :cond_0
    iget-object v0, p1, Lorg/wiiucoop/bo2android/T6Config;->mode:Ljava/lang/String;

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6Config;->modeLabel(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 78
    .local v0, "client":Ljava/lang/String;
    iget-boolean v1, p0, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;->canLoadEngine:Z

    const-string v2, "Cliente "

    if-eqz v1, :cond_1

    .line 79
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " pronto para iniciar."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 82
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " selecionado e pasta validada. O host gr\u00e1fico ser\u00e1 iniciado (janela SDL3, superf\u00edcie Vulkan e DXVK D3D11), mas o cliente n\u00e3o pode carregar ainda: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;->reason:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 73
    .end local v0    # "client":Ljava/lang/String;
    :cond_2
    :goto_0
    if-nez p0, :cond_3

    const-string v0, ""

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;->reason:Ljava/lang/String;

    :goto_1
    return-object v0
.end method

.method public static evaluate(Lorg/wiiucoop/bo2android/T6Config;Lorg/wiiucoop/bo2android/T6GameData$Result;ZLjava/lang/String;)Lorg/wiiucoop/bo2android/T6StartDecision$Decision;
    .locals 4
    .param p0, "config"    # Lorg/wiiucoop/bo2android/T6Config;
    .param p1, "data"    # Lorg/wiiucoop/bo2android/T6GameData$Result;
    .param p2, "engineRuntimeAvailable"    # Z
    .param p3, "engineRuntimeReason"    # Ljava/lang/String;

    .line 45
    const/4 v0, 0x0

    if-eqz p0, :cond_7

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6Config;->hasFolder()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_4

    .line 50
    :cond_0
    if-eqz p1, :cond_5

    invoke-virtual {p1}, Lorg/wiiucoop/bo2android/T6GameData$Result;->allowsStart()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_2

    .line 55
    :cond_1
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6Config;->hasMode()Z

    move-result v1

    if-nez v1, :cond_2

    .line 56
    new-instance v1, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;

    sget-object v2, Lorg/wiiucoop/bo2android/T6StartDecision$Code;->NO_MODE:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    const-string v3, "Escolha MULTIPLAYER ou ZOMBIES antes de iniciar."

    invoke-direct {v1, v2, v0, v0, v3}, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;-><init>(Lorg/wiiucoop/bo2android/T6StartDecision$Code;ZZLjava/lang/String;)V

    return-object v1

    .line 60
    :cond_2
    if-eqz p3, :cond_4

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_0

    .line 62
    :cond_3
    move-object v0, p3

    goto :goto_1

    .line 61
    :cond_4
    :goto_0
    const-string v0, "O runtime do motor n\u00e3o est\u00e1 dispon\u00edvel nesta compila\u00e7\u00e3o."

    .line 62
    :goto_1
    nop

    .line 64
    .local v0, "runtimeReason":Ljava/lang/String;
    new-instance v1, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;

    sget-object v2, Lorg/wiiucoop/bo2android/T6StartDecision$Code;->READY:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, p2, v0}, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;-><init>(Lorg/wiiucoop/bo2android/T6StartDecision$Code;ZZLjava/lang/String;)V

    return-object v1

    .line 51
    .end local v0    # "runtimeReason":Ljava/lang/String;
    :cond_5
    :goto_2
    new-instance v1, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;

    sget-object v2, Lorg/wiiucoop/bo2android/T6StartDecision$Code;->FOLDER_UNUSABLE:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    .line 52
    if-nez p1, :cond_6

    const-string v3, "A pasta n\u00e3o foi validada."

    goto :goto_3

    :cond_6
    iget-object v3, p1, Lorg/wiiucoop/bo2android/T6GameData$Result;->detail:Ljava/lang/String;

    :goto_3
    invoke-direct {v1, v2, v0, v0, v3}, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;-><init>(Lorg/wiiucoop/bo2android/T6StartDecision$Code;ZZLjava/lang/String;)V

    .line 51
    return-object v1

    .line 46
    :cond_7
    :goto_4
    new-instance v1, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;

    sget-object v2, Lorg/wiiucoop/bo2android/T6StartDecision$Code;->NO_FOLDER:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    const-string v3, "Nenhuma pasta do jogo foi selecionada."

    invoke-direct {v1, v2, v0, v0, v3}, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;-><init>(Lorg/wiiucoop/bo2android/T6StartDecision$Code;ZZLjava/lang/String;)V

    return-object v1
.end method
