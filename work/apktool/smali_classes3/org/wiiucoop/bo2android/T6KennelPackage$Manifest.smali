.class final Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;
.super Ljava/lang/Object;
.source "T6KennelPackage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6KennelPackage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Manifest"
.end annotation


# instance fields
.field final asset:Ljava/lang/String;

.field final files:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;",
            ">;"
        }
    .end annotation
.end field

.field final sha256:Ljava/lang/String;

.field final size:J

.field final version:I


# direct methods
.method constructor <init>(ILjava/lang/String;JLjava/lang/String;Ljava/util/List;)V
    .locals 0
    .param p1, "version"    # I
    .param p2, "asset"    # Ljava/lang/String;
    .param p3, "size"    # J
    .param p5, "sha256"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "J",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;",
            ">;)V"
        }
    .end annotation

    .line 53
    .local p6, "files":Ljava/util/List;, "Ljava/util/List<Lorg/wiiucoop/bo2android/T6KennelPackage$Entry;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput p1, p0, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;->version:I

    .line 55
    iput-object p2, p0, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;->asset:Ljava/lang/String;

    .line 56
    iput-wide p3, p0, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;->size:J

    .line 57
    iput-object p5, p0, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;->sha256:Ljava/lang/String;

    .line 58
    iput-object p6, p0, Lorg/wiiucoop/bo2android/T6KennelPackage$Manifest;->files:Ljava/util/List;

    .line 59
    return-void
.end method
