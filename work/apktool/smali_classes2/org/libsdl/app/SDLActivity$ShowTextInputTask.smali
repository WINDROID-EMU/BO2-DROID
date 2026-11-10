.class Lorg/libsdl/app/SDLActivity$ShowTextInputTask;
.super Ljava/lang/Object;
.source "SDLActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/libsdl/app/SDLActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ShowTextInputTask"
.end annotation


# static fields
.field static final HEIGHT_PADDING:I = 0xf


# instance fields
.field public h:I

.field public input_type:I

.field public w:I

.field public x:I

.field public y:I


# direct methods
.method public constructor <init>(IIIII)V
    .locals 1
    .param p1, "input_type"    # I
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "w"    # I
    .param p5, "h"    # I

    .line 1562
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1563
    iput p1, p0, Lorg/libsdl/app/SDLActivity$ShowTextInputTask;->input_type:I

    .line 1564
    iput p2, p0, Lorg/libsdl/app/SDLActivity$ShowTextInputTask;->x:I

    .line 1565
    iput p3, p0, Lorg/libsdl/app/SDLActivity$ShowTextInputTask;->y:I

    .line 1566
    iput p4, p0, Lorg/libsdl/app/SDLActivity$ShowTextInputTask;->w:I

    .line 1567
    iput p5, p0, Lorg/libsdl/app/SDLActivity$ShowTextInputTask;->h:I

    .line 1570
    iget v0, p0, Lorg/libsdl/app/SDLActivity$ShowTextInputTask;->w:I

    if-gtz v0, :cond_0

    .line 1571
    const/4 v0, 0x1

    iput v0, p0, Lorg/libsdl/app/SDLActivity$ShowTextInputTask;->w:I

    .line 1573
    :cond_0
    iget v0, p0, Lorg/libsdl/app/SDLActivity$ShowTextInputTask;->h:I

    add-int/lit8 v0, v0, 0xf

    if-gtz v0, :cond_1

    .line 1574
    const/16 v0, -0xe

    iput v0, p0, Lorg/libsdl/app/SDLActivity$ShowTextInputTask;->h:I

    .line 1576
    :cond_1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1580
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mLayout:Landroid/view/ViewGroup;

    if-nez v0, :cond_0

    .line 1581
    return-void

    .line 1584
    :cond_0
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lorg/libsdl/app/SDLActivity$ShowTextInputTask;->w:I

    iget v2, p0, Lorg/libsdl/app/SDLActivity$ShowTextInputTask;->h:I

    add-int/lit8 v2, v2, 0xf

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 1585
    .local v0, "params":Landroid/widget/RelativeLayout$LayoutParams;
    iget v1, p0, Lorg/libsdl/app/SDLActivity$ShowTextInputTask;->x:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 1586
    iget v1, p0, Lorg/libsdl/app/SDLActivity$ShowTextInputTask;->y:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 1588
    sget-object v1, Lorg/libsdl/app/SDLActivity;->mTextEdit:Lorg/libsdl/app/SDLDummyEdit;

    if-nez v1, :cond_1

    .line 1589
    new-instance v1, Lorg/libsdl/app/SDLDummyEdit;

    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContext()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/libsdl/app/SDLDummyEdit;-><init>(Landroid/content/Context;)V

    sput-object v1, Lorg/libsdl/app/SDLActivity;->mTextEdit:Lorg/libsdl/app/SDLDummyEdit;

    .line 1591
    sget-object v1, Lorg/libsdl/app/SDLActivity;->mLayout:Landroid/view/ViewGroup;

    sget-object v2, Lorg/libsdl/app/SDLActivity;->mTextEdit:Lorg/libsdl/app/SDLDummyEdit;

    invoke-virtual {v1, v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0

    .line 1593
    :cond_1
    sget-object v1, Lorg/libsdl/app/SDLActivity;->mTextEdit:Lorg/libsdl/app/SDLDummyEdit;

    invoke-virtual {v1, v0}, Lorg/libsdl/app/SDLDummyEdit;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1595
    :goto_0
    sget-object v1, Lorg/libsdl/app/SDLActivity;->mTextEdit:Lorg/libsdl/app/SDLDummyEdit;

    iget v2, p0, Lorg/libsdl/app/SDLActivity$ShowTextInputTask;->input_type:I

    invoke-virtual {v1, v2}, Lorg/libsdl/app/SDLDummyEdit;->setInputType(I)V

    .line 1597
    sget-object v1, Lorg/libsdl/app/SDLActivity;->mTextEdit:Lorg/libsdl/app/SDLDummyEdit;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/libsdl/app/SDLDummyEdit;->setVisibility(I)V

    .line 1598
    sget-object v1, Lorg/libsdl/app/SDLActivity;->mTextEdit:Lorg/libsdl/app/SDLDummyEdit;

    invoke-virtual {v1}, Lorg/libsdl/app/SDLDummyEdit;->requestFocus()Z

    .line 1600
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContext()Landroid/app/Activity;

    move-result-object v1

    const-string v3, "input_method"

    invoke-virtual {v1, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    .line 1601
    .local v1, "imm":Landroid/view/inputmethod/InputMethodManager;
    sget-object v3, Lorg/libsdl/app/SDLActivity;->mTextEdit:Lorg/libsdl/app/SDLDummyEdit;

    invoke-virtual {v1, v3, v2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 1603
    invoke-virtual {v1}, Landroid/view/inputmethod/InputMethodManager;->isAcceptingText()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1604
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->onNativeScreenKeyboardShown()V

    .line 1606
    :cond_2
    return-void
.end method
