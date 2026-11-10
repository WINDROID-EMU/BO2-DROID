.class public final enum Lorg/wiiucoop/bo2android/T6EnvVars$Problem;
.super Ljava/lang/Enum;
.source "T6EnvVars.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6EnvVars;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Problem"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/wiiucoop/bo2android/T6EnvVars$Problem;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

.field public static final enum ANDROID_RUNTIME:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

.field public static final enum DUPLICATE:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

.field public static final enum DXVK_WSI:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

.field public static final enum EMPTY_NAME:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

.field public static final enum LINKER:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

.field public static final enum NAME_SYNTAX:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

.field public static final enum NAME_TOO_LONG:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

.field public static final enum OK:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

.field public static final enum VALUE_LINE_BREAK:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

.field public static final enum VALUE_TOO_LONG:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;


# direct methods
.method private static synthetic $values()[Lorg/wiiucoop/bo2android/T6EnvVars$Problem;
    .locals 10

    .line 31
    sget-object v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->OK:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    sget-object v1, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->EMPTY_NAME:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    sget-object v2, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->NAME_TOO_LONG:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    sget-object v3, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->NAME_SYNTAX:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    sget-object v4, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->LINKER:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    sget-object v5, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->ANDROID_RUNTIME:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    sget-object v6, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->DXVK_WSI:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    sget-object v7, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->VALUE_TOO_LONG:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    sget-object v8, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->VALUE_LINE_BREAK:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    sget-object v9, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->DUPLICATE:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    filled-new-array/range {v0 .. v9}, [Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 31
    new-instance v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    const-string v1, "OK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->OK:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    new-instance v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    const-string v1, "EMPTY_NAME"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->EMPTY_NAME:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    new-instance v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    const-string v1, "NAME_TOO_LONG"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->NAME_TOO_LONG:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    new-instance v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    const-string v1, "NAME_SYNTAX"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->NAME_SYNTAX:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    new-instance v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    const-string v1, "LINKER"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->LINKER:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    new-instance v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    const-string v1, "ANDROID_RUNTIME"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->ANDROID_RUNTIME:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    new-instance v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    const-string v1, "DXVK_WSI"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->DXVK_WSI:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    new-instance v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    const-string v1, "VALUE_TOO_LONG"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->VALUE_TOO_LONG:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    new-instance v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    const-string v1, "VALUE_LINE_BREAK"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->VALUE_LINE_BREAK:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    new-instance v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    const-string v1, "DUPLICATE"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->DUPLICATE:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    invoke-static {}, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->$values()[Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    move-result-object v0

    sput-object v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->$VALUES:[Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 31
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6EnvVars$Problem;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 31
    const-class v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    return-object v0
.end method

.method public static values()[Lorg/wiiucoop/bo2android/T6EnvVars$Problem;
    .locals 1

    .line 31
    sget-object v0, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->$VALUES:[Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    invoke-virtual {v0}, [Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    return-object v0
.end method
