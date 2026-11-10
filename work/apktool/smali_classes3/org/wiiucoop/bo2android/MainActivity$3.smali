.class Lorg/wiiucoop/bo2android/MainActivity$3;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/window/OnBackInvokedCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/wiiucoop/bo2android/MainActivity;->registerBackCallback()V
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

    .line 613
    iput-object p1, p0, Lorg/wiiucoop/bo2android/MainActivity$3;->this$0:Lorg/wiiucoop/bo2android/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBackInvoked()V
    .locals 1

    .line 616
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MainActivity$3;->this$0:Lorg/wiiucoop/bo2android/MainActivity;

    invoke-static {v0}, Lorg/wiiucoop/bo2android/MainActivity;->access$500(Lorg/wiiucoop/bo2android/MainActivity;)V

    .line 617
    return-void
.end method
