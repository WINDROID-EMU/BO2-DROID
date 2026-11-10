.class final enum Lorg/wiiucoop/bo2android/T6KennelPackage$State;
.super Ljava/lang/Enum;
.source "T6KennelPackage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6KennelPackage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/wiiucoop/bo2android/T6KennelPackage$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/wiiucoop/bo2android/T6KennelPackage$State;

.field public static final enum INCOMPLETE:Lorg/wiiucoop/bo2android/T6KennelPackage$State;

.field public static final enum INSTALLED:Lorg/wiiucoop/bo2android/T6KennelPackage$State;

.field public static final enum MISSING:Lorg/wiiucoop/bo2android/T6KennelPackage$State;

.field public static final enum OUTDATED:Lorg/wiiucoop/bo2android/T6KennelPackage$State;


# direct methods
.method private static synthetic $values()[Lorg/wiiucoop/bo2android/T6KennelPackage$State;
    .locals 4

    .line 62
    sget-object v0, Lorg/wiiucoop/bo2android/T6KennelPackage$State;->MISSING:Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    sget-object v1, Lorg/wiiucoop/bo2android/T6KennelPackage$State;->INCOMPLETE:Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    sget-object v2, Lorg/wiiucoop/bo2android/T6KennelPackage$State;->OUTDATED:Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    sget-object v3, Lorg/wiiucoop/bo2android/T6KennelPackage$State;->INSTALLED:Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    filled-new-array {v0, v1, v2, v3}, [Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 62
    new-instance v0, Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    const-string v1, "MISSING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6KennelPackage$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6KennelPackage$State;->MISSING:Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    new-instance v0, Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    const-string v1, "INCOMPLETE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6KennelPackage$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6KennelPackage$State;->INCOMPLETE:Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    new-instance v0, Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    const-string v1, "OUTDATED"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6KennelPackage$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6KennelPackage$State;->OUTDATED:Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    new-instance v0, Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    const-string v1, "INSTALLED"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6KennelPackage$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6KennelPackage$State;->INSTALLED:Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    invoke-static {}, Lorg/wiiucoop/bo2android/T6KennelPackage$State;->$values()[Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    move-result-object v0

    sput-object v0, Lorg/wiiucoop/bo2android/T6KennelPackage$State;->$VALUES:[Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 62
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6KennelPackage$State;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 62
    const-class v0, Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    return-object v0
.end method

.method public static values()[Lorg/wiiucoop/bo2android/T6KennelPackage$State;
    .locals 1

    .line 62
    sget-object v0, Lorg/wiiucoop/bo2android/T6KennelPackage$State;->$VALUES:[Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    invoke-virtual {v0}, [Lorg/wiiucoop/bo2android/T6KennelPackage$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/wiiucoop/bo2android/T6KennelPackage$State;

    return-object v0
.end method
