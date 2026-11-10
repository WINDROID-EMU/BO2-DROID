.class public final synthetic Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lorg/wiiucoop/bo2android/SettingsActivity;

.field public final synthetic f$1:Lorg/wiiucoop/bo2android/T6DxvkStore;

.field public final synthetic f$2:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lorg/wiiucoop/bo2android/SettingsActivity;Lorg/wiiucoop/bo2android/T6DxvkStore;Ljava/lang/String;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda2;->f$0:Lorg/wiiucoop/bo2android/SettingsActivity;

    iput-object p2, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda2;->f$1:Lorg/wiiucoop/bo2android/T6DxvkStore;

    iput-object p3, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda2;->f$2:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda2;->f$0:Lorg/wiiucoop/bo2android/SettingsActivity;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda2;->f$1:Lorg/wiiucoop/bo2android/T6DxvkStore;

    iget-object v2, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda2;->f$2:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, p1, p2}, Lorg/wiiucoop/bo2android/SettingsActivity;->lambda$chooseDxvk$10$org-wiiucoop-bo2android-SettingsActivity(Lorg/wiiucoop/bo2android/T6DxvkStore;Ljava/lang/String;Landroid/content/DialogInterface;I)V

    return-void
.end method
