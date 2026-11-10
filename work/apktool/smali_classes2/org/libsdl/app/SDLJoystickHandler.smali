.class Lorg/libsdl/app/SDLJoystickHandler;
.super Ljava/lang/Object;
.source "SDLControllerManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;,
        Lorg/libsdl/app/SDLJoystickHandler$RangeComparator;
    }
.end annotation


# instance fields
.field private final mJoysticks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 277
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 279
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/libsdl/app/SDLJoystickHandler;->mJoysticks:Ljava/util/ArrayList;

    .line 280
    return-void
.end method


# virtual methods
.method declared-synchronized detectDevices()V
    .locals 5

    monitor-enter p0

    .line 286
    :try_start_0
    invoke-static {}, Landroid/view/InputDevice;->getDeviceIds()[I

    move-result-object v0

    .line 287
    .local v0, "deviceIds":[I
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget v3, v0, v2

    .line 288
    .local v3, "device_id":I
    invoke-static {v3}, Lorg/libsdl/app/SDLControllerManager;->isDeviceSDLJoystick(I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 289
    invoke-virtual {p0, v3}, Lorg/libsdl/app/SDLJoystickHandler;->deviceAdded(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 287
    .end local v3    # "device_id":I
    .end local p0    # "this":Lorg/libsdl/app/SDLJoystickHandler;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 292
    :cond_1
    monitor-exit p0

    return-void

    .line 285
    .end local v0    # "deviceIds":[I
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method deviceAdded(I)V
    .locals 23
    .param p1, "device_id"    # I

    .line 295
    move-object/from16 v0, p0

    invoke-static/range {p1 .. p1}, Landroid/view/InputDevice;->getDevice(I)Landroid/view/InputDevice;

    move-result-object v1

    .line 296
    .local v1, "joystickDevice":Landroid/view/InputDevice;
    if-nez v1, :cond_0

    .line 297
    return-void

    .line 300
    :cond_0
    invoke-virtual/range {p0 .. p1}, Lorg/libsdl/app/SDLJoystickHandler;->getJoystick(I)Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;

    move-result-object v2

    .line 301
    .local v2, "joystick":Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;
    const/16 v3, 0x1f

    if-nez v2, :cond_9

    .line 302
    new-instance v4, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;

    invoke-direct {v4}, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;-><init>()V

    move-object v2, v4

    .line 303
    move/from16 v4, p1

    iput v4, v2, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->device_id:I

    .line 304
    invoke-virtual {v1}, Landroid/view/InputDevice;->getName()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v2, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->name:Ljava/lang/String;

    .line 305
    invoke-virtual {v0, v1}, Lorg/libsdl/app/SDLJoystickHandler;->getJoystickDescriptor(Landroid/view/InputDevice;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v2, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->desc:Ljava/lang/String;

    .line 306
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, v2, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->axes:Ljava/util/ArrayList;

    .line 307
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, v2, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->hats:Ljava/util/ArrayList;

    .line 308
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 309
    .local v5, "axisStrsSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, v2, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->lights:Ljava/util/ArrayList;

    .line 311
    invoke-virtual {v1}, Landroid/view/InputDevice;->getMotionRanges()Ljava/util/List;

    move-result-object v6

    .line 312
    .local v6, "ranges":Ljava/util/List;, "Ljava/util/List<Landroid/view/InputDevice$MotionRange;>;"
    new-instance v7, Lorg/libsdl/app/SDLJoystickHandler$RangeComparator;

    invoke-direct {v7}, Lorg/libsdl/app/SDLJoystickHandler$RangeComparator;-><init>()V

    invoke-static {v6, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 313
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/view/InputDevice$MotionRange;

    .line 314
    .local v8, "range":Landroid/view/InputDevice$MotionRange;
    invoke-virtual {v8}, Landroid/view/InputDevice$MotionRange;->getSource()I

    move-result v9

    const/16 v10, 0x10

    and-int/2addr v9, v10

    if-eqz v9, :cond_3

    invoke-virtual {v8}, Landroid/view/InputDevice$MotionRange;->getAxis()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v5, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 315
    invoke-virtual {v8}, Landroid/view/InputDevice$MotionRange;->getAxis()I

    move-result v9

    const/16 v11, 0xf

    if-eq v9, v11, :cond_2

    invoke-virtual {v8}, Landroid/view/InputDevice$MotionRange;->getAxis()I

    move-result v9

    if-ne v9, v10, :cond_1

    goto :goto_1

    .line 318
    :cond_1
    iget-object v9, v2, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->axes:Ljava/util/ArrayList;

    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 316
    :cond_2
    :goto_1
    iget-object v9, v2, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->hats:Ljava/util/ArrayList;

    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 321
    .end local v8    # "range":Landroid/view/InputDevice$MotionRange;
    :cond_3
    :goto_2
    goto :goto_0

    .line 323
    :cond_4
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v7, v3, :cond_8

    .line 324
    invoke-virtual {v1}, Landroid/view/InputDevice;->getLightsManager()Landroid/hardware/lights/LightsManager;

    move-result-object v7

    .line 325
    .local v7, "lightsManager":Landroid/hardware/lights/LightsManager;
    invoke-virtual {v7}, Landroid/hardware/lights/LightsManager;->getLights()Ljava/util/List;

    move-result-object v8

    .line 326
    .local v8, "lights":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/lights/Light;>;"
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_6

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/hardware/lights/Light;

    .line 327
    .local v10, "light":Landroid/hardware/lights/Light;
    invoke-virtual {v10}, Landroid/hardware/lights/Light;->hasRgbControl()Z

    move-result v11

    if-eqz v11, :cond_5

    .line 328
    iget-object v11, v2, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->lights:Ljava/util/ArrayList;

    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 330
    .end local v10    # "light":Landroid/hardware/lights/Light;
    :cond_5
    goto :goto_3

    .line 331
    :cond_6
    iget-object v9, v2, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->lights:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_7

    .line 332
    invoke-virtual {v7}, Landroid/hardware/lights/LightsManager;->openSession()Landroid/hardware/lights/LightsManager$LightsSession;

    move-result-object v9

    iput-object v9, v2, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->lightsSession:Landroid/hardware/lights/LightsManager$LightsSession;

    .line 334
    :cond_7
    invoke-virtual {v1}, Landroid/view/InputDevice;->getSensorManager()Landroid/hardware/SensorManager;

    move-result-object v9

    .line 335
    .local v9, "sensorManager":Landroid/hardware/SensorManager;
    if-eqz v9, :cond_8

    .line 336
    iput-object v9, v2, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->sensorManager:Landroid/hardware/SensorManager;

    .line 337
    new-instance v10, Lorg/libsdl/app/SDLJoySensorListener;

    iget v11, v2, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->device_id:I

    invoke-direct {v10, v11}, Lorg/libsdl/app/SDLJoySensorListener;-><init>(I)V

    iput-object v10, v2, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->sensorListener:Lorg/libsdl/app/SDLJoySensorListener;

    .line 338
    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v10

    iput-object v10, v2, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->accelerometerSensor:Landroid/hardware/Sensor;

    .line 339
    const/4 v10, 0x4

    invoke-virtual {v9, v10}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v10

    iput-object v10, v2, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->gyroscopeSensor:Landroid/hardware/Sensor;

    .line 343
    .end local v7    # "lightsManager":Landroid/hardware/lights/LightsManager;
    .end local v8    # "lights":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/lights/Light;>;"
    .end local v9    # "sensorManager":Landroid/hardware/SensorManager;
    :cond_8
    iget-object v7, v0, Lorg/libsdl/app/SDLJoystickHandler;->mJoysticks:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 301
    .end local v5    # "axisStrsSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local v6    # "ranges":Ljava/util/List;, "Ljava/util/List<Landroid/view/InputDevice$MotionRange;>;"
    :cond_9
    move/from16 v4, p1

    .line 346
    :goto_4
    const/4 v5, 0x0

    .line 347
    .local v5, "can_rumble":Z
    const/4 v6, 0x0

    .line 348
    .local v6, "has_rgb_led":Z
    const/4 v7, 0x0

    .line 349
    .local v7, "has_accelerometer":Z
    const/4 v8, 0x0

    .line 350
    .local v8, "has_gyroscope":Z
    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v9, v3, :cond_d

    .line 351
    invoke-virtual {v1}, Landroid/view/InputDevice;->getVibratorManager()Landroid/os/VibratorManager;

    move-result-object v3

    .line 352
    .local v3, "vibratorManager":Landroid/os/VibratorManager;
    invoke-virtual {v3}, Landroid/os/VibratorManager;->getVibratorIds()[I

    move-result-object v9

    .line 353
    .local v9, "vibrators":[I
    array-length v10, v9

    if-lez v10, :cond_a

    .line 354
    const/4 v5, 0x1

    .line 356
    :cond_a
    iget-object v10, v2, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->lights:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_b

    .line 357
    const/4 v6, 0x1

    .line 359
    :cond_b
    iget-object v10, v2, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->accelerometerSensor:Landroid/hardware/Sensor;

    if-eqz v10, :cond_c

    .line 360
    const/4 v7, 0x1

    .line 362
    :cond_c
    iget-object v10, v2, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->gyroscopeSensor:Landroid/hardware/Sensor;

    if-eqz v10, :cond_d

    .line 363
    const/4 v8, 0x1

    .line 367
    .end local v3    # "vibratorManager":Landroid/os/VibratorManager;
    .end local v9    # "vibrators":[I
    :cond_d
    iget v10, v2, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->device_id:I

    iget-object v11, v2, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->name:Ljava/lang/String;

    iget-object v12, v2, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->desc:Ljava/lang/String;

    .line 368
    invoke-virtual {v0, v1}, Lorg/libsdl/app/SDLJoystickHandler;->getVendorId(Landroid/view/InputDevice;)I

    move-result v13

    invoke-virtual {v0, v1}, Lorg/libsdl/app/SDLJoystickHandler;->getProductId(Landroid/view/InputDevice;)I

    move-result v14

    .line 369
    invoke-virtual {v0, v1}, Lorg/libsdl/app/SDLJoystickHandler;->getButtonMask(Landroid/view/InputDevice;)I

    move-result v15

    iget-object v3, v2, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->axes:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v16

    iget-object v3, v2, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->axes:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Lorg/libsdl/app/SDLJoystickHandler;->getAxisMask(Ljava/util/List;)I

    move-result v17

    iget-object v3, v2, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->hats:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    div-int/lit8 v18, v3, 0x2

    .line 367
    move/from16 v19, v5

    move/from16 v20, v6

    move/from16 v21, v7

    move/from16 v22, v8

    invoke-static/range {v10 .. v22}, Lorg/libsdl/app/SDLControllerManager;->nativeAddJoystick(ILjava/lang/String;Ljava/lang/String;IIIIIIZZZZ)V

    .line 371
    return-void
.end method

.method deviceRemoved(I)V
    .locals 3
    .param p1, "device_id"    # I

    .line 374
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/libsdl/app/SDLJoystickHandler;->mJoysticks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 375
    iget-object v1, p0, Lorg/libsdl/app/SDLJoystickHandler;->mJoysticks:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;

    iget v1, v1, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->device_id:I

    if-ne v1, p1, :cond_1

    .line 377
    invoke-static {p1}, Lorg/libsdl/app/SDLControllerManager;->nativeRemoveJoystick(I)V

    .line 379
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1f

    if-lt v1, v2, :cond_0

    .line 380
    iget-object v1, p0, Lorg/libsdl/app/SDLJoystickHandler;->mJoysticks:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;

    iget-object v1, v1, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->lightsSession:Landroid/hardware/lights/LightsManager$LightsSession;

    if-eqz v1, :cond_0

    .line 382
    :try_start_0
    iget-object v1, p0, Lorg/libsdl/app/SDLJoystickHandler;->mJoysticks:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;

    iget-object v1, v1, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->lightsSession:Landroid/hardware/lights/LightsManager$LightsSession;

    invoke-virtual {v1}, Landroid/hardware/lights/LightsManager$LightsSession;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 385
    goto :goto_1

    .line 383
    :catch_0
    move-exception v1

    .line 386
    :goto_1
    iget-object v1, p0, Lorg/libsdl/app/SDLJoystickHandler;->mJoysticks:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;

    const/4 v2, 0x0

    iput-object v2, v1, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->lightsSession:Landroid/hardware/lights/LightsManager$LightsSession;

    .line 389
    :cond_0
    iget-object v1, p0, Lorg/libsdl/app/SDLJoystickHandler;->mJoysticks:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 390
    goto :goto_2

    .line 374
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 393
    .end local v0    # "i":I
    :cond_2
    :goto_2
    return-void
.end method

.method getAxisMask(Ljava/util/List;)I
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/InputDevice$MotionRange;",
            ">;)I"
        }
    .end annotation

    .line 452
    .local p1, "ranges":Ljava/util/List;, "Ljava/util/List<Landroid/view/InputDevice$MotionRange;>;"
    const/4 v0, 0x0

    .line 453
    .local v0, "axis_mask":I
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_0

    .line 455
    or-int/lit8 v0, v0, 0x3

    .line 457
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x4

    if-lt v1, v2, :cond_1

    .line 459
    or-int/lit8 v0, v0, 0xc

    .line 461
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x6

    if-lt v1, v2, :cond_2

    .line 463
    or-int/lit8 v0, v0, 0x30

    .line 467
    :cond_2
    const/4 v1, 0x0

    .line 468
    .local v1, "have_z":Z
    const/4 v2, 0x0

    .line 469
    .local v2, "have_past_z_before_rz":Z
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/InputDevice$MotionRange;

    .line 470
    .local v4, "range":Landroid/view/InputDevice$MotionRange;
    invoke-virtual {v4}, Landroid/view/InputDevice$MotionRange;->getAxis()I

    move-result v5

    .line 471
    .local v5, "axis":I
    const/16 v6, 0xb

    if-ne v5, v6, :cond_3

    .line 472
    const/4 v1, 0x1

    goto :goto_1

    .line 473
    :cond_3
    if-le v5, v6, :cond_4

    const/16 v6, 0xe

    if-ge v5, v6, :cond_4

    .line 474
    const/4 v2, 0x1

    .line 476
    .end local v4    # "range":Landroid/view/InputDevice$MotionRange;
    .end local v5    # "axis":I
    :cond_4
    :goto_1
    goto :goto_0

    .line 477
    :cond_5
    if-eqz v1, :cond_6

    if-eqz v2, :cond_6

    .line 480
    const v3, 0x8000

    or-int/2addr v0, v3

    .line 482
    :cond_6
    return v0
.end method

.method getButtonMask(Landroid/view/InputDevice;)I
    .locals 6
    .param p1, "joystickDevice"    # Landroid/view/InputDevice;

    .line 486
    const/4 v0, 0x0

    .line 487
    .local v0, "button_mask":I
    const/16 v1, 0x26

    new-array v2, v1, [I

    fill-array-data v2, :array_0

    .line 529
    .local v2, "keys":[I
    new-array v1, v1, [I

    fill-array-data v1, :array_1

    .line 570
    .local v1, "masks":[I
    invoke-virtual {p1, v2}, Landroid/view/InputDevice;->hasKeys([I)[Z

    move-result-object v3

    .line 571
    .local v3, "has_keys":[Z
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v5, v2

    if-ge v4, v5, :cond_1

    .line 572
    aget-boolean v5, v3, v4

    if-eqz v5, :cond_0

    .line 573
    aget v5, v1, v4

    or-int/2addr v0, v5

    .line 571
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 576
    .end local v4    # "i":I
    :cond_1
    return v0

    :array_0
    .array-data 4
        0x60
        0x61
        0x63
        0x64
        0x4
        0x52
        0x6e
        0x6c
        0x6a
        0x6b
        0x66
        0x67
        0x13
        0x14
        0x15
        0x16
        0x6d
        0x17
        0x68
        0x69
        0x62
        0x65
        0xbc
        0xbd
        0xbe
        0xbf
        0xc0
        0xc1
        0xc2
        0xc3
        0xc4
        0xc5
        0xc6
        0xc7
        0xc8
        0xc9
        0xca
        0xcb
    .end array-data

    :array_1
    .array-data 4
        0x1
        0x2
        0x4
        0x8
        0x10
        0x40
        0x20
        0x40
        0x80
        0x100
        0x200
        0x400
        0x800
        0x1000
        0x2000
        0x4000
        0x10
        0x1
        0x8000
        0x10000
        0x20000
        0x40000
        0x100000
        0x200000
        0x400000
        0x800000
        0x1000000
        0x2000000
        0x4000000
        0x8000000
        0x10000000
        0x20000000
        0x40000000    # 2.0f
        -0x80000000
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data
.end method

.method protected declared-synchronized getJoystick(I)Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;
    .locals 3
    .param p1, "device_id"    # I

    monitor-enter p0

    .line 396
    :try_start_0
    iget-object v0, p0, Lorg/libsdl/app/SDLJoystickHandler;->mJoysticks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;

    .line 397
    .local v1, "joystick":Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;
    iget v2, v1, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->device_id:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v2, p1, :cond_0

    .line 398
    monitor-exit p0

    return-object v1

    .line 400
    .end local v1    # "joystick":Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;
    :cond_0
    goto :goto_0

    .line 401
    .end local p0    # "this":Lorg/libsdl/app/SDLJoystickHandler;
    :cond_1
    monitor-exit p0

    const/4 v0, 0x0

    return-object v0

    .line 395
    .end local p1    # "device_id":I
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method getJoystickDescriptor(Landroid/view/InputDevice;)Ljava/lang/String;
    .locals 2
    .param p1, "joystickDevice"    # Landroid/view/InputDevice;

    .line 432
    invoke-virtual {p1}, Landroid/view/InputDevice;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    .line 434
    .local v0, "desc":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 435
    return-object v0

    .line 438
    :cond_0
    invoke-virtual {p1}, Landroid/view/InputDevice;->getName()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method getProductId(Landroid/view/InputDevice;)I
    .locals 1
    .param p1, "joystickDevice"    # Landroid/view/InputDevice;

    .line 442
    invoke-virtual {p1}, Landroid/view/InputDevice;->getProductId()I

    move-result v0

    return v0
.end method

.method getVendorId(Landroid/view/InputDevice;)I
    .locals 1
    .param p1, "joystickDevice"    # Landroid/view/InputDevice;

    .line 446
    invoke-virtual {p1}, Landroid/view/InputDevice;->getVendorId()I

    move-result v0

    return v0
.end method

.method handleMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 9
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 410
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    .line 411
    .local v0, "actionPointerIndex":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    .line 412
    .local v1, "action":I
    const/4 v2, 0x1

    const/4 v3, 0x2

    if-ne v1, v3, :cond_1

    .line 413
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getDeviceId()I

    move-result v4

    invoke-virtual {p0, v4}, Lorg/libsdl/app/SDLJoystickHandler;->getJoystick(I)Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;

    move-result-object v4

    .line 414
    .local v4, "joystick":Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;
    if-eqz v4, :cond_1

    .line 415
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    iget-object v6, v4, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->axes:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v5, v6, :cond_0

    .line 416
    iget-object v6, v4, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->axes:Ljava/util/ArrayList;

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/InputDevice$MotionRange;

    .line 418
    .local v6, "range":Landroid/view/InputDevice$MotionRange;
    invoke-virtual {v6}, Landroid/view/InputDevice$MotionRange;->getAxis()I

    move-result v7

    invoke-virtual {p1, v7, v0}, Landroid/view/MotionEvent;->getAxisValue(II)F

    move-result v7

    invoke-virtual {v6}, Landroid/view/InputDevice$MotionRange;->getMin()F

    move-result v8

    sub-float/2addr v7, v8

    invoke-virtual {v6}, Landroid/view/InputDevice$MotionRange;->getRange()F

    move-result v8

    div-float/2addr v7, v8

    const/high16 v8, 0x40000000    # 2.0f

    mul-float/2addr v7, v8

    const/high16 v8, 0x3f800000    # 1.0f

    sub-float/2addr v7, v8

    .line 419
    .local v7, "value":F
    iget v8, v4, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->device_id:I

    invoke-static {v8, v5, v7}, Lorg/libsdl/app/SDLControllerManager;->onNativeJoy(IIF)V

    .line 415
    .end local v6    # "range":Landroid/view/InputDevice$MotionRange;
    .end local v7    # "value":F
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 421
    .end local v5    # "i":I
    :cond_0
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_1
    iget-object v6, v4, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->hats:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    div-int/2addr v6, v3

    if-ge v5, v6, :cond_1

    .line 422
    iget-object v6, v4, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->hats:Ljava/util/ArrayList;

    mul-int/lit8 v7, v5, 0x2

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/InputDevice$MotionRange;

    invoke-virtual {v6}, Landroid/view/InputDevice$MotionRange;->getAxis()I

    move-result v6

    invoke-virtual {p1, v6, v0}, Landroid/view/MotionEvent;->getAxisValue(II)F

    move-result v6

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    .line 423
    .local v6, "hatX":I
    iget-object v7, v4, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->hats:Ljava/util/ArrayList;

    mul-int/lit8 v8, v5, 0x2

    add-int/2addr v8, v2

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/InputDevice$MotionRange;

    invoke-virtual {v7}, Landroid/view/InputDevice$MotionRange;->getAxis()I

    move-result v7

    invoke-virtual {p1, v7, v0}, Landroid/view/MotionEvent;->getAxisValue(II)F

    move-result v7

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v7

    .line 424
    .local v7, "hatY":I
    iget v8, v4, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->device_id:I

    invoke-static {v8, v5, v6, v7}, Lorg/libsdl/app/SDLControllerManager;->onNativeHat(IIII)V

    .line 421
    .end local v6    # "hatX":I
    .end local v7    # "hatY":I
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 428
    .end local v4    # "joystick":Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;
    .end local v5    # "i":I
    :cond_1
    return v2
.end method

.method setLED(IIII)V
    .locals 6
    .param p1, "device_id"    # I
    .param p2, "red"    # I
    .param p3, "green"    # I
    .param p4, "blue"    # I

    .line 580
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-ge v0, v1, :cond_0

    .line 581
    return-void

    .line 583
    :cond_0
    invoke-virtual {p0, p1}, Lorg/libsdl/app/SDLJoystickHandler;->getJoystick(I)Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;

    move-result-object v0

    .line 584
    .local v0, "joystick":Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;
    if-eqz v0, :cond_4

    iget-object v1, v0, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->lights:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_1

    .line 587
    :cond_1
    new-instance v1, Landroid/hardware/lights/LightsRequest$Builder;

    invoke-direct {v1}, Landroid/hardware/lights/LightsRequest$Builder;-><init>()V

    .line 588
    .local v1, "lightsRequest":Landroid/hardware/lights/LightsRequest$Builder;
    new-instance v2, Landroid/hardware/lights/LightState$Builder;

    invoke-direct {v2}, Landroid/hardware/lights/LightState$Builder;-><init>()V

    invoke-static {p2, p3, p4}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/hardware/lights/LightState$Builder;->setColor(I)Landroid/hardware/lights/LightState$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/hardware/lights/LightState$Builder;->build()Landroid/hardware/lights/LightState;

    move-result-object v2

    .line 589
    .local v2, "lightState":Landroid/hardware/lights/LightState;
    iget-object v3, v0, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->lights:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/hardware/lights/Light;

    .line 590
    .local v4, "light":Landroid/hardware/lights/Light;
    invoke-virtual {v4}, Landroid/hardware/lights/Light;->hasRgbControl()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 591
    invoke-virtual {v1, v4, v2}, Landroid/hardware/lights/LightsRequest$Builder;->addLight(Landroid/hardware/lights/Light;Landroid/hardware/lights/LightState;)Landroid/hardware/lights/LightsRequest$Builder;

    .line 593
    .end local v4    # "light":Landroid/hardware/lights/Light;
    :cond_2
    goto :goto_0

    .line 594
    :cond_3
    iget-object v3, v0, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->lightsSession:Landroid/hardware/lights/LightsManager$LightsSession;

    invoke-virtual {v1}, Landroid/hardware/lights/LightsRequest$Builder;->build()Landroid/hardware/lights/LightsRequest;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/hardware/lights/LightsManager$LightsSession;->requestLights(Landroid/hardware/lights/LightsRequest;)V

    .line 595
    return-void

    .line 585
    .end local v1    # "lightsRequest":Landroid/hardware/lights/LightsRequest$Builder;
    .end local v2    # "lightState":Landroid/hardware/lights/LightState;
    :cond_4
    :goto_1
    return-void
.end method

.method setSensorsEnabled(IZ)V
    .locals 5
    .param p1, "device_id"    # I
    .param p2, "enabled"    # Z

    .line 598
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-ge v0, v1, :cond_0

    .line 599
    return-void

    .line 601
    :cond_0
    invoke-virtual {p0, p1}, Lorg/libsdl/app/SDLJoystickHandler;->getJoystick(I)Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;

    move-result-object v0

    .line 602
    .local v0, "joystick":Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;
    if-eqz v0, :cond_6

    iget-object v1, v0, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->sensorManager:Landroid/hardware/SensorManager;

    if-nez v1, :cond_1

    goto :goto_1

    .line 605
    :cond_1
    if-eqz p2, :cond_3

    .line 606
    iget-object v1, v0, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->accelerometerSensor:Landroid/hardware/Sensor;

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    .line 607
    iget-object v1, v0, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v3, v0, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->sensorListener:Lorg/libsdl/app/SDLJoySensorListener;

    iget-object v4, v0, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->accelerometerSensor:Landroid/hardware/Sensor;

    invoke-static {v1, v3, v4, v2}, Lorg/libsdl/app/SDLSensorManager;->registerListener(Landroid/hardware/SensorManager;Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)V

    .line 609
    :cond_2
    iget-object v1, v0, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->gyroscopeSensor:Landroid/hardware/Sensor;

    if-eqz v1, :cond_5

    .line 610
    iget-object v1, v0, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v3, v0, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->sensorListener:Lorg/libsdl/app/SDLJoySensorListener;

    iget-object v4, v0, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->gyroscopeSensor:Landroid/hardware/Sensor;

    invoke-static {v1, v3, v4, v2}, Lorg/libsdl/app/SDLSensorManager;->registerListener(Landroid/hardware/SensorManager;Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)V

    goto :goto_0

    .line 613
    :cond_3
    iget-object v1, v0, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->accelerometerSensor:Landroid/hardware/Sensor;

    if-eqz v1, :cond_4

    .line 614
    iget-object v1, v0, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v2, v0, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->sensorListener:Lorg/libsdl/app/SDLJoySensorListener;

    iget-object v3, v0, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->accelerometerSensor:Landroid/hardware/Sensor;

    invoke-static {v1, v2, v3}, Lorg/libsdl/app/SDLSensorManager;->unregisterListener(Landroid/hardware/SensorManager;Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    .line 616
    :cond_4
    iget-object v1, v0, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->gyroscopeSensor:Landroid/hardware/Sensor;

    if-eqz v1, :cond_5

    .line 617
    iget-object v1, v0, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v2, v0, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->sensorListener:Lorg/libsdl/app/SDLJoySensorListener;

    iget-object v3, v0, Lorg/libsdl/app/SDLJoystickHandler$SDLJoystick;->gyroscopeSensor:Landroid/hardware/Sensor;

    invoke-static {v1, v2, v3}, Lorg/libsdl/app/SDLSensorManager;->unregisterListener(Landroid/hardware/SensorManager;Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    .line 620
    :cond_5
    :goto_0
    return-void

    .line 603
    :cond_6
    :goto_1
    return-void
.end method
