.class public final Lorg/wiiucoop/bo2android/T6SessionState;
.super Ljava/lang/Object;
.source "T6SessionState.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/wiiucoop/bo2android/T6SessionState$State;
    }
.end annotation


# static fields
.field public static final UNAVAILABLE:Lorg/wiiucoop/bo2android/T6SessionState;


# instance fields
.field public final answered:Z

.field public final engineAttached:Z

.field public final frames:J

.field public final state:Lorg/wiiucoop/bo2android/T6SessionState$State;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 36
    new-instance v6, Lorg/wiiucoop/bo2android/T6SessionState;

    sget-object v1, Lorg/wiiucoop/bo2android/T6SessionState$State;->UNKNOWN:Lorg/wiiucoop/bo2android/T6SessionState$State;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-wide/16 v2, 0x0

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lorg/wiiucoop/bo2android/T6SessionState;-><init>(Lorg/wiiucoop/bo2android/T6SessionState$State;JZZ)V

    sput-object v6, Lorg/wiiucoop/bo2android/T6SessionState;->UNAVAILABLE:Lorg/wiiucoop/bo2android/T6SessionState;

    return-void
.end method

.method private constructor <init>(Lorg/wiiucoop/bo2android/T6SessionState$State;JZZ)V
    .locals 0
    .param p1, "state"    # Lorg/wiiucoop/bo2android/T6SessionState$State;
    .param p2, "frames"    # J
    .param p4, "engineAttached"    # Z
    .param p5, "answered"    # Z

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6SessionState;->state:Lorg/wiiucoop/bo2android/T6SessionState$State;

    .line 47
    iput-wide p2, p0, Lorg/wiiucoop/bo2android/T6SessionState;->frames:J

    .line 48
    iput-boolean p4, p0, Lorg/wiiucoop/bo2android/T6SessionState;->engineAttached:Z

    .line 49
    iput-boolean p5, p0, Lorg/wiiucoop/bo2android/T6SessionState;->answered:Z

    .line 50
    return-void
.end method

