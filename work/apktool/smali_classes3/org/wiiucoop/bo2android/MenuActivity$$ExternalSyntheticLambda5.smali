.class public final synthetic Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/wiiucoop/bo2android/MenuActivity;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Lorg/wiiucoop/bo2android/MenuActivity;Ljava/lang/String;Landroid/widget/TextView;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda5;->f$0:Lorg/wiiucoop/bo2android/MenuActivity;

    iput-object p2, p0, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda5;->f$1:Ljava/lang/String;

    iput-object p3, p0, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda5;->f$2:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda5;->f$0:Lorg/wiiucoop/bo2android/MenuActivity;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda5;->f$1:Ljava/lang/String;

    iget-object v2, p0, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda5;->f$2:Landroid/widget/TextView;

    invoke-virtual {v0, v1, v2}, Lorg/wiiucoop/bo2android/MenuActivity;->lambda$refreshKennelStatus$22$org-wiiucoop-bo2android-MenuActivity(Ljava/lang/String;Landroid/widget/TextView;)V

    return-void
.end method
