.class Lorg/libsdl/app/SDLHapticHandler$SDLHaptic;
.super Ljava/lang/Object;
.source "SDLControllerManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/libsdl/app/SDLHapticHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SDLHaptic"
.end annotation


# instance fields
.field device_id:I

.field name:Ljava/lang/String;

.field vib:Landroid/os/Vibrator;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 725
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
