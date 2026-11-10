.class public Lorg/libsdl/app/SDLControllerManager;
.super Ljava/lang/Object;
.source "SDLControllerManager.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SDLControllerManager"

.field protected static mDeviceListener:Lorg/libsdl/app/SDLDeviceListener;

.field protected static mHapticHandler:Lorg/libsdl/app/SDLHapticHandler;

.field protected static mJoystickHandler:Lorg/libsdl/app/SDLJoystickHandler;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static detectDevices()V
    .locals 1

    .line 100
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mJoystickHandler:Lorg/libsdl/app/SDLJoystickHandler;

    invoke-virtual {v0}, Lorg/libsdl/app/SDLJoystickHandler;->detectDevices()V

    .line 101
    return-void
.end method

.method static detectHapticDevices()V
    .locals 1

    .line 121
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mHapticHandler:Lorg/libsdl/app/SDLHapticHandler;

    if-eqz v0, :cond_0

    .line 122
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mHapticHandler:Lorg/libsdl/app/SDLHapticHandler;

    invoke-virtual {v0}, Lorg/libsdl/app/SDLHapticHandler;->detectHapticDevices()V

    .line 124
    :cond_0
    return-void
.end method

.method public static handleJoystickMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p0, "event"    # Landroid/view/MotionEvent;

    .line 93
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mJoystickHandler:Lorg/libsdl/app/SDLJoystickHandler;

    if-eqz v0, :cond_0

    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mJoystickHandler:Lorg/libsdl/app/SDLJoystickHandler;

    invoke-virtual {v0, p0}, Lorg/libsdl/app/SDLJoystickHandler;->handleMotionEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static hapticRumble(IFFI)V
    .locals 1
    .param p0, "device_id"    # I
    .param p1, "low_frequency_intensity"    # F
    .param p2, "high_frequency_intensity"    # F
    .param p3, "length"    # I

    .line 139
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mHapticHandler:Lorg/libsdl/app/SDLHapticHandler;

    if-eqz v0, :cond_0

    .line 140
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mHapticHandler:Lorg/libsdl/app/SDLHapticHandler;

    invoke-virtual {v0, p0, p1, p2, p3}, Lorg/libsdl/app/SDLHapticHandler;->rumble(IFFI)V

    .line 142
    :cond_0
    return-void
.end method

.method static hapticRun(IFI)V
    .locals 1
    .param p0, "device_id"    # I
    .param p1, "intensity"    # F
    .param p2, "length"    # I

    .line 130
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mHapticHandler:Lorg/libsdl/app/SDLHapticHandler;

    if-eqz v0, :cond_0

    .line 131
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mHapticHandler:Lorg/libsdl/app/SDLHapticHandler;

    invoke-virtual {v0, p0, p1, p2}, Lorg/libsdl/app/SDLHapticHandler;->run(IFI)V

    .line 133
    :cond_0
    return-void
.end method

.method static hapticStop(I)V
    .locals 1
    .param p0, "device_id"    # I

    .line 149
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mHapticHandler:Lorg/libsdl/app/SDLHapticHandler;

    if-eqz v0, :cond_0

    .line 150
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mHapticHandler:Lorg/libsdl/app/SDLHapticHandler;

    invoke-virtual {v0, p0}, Lorg/libsdl/app/SDLHapticHandler;->stop(I)V

    .line 152
    :cond_0
    return-void
.end method

.method static initialize()V
    .locals 2

    .line 59
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mJoystickHandler:Lorg/libsdl/app/SDLJoystickHandler;

    if-nez v0, :cond_0

    .line 60
    new-instance v0, Lorg/libsdl/app/SDLJoystickHandler;

    invoke-direct {v0}, Lorg/libsdl/app/SDLJoystickHandler;-><init>()V

    sput-object v0, Lorg/libsdl/app/SDLControllerManager;->mJoystickHandler:Lorg/libsdl/app/SDLJoystickHandler;

    .line 63
    :cond_0
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mHapticHandler:Lorg/libsdl/app/SDLHapticHandler;

    if-nez v0, :cond_2

    const/16 v0, 0x1000

    invoke-static {v0}, Lorg/libsdl/app/SDL;->isSubsystemCompiled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 64
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_1

    .line 65
    new-instance v0, Lorg/libsdl/app/SDLHapticHandler_API31;

    invoke-direct {v0}, Lorg/libsdl/app/SDLHapticHandler_API31;-><init>()V

    sput-object v0, Lorg/libsdl/app/SDLControllerManager;->mHapticHandler:Lorg/libsdl/app/SDLHapticHandler;

    goto :goto_0

    .line 66
    :cond_1
    nop

    .line 67
    new-instance v0, Lorg/libsdl/app/SDLHapticHandler_API26;

    invoke-direct {v0}, Lorg/libsdl/app/SDLHapticHandler_API26;-><init>()V

    sput-object v0, Lorg/libsdl/app/SDLControllerManager;->mHapticHandler:Lorg/libsdl/app/SDLHapticHandler;

    .line 72
    :cond_2
    :goto_0
    return-void
.end method

