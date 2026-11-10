.class public final Lorg/wiiucoop/bo2android/T6EnvVars$Var;
.super Ljava/lang/Object;
.source "T6EnvVars.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6EnvVars;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Var"
.end annotation


# instance fields
.field public enabled:Z

.field public name:Ljava/lang/String;

.field public value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "enabled"    # Z

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->name:Ljava/lang/String;

    .line 40
    iput-object p2, p0, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->value:Ljava/lang/String;

    .line 41
    iput-boolean p3, p0, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->enabled:Z

    .line 42
    return-void
.end method


# virtual methods
.method public copy()Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    .locals 4

    .line 45
    new-instance v0, Lorg/wiiucoop/bo2android/T6EnvVars$Var;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->name:Ljava/lang/String;

    iget-object v2, p0, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->value:Ljava/lang/String;

    iget-boolean v3, p0, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->enabled:Z

    invoke-direct {v0, v1, v2, v3}, Lorg/wiiucoop/bo2android/T6EnvVars$Var;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    return-object v0
.end method
