.class synthetic Lorg/wiiucoop/bo2android/MenuActivity$1;
.super Ljava/lang/Object;
.source "MenuActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/MenuActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$org$wiiucoop$bo2android$T6StartDecision$Code:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 350
    invoke-static {}, Lorg/wiiucoop/bo2android/T6StartDecision$Code;->values()[Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lorg/wiiucoop/bo2android/MenuActivity$1;->$SwitchMap$org$wiiucoop$bo2android$T6StartDecision$Code:[I

    :try_start_0
    sget-object v0, Lorg/wiiucoop/bo2android/MenuActivity$1;->$SwitchMap$org$wiiucoop$bo2android$T6StartDecision$Code:[I

    sget-object v1, Lorg/wiiucoop/bo2android/T6StartDecision$Code;->NO_FOLDER:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    invoke-virtual {v1}, Lorg/wiiucoop/bo2android/T6StartDecision$Code;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :goto_0
    :try_start_1
    sget-object v0, Lorg/wiiucoop/bo2android/MenuActivity$1;->$SwitchMap$org$wiiucoop$bo2android$T6StartDecision$Code:[I

    sget-object v1, Lorg/wiiucoop/bo2android/T6StartDecision$Code;->FOLDER_UNUSABLE:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    invoke-virtual {v1}, Lorg/wiiucoop/bo2android/T6StartDecision$Code;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    :goto_1
    :try_start_2
    sget-object v0, Lorg/wiiucoop/bo2android/MenuActivity$1;->$SwitchMap$org$wiiucoop$bo2android$T6StartDecision$Code:[I

    sget-object v1, Lorg/wiiucoop/bo2android/T6StartDecision$Code;->NO_MODE:Lorg/wiiucoop/bo2android/T6StartDecision$Code;

    invoke-virtual {v1}, Lorg/wiiucoop/bo2android/T6StartDecision$Code;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v0

    :goto_2
    return-void
.end method
