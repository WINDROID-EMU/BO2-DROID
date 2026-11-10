.class public final Lorg/wiiucoop/bo2android/T6StartDecision$Decision;
.super Ljava/lang/Object;
.source "T6StartDecision.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6StartDecision;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Decision"
.end annotation


# instance fields
.field public final canLaunchHost:Z

.field public final canLoadEngine:Z

.field public final code:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

.field public final reason:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/wiiucoop/bo2android/T6StartDecision$Code;ZZLjava/lang/String;)V
    .locals 0
    .param p1, "code"    # Lorg/wiiucoop/bo2android/T6StartDecision$Code;
    .param p2, "canLaunchHost"    # Z
    .param p3, "canLoadEngine"    # Z
    .param p4, "reason"    # Ljava/lang/String;

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;->code:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    .line 34
    iput-boolean p2, p0, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;->canLaunchHost:Z

    .line 35
    iput-boolean p3, p0, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;->canLoadEngine:Z

    .line 36
    iput-object p4, p0, Lorg/wiiucoop/bo2android/T6StartDecision$Decision;->reason:Ljava/lang/String;

    .line 37
    return-void
.end method
