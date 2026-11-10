.class public final Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
.super Ljava/lang/Object;
.source "T6DriverPackage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6DriverPackage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Meta"
.end annotation


# instance fields
.field public author:Ljava/lang/String;

.field public description:Ljava/lang/String;

.field public driverVersion:Ljava/lang/String;

.field public libraryName:Ljava/lang/String;

.field public minApi:I

.field public name:Ljava/lang/String;

.field public schemaVersion:I

.field public vendor:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    const/4 v0, -0x1

    iput v0, p0, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->schemaVersion:I

    .line 76
    const-string v0, ""

    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->name:Ljava/lang/String;

    .line 77
    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->description:Ljava/lang/String;

    .line 78
    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->author:Ljava/lang/String;

    .line 79
    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->vendor:Ljava/lang/String;

    .line 80
    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->driverVersion:Ljava/lang/String;

    .line 81
    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->libraryName:Ljava/lang/String;

    .line 82
    const/4 v0, 0x0

    iput v0, p0, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->minApi:I

    return-void
.end method
