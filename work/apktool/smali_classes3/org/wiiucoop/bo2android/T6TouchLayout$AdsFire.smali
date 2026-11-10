.class public final Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;
.super Ljava/lang/Object;
.source "T6TouchLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6TouchLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AdsFire"
.end annotation


# static fields
.field public static final MAX_QUEUED:I = 0x5


# instance fields
.field private aimFrom:J

.field private aimUntil:J

.field private held:Z

.field private final pulses:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "[J>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 272
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 276
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->pulses:Ljava/util/ArrayList;

    .line 278
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->aimFrom:J

    iput-wide v0, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->aimUntil:J

    return-void
.end method

.method private prune(J)V
    .locals 5
    .param p1, "now"    # J

    .line 349
    nop

    :goto_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->pulses:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->pulses:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [J

    const/4 v2, 0x1

    aget-wide v3, v0, v2

    cmp-long v0, v3, p1

    if-gtz v0, :cond_0

    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->pulses:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le v0, v2, :cond_0

    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->pulses:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_0

    .line 350
    :cond_0
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .line 319
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->held:Z

    .line 320
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->pulses:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 321
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->aimUntil:J

    iput-wide v0, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->aimFrom:J

    .line 322
    return-void
.end method

.method public down(JZ)V
    .locals 16
    .param p1, "now"    # J
    .param p3, "aimHeldElsewhere"    # Z

    .line 282
    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    invoke-direct/range {p0 .. p2}, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->prune(J)V

    .line 283
    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez p3, :cond_1

    invoke-virtual/range {p0 .. p2}, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->triggers(J)I

    move-result v5

    and-int/2addr v5, v4

    if-eqz v5, :cond_0

    goto :goto_0

    :cond_0
    move v5, v3

    goto :goto_1

    :cond_1
    :goto_0
    move v5, v4

    .line 284
    .local v5, "aiming":Z
    :goto_1
    if-eqz v5, :cond_2

    move-wide v6, v1

    goto :goto_2

    :cond_2
    const-wide/16 v6, 0x78

    add-long/2addr v6, v1

    .line 285
    .local v6, "at":J
    :goto_2
    iget-object v8, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->pulses:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v8

    const-wide v9, 0x7fffffffffffffffL

    if-nez v8, :cond_6

    .line 286
    iget-object v8, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->pulses:Ljava/util/ArrayList;

    iget-object v11, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->pulses:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    sub-int/2addr v11, v4

    invoke-virtual {v8, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [J

    .line 287
    .local v8, "last":[J
    aget-wide v11, v8, v4

    cmp-long v11, v11, v9

    if-nez v11, :cond_3

    aget-wide v11, v8, v3

    const-wide/16 v13, 0x64

    add-long/2addr v11, v13

    invoke-static {v1, v2, v11, v12}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v11

    aput-wide v11, v8, v4

    .line 289
    :cond_3
    aget-wide v11, v8, v4

    const-wide/16 v13, 0x46

    add-long/2addr v11, v13

    invoke-static {v6, v7, v11, v12}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    .line 290
    const/4 v11, 0x0

    .line 291
    .local v11, "waiting":I
    iget-object v12, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->pulses:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_4
    :goto_3
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_5

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, [J

    .local v13, "p":[J
    aget-wide v14, v13, v4

    cmp-long v14, v14, v1

    if-lez v14, :cond_4

    add-int/lit8 v11, v11, 0x1

    goto :goto_3

    .line 292
    .end local v13    # "p":[J
    :cond_5
    const/4 v12, 0x5

    if-lt v11, v12, :cond_6

    .line 293
    iput-boolean v4, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->held:Z

    .line 294
    iput-wide v9, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->aimUntil:J

    .line 295
    return-void

    .line 298
    .end local v8    # "last":[J
    .end local v11    # "waiting":I
    :cond_6
    iget-wide v11, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->aimFrom:J

    const-wide/16 v13, 0x0

    cmp-long v8, v11, v13

    if-ltz v8, :cond_7

    invoke-virtual/range {p0 .. p2}, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->triggers(J)I

    move-result v8

    and-int/2addr v8, v4

    if-nez v8, :cond_8

    :cond_7
    iput-wide v1, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->aimFrom:J

    .line 299
    :cond_8
    iput-boolean v4, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->held:Z

    .line 300
    iget-object v8, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->pulses:Ljava/util/ArrayList;

    const/4 v11, 0x2

    new-array v11, v11, [J

    aput-wide v6, v11, v3

    aput-wide v9, v11, v4

    invoke-virtual {v8, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 301
    iput-wide v9, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->aimUntil:J

    .line 302
    return-void
.end method

.method public held()Z
    .locals 1

    .line 325
    iget-boolean v0, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->held:Z

    return v0
.end method

.method public nextChange(J)J
    .locals 7
    .param p1, "now"    # J

    .line 339
    const-wide v0, 0x7fffffffffffffffL

    .line 340
    .local v0, "next":J
    iget-object v2, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->pulses:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [J

    .line 341
    .local v3, "p":[J
    const/4 v4, 0x0

    aget-wide v5, v3, v4

    cmp-long v5, v5, p1

    if-lez v5, :cond_0

    aget-wide v5, v3, v4

    cmp-long v5, v5, v0

    if-gez v5, :cond_0

    aget-wide v0, v3, v4

    .line 342
    :cond_0
    const/4 v4, 0x1

    aget-wide v5, v3, v4

    cmp-long v5, v5, p1

    if-lez v5, :cond_1

    aget-wide v5, v3, v4

    cmp-long v5, v5, v0

    if-gez v5, :cond_1

    aget-wide v0, v3, v4

    .line 343
    .end local v3    # "p":[J
    :cond_1
    goto :goto_0

    .line 344
    :cond_2
    iget-wide v2, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->aimUntil:J

    cmp-long v2, v2, p1

    if-lez v2, :cond_3

    iget-wide v2, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->aimUntil:J

    cmp-long v2, v2, v0

    if-gez v2, :cond_3

    iget-wide v0, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->aimUntil:J

    .line 345
    :cond_3
    const-wide v2, 0x7fffffffffffffffL

    cmp-long v2, v0, v2

    if-nez v2, :cond_4

    const-wide/16 v2, -0x1

    goto :goto_1

    :cond_4
    move-wide v2, v0

    :goto_1
    return-wide v2
.end method

.method public triggers(J)I
    .locals 6
    .param p1, "now"    # J

    .line 330
    iget-wide v0, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->aimFrom:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    const/4 v1, 0x0

    if-ltz v0, :cond_4

    iget-wide v2, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->aimFrom:J

    cmp-long v0, p1, v2

    if-gez v0, :cond_0

    goto :goto_1

    .line 331
    :cond_0
    const/4 v0, 0x0

    .line 332
    .local v0, "t":I
    iget-wide v2, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->aimUntil:J

    cmp-long v2, p1, v2

    if-gez v2, :cond_1

    or-int/lit8 v0, v0, 0x1

    .line 333
    :cond_1
    iget-object v2, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->pulses:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [J

    .local v3, "p":[J
    aget-wide v4, v3, v1

    cmp-long v4, p1, v4

    if-ltz v4, :cond_2

    const/4 v4, 0x1

    aget-wide v4, v3, v4

    cmp-long v4, p1, v4

    if-gez v4, :cond_2

    or-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 334
    .end local v3    # "p":[J
    :cond_3
    return v0

    .line 330
    .end local v0    # "t":I
    :cond_4
    :goto_1
    return v1
.end method

.method public up(J)V
    .locals 10
    .param p1, "now"    # J

    .line 306
    iget-boolean v0, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->held:Z

    if-nez v0, :cond_0

    return-void

    .line 307
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->held:Z

    .line 308
    move-wide v1, p1

    .line 309
    .local v1, "end":J
    iget-object v3, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->pulses:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    .line 310
    iget-object v3, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->pulses:Ljava/util/ArrayList;

    iget-object v4, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->pulses:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x1

    sub-int/2addr v4, v5

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [J

    .line 311
    .local v3, "last":[J
    aget-wide v6, v3, v5

    const-wide v8, 0x7fffffffffffffffL

    cmp-long v4, v6, v8

    if-nez v4, :cond_1

    aget-wide v6, v3, v0

    const-wide/16 v8, 0x64

    add-long/2addr v6, v8

    invoke-static {p1, p2, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    aput-wide v6, v3, v5

    .line 312
    :cond_1
    aget-wide v4, v3, v5

    invoke-static {v1, v2, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    .line 314
    .end local v3    # "last":[J
    :cond_2
    const-wide/16 v3, 0x12c

    add-long/2addr v3, v1

    iput-wide v3, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->aimUntil:J

    .line 315
    return-void
.end method
