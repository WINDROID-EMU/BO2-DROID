.class final Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
.super Ljava/lang/Object;
.source "T6TouchOverlay.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6TouchOverlay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Finger"
.end annotation


# instance fields
.field aiming:Z

.field control:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

.field downTime:J

.field downX:F

.field downY:F

.field lastX:F

.field lastY:F

.field moved:Z

.field x:F

.field y:F


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/wiiucoop/bo2android/T6TouchOverlay$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/wiiucoop/bo2android/T6TouchOverlay$1;

    .line 100
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;-><init>()V

    return-void
.end method
