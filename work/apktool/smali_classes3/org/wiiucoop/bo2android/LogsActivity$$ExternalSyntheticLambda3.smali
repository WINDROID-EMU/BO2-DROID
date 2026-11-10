.class public final synthetic Lorg/wiiucoop/bo2android/LogsActivity$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/wiiucoop/bo2android/LogsActivity;

.field public final synthetic f$1:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lorg/wiiucoop/bo2android/LogsActivity;Ljava/util/List;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/wiiucoop/bo2android/LogsActivity$$ExternalSyntheticLambda3;->f$0:Lorg/wiiucoop/bo2android/LogsActivity;

    iput-object p2, p0, Lorg/wiiucoop/bo2android/LogsActivity$$ExternalSyntheticLambda3;->f$1:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/LogsActivity$$ExternalSyntheticLambda3;->f$0:Lorg/wiiucoop/bo2android/LogsActivity;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/LogsActivity$$ExternalSyntheticLambda3;->f$1:Ljava/util/List;

    invoke-virtual {v0, v1}, Lorg/wiiucoop/bo2android/LogsActivity;->lambda$refreshNow$0$org-wiiucoop-bo2android-LogsActivity(Ljava/util/List;)V

    return-void
.end method
