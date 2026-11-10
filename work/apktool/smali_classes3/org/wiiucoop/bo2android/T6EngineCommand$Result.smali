.class public final Lorg/wiiucoop/bo2android/T6EngineCommand$Result;
.super Ljava/lang/Object;
.source "T6EngineCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6EngineCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Result"
.end annotation


# instance fields
.field public final accepted:Z

.field public final answered:Z

.field public final applied:Z

.field public final pending:I

.field public final reason:Ljava/lang/String;


# direct methods
.method constructor <init>(ZZILjava/lang/String;Z)V
    .locals 1
    .param p1, "accepted"    # Z
    .param p2, "applied"    # Z
    .param p3, "pending"    # I
    .param p4, "reason"    # Ljava/lang/String;
    .param p5, "answered"    # Z

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-boolean p1, p0, Lorg/wiiucoop/bo2android/T6EngineCommand$Result;->accepted:Z

    .line 50
    iput-boolean p2, p0, Lorg/wiiucoop/bo2android/T6EngineCommand$Result;->applied:Z

    .line 51
    iput p3, p0, Lorg/wiiucoop/bo2android/T6EngineCommand$Result;->pending:I

    .line 52
    if-nez p4, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    move-object v0, p4

    :goto_0
    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6EngineCommand$Result;->reason:Ljava/lang/String;

    .line 53
    iput-boolean p5, p0, Lorg/wiiucoop/bo2android/T6EngineCommand$Result;->answered:Z

    .line 54
    return-void
.end method


# virtual methods
.method public isApplied()Z
    .locals 1

    .line 58
    iget-boolean v0, p0, Lorg/wiiucoop/bo2android/T6EngineCommand$Result;->applied:Z

    return v0
.end method
