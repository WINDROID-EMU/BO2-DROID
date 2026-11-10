.class public final enum Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;
.super Ljava/lang/Enum;
.source "T6PlayerName.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6PlayerName;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Outcome"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

.field public static final enum EMPTY:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

.field public static final enum NOT_VERIFIED:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

.field public static final enum NO_FOLDER:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

.field public static final enum PLACEHOLDER:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

.field public static final enum SAVED:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

.field public static final enum TOO_SHORT:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

.field public static final enum WRITE_FAILED:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;


# direct methods
.method private static synthetic $values()[Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;
    .locals 7

    .line 103
    sget-object v0, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->SAVED:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    sget-object v1, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->NO_FOLDER:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    sget-object v2, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->EMPTY:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    sget-object v3, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->TOO_SHORT:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    sget-object v4, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->PLACEHOLDER:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    sget-object v5, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->WRITE_FAILED:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    sget-object v6, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->NOT_VERIFIED:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    filled-new-array/range {v0 .. v6}, [Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 103
    new-instance v0, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    const-string v1, "SAVED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->SAVED:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    new-instance v0, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    const-string v1, "NO_FOLDER"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->NO_FOLDER:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    new-instance v0, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    const-string v1, "EMPTY"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->EMPTY:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    new-instance v0, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    const-string v1, "TOO_SHORT"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->TOO_SHORT:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    new-instance v0, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    const-string v1, "PLACEHOLDER"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->PLACEHOLDER:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    new-instance v0, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    const-string v1, "WRITE_FAILED"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->WRITE_FAILED:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    new-instance v0, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    const-string v1, "NOT_VERIFIED"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->NOT_VERIFIED:Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    invoke-static {}, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->$values()[Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    move-result-object v0

    sput-object v0, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->$VALUES:[Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 103
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 103
    const-class v0, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    return-object v0
.end method

.method public static values()[Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;
    .locals 1

    .line 103
    sget-object v0, Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->$VALUES:[Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    invoke-virtual {v0}, [Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/wiiucoop/bo2android/T6PlayerName$Outcome;

    return-object v0
.end method
