.class Lorg/libsdl/app/SDLJoySensorListener;
.super Ljava/lang/Object;
.source "SDLControllerManager.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# instance fields
.field device_id:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "device_id"    # I

    .line 1067
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1068
    iput p1, p0, Lorg/libsdl/app/SDLJoySensorListener;->device_id:I

    .line 1069
    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .line 1072
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 8
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .line 1076
    iget v0, p0, Lorg/libsdl/app/SDLJoySensorListener;->device_id:I

    iget-object v1, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v1}, Landroid/hardware/Sensor;->getType()I

    move-result v1

    iget-wide v2, p1, Landroid/hardware/SensorEvent;->timestamp:J

    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v5, 0x0

    aget v4, v4, v5

    iget-object v5, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v6, 0x1

    aget v5, v5, v6

    iget-object v6, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v7, 0x2

    aget v6, v6, v7

    invoke-static/range {v0 .. v6}, Lorg/libsdl/app/SDLControllerManager;->onNativeJoySensor(IIJFFF)V

    .line 1077
    return-void
.end method