.method public static initializeDeviceListener()V
    .locals 3

    .line 75
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mDeviceListener:Lorg/libsdl/app/SDLDeviceListener;

    if-nez v0, :cond_0

    .line 76
    new-instance v0, Lorg/libsdl/app/SDLDeviceListener;

    invoke-direct {v0}, Lorg/libsdl/app/SDLDeviceListener;-><init>()V

    sput-object v0, Lorg/libsdl/app/SDLControllerManager;->mDeviceListener:Lorg/libsdl/app/SDLDeviceListener;

    .line 78
    invoke-static {}, Lorg/libsdl/app/SDL;->getContext()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "input"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/input/InputManager;

    .line 79
    .local v0, "im":Landroid/hardware/input/InputManager;
    sget-object v1, Lorg/libsdl/app/SDLControllerManager;->mDeviceListener:Lorg/libsdl/app/SDLDeviceListener;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/hardware/input/InputManager;->registerInputDeviceListener(Landroid/hardware/input/InputManager$InputDeviceListener;Landroid/os/Handler;)V

    .line 81
    .end local v0    # "im":Landroid/hardware/input/InputManager;
    :cond_0
    return-void
.end method

.method public static isDeviceSDLJoystick(I)Z
    .locals 1
    .param p0, "deviceId"    # I

    .line 182
    invoke-static {p0}, Landroid/view/InputDevice;->getDevice(I)Landroid/view/InputDevice;

    move-result-object v0

    invoke-static {v0}, Lorg/libsdl/app/SDLControllerManager;->isDeviceSDLJoystick(Landroid/view/InputDevice;)Z

    move-result v0

    return v0
.end method

.method public static isDeviceSDLJoystick(Landroid/view/InputDevice;)Z
    .locals 4
    .param p0, "device"    # Landroid/view/InputDevice;

    .line 157
    const/4 v0, 0x0

    if-eqz p0, :cond_3

    invoke-virtual {p0}, Landroid/view/InputDevice;->isVirtual()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 160
    :cond_0
    invoke-virtual {p0}, Landroid/view/InputDevice;->getSources()I

    move-result v1

    .line 175
    .local v1, "sources":I
    and-int/lit8 v2, v1, 0x10

    if-nez v2, :cond_1

    and-int/lit16 v2, v1, 0x201

    const/16 v3, 0x201

    if-eq v2, v3, :cond_1

    and-int/lit16 v2, v1, 0x401

    const/16 v3, 0x401

    if-ne v2, v3, :cond_2

    :cond_1
    const/4 v0, 0x1

    :cond_2
    return v0

    .line 158
    .end local v1    # "sources":I
    :cond_3
    :goto_0
    return v0
.end method

.method static joystickSetLED(IIII)V
    .locals 1
    .param p0, "device_id"    # I
    .param p1, "red"    # I
    .param p2, "green"    # I
    .param p3, "blue"    # I

    .line 107
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mJoystickHandler:Lorg/libsdl/app/SDLJoystickHandler;

    invoke-virtual {v0, p0, p1, p2, p3}, Lorg/libsdl/app/SDLJoystickHandler;->setLED(IIII)V

    .line 108
    return-void
.end method

.method static joystickSetSensorsEnabled(IZ)V
    .locals 1
    .param p0, "device_id"    # I
    .param p1, "enabled"    # Z

    .line 114
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mJoystickHandler:Lorg/libsdl/app/SDLJoystickHandler;

    invoke-virtual {v0, p0, p1}, Lorg/libsdl/app/SDLJoystickHandler;->setSensorsEnabled(IZ)V

    .line 115
    return-void
.end method

.method static native nativeAddHaptic(ILjava/lang/String;)V
.end method

.method static native nativeAddJoystick(ILjava/lang/String;Ljava/lang/String;IIIIIIZZZZ)V
.end method

.method static native nativeRemoveHaptic(I)V
.end method

.method static native nativeRemoveJoystick(I)V
.end method

.method static native nativeSetupJNI()V
.end method

.method static native onNativeHat(IIII)V
.end method

.method static native onNativeJoy(IIF)V
.end method

.method static native onNativeJoySensor(IIJFFF)V
.end method

.method public static native onNativePadDown(III)Z
.end method

.method public static native onNativePadUp(III)Z
.end method

.method public static shutdownDeviceListener()V
    .locals 2

    .line 84
    sget-object v0, Lorg/libsdl/app/SDLControllerManager;->mDeviceListener:Lorg/libsdl/app/SDLDeviceListener;

    if-eqz v0, :cond_0

    .line 85
    invoke-static {}, Lorg/libsdl/app/SDL;->getContext()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "input"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/input/InputManager;

    .line 86
    .local v0, "im":Landroid/hardware/input/InputManager;
    sget-object v1, Lorg/libsdl/app/SDLControllerManager;->mDeviceListener:Lorg/libsdl/app/SDLDeviceListener;

    invoke-virtual {v0, v1}, Landroid/hardware/input/InputManager;->unregisterInputDeviceListener(Landroid/hardware/input/InputManager$InputDeviceListener;)V

    .line 87
    const/4 v1, 0x0

    sput-object v1, Lorg/libsdl/app/SDLControllerManager;->mDeviceListener:Lorg/libsdl/app/SDLDeviceListener;

    .line 89
    .end local v0    # "im":Landroid/hardware/input/InputManager;
    :cond_0
    return-void
.end method
