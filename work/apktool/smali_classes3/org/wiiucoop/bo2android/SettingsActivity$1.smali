.class Lorg/wiiucoop/bo2android/SettingsActivity$1;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/hardware/input/InputManager$InputDeviceListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/SettingsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/wiiucoop/bo2android/SettingsActivity;


# direct methods
.method constructor <init>(Lorg/wiiucoop/bo2android/SettingsActivity;)V
    .locals 0
    .param p1, "this$0"    # Lorg/wiiucoop/bo2android/SettingsActivity;

    .line 134
    iput-object p1, p0, Lorg/wiiucoop/bo2android/SettingsActivity$1;->this$0:Lorg/wiiucoop/bo2android/SettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onInputDeviceAdded(I)V
    .locals 1
    .param p1, "deviceId"    # I

    .line 135
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity$1;->this$0:Lorg/wiiucoop/bo2android/SettingsActivity;

    invoke-static {v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->access$000(Lorg/wiiucoop/bo2android/SettingsActivity;)V

    return-void
.end method

.method public onInputDeviceChanged(I)V
    .locals 1
    .param p1, "deviceId"    # I

    .line 137
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity$1;->this$0:Lorg/wiiucoop/bo2android/SettingsActivity;

    invoke-static {v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->access$000(Lorg/wiiucoop/bo2android/SettingsActivity;)V

    return-void
.end method

.method public onInputDeviceRemoved(I)V
    .locals 1
    .param p1, "deviceId"    # I

    .line 136
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity$1;->this$0:Lorg/wiiucoop/bo2android/SettingsActivity;

    invoke-static {v0}, Lorg/wiiucoop/bo2android/SettingsActivity;->access$000(Lorg/wiiucoop/bo2android/SettingsActivity;)V

    return-void
.end method
