.class final Lorg/wiiucoop/bo2android/T6GuestImage$Result;
.super Ljava/lang/Object;
.source "T6GuestImage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6GuestImage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Result"
.end annotation


# instance fields
.field final detail:Ljava/lang/String;

.field final ready:Z


# direct methods
.method constructor <init>(ZLjava/lang/String;)V
    .locals 0
    .param p1, "ready"    # Z
    .param p2, "detail"    # Ljava/lang/String;

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-boolean p1, p0, Lorg/wiiucoop/bo2android/T6GuestImage$Result;->ready:Z

    .line 53
    iput-object p2, p0, Lorg/wiiucoop/bo2android/T6GuestImage$Result;->detail:Ljava/lang/String;

    .line 54
    return-void
.end method
