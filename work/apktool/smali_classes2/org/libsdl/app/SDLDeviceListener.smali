.class Lorg/libsdl/app/SDLDeviceListener;
.super Ljava/lang/Object;
.source "SDLControllerManager.java"

# interfaces
.implements Landroid/hardware/input/InputManager$InputDeviceListener;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 187
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onInputDeviceAdded(I)V
    .locals 1
    .param p1, "deviceId"    # I

    .line 191
    invoke-static {p1}, Lorg/libsdl/app/SDLControllerManager;->isDeviceSDLJoystick(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 192
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mJoystickHandler:Lorg/libsdl/app/SDLJoystickHandler;

    invoke-virtual {v0, p1}, Lorg/libsdl/app/SDLJoystickHandler;->deviceAdded(I)V

    .line 194
    :cond_0
    return-void
.end method

.method public onInputDeviceChanged(I)V
    .locals 1
    .param p1, "deviceId"    # I

    .line 199
    invoke-static {p1}, Lorg/libsdl/app/SDLControllerManager;->isDeviceSDLJoystick(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 200
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mJoystickHandler:Lorg/libsdl/app/SDLJoystickHandler;

    invoke-virtual {v0, p1}, Lorg/libsdl/app/SDLJoystickHandler;->deviceAdded(I)V

    .line 202
    :cond_0
    return-void
.end method

.method public onInputDeviceRemoved(I)V
    .locals 1
    .param p1, "deviceId"    # I

    .line 207
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mJoystickHandler:Lorg/libsdl/app/SDLJoystickHandler;

    invoke-virtual {v0, p1}, Lorg/libsdl/app/SDLJoystickHandler;->deviceRemoved(I)V

    .line 208
    return-void
.end method
