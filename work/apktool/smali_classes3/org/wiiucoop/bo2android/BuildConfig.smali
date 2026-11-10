.class public final Lorg/wiiucoop/bo2android/BuildConfig;
.super Ljava/lang/Object;
.source "BuildConfig.java"


# static fields
.field public static final APPLICATION_ID:Ljava/lang/String; = "com.t6requiem.bo2arm"

.field public static final BUILD_TYPE:Ljava/lang/String; = "debug"

.field public static final DEBUG:Z

.field public static final T6_ENGINE_DIAG:Z = true

.field public static final T6_SIGNING_CERT_SHA256:Ljava/lang/String; = "2b4f103bf8dd7852738478add1399ade5fc115b20bf4314f101c466e404b0262"

.field public static final T6_SOURCE_CODE:I = 0x8

.field public static final T6_UPDATE_CHANNEL:Ljava/lang/String; = "public"

.field public static final T6_UPDATE_CHANNEL_KEY:Ljava/lang/String; = ""

.field public static final T6_UPDATE_URL:Ljava/lang/String; = "https://t6requiem-update.soldadoghostzm.workers.dev"

.field public static final VERSION_CODE:I = 0x19

.field public static final VERSION_NAME:Ljava/lang/String; = "2.1.0-beta"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 7
    const-string v0, "true"

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lorg/wiiucoop/bo2android/BuildConfig;->DEBUG:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
