.class Lorg/libsdl/app/SDLActivity$8;
.super Ljava/lang/Object;
.source "SDLActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/libsdl/app/SDLActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/libsdl/app/SDLActivity;


# direct methods
.method constructor <init>(Lorg/libsdl/app/SDLActivity;)V
    .locals 0
    .param p1, "this$0"    # Lorg/libsdl/app/SDLActivity;

    .line 1942
    iput-object p1, p0, Lorg/libsdl/app/SDLActivity$8;->this$0:Lorg/libsdl/app/SDLActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1945
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_1

    .line 1946
    iget-object v0, p0, Lorg/libsdl/app/SDLActivity$8;->this$0:Lorg/libsdl/app/SDLActivity;

    .line 1947
    invoke-virtual {v0}, Lorg/libsdl/app/SDLActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getInsetsController()Landroid/view/WindowInsetsController;

    move-result-object v0

    .line 1948
    .local v0, "controller":Landroid/view/WindowInsetsController;
    if-eqz v0, :cond_0

    .line 1949
    invoke-static {}, Landroid/view/WindowInsets$Type;->systemBars()I

    move-result v1

    invoke-interface {v0, v1}, Landroid/view/WindowInsetsController;->hide(I)V

    .line 1951
    .end local v0    # "controller":Landroid/view/WindowInsetsController;
    :cond_0
    goto :goto_0

    .line 1952
    :cond_1
    const/16 v0, 0x1706

    .line 1959
    .local v0, "flags":I
    iget-object v1, p0, Lorg/libsdl/app/SDLActivity$8;->this$0:Lorg/libsdl/app/SDLActivity;

    invoke-virtual {v1}, Lorg/libsdl/app/SDLActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 1961
    .end local v0    # "flags":I
    :goto_0
    return-void
.end method
