.class Lorg/wiiucoop/bo2android/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/wiiucoop/bo2android/MainActivity;


# direct methods
.method constructor <init>(Lorg/wiiucoop/bo2android/MainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lorg/wiiucoop/bo2android/MainActivity;

    .line 121
    iput-object p1, p0, Lorg/wiiucoop/bo2android/MainActivity$1;->this$0:Lorg/wiiucoop/bo2android/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 124
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity$1;->this$0:Lorg/wiiucoop/bo2android/MainActivity;

    const-string v1, "tick"

    invoke-static {v0, v1}, Lorg/wiiucoop/bo2android/MainActivity;->access$000(Lorg/wiiucoop/bo2android/MainActivity;Ljava/lang/String;)V

    .line 125
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity$1;->this$0:Lorg/wiiucoop/bo2android/MainActivity;

    invoke-static {v0}, Lorg/wiiucoop/bo2android/MainActivity;->access$100(Lorg/wiiucoop/bo2android/MainActivity;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0xfa

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 126
    return-void
.end method
