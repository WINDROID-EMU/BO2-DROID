.class final Lorg/wiiucoop/bo2android/T6Updater$Check;
.super Ljava/lang/Object;
.source "T6Updater.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6Updater;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Check"
.end annotation


# instance fields
.field apk:Lorg/wiiucoop/bo2android/T6Updater$Component;

.field source:Lorg/wiiucoop/bo2android/T6Updater$Component;

.field sourceCurrent:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    const-string v0, ""

    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6Updater$Check;->sourceCurrent:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method any()Z
    .locals 1

    .line 69
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6Updater$Check;->apk:Lorg/wiiucoop/bo2android/T6Updater$Component;

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6Updater$Check;->source:Lorg/wiiucoop/bo2android/T6Updater$Component;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method
