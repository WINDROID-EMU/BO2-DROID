.class public final Lorg/wiiucoop/bo2android/T6DriverStore$Entry;
.super Ljava/lang/Object;
.source "T6DriverStore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6DriverStore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Entry"
.end annotation


# instance fields
.field public final id:Ljava/lang/String;

.field public final librarySha256:Ljava/lang/String;

.field public final meta:Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;


# direct methods
.method constructor <init>(Ljava/lang/String;Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;Ljava/lang/String;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "meta"    # Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;
    .param p3, "librarySha256"    # Ljava/lang/String;

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6DriverStore$Entry;->id:Ljava/lang/String;

    .line 37
    iput-object p2, p0, Lorg/wiiucoop/bo2android/T6DriverStore$Entry;->meta:Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;

    .line 38
    iput-object p3, p0, Lorg/wiiucoop/bo2android/T6DriverStore$Entry;->librarySha256:Ljava/lang/String;

    .line 39
    return-void
.end method
