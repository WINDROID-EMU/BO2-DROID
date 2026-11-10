.class public final Lorg/wiiucoop/bo2android/T6Logs$Buffer;
.super Ljava/lang/Object;
.source "T6Logs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6Logs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Buffer"
.end annotation


# instance fields
.field private cutoff:Ljava/lang/String;

.field private final lines:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/Deque<",
            "Lorg/wiiucoop/bo2android/T6Logs$Line;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6Logs$Buffer;->lines:Ljava/util/List;

    .line 117
    const-string v0, ""

    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6Logs$Buffer;->cutoff:Ljava/lang/String;

    .line 120
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/4 v1, 0x4

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6Logs$Buffer;->lines:Ljava/util/List;

    new-instance v2, Ljava/util/ArrayDeque;

    invoke-direct {v2}, Ljava/util/ArrayDeque;-><init>()V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 121
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method static synthetic lambda$filter$0(Lorg/wiiucoop/bo2android/T6Logs$Line;Lorg/wiiucoop/bo2android/T6Logs$Line;)I
    .locals 2
    .param p0, "a"    # Lorg/wiiucoop/bo2android/T6Logs$Line;
    .param p1, "b"    # Lorg/wiiucoop/bo2android/T6Logs$Line;

    .line 170
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6Logs$Line;->time:Ljava/lang/String;

    iget-object v1, p1, Lorg/wiiucoop/bo2android/T6Logs$Line;->time:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method


# virtual methods
.method public add(Lorg/wiiucoop/bo2android/T6Logs$Line;)V
    .locals 4
    .param p1, "line"    # Lorg/wiiucoop/bo2android/T6Logs$Line;

    .line 130
    if-nez p1, :cond_0

    return-void

    .line 131
    :cond_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6Logs$Buffer;->cutoff:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p1, Lorg/wiiucoop/bo2android/T6Logs$Line;->time:Ljava/lang/String;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6Logs$Buffer;->cutoff:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-gtz v0, :cond_1

    return-void

    .line 132
    :cond_1
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6Logs$Buffer;->lines:Ljava/util/List;

    iget v1, p1, Lorg/wiiucoop/bo2android/T6Logs$Line;->category:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Deque;

    .line 133
    .local v0, "d":Ljava/util/Deque;, "Ljava/util/Deque<Lorg/wiiucoop/bo2android/T6Logs$Line;>;"
    invoke-interface {v0}, Ljava/util/Deque;->peekLast()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/wiiucoop/bo2android/T6Logs$Line;

    .line 134
    .local v1, "last":Lorg/wiiucoop/bo2android/T6Logs$Line;
    if-eqz v1, :cond_2

    iget-char v2, v1, Lorg/wiiucoop/bo2android/T6Logs$Line;->level:C

    iget-char v3, p1, Lorg/wiiucoop/bo2android/T6Logs$Line;->level:C

    if-ne v2, v3, :cond_2

    iget-object v2, v1, Lorg/wiiucoop/bo2android/T6Logs$Line;->tag:Ljava/lang/String;

    iget-object v3, p1, Lorg/wiiucoop/bo2android/T6Logs$Line;->tag:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, v1, Lorg/wiiucoop/bo2android/T6Logs$Line;->message:Ljava/lang/String;

    iget-object v3, p1, Lorg/wiiucoop/bo2android/T6Logs$Line;->message:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 135
    iget v2, v1, Lorg/wiiucoop/bo2android/T6Logs$Line;->repeats:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v1, Lorg/wiiucoop/bo2android/T6Logs$Line;->repeats:I

    .line 136
    return-void

    .line 138
    :cond_2
    invoke-interface {v0, p1}, Ljava/util/Deque;->addLast(Ljava/lang/Object;)V

    .line 139
    :goto_0
    invoke-interface {v0}, Ljava/util/Deque;->size()I

    move-result v2

    const/16 v3, 0xfa0

    if-le v2, v3, :cond_3

    invoke-interface {v0}, Ljava/util/Deque;->removeFirst()Ljava/lang/Object;

    goto :goto_0

    .line 140
    :cond_3
    return-void
.end method

.method public clear()V
    .locals 5

    .line 144
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6Logs$Buffer;->cutoff:Ljava/lang/String;

    .line 145
    .local v0, "newest":Ljava/lang/String;
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6Logs$Buffer;->lines:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Deque;

    .line 146
    .local v2, "d":Ljava/util/Deque;, "Ljava/util/Deque<Lorg/wiiucoop/bo2android/T6Logs$Line;>;"
    invoke-interface {v2}, Ljava/util/Deque;->peekLast()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/wiiucoop/bo2android/T6Logs$Line;

    .line 147
    .local v3, "last":Lorg/wiiucoop/bo2android/T6Logs$Line;
    if-eqz v3, :cond_0

    iget-object v4, v3, Lorg/wiiucoop/bo2android/T6Logs$Line;->time:Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v4

    if-lez v4, :cond_0

    iget-object v0, v3, Lorg/wiiucoop/bo2android/T6Logs$Line;->time:Ljava/lang/String;

    .line 148
    :cond_0
    invoke-interface {v2}, Ljava/util/Deque;->clear()V

    .line 149
    .end local v2    # "d":Ljava/util/Deque;, "Ljava/util/Deque<Lorg/wiiucoop/bo2android/T6Logs$Line;>;"
    .end local v3    # "last":Lorg/wiiucoop/bo2android/T6Logs$Line;
    goto :goto_0

    .line 150
    :cond_1
    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6Logs$Buffer;->cutoff:Ljava/lang/String;

    .line 151
    return-void
