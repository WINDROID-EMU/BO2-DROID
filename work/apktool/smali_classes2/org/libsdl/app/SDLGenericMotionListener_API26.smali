.class Lorg/libsdl/app/SDLGenericMotionListener_API26;
.super Lorg/libsdl/app/SDLGenericMotionListener_API24;
.source "SDLControllerManager.java"


# instance fields
.field private mRelativeModeEnabled:Z


# direct methods
.method constructor <init>()V
    .locals 0

    .line 976
    invoke-direct {p0}, Lorg/libsdl/app/SDLGenericMotionListener_API24;-><init>()V

    return-void
.end method


# virtual methods
.method checkRelativeEvent(Landroid/view/MotionEvent;)Z
    .locals 2
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 1032
    nop

    .line 1036
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v0

    const v1, 0x20004

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method getEventX(Landroid/view/MotionEvent;I)F
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "pointerIndex"    # I

    .line 1042
    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    return v0
.end method

.method getEventY(Landroid/view/MotionEvent;I)F
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "pointerIndex"    # I

    .line 1048
    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    return v0
.end method

.method inRelativeMode()Z
    .locals 1

    .line 987
    iget-boolean v0, p0, Lorg/libsdl/app/SDLGenericMotionListener_API26;->mRelativeModeEnabled:Z

    return v0
.end method

.method reclaimRelativeMouseModeIfNeeded()V
    .locals 1

    .line 1017
    nop

    .line 1022
    iget-boolean v0, p0, Lorg/libsdl/app/SDLGenericMotionListener_API26;->mRelativeModeEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lorg/libsdl/app/SDLActivity;->isDeXMode()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1023
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContentView()Landroid/view/View;

    move-result-object v0

    .line 1024
    .local v0, "contentView":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 1025
    invoke-virtual {v0}, Landroid/view/View;->requestPointerCapture()V

    .line 1028
    .end local v0    # "contentView":Landroid/view/View;
    :cond_0
    return-void
.end method

.method setRelativeMouseEnabled(Z)Z
    .locals 2
    .param p1, "enabled"    # Z

    .line 993
    nop

    .line 998
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->isDeXMode()Z

    move-result v0

    if-eqz v0, :cond_1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1b

    if-lt v0, v1, :cond_0

    goto :goto_0

    .line 1010
    :cond_0
    const/4 v0, 0x0

    return v0

    .line 999
    :cond_1
    :goto_0
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContentView()Landroid/view/View;

    move-result-object v0

    .line 1000
    .local v0, "contentView":Landroid/view/View;
    if-eqz v0, :cond_3

    .line 1001
    if-eqz p1, :cond_2

    .line 1002
    invoke-virtual {v0}, Landroid/view/View;->requestPointerCapture()V

    goto :goto_1

    .line 1004
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->releasePointerCapture()V

    .line 1007
    :cond_3
    :goto_1
    iput-boolean p1, p0, Lorg/libsdl/app/SDLGenericMotionListener_API26;->mRelativeModeEnabled:Z

    .line 1008
    const/4 v1, 0x1

    return v1
.end method

.method supportsRelativeMouse()Z
    .locals 2

    .line 982
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->isDeXMode()Z

    move-result v0

    if-eqz v0, :cond_1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1b

    if-lt v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method
