.class Lorg/libsdl/app/SDLGenericMotionListener_API24;
.super Lorg/libsdl/app/SDLGenericMotionListener_API14;
.source "SDLControllerManager.java"


# instance fields
.field private mRelativeModeEnabled:Z


# direct methods
.method constructor <init>()V
    .locals 0

    .line 926
    invoke-direct {p0}, Lorg/libsdl/app/SDLGenericMotionListener_API14;-><init>()V

    return-void
.end method


# virtual methods
.method getEventX(Landroid/view/MotionEvent;I)F
    .locals 2
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "pointerIndex"    # I

    .line 949
    nop

    .line 954
    iget-boolean v0, p0, Lorg/libsdl/app/SDLGenericMotionListener_API24;->mRelativeModeEnabled:Z

    if-eqz v0, :cond_0

    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->getToolType(I)I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 955
    const/16 v0, 0x1b

    invoke-virtual {p1, v0, p2}, Landroid/view/MotionEvent;->getAxisValue(II)F

    move-result v0

    return v0

    .line 957
    :cond_0
    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    return v0
.end method

.method getEventY(Landroid/view/MotionEvent;I)F
    .locals 2
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "pointerIndex"    # I

    .line 963
    nop

    .line 968
    iget-boolean v0, p0, Lorg/libsdl/app/SDLGenericMotionListener_API24;->mRelativeModeEnabled:Z

    if-eqz v0, :cond_0

    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->getToolType(I)I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 969
    const/16 v0, 0x1c

    invoke-virtual {p1, v0, p2}, Landroid/view/MotionEvent;->getAxisValue(II)F

    move-result v0

    return v0

    .line 971
    :cond_0
    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    return v0
.end method

.method inRelativeMode()Z
    .locals 1

    .line 938
    iget-boolean v0, p0, Lorg/libsdl/app/SDLGenericMotionListener_API24;->mRelativeModeEnabled:Z

    return v0
.end method

.method setRelativeMouseEnabled(Z)Z
    .locals 1
    .param p1, "enabled"    # Z

    .line 943
    iput-boolean p1, p0, Lorg/libsdl/app/SDLGenericMotionListener_API24;->mRelativeModeEnabled:Z

    .line 944
    const/4 v0, 0x1

    return v0
.end method

.method supportsRelativeMouse()Z
    .locals 1

    .line 933
    const/4 v0, 0x1

    return v0
.end method
