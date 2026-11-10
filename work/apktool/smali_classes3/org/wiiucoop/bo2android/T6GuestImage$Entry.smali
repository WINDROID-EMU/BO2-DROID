.class final Lorg/wiiucoop/bo2android/T6GuestImage$Entry;
.super Ljava/lang/Object;
.source "T6GuestImage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6GuestImage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Entry"
.end annotation


# instance fields
.field final sha256:Ljava/lang/String;

.field final size:J


# direct methods
.method constructor <init>(JLjava/lang/String;)V
    .locals 0
    .param p1, "size"    # J
    .param p3, "sha256"    # Ljava/lang/String;

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-wide p1, p0, Lorg/wiiucoop/bo2android/T6GuestImage$Entry;->size:J

    .line 43
    iput-object p3, p0, Lorg/wiiucoop/bo2android/T6GuestImage$Entry;->sha256:Ljava/lang/String;

    .line 44
    return-void
.end method
