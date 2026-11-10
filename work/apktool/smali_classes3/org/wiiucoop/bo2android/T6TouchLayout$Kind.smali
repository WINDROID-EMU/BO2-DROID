.class public final enum Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;
.super Ljava/lang/Enum;
.source "T6TouchLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6TouchLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Kind"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

.field public static final enum BUTTON:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

.field public static final enum STICK_LEFT:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;


# direct methods
.method private static synthetic $values()[Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;
    .locals 2

    .line 56
    sget-object v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;->BUTTON:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    sget-object v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;->STICK_LEFT:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    filled-new-array {v0, v1}, [Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 56
    new-instance v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    const-string v1, "BUTTON"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;->BUTTON:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    new-instance v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    const-string v1, "STICK_LEFT"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;->STICK_LEFT:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    invoke-static {}, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;->$values()[Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    move-result-object v0

    sput-object v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;->$VALUES:[Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 56
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 56
    const-class v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    return-object v0
.end method

.method public static values()[Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;
    .locals 1

    .line 56
    sget-object v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;->$VALUES:[Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    invoke-virtual {v0}, [Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    return-object v0
.end method
