.class public final synthetic Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda14;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/wiiucoop/bo2android/SettingsActivity;

.field public final synthetic f$1:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Lorg/wiiucoop/bo2android/SettingsActivity;Ljava/io/File;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda14;->f$0:Lorg/wiiucoop/bo2android/SettingsActivity;

    iput-object p2, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda14;->f$1:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda14;->f$0:Lorg/wiiucoop/bo2android/SettingsActivity;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda14;->f$1:Ljava/io/File;

    invoke-virtual {v0, v1}, Lorg/wiiucoop/bo2android/SettingsActivity;->lambda$kennelCheckAndInstall$16$org-wiiucoop-bo2android-SettingsActivity(Ljava/io/File;)V

    return-void
.end method
