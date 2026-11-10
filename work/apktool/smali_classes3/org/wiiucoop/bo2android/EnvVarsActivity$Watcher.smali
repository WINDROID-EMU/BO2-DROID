.class final Lorg/wiiucoop/bo2android/EnvVarsActivity$Watcher;
.super Ljava/lang/Object;
.source "EnvVarsActivity.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/EnvVarsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Watcher"
.end annotation


# instance fields
.field private final target:Lorg/wiiucoop/bo2android/EnvVarsActivity$OnText;

.field final synthetic this$0:Lorg/wiiucoop/bo2android/EnvVarsActivity;


# direct methods
.method constructor <init>(Lorg/wiiucoop/bo2android/EnvVarsActivity;Lorg/wiiucoop/bo2android/EnvVarsActivity$OnText;)V
    .locals 0
    .param p2, "target"    # Lorg/wiiucoop/bo2android/EnvVarsActivity$OnText;

    .line 234
    iput-object p1, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity$Watcher;->this$0:Lorg/wiiucoop/bo2android/EnvVarsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 235
    iput-object p2, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity$Watcher;->target:Lorg/wiiucoop/bo2android/EnvVarsActivity$OnText;

    .line 236
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2
    .param p1, "s"    # Landroid/text/Editable;

    .line 243
    iget-object v0, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity$Watcher;->target:Lorg/wiiucoop/bo2android/EnvVarsActivity$OnText;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/wiiucoop/bo2android/EnvVarsActivity$OnText;->changed(Ljava/lang/String;)V

    .line 244
    iget-object v0, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity$Watcher;->this$0:Lorg/wiiucoop/bo2android/EnvVarsActivity;

    invoke-static {v0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->access$000(Lorg/wiiucoop/bo2android/EnvVarsActivity;)V

    .line 245
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .line 238
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .line 239
    return-void
.end method
