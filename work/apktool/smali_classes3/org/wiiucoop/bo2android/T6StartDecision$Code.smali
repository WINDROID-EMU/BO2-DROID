.class public final enum Lorg/wiiucoop/bo2android/T6StartDecision$Code;
.super Ljava/lang/Enum;
.source "T6StartDecision.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6StartDecision;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Code"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/wiiucoop/bo2android/T6StartDecision$Code;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/wiiucoop/bo2android/T6StartDecision$Code;

.field public static final enum FOLDER_UNUSABLE:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

.field public static final enum NO_FOLDER:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

.field public static final enum NO_MODE:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

.field public static final enum READY:Lorg/wiiucoop/bo2android/T6StartDecision$Code;


# direct methods
.method private static synthetic $values()[Lorg/wiiucoop/bo2android/T6StartDecision$Code;
    .locals 4

    .line 19
    sget-object v0, Lorg/wiiucoop/bo2android/T6StartDecision$Code;->READY:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    sget-object v1, Lorg/wiiucoop/bo2android/T6StartDecision$Code;->NO_FOLDER:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    sget-object v2, Lorg/wiiucoop/bo2android/T6StartDecision$Code;->FOLDER_UNUSABLE:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    sget-object v3, Lorg/wiiucoop/bo2android/T6StartDecision$Code;->NO_MODE:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    filled-new-array {v0, v1, v2, v3}, [Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 20
    new-instance v0, Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    const-string v1, "READY"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6StartDecision$Code;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6StartDecision$Code;->READY:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    .line 21
    new-instance v0, Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    const-string v1, "NO_FOLDER"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6StartDecision$Code;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6StartDecision$Code;->NO_FOLDER:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    .line 22
    new-instance v0, Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    const-string v1, "FOLDER_UNUSABLE"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6StartDecision$Code;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6StartDecision$Code;->FOLDER_UNUSABLE:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    .line 23
    new-instance v0, Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    const-string v1, "NO_MODE"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6StartDecision$Code;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6StartDecision$Code;->NO_MODE:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    .line 19
    invoke-static {}, Lorg/wiiucoop/bo2android/T6StartDecision$Code;->$values()[Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    move-result-object v0

    sput-object v0, Lorg/wiiucoop/bo2android/T6StartDecision$Code;->$VALUES:[Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 19
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6StartDecision$Code;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 19
    const-class v0, Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    return-object v0
.end method

.method public static values()[Lorg/wiiucoop/bo2android/T6StartDecision$Code;
    .locals 1

    .line 19
    sget-object v0, Lorg/wiiucoop/bo2android/T6StartDecision$Code;->$VALUES:[Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    invoke-virtual {v0}, [Lorg/wiiucoop/bo2android/T6StartDecision$Code;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    return-object v0
.end method
