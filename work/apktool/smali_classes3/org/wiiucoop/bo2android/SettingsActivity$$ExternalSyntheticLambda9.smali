.class public final synthetic Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda9;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lorg/wiiucoop/bo2android/SettingsActivity;

.field public final synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(Lorg/wiiucoop/bo2android/SettingsActivity;I)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda9;->f$0:Lorg/wiiucoop/bo2android/SettingsActivity;

    iput p2, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda9;->f$1:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda9;->f$0:Lorg/wiiucoop/bo2android/SettingsActivity;

    iget v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda9;->f$1:I

    invoke-virtual {v0, v1, p1, p2}, Lorg/wiiucoop/bo2android/SettingsActivity;->lambda$chooseLanguage$2$org-wiiucoop-bo2android-SettingsActivity(ILandroid/content/DialogInterface;I)V

    return-void
.end method
