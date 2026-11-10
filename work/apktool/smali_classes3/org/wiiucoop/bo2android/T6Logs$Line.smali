.class public final Lorg/wiiucoop/bo2android/T6Logs$Line;
.super Ljava/lang/Object;
.source "T6Logs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6Logs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Line"
.end annotation


# instance fields
.field public final category:I

.field public final level:C

.field public final message:Ljava/lang/String;

.field public repeats:I

.field public final tag:Ljava/lang/String;

.field public final time:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;CLjava/lang/String;Ljava/lang/String;I)V
    .locals 1
    .param p1, "time"    # Ljava/lang/String;
    .param p2, "level"    # C
    .param p3, "tag"    # Ljava/lang/String;
    .param p4, "message"    # Ljava/lang/String;
    .param p5, "category"    # I

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const/4 v0, 0x1

    iput v0, p0, Lorg/wiiucoop/bo2android/T6Logs$Line;->repeats:I

    .line 44
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6Logs$Line;->time:Ljava/lang/String;

    .line 45
    iput-char p2, p0, Lorg/wiiucoop/bo2android/T6Logs$Line;->level:C

    .line 46
    iput-object p3, p0, Lorg/wiiucoop/bo2android/T6Logs$Line;->tag:Ljava/lang/String;

    .line 47
    iput-object p4, p0, Lorg/wiiucoop/bo2android/T6Logs$Line;->message:Ljava/lang/String;

    .line 48
    iput p5, p0, Lorg/wiiucoop/bo2android/T6Logs$Line;->category:I

    .line 49
    return-void
.end method


# virtual methods
.method public format()Ljava/lang/String;
    .locals 3

    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6Logs$Line;->time:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lorg/wiiucoop/bo2android/T6Logs;->CATEGORY_IDS:[Ljava/lang/String;

    iget v2, p0, Lorg/wiiucoop/bo2android/T6Logs$Line;->category:I

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6Logs$Line;->tag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-char v1, p0, Lorg/wiiucoop/bo2android/T6Logs$Line;->level:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6Logs$Line;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 54
    .local v0, "text":Ljava/lang/String;
    iget v1, p0, Lorg/wiiucoop/bo2android/T6Logs$Line;->repeats:I

    const/4 v2, 0x1

    if-le v1, v2, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " (x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/wiiucoop/bo2android/T6Logs$Line;->repeats:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    return-object v1
.end method
