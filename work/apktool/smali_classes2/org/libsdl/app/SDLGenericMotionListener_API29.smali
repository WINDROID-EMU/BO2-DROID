.class Lorg/libsdl/app/SDLGenericMotionListener_API29;
.super Lorg/libsdl/app/SDLGenericMotionListener_API26;
.source "SDLControllerManager.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1052
    invoke-direct {p0}, Lorg/libsdl/app/SDLGenericMotionListener_API26;-><init>()V

    return-void
.end method


# virtual methods
.method getPenDeviceType(Landroid/view/InputDevice;)I
    .locals 1
    .param p1, "penDevice"    # Landroid/view/InputDevice;

    .line 1056
    if-nez p1, :cond_0

    .line 1057
    const/4 v0, 0x0

    return v0

    .line 1060
    :cond_0
    invoke-virtual {p1}, Landroid/view/InputDevice;->isExternal()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    :goto_0
    return v0
.end method
