.class final Lorg/wiiucoop/bo2android/T6Updater$Component;
.super Ljava/lang/Object;
.source "T6Updater.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6Updater;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Component"
.end annotation


# instance fields
.field final asset:Ljava/lang/String;

.field final code:I

.field final minApkCode:I

.field final sha256:Ljava/lang/String;

.field final tag:Ljava/lang/String;

.field final version:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "o"    # Lorg/json/JSONObject;

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    const-string v0, "version"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6Updater$Component;->version:Ljava/lang/String;

    .line 54
    const-string v0, "code"

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lorg/wiiucoop/bo2android/T6Updater$Component;->code:I

    .line 55
    const-string v0, "tag"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6Updater$Component;->tag:Ljava/lang/String;

    .line 56
    const-string v0, "asset"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6Updater$Component;->asset:Ljava/lang/String;

    .line 57
    const-string v0, "sha256"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6Updater$Component;->sha256:Ljava/lang/String;

    .line 58
    const-string v0, "minApkCode"

    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lorg/wiiucoop/bo2android/T6Updater$Component;->minApkCode:I

    .line 59
    return-void
.end method
