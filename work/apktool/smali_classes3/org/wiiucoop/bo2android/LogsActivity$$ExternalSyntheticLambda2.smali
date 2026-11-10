.class public final synthetic Lorg/wiiucoop/bo2android/LogsActivity$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/wiiucoop/bo2android/LogsActivity;


# direct methods
.method public synthetic constructor <init>(Lorg/wiiucoop/bo2android/LogsActivity;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/wiiucoop/bo2android/LogsActivity$$ExternalSyntheticLambda2;->f$0:Lorg/wiiucoop/bo2android/LogsActivity;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/LogsActivity$$ExternalSyntheticLambda2;->f$0:Lorg/wiiucoop/bo2android/LogsActivity;

    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/LogsActivity;->lambda$refreshNow$1$org-wiiucoop-bo2android-LogsActivity()V

    return-void
.end method
