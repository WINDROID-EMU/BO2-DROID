.class public final synthetic Lorg/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lorg/wiiucoop/bo2android/EnvVarsActivity$OnText;


# instance fields
.field public final synthetic f$0:Lorg/wiiucoop/bo2android/T6EnvVars$Var;


# direct methods
.method public synthetic constructor <init>(Lorg/wiiucoop/bo2android/T6EnvVars$Var;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda0;->f$0:Lorg/wiiucoop/bo2android/T6EnvVars$Var;

    return-void
.end method


# virtual methods
.method public final changed(Ljava/lang/String;)V
    .locals 1

    .line 0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda0;->f$0:Lorg/wiiucoop/bo2android/T6EnvVars$Var;

    invoke-static {v0, p1}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->lambda$rebuildRows$2(Lorg/wiiucoop/bo2android/T6EnvVars$Var;Ljava/lang/String;)V

    return-void
.end method
