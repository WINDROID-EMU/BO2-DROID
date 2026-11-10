.class Lorg/libsdl/app/SDLClipboardHandler;
.super Ljava/lang/Object;
.source "SDLActivity.java"

# interfaces
.implements Landroid/content/ClipboardManager$OnPrimaryClipChangedListener;


# instance fields
.field protected mClipMgr:Landroid/content/ClipboardManager;


# direct methods
.method constructor <init>()V
    .locals 2

    .line 2472
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2473
    invoke-static {}, Lorg/libsdl/app/SDL;->getContext()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "clipboard"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    iput-object v0, p0, Lorg/libsdl/app/SDLClipboardHandler;->mClipMgr:Landroid/content/ClipboardManager;

    .line 2474
    iget-object v0, p0, Lorg/libsdl/app/SDLClipboardHandler;->mClipMgr:Landroid/content/ClipboardManager;

    invoke-virtual {v0, p0}, Landroid/content/ClipboardManager;->addPrimaryClipChangedListener(Landroid/content/ClipboardManager$OnPrimaryClipChangedListener;)V

    .line 2475
    return-void
.end method


# virtual methods
.method public clipboardGetText()Ljava/lang/String;
    .locals 4

    .line 2486
    iget-object v0, p0, Lorg/libsdl/app/SDLClipboardHandler;->mClipMgr:Landroid/content/ClipboardManager;

    invoke-virtual {v0}, Landroid/content/ClipboardManager;->getPrimaryClip()Landroid/content/ClipData;

    move-result-object v0

    .line 2487
    .local v0, "clip":Landroid/content/ClipData;
    if-eqz v0, :cond_0

    .line 2488
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v1

    .line 2489
    .local v1, "item":Landroid/content/ClipData$Item;
    if-eqz v1, :cond_0

    .line 2490
    invoke-virtual {v1}, Landroid/content/ClipData$Item;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    .line 2491
    .local v2, "text":Ljava/lang/CharSequence;
    if-eqz v2, :cond_0

    .line 2492
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 2496
    .end local v1    # "item":Landroid/content/ClipData$Item;
    .end local v2    # "text":Ljava/lang/CharSequence;
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public clipboardHasText()Z
    .locals 2

    .line 2478
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_0

    .line 2479
    iget-object v0, p0, Lorg/libsdl/app/SDLClipboardHandler;->mClipMgr:Landroid/content/ClipboardManager;

    invoke-virtual {v0}, Landroid/content/ClipboardManager;->hasPrimaryClip()Z

    move-result v0

    return v0

    .line 2481
    :cond_0
    iget-object v0, p0, Lorg/libsdl/app/SDLClipboardHandler;->mClipMgr:Landroid/content/ClipboardManager;

    invoke-virtual {v0}, Landroid/content/ClipboardManager;->hasText()Z

    move-result v0

    return v0
.end method

.method public clipboardSetText(Ljava/lang/String;)V
    .locals 3
    .param p1, "string"    # Ljava/lang/String;

    .line 2500
    iget-object v0, p0, Lorg/libsdl/app/SDLClipboardHandler;->mClipMgr:Landroid/content/ClipboardManager;

    invoke-virtual {v0, p0}, Landroid/content/ClipboardManager;->removePrimaryClipChangedListener(Landroid/content/ClipboardManager$OnPrimaryClipChangedListener;)V

    .line 2501
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 2502
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1c

    if-lt v0, v2, :cond_0

    .line 2503
    iget-object v0, p0, Lorg/libsdl/app/SDLClipboardHandler;->mClipMgr:Landroid/content/ClipboardManager;

    invoke-virtual {v0}, Landroid/content/ClipboardManager;->clearPrimaryClip()V

    goto :goto_0

    .line 2505
    :cond_0
    const-string v0, ""

    invoke-static {v1, v0}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v0

    .line 2506
    .local v0, "clip":Landroid/content/ClipData;
    iget-object v1, p0, Lorg/libsdl/app/SDLClipboardHandler;->mClipMgr:Landroid/content/ClipboardManager;

    invoke-virtual {v1, v0}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 2507
    .end local v0    # "clip":Landroid/content/ClipData;
    goto :goto_0

    .line 2509
    :cond_1
    invoke-static {v1, p1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v0

    .line 2510
    .restart local v0    # "clip":Landroid/content/ClipData;
    iget-object v1, p0, Lorg/libsdl/app/SDLClipboardHandler;->mClipMgr:Landroid/content/ClipboardManager;

    invoke-virtual {v1, v0}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 2512
    .end local v0    # "clip":Landroid/content/ClipData;
    :goto_0
    iget-object v0, p0, Lorg/libsdl/app/SDLClipboardHandler;->mClipMgr:Landroid/content/ClipboardManager;

    invoke-virtual {v0, p0}, Landroid/content/ClipboardManager;->addPrimaryClipChangedListener(Landroid/content/ClipboardManager$OnPrimaryClipChangedListener;)V

    .line 2513
    return-void
.end method

.method public onPrimaryClipChanged()V
    .locals 0

    .line 2517
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->onNativeClipboardChanged()V

    .line 2518
    return-void
.end method
