.class Lorg/libsdl/app/SDLGenericMotionListener_API14;
.super Ljava/lang/Object;
.source "SDLControllerManager.java"

# interfaces
.implements Landroid/view/View$OnGenericMotionListener;


# static fields
.field protected static final SDL_PEN_DEVICE_TYPE_DIRECT:I = 0x1

.field protected static final SDL_PEN_DEVICE_TYPE_INDIRECT:I = 0x2

.field protected static final SDL_PEN_DEVICE_TYPE_UNKNOWN:I


# direct methods
.method constructor <init>()V
    .locals 0

    .line 813
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method checkRelativeEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 910
    invoke-virtual {p0}, Lorg/libsdl/app/SDLGenericMotionListener_API14;->inRelativeMode()Z

    move-result v0

    return v0
.end method

.method getEventX(Landroid/view/MotionEvent;I)F
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "pointerIndex"    # I

    .line 914
    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    return v0
.end method

.method getEventY(Landroid/view/MotionEvent;I)F
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "pointerIndex"    # I

    .line 918
    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    return v0
.end method

.method getPenDeviceType(Landroid/view/InputDevice;)I
    .locals 1
    .param p1, "penDevice"    # Landroid/view/InputDevice;

    .line 922
    const/4 v0, 0x0

    return v0
.end method

.method inRelativeMode()Z
    .locals 1

    .line 898
    const/4 v0, 0x0

    return v0
.end method