.end method

.method public export(ILjava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "category"    # I
    .param p2, "header"    # Ljava/lang/String;

    .line 176
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 177
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 178
    const/16 v1, 0x56

    const-string v3, ""

    invoke-virtual {p0, p1, v1, v3}, Lorg/wiiucoop/bo2android/T6Logs$Buffer;->filter(ICLjava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/wiiucoop/bo2android/T6Logs$Line;

    .local v3, "l":Lorg/wiiucoop/bo2android/T6Logs$Line;
    invoke-virtual {v3}, Lorg/wiiucoop/bo2android/T6Logs$Line;->format()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 179
    .end local v3    # "l":Lorg/wiiucoop/bo2android/T6Logs$Line;
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public filter(ICLjava/lang/String;)Ljava/util/List;
    .locals 7
    .param p1, "category"    # I
    .param p2, "minimumLevel"    # C
    .param p3, "search"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IC",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lorg/wiiucoop/bo2android/T6Logs$Line;",
            ">;"
        }
    .end annotation

    .line 159
    if-nez p3, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 160
    .local v0, "needle":Ljava/lang/String;
    :goto_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 161
    .local v1, "out":Ljava/util/List;, "Ljava/util/List<Lorg/wiiucoop/bo2android/T6Logs$Line;>;"
    const/4 v2, 0x0

    .local v2, "c":I
    :goto_1
    const/4 v3, 0x4

    if-ge v2, v3, :cond_5

    .line 162
    if-ltz p1, :cond_1

    if-eq v2, p1, :cond_1

    goto :goto_3

    .line 163
    :cond_1
    iget-object v3, p0, Lorg/wiiucoop/bo2android/T6Logs$Buffer;->lines:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Deque;

    invoke-interface {v3}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/wiiucoop/bo2android/T6Logs$Line;

    .line 164
    .local v4, "l":Lorg/wiiucoop/bo2android/T6Logs$Line;
    iget-char v5, v4, Lorg/wiiucoop/bo2android/T6Logs$Line;->level:C

    invoke-static {v5, p2}, Lorg/wiiucoop/bo2android/T6Logs;->levelAtLeast(CC)Z

    move-result v5

    if-nez v5, :cond_2

    goto :goto_2

    .line 165
    :cond_2
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_3

    iget-object v5, v4, Lorg/wiiucoop/bo2android/T6Logs$Line;->message:Ljava/lang/String;

    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v5, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    iget-object v5, v4, Lorg/wiiucoop/bo2android/T6Logs$Line;->tag:Ljava/lang/String;

    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 166
    invoke-virtual {v5, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    goto :goto_2

    .line 167
    :cond_3
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    .end local v4    # "l":Lorg/wiiucoop/bo2android/T6Logs$Line;
    goto :goto_2

    .line 161
    :cond_4
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 170
    .end local v2    # "c":I
    :cond_5
    if-gez p1, :cond_6

    new-instance v2, Lorg/wiiucoop/bo2android/T6Logs$Buffer$$ExternalSyntheticLambda0;

    invoke-direct {v2}, Lorg/wiiucoop/bo2android/T6Logs$Buffer$$ExternalSyntheticLambda0;-><init>()V

    invoke-interface {v1, v2}, Ljava/util/List;->sort(Ljava/util/Comparator;)V

    .line 171
    :cond_6
    return-object v1
.end method

.method public load(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 125
    .local p1, "rawLines":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6Logs$Buffer;->lines:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Deque;

    .local v1, "d":Ljava/util/Deque;, "Ljava/util/Deque<Lorg/wiiucoop/bo2android/T6Logs$Line;>;"
    invoke-interface {v1}, Ljava/util/Deque;->clear()V

    .end local v1    # "d":Ljava/util/Deque;, "Ljava/util/Deque<Lorg/wiiucoop/bo2android/T6Logs$Line;>;"
    goto :goto_0

    .line 126
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .local v1, "raw":Ljava/lang/String;
    invoke-static {v1}, Lorg/wiiucoop/bo2android/T6Logs;->parse(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6Logs$Line;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/wiiucoop/bo2android/T6Logs$Buffer;->add(Lorg/wiiucoop/bo2android/T6Logs$Line;)V

    .end local v1    # "raw":Ljava/lang/String;
    goto :goto_1

    .line 127
    :cond_1
    return-void
.end method

.method public size(I)I
    .locals 1
    .param p1, "category"    # I

    .line 154
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6Logs$Buffer;->lines:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->size()I

    move-result v0

    return v0
.end method
