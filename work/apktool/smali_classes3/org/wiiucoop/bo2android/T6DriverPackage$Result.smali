.class public final Lorg/wiiucoop/bo2android/T6DriverPackage$Result;
.super Ljava/lang/Object;
.source "T6DriverPackage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6DriverPackage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Result"
.end annotation


# instance fields
.field public final id:Ljava/lang/String;

.field public final librarySha256:Ljava/lang/String;

.field public final meta:Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;

.field public final ok:Z

.field public final problem:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

.field public final reason:Ljava/lang/String;

.field public final zipSha256:Ljava/lang/String;


# direct methods
.method private constructor <init>(ZLjava/lang/String;Ljava/lang/String;Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "ok"    # Z
    .param p2, "reason"    # Ljava/lang/String;
    .param p3, "id"    # Ljava/lang/String;
    .param p4, "meta"    # Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    .param p5, "librarySha256"    # Ljava/lang/String;
    .param p6, "zipSha256"    # Ljava/lang/String;

    .line 54
    const/4 v7, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;-><init>(ZLjava/lang/String;Ljava/lang/String;Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;Ljava/lang/String;Ljava/lang/String;Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;)V

    .line 55
    return-void
.end method

.method synthetic constructor <init>(ZLjava/lang/String;Ljava/lang/String;Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;Ljava/lang/String;Ljava/lang/String;Lorg/wiiucoop/bo2android/T6DriverPackage$1;)V
    .locals 0
    .param p1, "x0"    # Z
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # Ljava/lang/String;
    .param p4, "x3"    # Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    .param p5, "x4"    # Ljava/lang/String;
    .param p6, "x5"    # Ljava/lang/String;
    .param p7, "x6"    # Lorg/wiiucoop/bo2android/T6DriverPackage$1;

    .line 43
    invoke-direct/range {p0 .. p6}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;-><init>(ZLjava/lang/String;Ljava/lang/String;Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private constructor <init>(ZLjava/lang/String;Ljava/lang/String;Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;Ljava/lang/String;Ljava/lang/String;Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;)V
    .locals 0
    .param p1, "ok"    # Z
    .param p2, "reason"    # Ljava/lang/String;
    .param p3, "id"    # Ljava/lang/String;
    .param p4, "meta"    # Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    .param p5, "librarySha256"    # Ljava/lang/String;
    .param p6, "zipSha256"    # Ljava/lang/String;
    .param p7, "problem"    # Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-object p7, p0, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->problem:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    .line 60
    iput-boolean p1, p0, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->ok:Z

    .line 61
    iput-object p2, p0, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->reason:Ljava/lang/String;

    .line 62
    iput-object p3, p0, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->id:Ljava/lang/String;

    .line 63
    iput-object p4, p0, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->meta:Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;

    .line 64
    iput-object p5, p0, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->librarySha256:Ljava/lang/String;

    .line 65
    iput-object p6, p0, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->zipSha256:Ljava/lang/String;

    .line 66
    return-void
.end method

.method static fail(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;
    .locals 9
    .param p0, "problem"    # Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;
    .param p1, "reason"    # Ljava/lang/String;

    .line 69
    new-instance v8, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v1, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, v8

    move-object v2, p1

    move-object v7, p0

    invoke-direct/range {v0 .. v7}, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;-><init>(ZLjava/lang/String;Ljava/lang/String;Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;Ljava/lang/String;Ljava/lang/String;Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;)V

    return-object v8
.end method
