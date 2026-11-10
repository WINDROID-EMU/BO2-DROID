.class public final Lorg/wiiucoop/bo2android/T6DxvkStore$Result;
.super Ljava/lang/Object;
.source "T6DxvkStore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6DxvkStore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Result"
.end annotation


# instance fields
.field public final id:Ljava/lang/String;

.field public final ok:Z

.field public final reason:Ljava/lang/String;

.field public final version:Ljava/lang/String;


# direct methods
.method constructor <init>(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "ok"    # Z
    .param p2, "reason"    # Ljava/lang/String;
    .param p3, "id"    # Ljava/lang/String;
    .param p4, "version"    # Ljava/lang/String;

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    iput-boolean p1, p0, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;->ok:Z

    .line 100
    iput-object p2, p0, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;->reason:Ljava/lang/String;

    .line 101
    iput-object p3, p0, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;->id:Ljava/lang/String;

    .line 102
    iput-object p4, p0, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;->version:Ljava/lang/String;

    .line 103
    return-void
.end method

.method static fail(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DxvkStore$Result;
    .locals 3
    .param p0, "reason"    # Ljava/lang/String;

    .line 106
    new-instance v0, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;

    const/4 v1, 0x0

    const-string v2, ""

    invoke-direct {v0, v1, p0, v2, v2}, Lorg/wiiucoop/bo2android/T6DxvkStore$Result;-><init>(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method
