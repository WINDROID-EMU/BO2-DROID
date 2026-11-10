.class public final synthetic Lorg/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field public final synthetic f$0:Lorg/wiiucoop/bo2android/EnvVarsActivity;

.field public final synthetic f$1:Lorg/wiiucoop/bo2android/T6EnvVars$Var;


# direct methods
.method public synthetic constructor <init>(Lorg/wiiucoop/bo2android/EnvVarsActivity;Lorg/wiiucoop/bo2android/T6EnvVars$Var;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda3;->f$0:Lorg/wiiucoop/bo2android/EnvVarsActivity;

    iput-object p2, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda3;->f$1:Lorg/wiiucoop/bo2android/T6EnvVars$Var;

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda3;->f$0:Lorg/wiiucoop/bo2android/EnvVarsActivity;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda3;->f$1:Lorg/wiiucoop/bo2android/T6EnvVars$Var;

    invoke-virtual {v0, v1, p1, p2}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->lambda$rebuildRows$5$org-wiiucoop-bo2android-EnvVarsActivity(Lorg/wiiucoop/bo2android/T6EnvVars$Var;Landroid/widget/CompoundButton;Z)V

    return-void
.end method
