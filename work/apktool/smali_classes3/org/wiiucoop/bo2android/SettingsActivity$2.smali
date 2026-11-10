.class Lorg/wiiucoop/bo2android/SettingsActivity$2;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/wiiucoop/bo2android/SettingsActivity;->bindSprintThreshold()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/wiiucoop/bo2android/SettingsActivity;

.field final synthetic val$label:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lorg/wiiucoop/bo2android/SettingsActivity;Landroid/widget/TextView;)V
    .locals 0
    .param p1, "this$0"    # Lorg/wiiucoop/bo2android/SettingsActivity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 163
    iput-object p1, p0, Lorg/wiiucoop/bo2android/SettingsActivity$2;->this$0:Lorg/wiiucoop/bo2android/SettingsActivity;

    iput-object p2, p0, Lorg/wiiucoop/bo2android/SettingsActivity$2;->val$label:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 5
    .param p1, "bar"    # Landroid/widget/SeekBar;
    .param p2, "progress"    # I
    .param p3, "fromUser"    # Z

    .line 166
    add-int/lit8 v0, p2, 0x32

    .line 167
    .local v0, "v":I
    iget-object v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity$2;->val$label:Landroid/widget/TextView;

    iget-object v2, p0, Lorg/wiiucoop/bo2android/SettingsActivity$2;->this$0:Lorg/wiiucoop/bo2android/SettingsActivity;

    sget v3, Lorg/wiiucoop/bo2android/R$string;->settings_touch_sprint_threshold_value:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/wiiucoop/bo2android/SettingsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 168
    if-eqz p3, :cond_0

    iget-object v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity$2;->this$0:Lorg/wiiucoop/bo2android/SettingsActivity;

    const-string v2, "touch_sprint_threshold"

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lorg/wiiucoop/bo2android/T6Ui;->setString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    :cond_0
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .param p1, "bar"    # Landroid/widget/SeekBar;

    .line 173
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 2
    .param p1, "bar"    # Landroid/widget/SeekBar;

    .line 177
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "settings: touch_sprint_threshold="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v1

    add-int/lit8 v1, v1, 0x32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "t6android"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    return-void
.end method
