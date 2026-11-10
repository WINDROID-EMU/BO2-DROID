.class public final synthetic Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lorg/wiiucoop/bo2android/SettingsActivity;

.field public final synthetic f$1:Lorg/wiiucoop/bo2android/T6DxvkStore;

.field public final synthetic f$2:[Ljava/lang/String;

.field public final synthetic f$3:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lorg/wiiucoop/bo2android/SettingsActivity;Lorg/wiiucoop/bo2android/T6DxvkStore;[Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda1;->f$0:Lorg/wiiucoop/bo2android/SettingsActivity;

    iput-object p2, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda1;->f$1:Lorg/wiiucoop/bo2android/T6DxvkStore;

    iput-object p3, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda1;->f$2:[Ljava/lang/String;

    iput-object p4, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda1;->f$3:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 6

    .line 0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda1;->f$0:Lorg/wiiucoop/bo2android/SettingsActivity;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda1;->f$1:Lorg/wiiucoop/bo2android/T6DxvkStore;

    iget-object v2, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda1;->f$2:[Ljava/lang/String;

    iget-object v3, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda1;->f$3:Ljava/lang/String;

    move-object v4, p1

    move v5, p2

    invoke-virtual/range {v0 .. v5}, Lorg/wiiucoop/bo2android/SettingsActivity;->lambda$chooseDxvk$9$org-wiiucoop-bo2android-SettingsActivity(Lorg/wiiucoop/bo2android/T6DxvkStore;[Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface;I)V

    return-void
.end method
