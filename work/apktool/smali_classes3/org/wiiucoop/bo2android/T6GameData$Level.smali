.class public final enum Lorg/wiiucoop/bo2android/T6GameData$Level;
.super Ljava/lang/Enum;
.source "T6GameData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6GameData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Level"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/wiiucoop/bo2android/T6GameData$Level;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/wiiucoop/bo2android/T6GameData$Level;

.field public static final enum FAIL:Lorg/wiiucoop/bo2android/T6GameData$Level;

.field public static final enum OK:Lorg/wiiucoop/bo2android/T6GameData$Level;

.field public static final enum WARN:Lorg/wiiucoop/bo2android/T6GameData$Level;


# direct methods
.method private static synthetic $values()[Lorg/wiiucoop/bo2android/T6GameData$Level;
    .locals 3

    .line 29
    sget-object v0, Lorg/wiiucoop/bo2android/T6GameData$Level;->OK:Lorg/wiiucoop/bo2android/T6GameData$Level;

    sget-object v1, Lorg/wiiucoop/bo2android/T6GameData$Level;->WARN:Lorg/wiiucoop/bo2android/T6GameData$Level;

    sget-object v2, Lorg/wiiucoop/bo2android/T6GameData$Level;->FAIL:Lorg/wiiucoop/bo2android/T6GameData$Level;

    filled-new-array {v0, v1, v2}, [Lorg/wiiucoop/bo2android/T6GameData$Level;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 29
    new-instance v0, Lorg/wiiucoop/bo2android/T6GameData$Level;

    const-string v1, "OK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6GameData$Level;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6GameData$Level;->OK:Lorg/wiiucoop/bo2android/T6GameData$Level;

    new-instance v0, Lorg/wiiucoop/bo2android/T6GameData$Level;

    const-string v1, "WARN"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6GameData$Level;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6GameData$Level;->WARN:Lorg/wiiucoop/bo2android/T6GameData$Level;

    new-instance v0, Lorg/wiiucoop/bo2android/T6GameData$Level;

    const-string v1, "FAIL"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6GameData$Level;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6GameData$Level;->FAIL:Lorg/wiiucoop/bo2android/T6GameData$Level;

    invoke-static {}, Lorg/wiiucoop/bo2android/T6GameData$Level;->$values()[Lorg/wiiucoop/bo2android/T6GameData$Level;

    move-result-object v0

    sput-object v0, Lorg/wiiucoop/bo2android/T6GameData$Level;->$VALUES:[Lorg/wiiucoop/bo2android/T6GameData$Level;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 29
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6GameData$Level;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 29
    const-class v0, Lorg/wiiucoop/bo2android/T6GameData$Level;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/wiiucoop/bo2android/T6GameData$Level;

    return-object v0
.end method

.method public static values()[Lorg/wiiucoop/bo2android/T6GameData$Level;
    .locals 1

    .line 29
    sget-object v0, Lorg/wiiucoop/bo2android/T6GameData$Level;->$VALUES:[Lorg/wiiucoop/bo2android/T6GameData$Level;

    invoke-virtual {v0}, [Lorg/wiiucoop/bo2android/T6GameData$Level;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/wiiucoop/bo2android/T6GameData$Level;

    return-object v0
.end method
