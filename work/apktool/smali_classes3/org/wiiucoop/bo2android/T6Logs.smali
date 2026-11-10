.class public final Lorg/wiiucoop/bo2android/T6Logs;
.super Ljava/lang/Object;
.source "T6Logs.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/wiiucoop/bo2android/T6Logs$Line;,
        Lorg/wiiucoop/bo2android/T6Logs$Buffer;
    }
.end annotation


# static fields
.field public static final AUDIO_NET:I = 0x3

.field public static final CATEGORY_COUNT:I = 0x4

.field public static final CATEGORY_IDS:[Ljava/lang/String;

.field public static final ENGINE:I = 0x0

.field public static final GRAPHICS:I = 0x1

.field public static final HOST:I = 0x2

.field public static final MAX_PER_CATEGORY:I = 0xfa0

.field private static final SECRET:Ljava/util/regex/Pattern;

.field private static final THREADTIME:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 26
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "engine"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "graphics"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "host"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "audio-net"

    aput-object v2, v0, v1

    sput-object v0, Lorg/wiiucoop/bo2android/T6Logs;->CATEGORY_IDS:[Ljava/lang/String;

    .line 59
    const-string v0, "^(\\d\\d-\\d\\d \\d\\d:\\d\\d:\\d\\d\\.\\d{3})\\s+\\d+\\s+\\d+\\s+([VDIWEF])\\s+(.*?)\\s*: (.*)$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/wiiucoop/bo2android/T6Logs;->THREADTIME:Ljava/util/regex/Pattern;

    .line 97
    const-string v0, "(?i)\\b(token|password|passwd|secret|auth|authorization|cookie|session[_-]?key|api[_-]?key)(\\s*[=:]\\s*)(\\S+)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/wiiucoop/bo2android/T6Logs;->SECRET:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    return-void
.end method

.method public static categorize(Ljava/lang/String;Ljava/lang/String;)I
    .locals 19
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;

    .line 81
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    move-object/from16 v1, p0

    invoke-virtual {v1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 82
    .local v0, "t":Ljava/lang/String;
    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    move-object/from16 v3, p1

    invoke-virtual {v3, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    .line 83
    .local v2, "m":Ljava/lang/String;
    const-string v4, "t6android"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const-string v5, "audio"

    const-string v6, "dxvk"

    const/16 v7, 0x9

    const/16 v8, 0x8

    const/4 v9, 0x7

    const/4 v10, 0x6

    const-string v11, "vulkan"

    const/4 v12, 0x5

    const/4 v13, 0x4

    const/4 v14, 0x0

    const/4 v15, 0x3

    const/16 v16, 0x2

    const/16 v17, 0x1

    if-eqz v4, :cond_3

    .line 84
    new-array v4, v12, [Ljava/lang/String;

    const-string v18, "guest"

    aput-object v18, v4, v14

    const-string v18, "engine"

    aput-object v18, v4, v17

    const-string v18, "t6-milestone"

    aput-object v18, v4, v16

    const-string v18, "[messagebox]"

    aput-object v18, v4, v15

    const-string v18, "[keys]"

    aput-object v18, v4, v13

    invoke-static {v2, v4}, Lorg/wiiucoop/bo2android/T6Logs;->startsWithAny(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    return v14

    .line 85
    :cond_0
    new-array v4, v7, [Ljava/lang/String;

    const-string v7, "d3d"

    aput-object v7, v4, v14

    aput-object v6, v4, v17

    aput-object v11, v4, v16

    const-string v6, "vkshim"

    aput-object v6, v4, v15

    const-string v6, "vkdriver"

    aput-object v6, v4, v13

    const-string v6, "display:"

    aput-object v6, v4, v12

    const-string v6, "info:"

    aput-object v6, v4, v10

    const-string v6, "warn:"

    aput-object v6, v4, v9

    const-string v6, "err:"

    aput-object v6, v4, v8

    invoke-static {v2, v4}, Lorg/wiiucoop/bo2android/T6Logs;->startsWithAny(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    return v17

    .line 86
    :cond_1
    new-array v4, v12, [Ljava/lang/String;

    aput-object v5, v4, v14

    const-string v5, "net"

    aput-object v5, v4, v17

    const-string v5, "sock"

    aput-object v5, v4, v16

    const-string v5, "[nx-host] net"

    aput-object v5, v4, v15

    const-string v5, "[nx-host] sock"

    aput-object v5, v4, v13

    invoke-static {v2, v4}, Lorg/wiiucoop/bo2android/T6Logs;->startsWithAny(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    return v15

    .line 87
    :cond_2
    return v16

    .line 89
    :cond_3
    const/16 v4, 0xa

    new-array v4, v4, [Ljava/lang/String;

    const-string v18, "adreno"

    aput-object v18, v4, v14

    aput-object v11, v4, v17

    const-string v11, "mesa"

    aput-object v11, v4, v16

    const-string v18, "turnip"

    aput-object v18, v4, v15

    const-string v18, "qdgralloc"

    aput-object v18, v4, v13

    const-string v18, "gralloc"

    aput-object v18, v4, v12

    const-string v18, "ahardwarebuffer"

    aput-object v18, v4, v10

    const-string v10, "graphicbuffer"

    aput-object v10, v4, v9

    const-string v9, "adrenotools"

    aput-object v9, v4, v8

    aput-object v6, v4, v7

    invoke-static {v0, v4}, Lorg/wiiucoop/bo2android/T6Logs;->startsWithAny(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 90
    return v17

    .line 91
    :cond_4
    const-string v4, "libc"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-virtual {v2, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_5

    return v17

    .line 92
    :cond_5
    new-array v4, v12, [Ljava/lang/String;

    aput-object v5, v4, v14

    const-string v5, "aaudio"

    aput-object v5, v4, v17

    const-string v5, "sdlaudio"

    aput-object v5, v4, v16

    const-string v5, "oboe"

    aput-object v5, v4, v15

    const-string v5, "media"

    aput-object v5, v4, v13

    invoke-static {v0, v4}, Lorg/wiiucoop/bo2android/T6Logs;->startsWithAny(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    return v15

    .line 93
    :cond_6
    return v16
.end method

.method public static levelAtLeast(CC)Z
    .locals 2
    .param p0, "level"    # C
    .param p1, "minimum"    # C

    .line 107
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Logs;->rank(C)I

    move-result v0

    invoke-static {p1}, Lorg/wiiucoop/bo2android/T6Logs;->rank(C)I

    move-result v1

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static parse(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6Logs$Line;
    .locals 10
    .param p0, "raw"    # Ljava/lang/String;

    .line 64
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 65
    :cond_0
    sget-object v1, Lorg/wiiucoop/bo2android/T6Logs;->THREADTIME:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 66
    .local v1, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-nez v2, :cond_1

    return-object v0

    .line 67
    :cond_1
    const/4 v0, 0x3

    invoke-virtual {v1, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 68
    .local v0, "tag":Ljava/lang/String;
    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/wiiucoop/bo2android/T6Logs;->redact(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 69
    .local v8, "message":Ljava/lang/String;
    new-instance v9, Lorg/wiiucoop/bo2android/T6Logs$Line;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v0, v8}, Lorg/wiiucoop/bo2android/T6Logs;->categorize(Ljava/lang/String;Ljava/lang/String;)I

    move-result v7

    move-object v2, v9

    move-object v5, v0

    move-object v6, v8

    invoke-direct/range {v2 .. v7}, Lorg/wiiucoop/bo2android/T6Logs$Line;-><init>(Ljava/lang/String;CLjava/lang/String;Ljava/lang/String;I)V

    return-object v9
.end method

.method private static rank(C)I
    .locals 1
    .param p0, "level"    # C

    .line 111
    const-string v0, "VDIWEF"

    invoke-virtual {v0, p0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    return v0
.end method

.method public static redact(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "message"    # Ljava/lang/String;

    .line 102
    sget-object v0, Lorg/wiiucoop/bo2android/T6Logs;->SECRET:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    const-string v1, "$1$2***"

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static varargs startsWithAny(Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 5
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "prefixes"    # [Ljava/lang/String;

    .line 73
    array-length v0, p1

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    aget-object v3, p1, v2

    .line 74
    .local v3, "p":Ljava/lang/String;
    invoke-virtual {p0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v0, 0x1

    return v0

    .line 73
    .end local v3    # "p":Ljava/lang/String;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 76
    :cond_1
    return v1
.end method
