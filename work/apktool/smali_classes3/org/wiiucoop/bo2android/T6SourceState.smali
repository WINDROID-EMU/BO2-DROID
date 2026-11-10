.class final Lorg/wiiucoop/bo2android/T6SourceState;
.super Ljava/lang/Object;
.source "T6SourceState.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    return-void
.end method

.method static installedCode(IZI)I
    .locals 1
    .param p0, "updateCode"    # I
    .param p1, "filesVerify"    # Z
    .param p2, "embeddedCode"    # I

    .line 30
    invoke-static {p0, p1, p2}, Lorg/wiiucoop/bo2android/T6SourceState;->useUpdate(IZI)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, p0

    goto :goto_0

    :cond_0
    move v0, p2

    :goto_0
    return v0
.end method

.method static offerRemote(IIII)Z
    .locals 1
    .param p0, "remoteCode"    # I
    .param p1, "remoteMinApkCode"    # I
    .param p2, "installedApkCode"    # I
    .param p3, "installedSourceCode"    # I

    .line 35
    if-le p0, p3, :cond_0

    if-gt p1, p2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static useUpdate(IZI)Z
    .locals 1
    .param p0, "updateCode"    # I
    .param p1, "filesVerify"    # Z
    .param p2, "embeddedCode"    # I

    .line 25
    if-lez p0, :cond_0

    if-eqz p1, :cond_0

    if-le p0, p2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
