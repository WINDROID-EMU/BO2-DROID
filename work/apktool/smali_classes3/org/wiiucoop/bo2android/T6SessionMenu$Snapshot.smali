.class public final Lorg/wiiucoop/bo2android/T6SessionMenu$Snapshot;
.super Ljava/lang/Object;
.source "T6SessionMenu.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6SessionMenu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Snapshot"
.end annotation


# instance fields
.field public final client:Ljava/lang/String;

.field public final engine:Ljava/lang/String;

.field public final folder:Ljava/lang/String;

.field public final fps:Ljava/lang/String;

.field public final session:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "client"    # Ljava/lang/String;
    .param p2, "folder"    # Ljava/lang/String;
    .param p3, "session"    # Ljava/lang/String;
    .param p4, "engine"    # Ljava/lang/String;
    .param p5, "fps"    # Ljava/lang/String;

    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 147
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6SessionMenu$Snapshot;->client:Ljava/lang/String;

    .line 148
    iput-object p2, p0, Lorg/wiiucoop/bo2android/T6SessionMenu$Snapshot;->folder:Ljava/lang/String;

    .line 149
    iput-object p3, p0, Lorg/wiiucoop/bo2android/T6SessionMenu$Snapshot;->session:Ljava/lang/String;

    .line 150
    iput-object p4, p0, Lorg/wiiucoop/bo2android/T6SessionMenu$Snapshot;->engine:Ljava/lang/String;

    .line 151
    iput-object p5, p0, Lorg/wiiucoop/bo2android/T6SessionMenu$Snapshot;->fps:Ljava/lang/String;

    .line 152
    return-void
.end method