.method public static parse(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6SessionState;
    .locals 15
    .param p0, "text"    # Ljava/lang/String;

    .line 68
    if-eqz p0, :cond_6

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_2

    .line 72
    :cond_0
    sget-object v0, Lorg/wiiucoop/bo2android/T6SessionState$State;->UNKNOWN:Lorg/wiiucoop/bo2android/T6SessionState$State;

    .line 73
    .local v0, "state":Lorg/wiiucoop/bo2android/T6SessionState$State;
    const-wide/16 v1, 0x0

    .line 74
    .local v1, "frames":J
    const/4 v3, 0x0

    .line 75
    .local v3, "engineAttached":Z
    const/4 v4, 0x0

    .line 77
    .local v4, "sawState":Z
    const-string v5, "\n"

    invoke-virtual {p0, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    array-length v6, v5

    const/4 v7, 0x0

    move v8, v7

    :goto_0
    if-ge v8, v6, :cond_5

    aget-object v9, v5, v8

    .line 78
    .local v9, "rawLine":Ljava/lang/String;
    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    .line 79
    .local v10, "line":Ljava/lang/String;
    const/16 v11, 0x3d

    invoke-virtual {v10, v11}, Ljava/lang/String;->indexOf(I)I

    move-result v11

    .line 81
    .local v11, "separator":I
    if-gtz v11, :cond_1

    .line 82
    goto :goto_1

    .line 85
    :cond_1
    invoke-virtual {v10, v7, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12

    .line 86
    .local v12, "key":Ljava/lang/String;
    add-int/lit8 v13, v11, 0x1

    invoke-virtual {v10, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v13

    .line 88
    .local v13, "value":Ljava/lang/String;
    const-string v14, "state"

    invoke-virtual {v14, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_2

    .line 89
    const/4 v4, 0x1

    .line 90
    invoke-static {v13}, Lorg/wiiucoop/bo2android/T6SessionState;->stateOf(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6SessionState$State;

    move-result-object v0

    goto :goto_1

    .line 91
    :cond_2
    const-string v14, "frames"

    invoke-virtual {v14, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_3

    .line 92
    invoke-static {v13}, Lorg/wiiucoop/bo2android/T6SessionState;->parseFrames(Ljava/lang/String;)J

    move-result-wide v1

    goto :goto_1

    .line 93
    :cond_3
    const-string v14, "engine"

    invoke-virtual {v14, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_4

    .line 94
    const-string v14, "attached"

    invoke-virtual {v14, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 77
    .end local v9    # "rawLine":Ljava/lang/String;
    .end local v10    # "line":Ljava/lang/String;
    .end local v11    # "separator":I
    .end local v12    # "key":Ljava/lang/String;
    .end local v13    # "value":Ljava/lang/String;
    :cond_4
    :goto_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 98
    :cond_5
    new-instance v5, Lorg/wiiucoop/bo2android/T6SessionState;

    move-object v8, v5

    move-object v9, v0

    move-wide v10, v1

    move v12, v3

    move v13, v4

    invoke-direct/range {v8 .. v13}, Lorg/wiiucoop/bo2android/T6SessionState;-><init>(Lorg/wiiucoop/bo2android/T6SessionState$State;JZZ)V

    return-object v5

    .line 69
    .end local v0    # "state":Lorg/wiiucoop/bo2android/T6SessionState$State;
    .end local v1    # "frames":J
    .end local v3    # "engineAttached":Z
    .end local v4    # "sawState":Z
    :cond_6
    :goto_2
    sget-object v0, Lorg/wiiucoop/bo2android/T6SessionState;->UNAVAILABLE:Lorg/wiiucoop/bo2android/T6SessionState;

    return-object v0
.end method

.method private static parseFrames(Ljava/lang/String;)J
    .locals 5
    .param p0, "value"    # Ljava/lang/String;

    .line 116
    const-wide/16 v0, 0x0

    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    .local v2, "frames":J
    cmp-long v4, v2, v0

    if-gez v4, :cond_0

    goto :goto_0

    :cond_0
    move-wide v0, v2

    :goto_0
    return-wide v0

    .line 118
    .end local v2    # "frames":J
    :catch_0
    move-exception v2

    .line 119
    .local v2, "e":Ljava/lang/NumberFormatException;
    return-wide v0
.end method

.method public static read()Lorg/wiiucoop/bo2android/T6SessionState;
    .locals 1

    .line 59
    invoke-static {}, Lorg/wiiucoop/bo2android/T6Native;->sessionState()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6SessionState;->parse(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6SessionState;

    move-result-object v0

    return-object v0
.end method

.method private static stateOf(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6SessionState$State;
    .locals 1
    .param p0, "value"    # Ljava/lang/String;

    .line 102
    const-string v0, "running"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 103
    sget-object v0, Lorg/wiiucoop/bo2android/T6SessionState$State;->RUNNING:Lorg/wiiucoop/bo2android/T6SessionState$State;

    return-object v0

    .line 105
    :cond_0
    const-string v0, "idle"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 106
    sget-object v0, Lorg/wiiucoop/bo2android/T6SessionState$State;->IDLE:Lorg/wiiucoop/bo2android/T6SessionState$State;

    return-object v0

    .line 108
    :cond_1
    const-string v0, "finished"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 109
    sget-object v0, Lorg/wiiucoop/bo2android/T6SessionState$State;->FINISHED:Lorg/wiiucoop/bo2android/T6SessionState$State;

    return-object v0

    .line 111
    :cond_2
    sget-object v0, Lorg/wiiucoop/bo2android/T6SessionState$State;->UNKNOWN:Lorg/wiiucoop/bo2android/T6SessionState$State;

    return-object v0
.end method


# virtual methods
.method public isHostRunning()Z
    .locals 2

    .line 54
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6SessionState;->state:Lorg/wiiucoop/bo2android/T6SessionState$State;

    sget-object v1, Lorg/wiiucoop/bo2android/T6SessionState$State;->RUNNING:Lorg/wiiucoop/bo2android/T6SessionState$State;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
