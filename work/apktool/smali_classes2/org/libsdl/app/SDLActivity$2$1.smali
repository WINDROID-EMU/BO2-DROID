.class Lorg/libsdl/app/SDLActivity$2$1;
.super Ljava/lang/Object;
.source "SDLActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/libsdl/app/SDLActivity$2;->onBackInvoked()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/libsdl/app/SDLActivity$2;


# direct methods
.method constructor <init>(Lorg/libsdl/app/SDLActivity$2;)V
    .locals 0
    .param p1, "this$0"    # Lorg/libsdl/app/SDLActivity$2;

    .line 818
    iput-object p1, p0, Lorg/libsdl/app/SDLActivity$2$1;->this$0:Lorg/libsdl/app/SDLActivity$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 821
    const/4 v0, 0x4

    invoke-static {v0}, Lorg/libsdl/app/SDLActivity;->onNativeKeyUp(I)V

    .line 822
    return-void
.end method
