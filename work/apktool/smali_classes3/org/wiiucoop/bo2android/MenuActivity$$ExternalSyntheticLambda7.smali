.class public final synthetic Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/wiiucoop/bo2android/MenuActivity;

.field public final synthetic f$1:Ljava/io/IOException;


# direct methods
.method public synthetic constructor <init>(Lorg/wiiucoop/bo2android/MenuActivity;Ljava/io/IOException;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda7;->f$0:Lorg/wiiucoop/bo2android/MenuActivity;

    iput-object p2, p0, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda7;->f$1:Ljava/io/IOException;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda7;->f$0:Lorg/wiiucoop/bo2android/MenuActivity;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda7;->f$1:Ljava/io/IOException;

    invoke-virtual {v0, v1}, Lorg/wiiucoop/bo2android/MenuActivity;->lambda$runUpdate$10$org-wiiucoop-bo2android-MenuActivity(Ljava/io/IOException;)V

    return-void
.end method
