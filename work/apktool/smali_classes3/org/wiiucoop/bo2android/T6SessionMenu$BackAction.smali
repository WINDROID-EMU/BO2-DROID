.class public final enum Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;
.super Ljava/lang/Enum;
.source "T6SessionMenu.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6SessionMenu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "BackAction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;

.field public static final enum CLOSE_PANEL:Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;

.field public static final enum LEAVE_SESSION:Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;

.field public static final enum OPEN_PANEL:Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;


# direct methods
.method private static synthetic $values()[Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;
    .locals 3

    .line 44
    sget-object v0, Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;->OPEN_PANEL:Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;

    sget-object v1, Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;->CLOSE_PANEL:Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;

    sget-object v2, Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;->LEAVE_SESSION:Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;

    filled-new-array {v0, v1, v2}, [Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 45
    new-instance v0, Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;

    const-string v1, "OPEN_PANEL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;->OPEN_PANEL:Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;

    .line 46
    new-instance v0, Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;

    const-string v1, "CLOSE_PANEL"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;->CLOSE_PANEL:Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;

    .line 47
    new-instance v0, Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;

    const-string v1, "LEAVE_SESSION"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;->LEAVE_SESSION:Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;

    .line 44
    invoke-static {}, Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;->$values()[Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;

    move-result-object v0

    sput-object v0, Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;->$VALUES:[Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 44
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 44
    const-class v0, Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;

    return-object v0
.end method

.method public static values()[Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;
    .locals 1

    .line 44
    sget-object v0, Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;->$VALUES:[Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;

    invoke-virtual {v0}, [Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/wiiucoop/bo2android/T6SessionMenu$BackAction;

    return-object v0
.end method
