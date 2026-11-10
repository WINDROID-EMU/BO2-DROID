.class Lorg/libsdl/app/SDLActivity$2;
.super Ljava/lang/Object;
.source "SDLActivity.java"

# interfaces
.implements Landroid/window/OnBackInvokedCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/libsdl/app/SDLActivity;->setBackButtonTrapEnabled(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field mBackKeyHandler:Landroid/os/Handler;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 808
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBackInvoked()V
    .locals 4

    .line 813
    iget-object v0, p0, Lorg/libsdl/app/SDLActivity$2;->mBackKeyHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    .line 814
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lorg/libsdl/app/SDLActivity$2;->mBackKeyHandler:Landroid/os/Handler;

    .line 817
    :cond_0
    const/4 v0, 0x4

    invoke-static {v0}, Lorg/libsdl/app/SDLActivity;->onNativeKeyDown(I)V

    .line 818
    iget-object v0, p0, Lorg/libsdl/app/SDLActivity$2;->mBackKeyHandler:Landroid/os/Handler;

    new-instance v1, Lorg/libsdl/app/SDLActivity$2$1;

    invoke-direct {v1, p0}, Lorg/libsdl/app/SDLActivity$2$1;-><init>(Lorg/libsdl/app/SDLActivity$2;)V

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 824
    return-void
.end method
