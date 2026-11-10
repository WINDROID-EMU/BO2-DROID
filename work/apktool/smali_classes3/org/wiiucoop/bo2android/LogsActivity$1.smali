.class Lorg/wiiucoop/bo2android/LogsActivity$1;
.super Ljava/lang/Object;
.source "LogsActivity.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/wiiucoop/bo2android/LogsActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/wiiucoop/bo2android/LogsActivity;


# direct methods
.method constructor <init>(Lorg/wiiucoop/bo2android/LogsActivity;)V
    .locals 0
    .param p1, "this$0"    # Lorg/wiiucoop/bo2android/LogsActivity;

    .line 88
    iput-object p1, p0, Lorg/wiiucoop/bo2android/LogsActivity$1;->this$0:Lorg/wiiucoop/bo2android/LogsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 1
    .param p1, "s"    # Landroid/text/Editable;

    .line 91
    iget-object v0, p0, Lorg/wiiucoop/bo2android/LogsActivity$1;->this$0:Lorg/wiiucoop/bo2android/LogsActivity;

    invoke-static {v0}, Lorg/wiiucoop/bo2android/LogsActivity;->access$100(Lorg/wiiucoop/bo2android/LogsActivity;)V

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "a"    # I
    .param p3, "b"    # I
    .param p4, "c"    # I

    .line 89
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "a"    # I
    .param p3, "b"    # I
    .param p4, "c"    # I

    .line 90
    return-void
.end method
