.class public final synthetic Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lorg/wiiucoop/bo2android/T6Updater$Progress;


# instance fields
.field public final synthetic f$0:Lorg/wiiucoop/bo2android/SettingsActivity;

.field public final synthetic f$1:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lorg/wiiucoop/bo2android/SettingsActivity;Ljava/lang/String;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda0;->f$0:Lorg/wiiucoop/bo2android/SettingsActivity;

    iput-object p2, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onProgress(Ljava/lang/String;JJ)V
    .locals 7

    .line 0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda0;->f$0:Lorg/wiiucoop/bo2android/SettingsActivity;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    move-object v2, p1

    move-wide v3, p2

    move-wide v5, p4

    invoke-virtual/range {v0 .. v6}, Lorg/wiiucoop/bo2android/SettingsActivity;->lambda$kennelCheckAndInstall$15$org-wiiucoop-bo2android-SettingsActivity(Ljava/lang/String;Ljava/lang/String;JJ)V

    return-void
.end method
