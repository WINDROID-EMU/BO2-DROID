.class public Lorg/libsdl/app/SDLSurface;
.super Landroid/view/SurfaceView;
.source "SDLSurface.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;
.implements Landroid/view/View$OnApplyWindowInsetsListener;
.implements Landroid/view/View$OnKeyListener;
.implements Landroid/view/View$OnTouchListener;
.implements Landroid/hardware/SensorEventListener;
.implements Landroid/view/ScaleGestureDetector$OnScaleGestureListener;


# instance fields
.field protected mDisplay:Landroid/view/Display;

.field protected mHeight:F

.field protected mIsSurfaceReady:Z

.field protected mKeyboardVisible:Z

.field protected mSensorManager:Landroid/hardware/SensorManager;

.field protected mWidth:F

.field private final scaleGestureDetector:Landroid/view/ScaleGestureDetector;


# direct methods
.method protected constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 56
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 57
    invoke-virtual {p0}, Lorg/libsdl/app/SDLSurface;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 59
    new-instance v0, Landroid/view/ScaleGestureDetector;

    invoke-direct {v0, p1, p0}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object v0, p0, Lorg/libsdl/app/SDLSurface;->scaleGestureDetector:Landroid/view/ScaleGestureDetector;

    .line 61
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/libsdl/app/SDLSurface;->setFocusable(Z)V

    .line 62
    invoke-virtual {p0, v0}, Lorg/libsdl/app/SDLSurface;->setFocusableInTouchMode(Z)V

    .line 63
    invoke-virtual {p0}, Lorg/libsdl/app/SDLSurface;->requestFocus()Z

    .line 64
    invoke-virtual {p0, p0}, Lorg/libsdl/app/SDLSurface;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    .line 65
    invoke-virtual {p0, p0}, Lorg/libsdl/app/SDLSurface;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 66
    invoke-virtual {p0, p0}, Lorg/libsdl/app/SDLSurface;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 68
    const-string v0, "window"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    iput-object v0, p0, Lorg/libsdl/app/SDLSurface;->mDisplay:Landroid/view/Display;

    .line 69
    const-string v0, "sensor"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lorg/libsdl/app/SDLSurface;->mSensorManager:Landroid/hardware/SensorManager;

    .line 71
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getMotionListener()Lorg/libsdl/app/SDLGenericMotionListener_API14;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/libsdl/app/SDLSurface;->setOnGenericMotionListener(Landroid/view/View$OnGenericMotionListener;)V

    .line 74
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lorg/libsdl/app/SDLSurface;->mWidth:F

    .line 75
    iput v0, p0, Lorg/libsdl/app/SDLSurface;->mHeight:F

    .line 77
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/libsdl/app/SDLSurface;->mIsSurfaceReady:Z

    .line 78
    return-void
.end method

.method private getNormalizedX(F)F
    .locals 2
    .param p1, "x"    # F

    .line 240
    iget v0, p0, Lorg/libsdl/app/SDLSurface;->mWidth:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_0

    .line 241
    const/high16 v0, 0x3f000000    # 0.5f

    return v0

    .line 243
    :cond_0
    iget v0, p0, Lorg/libsdl/app/SDLSurface;->mWidth:F

    sub-float/2addr v0, v1

    div-float v0, p1, v0

    return v0
.end method

.method private getNormalizedY(F)F
    .locals 2
    .param p1, "y"    # F

    .line 249
    iget v0, p0, Lorg/libsdl/app/SDLSurface;->mHeight:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_0

    .line 250
    const/high16 v0, 0x3f000000    # 0.5f

    return v0

    .line 252
    :cond_0
    iget v0, p0, Lorg/libsdl/app/SDLSurface;->mHeight:F

    sub-float/2addr v0, v1

    div-float v0, p1, v0

    return v0
.end method


