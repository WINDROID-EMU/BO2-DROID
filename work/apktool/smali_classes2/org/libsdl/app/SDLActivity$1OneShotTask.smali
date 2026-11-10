.class Lorg/libsdl/app/SDLActivity$1OneShotTask;
.super Ljava/lang/Object;
.source "SDLActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/libsdl/app/SDLActivity;->showToast(Ljava/lang/String;IIII)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "OneShotTask"
.end annotation


# instance fields
.field private final mDuration:I

.field private final mGravity:I

.field private final mMessage:Ljava/lang/String;

.field private final mXOffset:I

.field private final mYOffset:I


# direct methods
.method constructor <init>(Ljava/lang/String;IIII)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "duration"    # I
    .param p3, "gravity"    # I
    .param p4, "xOffset"    # I
    .param p5, "yOffset"    # I

    .line 2227
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2228
    iput-object p1, p0, Lorg/libsdl/app/SDLActivity$1OneShotTask;->mMessage:Ljava/lang/String;

    .line 2229
    iput p2, p0, Lorg/libsdl/app/SDLActivity$1OneShotTask;->mDuration:I

    .line 2230
    iput p3, p0, Lorg/libsdl/app/SDLActivity$1OneShotTask;->mGravity:I

    .line 2231
    iput p4, p0, Lorg/libsdl/app/SDLActivity$1OneShotTask;->mXOffset:I

    .line 2232
    iput p5, p0, Lorg/libsdl/app/SDLActivity$1OneShotTask;->mYOffset:I

    .line 2233
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 2238
    :try_start_0
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    iget-object v1, p0, Lorg/libsdl/app/SDLActivity$1OneShotTask;->mMessage:Ljava/lang/String;

    iget v2, p0, Lorg/libsdl/app/SDLActivity$1OneShotTask;->mDuration:I

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 2239
    .local v0, "toast":Landroid/widget/Toast;
    iget v1, p0, Lorg/libsdl/app/SDLActivity$1OneShotTask;->mGravity:I

    if-ltz v1, :cond_0

    .line 2240
    iget v1, p0, Lorg/libsdl/app/SDLActivity$1OneShotTask;->mGravity:I

    iget v2, p0, Lorg/libsdl/app/SDLActivity$1OneShotTask;->mXOffset:I

    iget v3, p0, Lorg/libsdl/app/SDLActivity$1OneShotTask;->mYOffset:I

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/Toast;->setGravity(III)V

    .line 2242
    :cond_0
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2245
    .end local v0    # "toast":Landroid/widget/Toast;
    goto :goto_0

    .line 2243
    :catch_0
    move-exception v0

    .line 2244
    .local v0, "ex":Ljava/lang/Exception;
    const-string v1, "SDL"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2246
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_0
    return-void
.end method
