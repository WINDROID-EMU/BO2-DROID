.class public final synthetic Lorg/wiiucoop/bo2android/T6Updater$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/io/FilenameFilter;


# instance fields
.field public final synthetic f$0:Ljava/io/File;

.field public final synthetic f$1:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Ljava/io/File;Ljava/io/File;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6Updater$$ExternalSyntheticLambda0;->f$0:Ljava/io/File;

    iput-object p2, p0, Lorg/wiiucoop/bo2android/T6Updater$$ExternalSyntheticLambda0;->f$1:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/io/File;Ljava/lang/String;)Z
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6Updater$$ExternalSyntheticLambda0;->f$0:Ljava/io/File;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6Updater$$ExternalSyntheticLambda0;->f$1:Ljava/io/File;

    invoke-static {v0, v1, p1, p2}, Lorg/wiiucoop/bo2android/T6Updater;->lambda$downloadTo$0(Ljava/io/File;Ljava/io/File;Ljava/io/File;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method
