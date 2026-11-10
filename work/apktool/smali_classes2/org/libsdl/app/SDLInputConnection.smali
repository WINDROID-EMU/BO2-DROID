.class Lorg/libsdl/app/SDLInputConnection;
.super Landroid/view/inputmethod/BaseInputConnection;
.source "SDLInputConnection.java"


# instance fields
.field protected mCommittedText:Ljava/lang/String;

.field protected mEditText:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Landroid/view/View;Z)V
    .locals 2
    .param p1, "targetView"    # Landroid/view/View;
    .param p2, "fullEditor"    # Z

    .line 16
    invoke-direct {p0, p1, p2}, Landroid/view/inputmethod/BaseInputConnection;-><init>(Landroid/view/View;Z)V

    .line 13
    const-string v0, ""

    iput-object v0, p0, Lorg/libsdl/app/SDLInputConnection;->mCommittedText:Ljava/lang/String;

    .line 17
    new-instance v0, Landroid/widget/EditText;

    invoke-static {}, Lorg/libsdl/app/SDL;->getContext()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/libsdl/app/SDLInputConnection;->mEditText:Landroid/widget/EditText;

    .line 18
    return-void
.end method

.method public static native nativeCommitText(Ljava/lang/String;I)V
.end method

.method public static native nativeGenerateScancodeForUnichar(C)V
.end method


