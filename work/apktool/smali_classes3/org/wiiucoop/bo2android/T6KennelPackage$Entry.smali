.class final Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;
.super Ljava/lang/Object;
.source "T6KennelPackage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6KennelPackage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Entry"
.end annotation


# instance fields
.field final path:Ljava/lang/String;

.field final sha256:Ljava/lang/String;

.field final size:J


# direct methods
.method constructor <init>(Ljava/lang/String;JLjava/lang/String;)V
    .locals 0
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "size"    # J
    .param p4, "sha256"    # Ljava/lang/String;

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;->path:Ljava/lang/String;

    .line 41
    iput-wide p2, p0, Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;->size:J

    .line 42
    iput-object p4, p0, Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;->sha256:Ljava/lang/String;

    .line 43
    return-void
.end method
