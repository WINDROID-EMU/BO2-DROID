.class public final Lorg/wiiucoop/bo2android/T6GameData$Result;
.super Ljava/lang/Object;
.source "T6GameData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6GameData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Result"
.end annotation


# instance fields
.field public final detail:Ljava/lang/String;

.field public final found:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final level:Lorg/wiiucoop/bo2android/T6GameData$Level;

.field public final missing:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/wiiucoop/bo2android/T6GameData$Level;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .param p1, "level"    # Lorg/wiiucoop/bo2android/T6GameData$Level;
    .param p2, "detail"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/wiiucoop/bo2android/T6GameData$Level;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 37
    .local p3, "found":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p4, "missing":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6GameData$Result;->level:Lorg/wiiucoop/bo2android/T6GameData$Level;

    .line 39
    iput-object p2, p0, Lorg/wiiucoop/bo2android/T6GameData$Result;->detail:Ljava/lang/String;

    .line 40
    iput-object p3, p0, Lorg/wiiucoop/bo2android/T6GameData$Result;->found:Ljava/util/List;

    .line 41
    iput-object p4, p0, Lorg/wiiucoop/bo2android/T6GameData$Result;->missing:Ljava/util/List;

    .line 42
    return-void
.end method


# virtual methods
.method public allowsStart()Z
    .locals 2

    .line 45
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6GameData$Result;->level:Lorg/wiiucoop/bo2android/T6GameData$Level;

    sget-object v1, Lorg/wiiucoop/bo2android/T6GameData$Level;->FAIL:Lorg/wiiucoop/bo2android/T6GameData$Level;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
