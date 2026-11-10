.class final enum Lorg/wiiucoop/bo2android/T6Updater$Result;
.super Ljava/lang/Enum;
.source "T6Updater.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6Updater;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "Result"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/wiiucoop/bo2android/T6Updater$Result;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/wiiucoop/bo2android/T6Updater$Result;

.field public static final enum DONE:Lorg/wiiucoop/bo2android/T6Updater$Result;

.field public static final enum STALLED:Lorg/wiiucoop/bo2android/T6Updater$Result;


# direct methods
.method private static synthetic $values()[Lorg/wiiucoop/bo2android/T6Updater$Result;
    .locals 2

    .line 314
    sget-object v0, Lorg/wiiucoop/bo2android/T6Updater$Result;->DONE:Lorg/wiiucoop/bo2android/T6Updater$Result;

    sget-object v1, Lorg/wiiucoop/bo2android/T6Updater$Result;->STALLED:Lorg/wiiucoop/bo2android/T6Updater$Result;

    filled-new-array {v0, v1}, [Lorg/wiiucoop/bo2android/T6Updater$Result;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 314
    new-instance v0, Lorg/wiiucoop/bo2android/T6Updater$Result;

    const-string v1, "DONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6Updater$Result;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6Updater$Result;->DONE:Lorg/wiiucoop/bo2android/T6Updater$Result;

    new-instance v0, Lorg/wiiucoop/bo2android/T6Updater$Result;

    const-string v1, "STALLED"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6Updater$Result;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6Updater$Result;->STALLED:Lorg/wiiucoop/bo2android/T6Updater$Result;

    invoke-static {}, Lorg/wiiucoop/bo2android/T6Updater$Result;->$values()[Lorg/wiiucoop/bo2android/T6Updater$Result;

    move-result-object v0

    sput-object v0, Lorg/wiiucoop/bo2android/T6Updater$Result;->$VALUES:[Lorg/wiiucoop/bo2android/T6Updater$Result;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 314
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6Updater$Result;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 314
    const-class v0, Lorg/wiiucoop/bo2android/T6Updater$Result;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/wiiucoop/bo2android/T6Updater$Result;

    return-object v0
.end method

.method public static values()[Lorg/wiiucoop/bo2android/T6Updater$Result;
    .locals 1

    .line 314
    sget-object v0, Lorg/wiiucoop/bo2android/T6Updater$Result;->$VALUES:[Lorg/wiiucoop/bo2android/T6Updater$Result;

    invoke-virtual {v0}, [Lorg/wiiucoop/bo2android/T6Updater$Result;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/wiiucoop/bo2android/T6Updater$Result;

    return-object v0
.end method