# virtual methods
.method protected enableSensor(IZ)V
    .locals 3
    .param p1, "sensortype"    # I
    .param p2, "enabled"    # Z

    .line 330
    if-eqz p2, :cond_0

    .line 331
    iget-object v0, p0, Lorg/libsdl/app/SDLSurface;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lorg/libsdl/app/SDLSurface;->mSensorManager:Landroid/hardware/SensorManager;

    .line 332
    invoke-virtual {v1, p1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v1

    .line 331
    const/4 v2, 0x1

    invoke-static {v0, p0, v1, v2}, Lorg/libsdl/app/SDLSensorManager;->registerListener(Landroid/hardware/SensorManager;Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)V

    goto :goto_0

    .line 335
    :cond_0
    iget-object v0, p0, Lorg/libsdl/app/SDLSurface;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lorg/libsdl/app/SDLSurface;->mSensorManager:Landroid/hardware/SensorManager;

    .line 336
    invoke-virtual {v1, p1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v1

    .line 335
    invoke-static {v0, p0, v1}, Lorg/libsdl/app/SDLSensorManager;->unregisterListener(Landroid/hardware/SensorManager;Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    .line 338
    :goto_0
    return-void
.end method

.method protected getNativeSurface()Landroid/view/Surface;
    .locals 1

    .line 95
    invoke-virtual {p0}, Lorg/libsdl/app/SDLSurface;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v0

    return-object v0
.end method

.method protected handlePause()V
    .locals 2

    .line 81
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/libsdl/app/SDLSurface;->enableSensor(IZ)V

    .line 82
    return-void
.end method

.method protected handleResume()V
    .locals 1

    .line 85
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/libsdl/app/SDLSurface;->setFocusable(Z)V

    .line 86
    invoke-virtual {p0, v0}, Lorg/libsdl/app/SDLSurface;->setFocusableInTouchMode(Z)V

    .line 87
    invoke-virtual {p0}, Lorg/libsdl/app/SDLSurface;->requestFocus()Z

    .line 88
    invoke-virtual {p0, p0}, Lorg/libsdl/app/SDLSurface;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    .line 89
    invoke-virtual {p0, p0}, Lorg/libsdl/app/SDLSurface;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 90
    invoke-virtual {p0, p0}, Lorg/libsdl/app/SDLSurface;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 91
    invoke-virtual {p0, v0, v0}, Lorg/libsdl/app/SDLSurface;->enableSensor(IZ)V

    .line 92
    return-void
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .line 343
    return-void
.end method

.method public onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 5
    .param p1, "v"    # Landroid/view/View;
    .param p2, "insets"    # Landroid/view/WindowInsets;

    .line 206
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_1

    .line 207
    invoke-static {}, Landroid/view/WindowInsets$Type;->systemBars()I

    move-result v0

    .line 208
    invoke-static {}, Landroid/view/WindowInsets$Type;->systemGestures()I

    move-result v1

    or-int/2addr v0, v1

    .line 209
    invoke-static {}, Landroid/view/WindowInsets$Type;->mandatorySystemGestures()I

    move-result v1

    or-int/2addr v0, v1

    .line 210
    invoke-static {}, Landroid/view/WindowInsets$Type;->tappableElement()I

    move-result v1

    or-int/2addr v0, v1

    .line 211
    invoke-static {}, Landroid/view/WindowInsets$Type;->displayCutout()I

    move-result v1

    or-int/2addr v0, v1

    .line 207
    invoke-virtual {p2, v0}, Landroid/view/WindowInsets;->getInsets(I)Landroid/graphics/Insets;

    move-result-object v0

    .line 213
    .local v0, "combined":Landroid/graphics/Insets;
    iget v1, v0, Landroid/graphics/Insets;->left:I

    iget v2, v0, Landroid/graphics/Insets;->right:I

    iget v3, v0, Landroid/graphics/Insets;->top:I

    iget v4, v0, Landroid/graphics/Insets;->bottom:I

    invoke-static {v1, v2, v3, v4}, Lorg/libsdl/app/SDLActivity;->onNativeInsetsChanged(IIII)V

    .line 215
    invoke-static {}, Landroid/view/WindowInsets$Type;->ime()I

    move-result v1

    invoke-virtual {p2, v1}, Landroid/view/WindowInsets;->isVisible(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 216
    iget-boolean v1, p0, Lorg/libsdl/app/SDLSurface;->mKeyboardVisible:Z

    if-nez v1, :cond_1

    .line 217
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/libsdl/app/SDLSurface;->mKeyboardVisible:Z

    .line 218
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->onNativeScreenKeyboardShown()V

    goto :goto_0

    .line 221
    :cond_0
    iget-boolean v1, p0, Lorg/libsdl/app/SDLSurface;->mKeyboardVisible:Z

    if-eqz v1, :cond_1

    .line 222
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/libsdl/app/SDLSurface;->mKeyboardVisible:Z

    .line 223
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->onNativeScreenKeyboardHidden()V

    .line 229
    .end local v0    # "combined":Landroid/graphics/Insets;
    :cond_1
    :goto_0
    return-object p2
.end method

.method public onCapturedPointerEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 399
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getMotionListener()Lorg/libsdl/app/SDLGenericMotionListener_API14;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/libsdl/app/SDLGenericMotionListener_API14;->onGenericMotion(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .line 235
    const/4 v0, 0x0

    invoke-static {p1, p2, p3, v0}, Lorg/libsdl/app/SDLActivity;->handleKeyEvent(Landroid/view/View;ILandroid/view/KeyEvent;Landroid/view/inputmethod/InputConnection;)Z

    move-result v0

    return v0
.end method

.method public onResolvePointerIcon(Landroid/view/MotionEvent;I)Landroid/view/PointerIcon;
    .locals 2
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "pointerIndex"    # I

    .line 389
    :try_start_0
    invoke-super {p0, p1, p2}, Landroid/view/SurfaceView;->onResolvePointerIcon(Landroid/view/MotionEvent;I)Landroid/view/PointerIcon;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 390
    :catch_0
    move-exception v0

    .line 391
    .local v0, "e":Ljava/lang/NullPointerException;
    const/4 v1, 0x0

    return-object v1
.end method

.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 6
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .line 404
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result v0

    .line 405
    .local v0, "scale":F
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getCurrentSpanX()F

    move-result v1

    invoke-direct {p0, v1}, Lorg/libsdl/app/SDLSurface;->getNormalizedX(F)F

    move-result v1

    .line 406
    .local v1, "span_x":F
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getCurrentSpanY()F

    move-result v2

    invoke-direct {p0, v2}, Lorg/libsdl/app/SDLSurface;->getNormalizedY(F)F

    move-result v2

    .line 407
    .local v2, "span_y":F
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v3

    invoke-direct {p0, v3}, Lorg/libsdl/app/SDLSurface;->getNormalizedX(F)F

    move-result v3

    .line 408
    .local v3, "focus_x":F
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result v4

    invoke-direct {p0, v4}, Lorg/libsdl/app/SDLSurface;->getNormalizedY(F)F

    move-result v4

    .line 409
    .local v4, "focus_y":F
    invoke-static {v0, v1, v2, v3, v4}, Lorg/libsdl/app/SDLActivity;->onNativePinchUpdate(FFFFF)V

    .line 410
    const/4 v5, 0x1

    return v5
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .locals 5
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .line 415
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getCurrentSpanX()F

    move-result v0

    invoke-direct {p0, v0}, Lorg/libsdl/app/SDLSurface;->getNormalizedX(F)F

    move-result v0

    .line 416
    .local v0, "span_x":F
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getCurrentSpanY()F

    move-result v1

    invoke-direct {p0, v1}, Lorg/libsdl/app/SDLSurface;->getNormalizedY(F)F

    move-result v1

    .line 417
    .local v1, "span_y":F
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v2

    invoke-direct {p0, v2}, Lorg/libsdl/app/SDLSurface;->getNormalizedX(F)F

    move-result v2

    .line 418
    .local v2, "focus_x":F
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result v3

    invoke-direct {p0, v3}, Lorg/libsdl/app/SDLSurface;->getNormalizedY(F)F

    move-result v3

    .line 419
    .local v3, "focus_y":F
    invoke-static {v0, v1, v2, v3}, Lorg/libsdl/app/SDLActivity;->onNativePinchStart(FFFF)V

    .line 420
    const/4 v4, 0x1

    return v4
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .locals 0
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .line 425
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->onNativePinchEnd()V

    .line 426
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 4
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .line 347
    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v0}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 354
    iget-object v0, p0, Lorg/libsdl/app/SDLSurface;->mDisplay:Landroid/view/Display;

    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v0

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    .line 357
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v0, v0, v2

    .line 358
    .local v0, "x":F
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v1, v2, v1

    .line 359
    .local v1, "y":F
    const/4 v2, 0x0

    .line 360
    .local v2, "newRotation":I
    goto :goto_0

    .line 372
    .end local v0    # "x":F
    .end local v1    # "y":F
    .end local v2    # "newRotation":I
    :pswitch_0
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v0, v0, v1

    .line 373
    .restart local v0    # "x":F
    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v1, v1, v2

    neg-float v1, v1

    .line 374
    .restart local v1    # "y":F
    const/16 v2, 0x10e

    .restart local v2    # "newRotation":I
    goto :goto_0

    .line 367
    .end local v0    # "x":F
    .end local v1    # "y":F
    .end local v2    # "newRotation":I
    :pswitch_1
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v0, v0, v2

    neg-float v0, v0

    .line 368
    .restart local v0    # "x":F
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v1, v2, v1

    neg-float v1, v1

    .line 369
    .restart local v1    # "y":F
    const/16 v2, 0xb4

    .line 370
    .restart local v2    # "newRotation":I
    goto :goto_0

    .line 362
    .end local v0    # "x":F
    .end local v1    # "y":F
    .end local v2    # "newRotation":I
    :pswitch_2
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v0, v0, v1

    neg-float v0, v0

    .line 363
    .restart local v0    # "x":F
    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v1, v1, v2

    .line 364
    .restart local v1    # "y":F
    const/16 v2, 0x5a

    .line 365
    .restart local v2    # "newRotation":I
    nop

    .line 378
    :goto_0
    sget v3, Lorg/libsdl/app/SDLActivity;->mCurrentRotation:I

    if-eq v2, v3, :cond_0

    .line 379
    sput v2, Lorg/libsdl/app/SDLActivity;->mCurrentRotation:I

    .line 380
    invoke-static {v2}, Lorg/libsdl/app/SDLActivity;->onNativeRotationChanged(I)V

    .line 383
    .end local v0    # "x":F
    .end local v1    # "y":F
    .end local v2    # "newRotation":I
    :cond_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 21
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .line 260
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getDeviceId()I

    move-result v8

    .line 261
    .local v8, "touchDevId":I
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v9

    .line 262
    .local v9, "pointerCount":I
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v15

    .line 264
    .local v15, "action":I
    const/4 v2, 0x0

    .line 267
    .local v2, "i":I
    const/4 v14, 0x5

    const/4 v13, 0x6

    if-eq v15, v13, :cond_1

    if-ne v15, v14, :cond_0

    goto :goto_0

    :cond_0
    move v12, v2

    goto :goto_1

    .line 268
    :cond_1
    :goto_0
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v2

    move v12, v2

    .line 271
    .end local v2    # "i":I
    .local v12, "i":I
    :goto_1
    invoke-virtual {v1, v12}, Landroid/view/MotionEvent;->getToolType(I)I

    move-result v11

    .line 273
    .local v11, "toolType":I
    const/4 v2, 0x3

    const/16 v17, 0x1

    if-ne v11, v2, :cond_2

    .line 274
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getButtonState()I

    move-result v2

    .line 275
    .local v2, "buttonState":I
    const/4 v3, 0x0

    .line 279
    .local v3, "relative":Z
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getMotionListener()Lorg/libsdl/app/SDLGenericMotionListener_API14;

    move-result-object v4

    .line 280
    .local v4, "motionListener":Lorg/libsdl/app/SDLGenericMotionListener_API14;
    invoke-virtual {v4, v1, v12}, Lorg/libsdl/app/SDLGenericMotionListener_API14;->getEventX(Landroid/view/MotionEvent;I)F

    move-result v5

    .line 281
    .local v5, "x":F
    invoke-virtual {v4, v1, v12}, Lorg/libsdl/app/SDLGenericMotionListener_API14;->getEventY(Landroid/view/MotionEvent;I)F

    move-result v6

    .line 282
    .local v6, "y":F
    invoke-virtual {v4}, Lorg/libsdl/app/SDLGenericMotionListener_API14;->inRelativeMode()Z

    move-result v3

    .line 284
    invoke-static {v2, v15, v5, v6, v3}, Lorg/libsdl/app/SDLActivity;->onNativeMouse(IIFFZ)V

    .line 285
    .end local v2    # "buttonState":I
    .end local v3    # "relative":Z
    .end local v4    # "motionListener":Lorg/libsdl/app/SDLGenericMotionListener_API14;
    move/from16 v16, v5

    move/from16 v18, v11

    move v4, v12

    move v3, v13

    move v5, v15

    goto/16 :goto_6

    .end local v5    # "x":F
    .end local v6    # "y":F
    :cond_2
    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x2

    const/4 v4, 0x4

    if-eq v11, v3, :cond_5

    if-ne v11, v4, :cond_3

    goto :goto_3

    .line 304
    :cond_3
    invoke-virtual {v1, v12}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v10

    .line 305
    .local v10, "pointerId":I
    invoke-virtual {v1, v12}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    invoke-direct {v0, v3}, Lorg/libsdl/app/SDLSurface;->getNormalizedX(F)F

    move-result v16

    .line 306
    .local v16, "x":F
    invoke-virtual {v1, v12}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    invoke-direct {v0, v3}, Lorg/libsdl/app/SDLSurface;->getNormalizedY(F)F

    move-result v18

    .line 307
    .local v18, "y":F
    invoke-virtual {v1, v12}, Landroid/view/MotionEvent;->getPressure(I)F

    move-result v3

    .line 308
    .local v3, "p":F
    cmpl-float v2, v3, v2

    if-lez v2, :cond_4

    .line 311
    const/high16 v3, 0x3f800000    # 1.0f

    move/from16 v19, v3

    goto :goto_2

    .line 308
    :cond_4
    move/from16 v19, v3

    .line 314
    .end local v3    # "p":F
    .local v19, "p":F
    :goto_2
    move v2, v8

    move v3, v10

    move v4, v15

    move/from16 v5, v16

    move/from16 v6, v18

    move/from16 v7, v19

    invoke-static/range {v2 .. v7}, Lorg/libsdl/app/SDLActivity;->onNativeTouch(IIIFFF)V

    move v4, v12

    move v3, v13

    move v5, v15

    move/from16 v18, v11

    goto :goto_6

    .line 286
    .end local v10    # "pointerId":I
    .end local v16    # "x":F
    .end local v18    # "y":F
    .end local v19    # "p":F
    :cond_5
    :goto_3
    invoke-virtual {v1, v12}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    .line 287
    .local v5, "pointerId":I
    invoke-virtual {v1, v12}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    .line 288
    .local v6, "x":F
    invoke-virtual {v1, v12}, Landroid/view/MotionEvent;->getY(I)F

    move-result v7

    .line 289
    .local v7, "y":F
    invoke-virtual {v1, v12}, Landroid/view/MotionEvent;->getPressure(I)F

    move-result v10

    .line 290
    .local v10, "p":F
    cmpl-float v2, v10, v2

    if-lez v2, :cond_6

    .line 293
    const/high16 v10, 0x3f800000    # 1.0f

    move v2, v10

    goto :goto_4

    .line 290
    :cond_6
    move v2, v10

    .line 297
    .end local v10    # "p":F
    .local v2, "p":F
    :goto_4
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getButtonState()I

    move-result v10

    shr-int/2addr v10, v4

    if-ne v11, v3, :cond_7

    const/4 v3, 0x0

    goto :goto_5

    :cond_7
    const/16 v3, 0x1e

    :goto_5
    shl-int v3, v17, v3

    or-int/2addr v3, v10

    .line 298
    .local v3, "buttonState":I
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getButtonState()I

    move-result v10

    and-int/2addr v4, v10

    if-eqz v4, :cond_8

    .line 299
    or-int/lit8 v3, v3, 0x8

    .line 302
    :cond_8
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getMotionListener()Lorg/libsdl/app/SDLGenericMotionListener_API14;

    move-result-object v4

    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getDevice()Landroid/view/InputDevice;

    move-result-object v10

    invoke-virtual {v4, v10}, Lorg/libsdl/app/SDLGenericMotionListener_API14;->getPenDeviceType(Landroid/view/InputDevice;)I

    move-result v4

    move v10, v5

    move/from16 v18, v11

    .end local v11    # "toolType":I
    .local v18, "toolType":I
    move v11, v4

    move v4, v12

    .end local v12    # "i":I
    .local v4, "i":I
    move v12, v3

    move/from16 v19, v3

    move v3, v13

    .end local v3    # "buttonState":I
    .local v19, "buttonState":I
    move v13, v15

    move v14, v6

    move/from16 v20, v5

    move v5, v15

    .end local v15    # "action":I
    .local v5, "action":I
    .local v20, "pointerId":I
    move v15, v7

    move/from16 v16, v2

    invoke-static/range {v10 .. v16}, Lorg/libsdl/app/SDLActivity;->onNativePen(IIIIFFF)V

    .line 303
    .end local v19    # "buttonState":I
    move/from16 v16, v6

    move v6, v7

    .line 318
    .end local v2    # "p":F
    .end local v7    # "y":F
    .end local v20    # "pointerId":I
    .local v6, "y":F
    .restart local v16    # "x":F
    :goto_6
    if-eq v5, v3, :cond_b

    const/4 v2, 0x5

    if-ne v5, v2, :cond_9

    .line 319
    goto :goto_7

    .line 320
    .end local v18    # "toolType":I
    :cond_9
    add-int/lit8 v12, v4, 0x1

    .end local v4    # "i":I
    .restart local v12    # "i":I
    if-lt v12, v9, :cond_a

    goto :goto_8

    :cond_a
    move v14, v2

    move v13, v3

    move v15, v5

    goto/16 :goto_1

    .line 322
    .end local v12    # "i":I
    .restart local v4    # "i":I
    :cond_b
    :goto_7
    move v12, v4

    .end local v4    # "i":I
    .restart local v12    # "i":I
    :goto_8
    iget-object v2, v0, Lorg/libsdl/app/SDLSurface;->scaleGestureDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v2, v1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 324
    return v17
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 17
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .line 122
    move-object/from16 v1, p0

    move/from16 v8, p3

    move/from16 v9, p4

    const-string v0, "SDL"

    const-string v2, "surfaceChanged()"

    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    if-nez v0, :cond_0

    .line 125
    return-void

    .line 128
    :cond_0
    int-to-float v0, v8

    iput v0, v1, Lorg/libsdl/app/SDLSurface;->mWidth:F

    .line 129
    int-to-float v0, v9

    iput v0, v1, Lorg/libsdl/app/SDLSurface;->mHeight:F

    .line 130
    move/from16 v2, p3

    .line 131
    .local v2, "nDeviceWidth":I
    move/from16 v3, p4

    .line 132
    .local v3, "nDeviceHeight":I
    const/high16 v4, 0x3f800000    # 1.0f

    .line 135
    .local v4, "density":F
    :try_start_0
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 136
    .local v0, "realMetrics":Landroid/util/DisplayMetrics;
    iget-object v5, v1, Lorg/libsdl/app/SDLSurface;->mDisplay:Landroid/view/Display;

    invoke-virtual {v5, v0}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    .line 137
    iget v5, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    move v2, v5

    .line 138
    iget v5, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    move v3, v5

    .line 140
    iget v5, v0, Landroid/util/DisplayMetrics;->densityDpi:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    int-to-float v5, v5

    const/high16 v6, 0x43200000    # 160.0f

    div-float v4, v5, v6

    .line 142
    .end local v0    # "realMetrics":Landroid/util/DisplayMetrics;
    move v10, v2

    move v11, v3

    move v12, v4

    goto :goto_0

    .line 141
    :catch_0
    move-exception v0

    move v10, v2

    move v11, v3

    move v12, v4

    .line 144
    .end local v2    # "nDeviceWidth":I
    .end local v3    # "nDeviceHeight":I
    .end local v4    # "density":F
    .local v10, "nDeviceWidth":I
    .local v11, "nDeviceHeight":I
    .local v12, "density":F
    :goto_0
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContext()Landroid/app/Activity;

    move-result-object v2

    monitor-enter v2

    .line 146
    :try_start_1
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContext()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 147
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 149
    const-string v0, "SDL"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Window size: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    const-string v0, "SDL"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Device size: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    iget-object v0, v1, Lorg/libsdl/app/SDLSurface;->mDisplay:Landroid/view/Display;

    invoke-virtual {v0}, Landroid/view/Display;->getRefreshRate()F

    move-result v7

    move/from16 v2, p3

    move/from16 v3, p4

    move v4, v10

    move v5, v11

    move v6, v12

    invoke-static/range {v2 .. v7}, Lorg/libsdl/app/SDLActivity;->nativeSetScreenResolution(IIIIFF)V

    .line 152
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->onNativeResize()V

    .line 156
    const/4 v0, 0x0

    .line 157
    .local v0, "skip":Z
    sget-object v2, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    invoke-virtual {v2}, Lorg/libsdl/app/SDLActivity;->getRequestedOrientation()I

    move-result v2

    .line 159
    .local v2, "requestedOrientation":I
    const/4 v3, 0x1

    if-eq v2, v3, :cond_3

    const/4 v4, 0x7

    if-ne v2, v4, :cond_1

    goto :goto_1

    .line 163
    :cond_1
    if-eqz v2, :cond_2

    const/4 v4, 0x6

    if-ne v2, v4, :cond_4

    .line 164
    :cond_2
    iget v4, v1, Lorg/libsdl/app/SDLSurface;->mWidth:F

    iget v5, v1, Lorg/libsdl/app/SDLSurface;->mHeight:F

    cmpg-float v4, v4, v5

    if-gez v4, :cond_4

    .line 165
    const/4 v0, 0x1

    goto :goto_2

    .line 160
    :cond_3
    :goto_1
    iget v4, v1, Lorg/libsdl/app/SDLSurface;->mWidth:F

    iget v5, v1, Lorg/libsdl/app/SDLSurface;->mHeight:F

    cmpl-float v4, v4, v5

    if-lez v4, :cond_4

    .line 161
    const/4 v0, 0x1

    .line 170
    :cond_4
    :goto_2
    if-eqz v0, :cond_5

    .line 171
    iget v4, v1, Lorg/libsdl/app/SDLSurface;->mWidth:F

    iget v5, v1, Lorg/libsdl/app/SDLSurface;->mHeight:F

    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    move-result v4

    float-to-double v4, v4

    .line 172
    .local v4, "min":D
    iget v6, v1, Lorg/libsdl/app/SDLSurface;->mWidth:F

    iget v7, v1, Lorg/libsdl/app/SDLSurface;->mHeight:F

    invoke-static {v6, v7}, Ljava/lang/Math;->max(FF)F

    move-result v6

    float-to-double v6, v6

    .line 174
    .local v6, "max":D
    div-double v13, v6, v4

    const-wide v15, 0x3ff3333333333333L    # 1.2

    cmpg-double v13, v13, v15

    if-gez v13, :cond_5

    .line 175
    const-string v13, "SDL"

    const-string v14, "Don\'t skip on such aspect-ratio. Could be a square resolution."

    invoke-static {v13, v14}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    const/4 v0, 0x0

    .line 181
    .end local v4    # "min":D
    .end local v6    # "max":D
    :cond_5
    if-eqz v0, :cond_6

    .line 182
    nop

    .line 183
    const/4 v0, 0x0

    .line 187
    :cond_6
    if-eqz v0, :cond_7

    .line 188
    const-string v3, "SDL"

    const-string v4, "Skip .. Surface is not ready."

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    const/4 v3, 0x0

    iput-boolean v3, v1, Lorg/libsdl/app/SDLSurface;->mIsSurfaceReady:Z

    .line 190
    return-void

    .line 194
    :cond_7
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->onNativeSurfaceChanged()V

    .line 197
    iput-boolean v3, v1, Lorg/libsdl/app/SDLSurface;->mIsSurfaceReady:Z

    .line 199
    sget-object v3, Lorg/libsdl/app/SDLActivity$NativeState;->RESUMED:Lorg/libsdl/app/SDLActivity$NativeState;

    sput-object v3, Lorg/libsdl/app/SDLActivity;->mNextNativeState:Lorg/libsdl/app/SDLActivity$NativeState;

    .line 200
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->handleNativeState()V

    .line 201
    return-void

    .line 147
    .end local v0    # "skip":Z
    .end local v2    # "requestedOrientation":I
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .line 101
    const-string v0, "SDL"

    const-string v1, "surfaceCreated()"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->onNativeSurfaceCreated()V

    .line 103
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .line 108
    const-string v0, "SDL"

    const-string v1, "surfaceDestroyed()"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    sget-object v0, Lorg/libsdl/app/SDLActivity$NativeState;->PAUSED:Lorg/libsdl/app/SDLActivity$NativeState;

    sput-object v0, Lorg/libsdl/app/SDLActivity;->mNextNativeState:Lorg/libsdl/app/SDLActivity$NativeState;

    .line 112
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->handleNativeState()V

    .line 114
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/libsdl/app/SDLSurface;->mIsSurfaceReady:Z

    .line 115
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->onNativeSurfaceDestroyed()V

    .line 116
    return-void
.end method
