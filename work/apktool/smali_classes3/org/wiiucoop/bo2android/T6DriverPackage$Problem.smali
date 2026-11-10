.class public final enum Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;
.super Ljava/lang/Enum;
.source "T6DriverPackage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6DriverPackage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Problem"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

.field public static final enum BAD_ENTRIES:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

.field public static final enum BAD_LIBRARY:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

.field public static final enum CANNOT_READ:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

.field public static final enum CORRUPT:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

.field public static final enum INSTALL_FAILED:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

.field public static final enum NEEDS_NEWER_ANDROID:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

.field public static final enum NOT_A_DRIVER:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

.field public static final enum TOO_LARGE:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;


# direct methods
.method private static synthetic $values()[Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;
    .locals 8

    .line 92
    sget-object v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->CANNOT_READ:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    sget-object v1, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->TOO_LARGE:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    sget-object v2, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->BAD_ENTRIES:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    sget-object v3, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->NOT_A_DRIVER:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    sget-object v4, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->NEEDS_NEWER_ANDROID:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    sget-object v5, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->BAD_LIBRARY:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    sget-object v6, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->INSTALL_FAILED:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    sget-object v7, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->CORRUPT:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    filled-new-array/range {v0 .. v7}, [Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 92
    new-instance v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    const-string v1, "CANNOT_READ"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->CANNOT_READ:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    new-instance v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    const-string v1, "TOO_LARGE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->TOO_LARGE:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    new-instance v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    const-string v1, "BAD_ENTRIES"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->BAD_ENTRIES:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    new-instance v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    const-string v1, "NOT_A_DRIVER"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->NOT_A_DRIVER:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    new-instance v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    const-string v1, "NEEDS_NEWER_ANDROID"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->NEEDS_NEWER_ANDROID:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    new-instance v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    const-string v1, "BAD_LIBRARY"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->BAD_LIBRARY:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    new-instance v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    const-string v1, "INSTALL_FAILED"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->INSTALL_FAILED:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    new-instance v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    const-string v1, "CORRUPT"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->CORRUPT:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    invoke-static {}, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->$values()[Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    move-result-object v0

    sput-object v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->$VALUES:[Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 92
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 92
    const-class v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    return-object v0
.end method

.method public static values()[Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;
    .locals 1

    .line 92
    sget-object v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->$VALUES:[Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    invoke-virtual {v0}, [Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    return-object v0
.end method
