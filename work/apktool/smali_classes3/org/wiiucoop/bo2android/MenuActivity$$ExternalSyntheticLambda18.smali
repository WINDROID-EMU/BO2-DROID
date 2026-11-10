.class public final synthetic Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda18;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/widget/TextView;

.field public final synthetic f$1:Z


# direct methods
.method public synthetic constructor <init>(Landroid/widget/TextView;Z)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda18;->f$0:Landroid/widget/TextView;

    iput-boolean p2, p0, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda18;->f$1:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda18;->f$0:Landroid/widget/TextView;

    iget-boolean v1, p0, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda18;->f$1:Z

    invoke-static {v0, v1}, Lorg/wiiucoop/bo2android/MenuActivity;->lambda$refreshKennelStatus$21(Landroid/widget/TextView;Z)V

    return-void
.end method
