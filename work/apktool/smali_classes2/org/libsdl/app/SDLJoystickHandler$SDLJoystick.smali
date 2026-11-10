.class Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;
.super Ljava/lang/Object;
.source "SDLControllerManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/libsdl/app/SDLJoystickHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SDLJoystick"
.end annotation


# instance fields
.field accelerometerSensor:Landroid/hardware/Sensor;

.field axes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/InputDevice$MotionRange;",
            ">;"
        }
    .end annotation
.end field

.field desc:Ljava/lang/String;

.field device_id:I

.field gyroscopeSensor:Landroid/hardware/Sensor;

.field hats:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/InputDevice$MotionRange;",
            ">;"
        }
    .end annotation
.end field

.field lights:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/hardware/lights/Light;",
            ">;"
        }
    .end annotation
.end field

.field lightsSession:Landroid/hardware/lights/LightsManager$LightsSession;

.field name:Ljava/lang/String;

.field sensorListener:Lorg/libsdl/app/SDLJoySensorListener;

.field sensorManager:Landroid/hardware/SensorManager;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 215
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
