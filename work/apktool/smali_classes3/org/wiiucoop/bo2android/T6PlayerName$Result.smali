.class public final Lorg/wiiucoop/bo2android/T6PlayerName$Result;
.super Ljava/lang/Object;
.source "T6PlayerName.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6PlayerName;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Result"
.end annotation


# instance fields
.field public final message:Ljava/lang/String;

.field public final name:Ljava/lang/String;

.field public final outcome:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

.field public final saved:Z


# direct methods
.method constructor <init>(Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "outcome"    # Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6PlayerName$Result;->outcome:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    .line 114
    sget-object v0, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->SAVED:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lorg/wiiucoop/bo2android/T6PlayerName$Result;->saved:Z

    .line 115
    iput-object p2, p0, Lorg/wiiucoop/bo2android/T6PlayerName$Result;->name:Ljava/lang/String;

    .line 116
    if-nez p3, :cond_1

    const-string v0, ""

    goto :goto_1

    :cond_1
    move-object v0, p3

    :goto_1
    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6PlayerName$Result;->message:Ljava/lang/String;

    .line 117
    return-void
.end method