.method public onGenericMotion(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 18
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .line 821
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getSource()I

    move-result v2

    const v3, 0x1000010

    if-ne v2, v3, :cond_0

    .line 822
    invoke-static/range {p2 .. p2}, Lorg/libsdl/app/SDLControllerManager;->handleJoystickMotionEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    return v2

    .line 825
    :cond_0
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    .line 826
    .local v2, "action":I
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v10

    .line 827
    .local v10, "pointerCount":I
    const/4 v3, 0x0

    .line 829
    .local v3, "consumed":Z
    const/4 v4, 0x0

    move v11, v3

    move v12, v4

    .end local v3    # "consumed":Z
    .local v11, "consumed":Z
    .local v12, "i":I
    :goto_0
    if-ge v12, v10, :cond_8

    .line 830
    invoke-virtual {v1, v12}, Landroid/view/MotionEvent;->getToolType(I)I

    move-result v13

    .line 832
    .local v13, "toolType":I
    const/4 v3, 0x3

    const/4 v4, 0x0

    if-ne v13, v3, :cond_3

    .line 833
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getButtonState()I

    move-result v3

    .line 835
    .local v3, "buttonState":I
    sparse-switch v2, :sswitch_data_0

    goto :goto_1

    .line 837
    :sswitch_0
    const/16 v5, 0xa

    invoke-virtual {v1, v5, v12}, Landroid/view/MotionEvent;->getAxisValue(II)F

    move-result v5

    .line 838
    .local v5, "x":F
    const/16 v6, 0x9

    invoke-virtual {v1, v6, v12}, Landroid/view/MotionEvent;->getAxisValue(II)F

    move-result v6

    .line 839
    .local v6, "y":F
    invoke-static {v3, v2, v5, v6, v4}, Lorg/libsdl/app/SDLActivity;->onNativeMouse(IIFFZ)V

    .line 840
    const/4 v11, 0x1

    .line 841
    goto :goto_1

    .line 847
    .end local v5    # "x":F
    .end local v6    # "y":F
    :sswitch_1
    invoke-virtual {v0, v1}, Lorg/libsdl/app/SDLGenericMotionListener_API14;->checkRelativeEvent(Landroid/view/MotionEvent;)Z

    move-result v4

    .line 848
    .local v4, "isRelative":Z
    invoke-virtual {v0, v1, v12}, Lorg/libsdl/app/SDLGenericMotionListener_API14;->getEventX(Landroid/view/MotionEvent;I)F

    move-result v5

    .line 849
    .restart local v5    # "x":F
    invoke-virtual {v0, v1, v12}, Lorg/libsdl/app/SDLGenericMotionListener_API14;->getEventY(Landroid/view/MotionEvent;I)F

    move-result v6

    .line 851
    .restart local v6    # "y":F
    if-nez v4, :cond_1

    const/16 v7, 0xb

    if-eq v2, v7, :cond_2

    const/16 v7, 0xc

    if-eq v2, v7, :cond_2

    .line 855
    :cond_1
    invoke-static {v3, v2, v5, v6, v4}, Lorg/libsdl/app/SDLActivity;->onNativeMouse(IIFFZ)V

    .line 856
    const/4 v11, 0x1

    .line 863
    .end local v3    # "buttonState":I
    .end local v4    # "isRelative":Z
    .end local v5    # "x":F
    .end local v6    # "y":F
    :cond_2
    :goto_1
    goto :goto_5

    :cond_3
    const/4 v3, 0x2

    const/4 v5, 0x4

    if-eq v13, v3, :cond_4

    if-ne v13, v5, :cond_2

    .line 864
    :cond_4
    packed-switch v2, :pswitch_data_0

    :pswitch_0
    goto :goto_5

    .line 868
    :pswitch_1
    invoke-virtual {v1, v12}, Landroid/view/MotionEvent;->getX(I)F

    move-result v14

    .line 869
    .local v14, "x":F
    invoke-virtual {v1, v12}, Landroid/view/MotionEvent;->getY(I)F

    move-result v15

    .line 870
    .local v15, "y":F
    invoke-virtual {v1, v12}, Landroid/view/MotionEvent;->getPressure(I)F

    move-result v6

    .line 871
    .local v6, "p":F
    const/high16 v7, 0x3f800000    # 1.0f

    cmpl-float v7, v6, v7

    if-lez v7, :cond_5

    .line 874
    const/high16 v6, 0x3f800000    # 1.0f

    move/from16 v16, v6

    goto :goto_2

    .line 871
    :cond_5
    move/from16 v16, v6

    .line 878
    .end local v6    # "p":F
    .local v16, "p":F
    :goto_2
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getButtonState()I

    move-result v6

    shr-int/2addr v6, v5

    if-ne v13, v3, :cond_6

    goto :goto_3

    :cond_6
    const/16 v4, 0x1e

    :goto_3
    const/4 v3, 0x1

    shl-int/2addr v3, v4

    or-int/2addr v3, v6

    .line 879
    .local v3, "buttons":I
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getButtonState()I

    move-result v4

    and-int/2addr v4, v5

    if-eqz v4, :cond_7

    .line 880
    or-int/lit8 v3, v3, 0x8

    move/from16 v17, v3

    goto :goto_4

    .line 879
    :cond_7
    move/from16 v17, v3

    .line 883
    .end local v3    # "buttons":I
    .local v17, "buttons":I
    :goto_4
    invoke-virtual {v1, v12}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getDevice()Landroid/view/InputDevice;

    move-result-object v4

    invoke-virtual {v0, v4}, Lorg/libsdl/app/SDLGenericMotionListener_API14;->getPenDeviceType(Landroid/view/InputDevice;)I

    move-result v4

    move/from16 v5, v17

    move v6, v2

    move v7, v14

    move v8, v15

    move/from16 v9, v16

    invoke-static/range {v3 .. v9}, Lorg/libsdl/app/SDLActivity;->onNativePen(IIIIFFF)V

    .line 884
    const/4 v3, 0x1

    move v11, v3

    .line 829
    .end local v13    # "toolType":I
    .end local v14    # "x":F
    .end local v15    # "y":F
    .end local v16    # "p":F
    .end local v17    # "buttons":I
    :goto_5
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_0

    .line 890
    .end local v12    # "i":I
    :cond_8
    return v11

    nop

    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_1
        0x7 -> :sswitch_1
        0x8 -> :sswitch_0
        0xb -> :sswitch_1
        0xc -> :sswitch_1
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method reclaimRelativeMouseModeIfNeeded()V
    .locals 0

    .line 907
    return-void
.end method

.method setRelativeMouseEnabled(Z)Z
    .locals 1
    .param p1, "enabled"    # Z

    .line 902
    const/4 v0, 0x0

    return v0
.end method

.method supportsRelativeMouse()Z
    .locals 1

    .line 894
    const/4 v0, 0x0

    return v0
.end method
