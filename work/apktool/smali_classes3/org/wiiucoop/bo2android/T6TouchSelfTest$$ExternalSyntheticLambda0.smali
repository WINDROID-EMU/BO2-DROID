.class public final synthetic Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/wiiucoop/bo2android/T6TouchSelfTest;

.field public final synthetic f$1:I

.field public final synthetic f$2:I


# direct methods
.method public synthetic constructor <init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;II)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda0;->f$0:Lorg/wiiucoop/bo2android/T6TouchSelfTest;

    iput p2, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda0;->f$1:I

    iput p3, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda0;->f$2:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda0;->f$0:Lorg/wiiucoop/bo2android/T6TouchSelfTest;

    iget v1, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda0;->f$1:I

    iget v2, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda0;->f$2:I

    invoke-virtual {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->lambda$schedule$0$org-wiiucoop-bo2android-T6TouchSelfTest(II)V

    return-void
.end method
