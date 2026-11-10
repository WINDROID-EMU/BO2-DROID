.class final Lorg/wiiucoop/bo2android/T6ConfigStore;
.super Ljava/lang/Object;
.source "T6ConfigStore.java"


# instance fields
.field private final file:Ljava/io/File;


# direct methods
.method constructor <init>(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6ConfigStore;->file:Ljava/io/File;

    .line 33
    return-void
.end method


# virtual methods
.method file()Ljava/io/File;
    .locals 1

    .line 36
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6ConfigStore;->file:Ljava/io/File;

    return-object v0
.end method

.method load()Lorg/wiiucoop/bo2android/T6Config;
    .locals 1

    .line 41
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6ConfigStore;->file:Ljava/io/File;

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6Config;->load(Ljava/io/File;)Lorg/wiiucoop/bo2android/T6Config;

    move-result-object v0

    return-object v0
.end method

.method update(Ljava/util/function/Consumer;)Lorg/wiiucoop/bo2android/T6Config;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Lorg/wiiucoop/bo2android/T6Config;",
            ">;)",
            "Lorg/wiiucoop/bo2android/T6Config;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 46
    .local p1, "change":Ljava/util/function/Consumer;, "Ljava/util/function/Consumer<Lorg/wiiucoop/bo2android/T6Config;>;"
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6ConfigStore;->file:Ljava/io/File;

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6Config;->load(Ljava/io/File;)Lorg/wiiucoop/bo2android/T6Config;

    move-result-object v0

    .line 47
    .local v0, "current":Lorg/wiiucoop/bo2android/T6Config;
    invoke-interface {p1, v0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 48
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6ConfigStore;->file:Ljava/io/File;

    invoke-virtual {v0, v1}, Lorg/wiiucoop/bo2android/T6Config;->save(Ljava/io/File;)V

    .line 49
    return-object v0
.end method
