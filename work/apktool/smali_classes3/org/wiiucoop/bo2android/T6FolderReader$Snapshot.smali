.class final Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;
.super Ljava/lang/Object;
.source "T6FolderReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6FolderReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Snapshot"
.end annotation


# instance fields
.field final permissionMissing:Z

.field final rawPath:Ljava/lang/String;

.field final rawReadable:Z

.field final result:Lorg/wiiucoop/bo2android/T6GameData$Result;


# direct methods
.method constructor <init>(Lorg/wiiucoop/bo2android/T6GameData$Result;Ljava/lang/String;ZZ)V
    .locals 0
    .param p1, "result"    # Lorg/wiiucoop/bo2android/T6GameData$Result;
    .param p2, "rawPath"    # Ljava/lang/String;
    .param p3, "rawReadable"    # Z
    .param p4, "permissionMissing"    # Z

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;->result:Lorg/wiiucoop/bo2android/T6GameData$Result;

    .line 40
    iput-object p2, p0, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;->rawPath:Ljava/lang/String;

    .line 41
    iput-boolean p3, p0, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;->rawReadable:Z

    .line 42
    iput-boolean p4, p0, Lorg/wiiucoop/bo2android/T6FolderReader$Snapshot;->permissionMissing:Z

    .line 43
    return-void
.end method
