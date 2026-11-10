.class public final synthetic Lorg/wiiucoop/bo2android/T6Logs$Buffer$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/Comparator;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 0
    check-cast p1, Lorg/wiiucoop/bo2android/T6Logs$Line;

    check-cast p2, Lorg/wiiucoop/bo2android/T6Logs$Line;

    invoke-static {p1, p2}, Lorg/wiiucoop/bo2android/T6Logs$Buffer;->lambda$filter$0(Lorg/wiiucoop/bo2android/T6Logs$Line;Lorg/wiiucoop/bo2android/T6Logs$Line;)I

    move-result p1

    return p1
.end method
