.class public final Lorg/wiiucoop/bo2android/T6DeviceInfo$Info;
.super Ljava/lang/Object;
.source "T6DeviceInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6DeviceInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Info"
.end annotation


# instance fields
.field public final cpu:Ljava/lang/String;

.field public final gpu:Ljava/lang/String;

.field public final ram:Ljava/lang/String;

.field public final vulkan:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "cpu"    # Ljava/lang/String;
    .param p2, "gpu"    # Ljava/lang/String;
    .param p3, "ram"    # Ljava/lang/String;
    .param p4, "vulkan"    # Ljava/lang/String;

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6DeviceInfo$Info;->cpu:Ljava/lang/String;

    .line 59
    iput-object p2, p0, Lorg/wiiucoop/bo2android/T6DeviceInfo$Info;->gpu:Ljava/lang/String;

    .line 60
    iput-object p3, p0, Lorg/wiiucoop/bo2android/T6DeviceInfo$Info;->ram:Ljava/lang/String;

    .line 61
    iput-object p4, p0, Lorg/wiiucoop/bo2android/T6DeviceInfo$Info;->vulkan:Ljava/lang/String;

    .line 62
    return-void
.end method
