.class public final enum Lorg/wiiucoop/bo2android/T6SessionState$State;
.super Ljava/lang/Enum;
.source "T6SessionState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6SessionState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/wiiucoop/bo2android/T6SessionState$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/wiiucoop/bo2android/T6SessionState$State;

.field public static final enum FINISHED:Lorg/wiiucoop/bo2android/T6SessionState$State;

.field public static final enum IDLE:Lorg/wiiucoop/bo2android/T6SessionState$State;

.field public static final enum RUNNING:Lorg/wiiucoop/bo2android/T6SessionState$State;

.field public static final enum UNKNOWN:Lorg/wiiucoop/bo2android/T6SessionState$State;


# direct methods
.method private static synthetic $values()[Lorg/wiiucoop/bo2android/T6SessionState$State;
    .locals 4

    .line 24
    sget-object v0, Lorg/wiiucoop/bo2android/T6SessionState$State;->IDLE:Lorg/wiiucoop/bo2android/T6SessionState$State;

    sget-object v1, Lorg/wiiucoop/bo2android/T6SessionState$State;->RUNNING:Lorg/wiiucoop/bo2android/T6SessionState$State;

    sget-object v2, Lorg/wiiucoop/bo2android/T6SessionState$State;->FINISHED:Lorg/wiiucoop/bo2android/T6SessionState$State;

    sget-object v3, Lorg/wiiucoop/bo2android/T6SessionState$State;->UNKNOWN:Lorg/wiiucoop/bo2android/T6SessionState$State;

    filled-new-array {v0, v1, v2, v3}, [Lorg/wiiucoop/bo2android/T6SessionState$State;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 26
    new-instance v0, Lorg/wiiucoop/bo2android/T6SessionState$State;

    const-string v1, "IDLE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6SessionState$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6SessionState$State;->IDLE:Lorg/wiiucoop/bo2android/T6SessionState$State;

    .line 28
    new-instance v0, Lorg/wiiucoop/bo2android/T6SessionState$State;

    const-string v1, "RUNNING"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6SessionState$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6SessionState$State;->RUNNING:Lorg/wiiucoop/bo2android/T6SessionState$State;

    .line 30
    new-instance v0, Lorg/wiiucoop/bo2android/T6SessionState$State;

    const-string v1, "FINISHED"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6SessionState$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6SessionState$State;->FINISHED:Lorg/wiiucoop/bo2android/T6SessionState$State;

    .line 32
    new-instance v0, Lorg/wiiucoop/bo2android/T6SessionState$State;

    const-string v1, "UNKNOWN"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6SessionState$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6SessionState$State;->UNKNOWN:Lorg/wiiucoop/bo2android/T6SessionState$State;

    .line 24
    invoke-static {}, Lorg/wiiucoop/bo2android/T6SessionState$State;->$values()[Lorg/wiiucoop/bo2android/T6SessionState$State;

    move-result-object v0

    sput-object v0, Lorg/wiiucoop/bo2android/T6SessionState$State;->$VALUES:[Lorg/wiiucoop/bo2android/T6SessionState$State;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 24
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6SessionState$State;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 24
    const-class v0, Lorg/wiiucoop/bo2android/T6SessionState$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/wiiucoop/bo2android/T6SessionState$State;

    return-object v0
.end method

.method public static values()[Lorg/wiiucoop/bo2android/T6SessionState$State;
    .locals 1

    .line 24
    sget-object v0, Lorg/wiiucoop/bo2android/T6SessionState$State;->$VALUES:[Lorg/wiiucoop/bo2android/T6SessionState$State;

    invoke-virtual {v0}, [Lorg/wiiucoop/bo2android/T6SessionState$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/wiiucoop/bo2android/T6SessionState$State;

    return-object v0
.end method
