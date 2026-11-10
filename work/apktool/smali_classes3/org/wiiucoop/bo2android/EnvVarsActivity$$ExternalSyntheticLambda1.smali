.class public final synthetic Lorg/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/EditText;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/EditText;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda1;->f$0:Landroid/widget/EditText;

    return-void
.end method


# virtual methods
.method public final onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda1;->f$0:Landroid/widget/EditText;

    invoke-static {v0, p1, p2, p3}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->lambda$rebuildRows$3(Landroid/widget/EditText;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method
