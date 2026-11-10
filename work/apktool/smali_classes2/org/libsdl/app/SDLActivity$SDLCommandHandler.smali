.class public Lorg/libsdl/app/SDLActivity$SDLCommandHandler;
.super Landroid/os/Handler;
.source "SDLActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/libsdl/app/SDLActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "SDLCommandHandler"
.end annotation


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 1017
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 8
    .param p1, "msg"    # Landroid/os/Message;

    .line 1020
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContext()Landroid/app/Activity;

    move-result-object v0

    .line 1021
    .local v0, "context":Landroid/content/Context;
    const-string v1, "SDL"

    if-nez v0, :cond_0

    .line 1022
    const-string v2, "error handling message, getContext() returned null"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1023
    return-void

    .line 1025
    :cond_0
    iget v2, p1, Landroid/os/Message;->arg1:I

    const-string v3, "error handling message, getContext() returned no Activity"

    const/4 v4, 0x0

    packed-switch v2, :pswitch_data_0

    .line 1120
    :pswitch_0
    instance-of v2, v0, Lorg/libsdl/app/SDLActivity;

    if-eqz v2, :cond_b

    move-object v2, v0

    check-cast v2, Lorg/libsdl/app/SDLActivity;

    iget v3, p1, Landroid/os/Message;->arg1:I

    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v2, v3, v4}, Lorg/libsdl/app/SDLActivity;->onUnhandledMessage(ILjava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_b

    .line 1121
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "error handling message, command is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_4

    .line 1107
    :pswitch_1
    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_b

    .line 1108
    move-object v1, v0

    check-cast v1, Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    .line 1109
    .local v1, "window":Landroid/view/Window;
    if-eqz v1, :cond_2

    .line 1110
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v2, v2, Ljava/lang/Integer;

    const/16 v3, 0x80

    if-eqz v2, :cond_1

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-eqz v2, :cond_1

    .line 1111
    invoke-virtual {v1, v3}, Landroid/view/Window;->addFlags(I)V

    goto :goto_0

    .line 1113
    :cond_1
    invoke-virtual {v1, v3}, Landroid/view/Window;->clearFlags(I)V

    .line 1116
    .end local v1    # "window":Landroid/view/Window;
    :cond_2
    :goto_0
    goto/16 :goto_4

    .line 1091
    :pswitch_2
    sget-object v1, Lorg/libsdl/app/SDLActivity;->mTextEdit:Lorg/libsdl/app/SDLDummyEdit;

    if-eqz v1, :cond_b

    .line 1095
    sget-object v1, Lorg/libsdl/app/SDLActivity;->mTextEdit:Lorg/libsdl/app/SDLDummyEdit;

    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v4, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2}, Lorg/libsdl/app/SDLDummyEdit;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1097
    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    .line 1098
    .local v1, "imm":Landroid/view/inputmethod/InputMethodManager;
    sget-object v2, Lorg/libsdl/app/SDLActivity;->mTextEdit:Lorg/libsdl/app/SDLDummyEdit;

    invoke-virtual {v2}, Lorg/libsdl/app/SDLDummyEdit;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    invoke-virtual {v1, v2, v4}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 1100
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->onNativeScreenKeyboardHidden()V

    .line 1102
    sget-object v2, Lorg/libsdl/app/SDLActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    invoke-virtual {v2}, Lorg/libsdl/app/SDLSurface;->requestFocus()Z

    .line 1103
    .end local v1    # "imm":Landroid/view/inputmethod/InputMethodManager;
    goto/16 :goto_4

    .line 1034
    :pswitch_3
    instance-of v2, v0, Landroid/app/Activity;

    if-eqz v2, :cond_9

    .line 1035
    move-object v1, v0

    check-cast v1, Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    .line 1036
    .local v1, "window":Landroid/view/Window;
    if-eqz v1, :cond_8

    .line 1037
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v2, v2, Ljava/lang/Integer;

    const/4 v3, 0x1

    const/16 v5, 0x400

    const/16 v6, 0x800

    const/16 v7, 0x1e

    if-eqz v2, :cond_5

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-eqz v2, :cond_5

    .line 1038
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v2, v7, :cond_4

    .line 1043
    invoke-virtual {v1}, Landroid/view/Window;->getInsetsController()Landroid/view/WindowInsetsController;

    move-result-object v2

    .line 1044
    .local v2, "controller":Landroid/view/WindowInsetsController;
    if-eqz v2, :cond_3

    .line 1045
    invoke-static {}, Landroid/view/WindowInsets$Type;->systemBars()I

    move-result v4

    invoke-interface {v2, v4}, Landroid/view/WindowInsetsController;->hide(I)V

    .line 1048
    const/4 v4, 0x2

    invoke-interface {v2, v4}, Landroid/view/WindowInsetsController;->setSystemBarsBehavior(I)V

    .line 1051
    .end local v2    # "controller":Landroid/view/WindowInsetsController;
    :cond_3
    goto :goto_1

    .line 1052
    :cond_4
    const/16 v2, 0x1706

    .line 1058
    .local v2, "flags":I
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 1059
    invoke-virtual {v1, v5}, Landroid/view/Window;->addFlags(I)V

    .line 1060
    invoke-virtual {v1, v6}, Landroid/view/Window;->clearFlags(I)V

    .line 1062
    .end local v2    # "flags":I
    :goto_1
    sput-boolean v3, Lorg/libsdl/app/SDLActivity;->mFullscreenModeActive:Z

    goto :goto_3

    .line 1064
    :cond_5
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v2, v7, :cond_7

    .line 1068
    invoke-virtual {v1}, Landroid/view/Window;->getInsetsController()Landroid/view/WindowInsetsController;

    move-result-object v2

    .line 1069
    .local v2, "controller":Landroid/view/WindowInsetsController;
    if-eqz v2, :cond_6

    .line 1070
    invoke-interface {v2, v3}, Landroid/view/WindowInsetsController;->setSystemBarsBehavior(I)V

    .line 1072
    invoke-static {}, Landroid/view/WindowInsets$Type;->systemBars()I

    move-result v3

    invoke-interface {v2, v3}, Landroid/view/WindowInsetsController;->show(I)V

    .line 1074
    .end local v2    # "controller":Landroid/view/WindowInsetsController;
    :cond_6
    goto :goto_2

    .line 1075
    :cond_7
    const/16 v2, 0x100

    .line 1076
    .local v2, "flags":I
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 1077
    invoke-virtual {v1, v6}, Landroid/view/Window;->addFlags(I)V

    .line 1078
    invoke-virtual {v1, v5}, Landroid/view/Window;->clearFlags(I)V

    .line 1080
    .end local v2    # "flags":I
    :goto_2
    sput-boolean v4, Lorg/libsdl/app/SDLActivity;->mFullscreenModeActive:Z

    .line 1082
    :goto_3
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v2, v7, :cond_8

    .line 1083
    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    const/4 v3, 0x3

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    .line 1086
    .end local v1    # "window":Landroid/view/Window;
    :cond_8
    goto :goto_4

    .line 1087
    :cond_9
    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1089
    goto :goto_4

    .line 1027
    :pswitch_4
    instance-of v2, v0, Landroid/app/Activity;

    if-eqz v2, :cond_a

    .line 1028
    move-object v1, v0

    check-cast v1, Landroid/app/Activity;

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_4

    .line 1030
    :cond_a
    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1032
    nop

    .line 1124
    :cond_b
    :goto_4
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
