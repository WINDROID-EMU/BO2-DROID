.class public final synthetic Lorg/wiiucoop/bo2android/T6Updater$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lorg/wiiucoop/bo2android/T6Updater$Bytes;


# instance fields
.field public final synthetic f$0:Lorg/wiiucoop/bo2android/T6Updater$Progress;

.field public final synthetic f$1:[J

.field public final synthetic f$2:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lorg/wiiucoop/bo2android/T6Updater$Progress;[JLjava/lang/String;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6Updater$$ExternalSyntheticLambda1;->f$0:Lorg/wiiucoop/bo2android/T6Updater$Progress;

    iput-object p2, p0, Lorg/wiiucoop/bo2android/T6Updater$$ExternalSyntheticLambda1;->f$1:[J

    iput-object p3, p0, Lorg/wiiucoop/bo2android/T6Updater$$ExternalSyntheticLambda1;->f$2:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final on(JJ)V
    .locals 7

    .line 0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6Updater$$ExternalSyntheticLambda1;->f$0:Lorg/wiiucoop/bo2android/T6Updater$Progress;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6Updater$$ExternalSyntheticLambda1;->f$1:[J

    iget-object v2, p0, Lorg/wiiucoop/bo2android/T6Updater$$ExternalSyntheticLambda1;->f$2:Ljava/lang/String;

    move-wide v3, p1

    move-wide v5, p3

    invoke-static/range {v0 .. v6}, Lorg/wiiucoop/bo2android/T6Updater;->lambda$downloadTo$1(Lorg/wiiucoop/bo2android/T6Updater$Progress;[JLjava/lang/String;JJ)V

    return-void
.end method
