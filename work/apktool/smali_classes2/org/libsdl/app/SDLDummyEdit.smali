.class public Lorg/libsdl/app/SDLDummyEdit;
.super Landroid/view/View;
.source "SDLDummyEdit.java"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# instance fields
.field ic:Landroid/view/inputmethod/InputConnection;

.field input_type:I


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 18
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 19
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/libsdl/app/SDLDummyEdit;->setFocusableInTouchMode(Z)V

    .line 20
    invoke-virtual {p0, v0}, Lorg/libsdl/app/SDLDummyEdit;->setFocusable(Z)V

    .line 21
    invoke-virtual {p0, p0}, Lorg/libsdl/app/SDLDummyEdit;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 22
    return-void
.end method


# virtual methods
.method public onCheckIsTextEditor()Z
    .locals 1

    .line 30
    const/4 v0, 0x1

    return v0
.end method

.method public onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .locals 2
    .param p1, "outAttrs"    # Landroid/view/inputmethod/EditorInfo;

    .line 57
    new-instance v0, Lorg/libsdl/app/SDLInputConnection;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lorg/libsdl/app/SDLInputConnection;-><init>(Landroid/view/View;Z)V

    iput-object v0, p0, Lorg/libsdl/app/SDLDummyEdit;->ic:Landroid/view/inputmethod/InputConnection;

    .line 59
    iget v0, p0, Lorg/libsdl/app/SDLDummyEdit;->input_type:I

    iput v0, p1, Landroid/view/inputmethod/EditorInfo;->inputType:I

    .line 60
    const/high16 v0, 0x12000000

    iput v0, p1, Landroid/view/inputmethod/EditorInfo;->imeOptions:I

    .line 63
    iget-object v0, p0, Lorg/libsdl/app/SDLDummyEdit;->ic:Landroid/view/inputmethod/InputConnection;

    return-object v0
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .line 35
    iget-object v0, p0, Lorg/libsdl/app/SDLDummyEdit;->ic:Landroid/view/inputmethod/InputConnection;

    invoke-static {p1, p2, p3, v0}, Lorg/libsdl/app/SDLActivity;->handleKeyEvent(Landroid/view/View;ILandroid/view/KeyEvent;Landroid/view/inputmethod/InputConnection;)Z

    move-result v0

    return v0
.end method

.method public onKeyPreIme(ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .line 47
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 48
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mTextEdit:Lorg/libsdl/app/SDLDummyEdit;

    if-eqz v0, :cond_0

    sget-object v0, Lorg/libsdl/app/SDLActivity;->mTextEdit:Lorg/libsdl/app/SDLDummyEdit;

    invoke-virtual {v0}, Lorg/libsdl/app/SDLDummyEdit;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 49
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->onNativeKeyboardFocusLost()V

    .line 52
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/view/View;->onKeyPreIme(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method setInputType(I)V
    .locals 0
    .param p1, "input_type"    # I

    .line 25
    iput p1, p0, Lorg/libsdl/app/SDLDummyEdit;->input_type:I

    .line 26
    return-void
.end method
