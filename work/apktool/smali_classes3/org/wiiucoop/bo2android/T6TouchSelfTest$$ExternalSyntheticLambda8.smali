.class public final synthetic Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda8;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/wiiucoop/bo2android/T6TouchSelfTest;

.field public final synthetic f$1:I

.field public final synthetic f$2:I

.field public final synthetic f$3:I


# direct methods
.method public synthetic constructor <init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;III)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda8;->f$0:Lorg/wiiucoop/bo2android/T6TouchSelfTest;

    iput p2, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda8;->f$1:I

    iput p3, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda8;->f$2:I

    iput p4, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda8;->f$3:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda8;->f$0:Lorg/wiiucoop/bo2android/T6TouchSelfTest;

    iget v1, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda8;->f$1:I

    iget v2, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda8;->f$2:I

    iget v3, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda8;->f$3:I

    invoke-virtual {v0, v1, v2, v3}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->lambda$schedule$25$org-wiiucoop-bo2android-T6TouchSelfTest(III)V

    return-void
.end method