# virtual methods
.method public commitText(Ljava/lang/CharSequence;I)Z
    .locals 1
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "newCursorPosition"    # I

    .line 50
    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/BaseInputConnection;->commitText(Ljava/lang/CharSequence;I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 51
    const/4 v0, 0x0

    return v0

    .line 53
    :cond_0
    invoke-virtual {p0}, Lorg/libsdl/app/SDLInputConnection;->updateText()V

    .line 54
    const/4 v0, 0x1

    return v0
.end method

.method public deleteSurroundingText(II)Z
    .locals 2
    .param p1, "beforeLength"    # I
    .param p2, "afterLength"    # I

    .line 70
    const/4 v0, 0x1

    if-lez p1, :cond_1

    if-nez p2, :cond_1

    .line 72
    :goto_0
    add-int/lit8 v1, p1, -0x1

    .end local p1    # "beforeLength":I
    .local v1, "beforeLength":I
    if-lez p1, :cond_0

    .line 73
    const/16 p1, 0x8

    invoke-static {p1}, Lorg/libsdl/app/SDLInputConnection;->nativeGenerateScancodeForUnichar(C)V

    move p1, v1

    goto :goto_0

    .line 75
    :cond_0
    return v0

    .line 78
    .end local v1    # "beforeLength":I
    .restart local p1    # "beforeLength":I
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/BaseInputConnection;->deleteSurroundingText(II)Z

    move-result v1

    if-nez v1, :cond_2

    .line 79
    const/4 v0, 0x0

    return v0

    .line 81
    :cond_2
    invoke-virtual {p0}, Lorg/libsdl/app/SDLInputConnection;->updateText()V

    .line 82
    return v0
.end method

.method public getEditable()Landroid/text/Editable;
    .locals 1

    .line 22
    iget-object v0, p0, Lorg/libsdl/app/SDLInputConnection;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getEditableText()Landroid/text/Editable;

    move-result-object v0

    return-object v0
.end method

.method public sendKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "event"    # Landroid/view/KeyEvent;

    .line 39
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/16 v1, 0x42

    if-ne v0, v1, :cond_0

    .line 40
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->onNativeSoftReturnKey()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 41
    const/4 v0, 0x1

    return v0

    .line 45
    :cond_0
    invoke-super {p0, p1}, Landroid/view/inputmethod/BaseInputConnection;->sendKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public setComposingText(Ljava/lang/CharSequence;I)Z
    .locals 1
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "newCursorPosition"    # I

    .line 59
    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/BaseInputConnection;->setComposingText(Ljava/lang/CharSequence;I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 60
    const/4 v0, 0x0

    return v0

    .line 62
    :cond_0
    invoke-virtual {p0}, Lorg/libsdl/app/SDLInputConnection;->updateText()V

    .line 63
    const/4 v0, 0x1

    return v0
.end method

.method protected updateText()V
    .locals 8

    .line 86
    invoke-virtual {p0}, Lorg/libsdl/app/SDLInputConnection;->getEditable()Landroid/text/Editable;

    move-result-object v0

    .line 87
    .local v0, "content":Landroid/text/Editable;
    if-nez v0, :cond_0

    .line 88
    return-void

    .line 91
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 92
    .local v1, "text":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    iget-object v3, p0, Lorg/libsdl/app/SDLInputConnection;->mCommittedText:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 96
    .local v2, "compareLength":I
    const/4 v3, 0x0

    .local v3, "matchLength":I
    :goto_0
    if-ge v3, v2, :cond_2

    .line 97
    iget-object v4, p0, Lorg/libsdl/app/SDLInputConnection;->mCommittedText:Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/String;->codePointAt(I)I

    move-result v4

    .line 98
    .local v4, "codePoint":I
    invoke-virtual {v1, v3}, Ljava/lang/String;->codePointAt(I)I

    move-result v5

    if-eq v4, v5, :cond_1

    .line 99
    goto :goto_1

    .line 101
    :cond_1
    invoke-static {v4}, Ljava/lang/Character;->charCount(I)I

    move-result v5

    add-int/2addr v3, v5

    .line 102
    .end local v4    # "codePoint":I
    goto :goto_0

    .line 104
    :cond_2
    :goto_1
    move v4, v3

    .local v4, "offset":I
    :goto_2
    iget-object v5, p0, Lorg/libsdl/app/SDLInputConnection;->mCommittedText:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_3

    .line 105
    iget-object v5, p0, Lorg/libsdl/app/SDLInputConnection;->mCommittedText:Ljava/lang/String;

    invoke-virtual {v5, v4}, Ljava/lang/String;->codePointAt(I)I

    move-result v5

    .line 106
    .local v5, "codePoint":I
    const/16 v6, 0x8

    invoke-static {v6}, Lorg/libsdl/app/SDLInputConnection;->nativeGenerateScancodeForUnichar(C)V

    .line 107
    invoke-static {v5}, Ljava/lang/Character;->charCount(I)I

    move-result v6

    add-int/2addr v4, v6

    .line 108
    .end local v5    # "codePoint":I
    goto :goto_2

    .line 110
    :cond_3
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v3, v5, :cond_7

    .line 111
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v1, v3, v5}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 112
    .local v5, "pendingText":Ljava/lang/String;
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->dispatchingKeyEvent()Z

    move-result v6

    if-nez v6, :cond_6

    .line 113
    const/4 v4, 0x0

    :goto_3
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v4, v6, :cond_6

    .line 114
    invoke-virtual {v5, v4}, Ljava/lang/String;->codePointAt(I)I

    move-result v6

    .line 115
    .local v6, "codePoint":I
    const/16 v7, 0xa

    if-ne v6, v7, :cond_4

    .line 116
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->onNativeSoftReturnKey()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 117
    return-void

    .line 121
    :cond_4
    if-lez v6, :cond_5

    const/16 v7, 0x80

    if-ge v6, v7, :cond_5

    .line 122
    int-to-char v7, v6

    invoke-static {v7}, Lorg/libsdl/app/SDLInputConnection;->nativeGenerateScancodeForUnichar(C)V

    .line 124
    :cond_5
    invoke-static {v6}, Ljava/lang/Character;->charCount(I)I

    move-result v7

    add-int/2addr v4, v7

    .line 125
    .end local v6    # "codePoint":I
    goto :goto_3

    .line 127
    :cond_6
    const/4 v6, 0x0

    invoke-static {v5, v6}, Lorg/libsdl/app/SDLInputConnection;->nativeCommitText(Ljava/lang/String;I)V

    .line 129
    .end local v5    # "pendingText":Ljava/lang/String;
    :cond_7
    iput-object v1, p0, Lorg/libsdl/app/SDLInputConnection;->mCommittedText:Ljava/lang/String;

    .line 130
    return-void
.end method
