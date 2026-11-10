.class final Lorg/wiiucoop/bo2android/T6TouchSelfTest;
.super Ljava/lang/Object;
.source "T6TouchSelfTest.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "t6android"


# instance fields
.field private final active:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[I>;"
        }
    .end annotation
.end field

.field private final downTime:J

.field private final handler:Landroid/os/Handler;

.field private final root:Landroid/view/ViewGroup;


# direct methods
.method private constructor <init>(Landroid/view/ViewGroup;Landroid/os/Handler;)V
    .locals 2
    .param p1, "root"    # Landroid/view/ViewGroup;
    .param p2, "handler"    # Landroid/os/Handler;

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->downTime:J

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->active:Ljava/util/List;

    .line 33
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->root:Landroid/view/ViewGroup;

    .line 34
    iput-object p2, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->handler:Landroid/os/Handler;

    .line 35
    return-void
.end method

.method private at(JLjava/lang/Runnable;)V
    .locals 1
    .param p1, "delay"    # J
    .param p3, "r"    # Ljava/lang/Runnable;

    .line 106
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p3, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private dispatch(I)V
    .locals 21
    .param p1, "action"    # I

    .line 140
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->active:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    .line 141
    .local v1, "n":I
    new-array v15, v1, [Landroid/view/MotionEvent$PointerProperties;

    .line 142
    .local v15, "props":[Landroid/view/MotionEvent$PointerProperties;
    new-array v14, v1, [Landroid/view/MotionEvent$PointerCoords;

    .line 143
    .local v14, "coords":[Landroid/view/MotionEvent$PointerCoords;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 144
    new-instance v3, Landroid/view/MotionEvent$PointerProperties;

    invoke-direct {v3}, Landroid/view/MotionEvent$PointerProperties;-><init>()V

    aput-object v3, v15, v2

    .line 145
    aget-object v3, v15, v2

    iget-object v4, v0, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->active:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [I

    const/4 v5, 0x0

    aget v4, v4, v5

    iput v4, v3, Landroid/view/MotionEvent$PointerProperties;->id:I

    .line 146
    aget-object v3, v15, v2

    const/4 v4, 0x1

    iput v4, v3, Landroid/view/MotionEvent$PointerProperties;->toolType:I

    .line 147
    new-instance v3, Landroid/view/MotionEvent$PointerCoords;

    invoke-direct {v3}, Landroid/view/MotionEvent$PointerCoords;-><init>()V

    aput-object v3, v14, v2

    .line 148
    aget-object v3, v14, v2

    iget-object v5, v0, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->active:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [I

    aget v4, v5, v4

    int-to-float v4, v4

    iput v4, v3, Landroid/view/MotionEvent$PointerCoords;->x:F

    .line 149
    aget-object v3, v14, v2

    iget-object v4, v0, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->active:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [I

    const/4 v5, 0x2

    aget v4, v4, v5

    int-to-float v4, v4

    iput v4, v3, Landroid/view/MotionEvent$PointerCoords;->y:F

    .line 150
    aget-object v3, v14, v2

    const/high16 v4, 0x3f800000    # 1.0f

    iput v4, v3, Landroid/view/MotionEvent$PointerCoords;->pressure:F

    .line 151
    aget-object v3, v14, v2

    iput v4, v3, Landroid/view/MotionEvent$PointerCoords;->size:F

    .line 143
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 153
    .end local v2    # "i":I
    :cond_0
    iget-wide v2, v0, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->downTime:J

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    const/16 v16, 0x1002

    const/16 v17, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/high16 v12, 0x3f800000    # 1.0f

    const/high16 v13, 0x3f800000    # 1.0f

    const/16 v18, 0x0

    const/16 v19, 0x0

    move/from16 v6, p1

    move v7, v1

    move-object v8, v15

    move-object v9, v14

    move-object/from16 v20, v14

    .end local v14    # "coords":[Landroid/view/MotionEvent$PointerCoords;
    .local v20, "coords":[Landroid/view/MotionEvent$PointerCoords;
    move/from16 v14, v18

    move-object/from16 v18, v15

    .end local v15    # "props":[Landroid/view/MotionEvent$PointerProperties;
    .local v18, "props":[Landroid/view/MotionEvent$PointerProperties;
    move/from16 v15, v19

    invoke-static/range {v2 .. v17}, Landroid/view/MotionEvent;->obtain(JJII[Landroid/view/MotionEvent$PointerProperties;[Landroid/view/MotionEvent$PointerCoords;IIFFIIII)Landroid/view/MotionEvent;

    move-result-object v2

    .line 155
    .local v2, "e":Landroid/view/MotionEvent;
    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->root:Landroid/view/ViewGroup;

    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 156
    invoke-virtual {v2}, Landroid/view/MotionEvent;->recycle()V

    .line 157
    return-void
.end method

.method private down(III)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "x"    # I
    .param p3, "y"    # I

    .line 116
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->active:Ljava/util/List;

    filled-new-array {p1, p2, p3}, [I

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 117
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->active:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 118
    :cond_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->active:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    sub-int/2addr v0, v1

    shl-int/lit8 v0, v0, 0x8

    or-int/lit8 v0, v0, 0x5

    :goto_0
    nop

    .line 119
    .local v0, "action":I
    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->dispatch(I)V

    .line 120
    return-void
.end method

.method private indexOf(I)I
    .locals 3
    .param p1, "id"    # I

    .line 111
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->active:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->active:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    const/4 v2, 0x0

    aget v1, v1, v2

    if-ne v1, p1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 112
    .end local v0    # "i":I
    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method private log(Ljava/lang/String;)V
    .locals 2
    .param p1, "what"    # Ljava/lang/String;

    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "touch selftest: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "t6android"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private move(III)V
    .locals 3
    .param p1, "id"    # I
    .param p2, "x"    # I
    .param p3, "y"    # I

    .line 123
    invoke-direct {p0, p1}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->indexOf(I)I

    move-result v0

    .line 124
    .local v0, "i":I
    if-gez v0, :cond_0

    return-void

    .line 125
    :cond_0
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->active:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    const/4 v2, 0x1

    aput p2, v1, v2

    .line 126
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->active:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    const/4 v2, 0x2

    aput p3, v1, v2

    .line 127
    invoke-direct {p0, v2}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->dispatch(I)V

    .line 128
    return-void
.end method

.method private px(F)I
    .locals 1
    .param p1, "nx"    # F

    .line 42
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->root:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method private py(F)I
    .locals 1
    .param p1, "ny"    # F

    .line 43
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->root:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method static run(Landroid/view/ViewGroup;Landroid/os/Handler;Lorg/wiiucoop/bo2android/T6TouchLayout;)V
    .locals 1
    .param p0, "root"    # Landroid/view/ViewGroup;
    .param p1, "handler"    # Landroid/os/Handler;
    .param p2, "layout"    # Lorg/wiiucoop/bo2android/T6TouchLayout;

    .line 38
    if-eqz p0, :cond_1

    if-eqz p2, :cond_1

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_0

    .line 39
    :cond_0
    new-instance v0, Lorg/wiiucoop/bo2android/T6TouchSelfTest;

    invoke-direct {v0, p0, p1}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;-><init>(Landroid/view/ViewGroup;Landroid/os/Handler;)V

    invoke-direct {v0, p2}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->schedule(Lorg/wiiucoop/bo2android/T6TouchLayout;)V

    .line 40
    return-void

    .line 38
    :cond_1
    :goto_0
    return-void
.end method

.method private schedule(Lorg/wiiucoop/bo2android/T6TouchLayout;)V
    .locals 36
    .param p1, "layout"    # Lorg/wiiucoop/bo2android/T6TouchLayout;

    .line 46
    move-object/from16 v7, p0

    move-object/from16 v8, p1

    const/4 v0, 0x0

    .local v0, "stick":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    const/4 v1, 0x0

    .line 47
    .local v1, "button":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    iget-object v2, v8, Lorg/wiiucoop/bo2android/T6TouchLayout;->controls:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move-object v9, v0

    move-object v10, v1

    .end local v0    # "stick":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .end local v1    # "button":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .local v9, "stick":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .local v10, "button":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    .line 48
    .local v0, "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    iget-object v1, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->kind:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    sget-object v3, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;->STICK_LEFT:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    if-ne v1, v3, :cond_0

    if-nez v9, :cond_0

    move-object v1, v0

    move-object v9, v1

    .line 49
    :cond_0
    iget-object v1, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->kind:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    sget-object v3, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;->BUTTON:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    if-ne v1, v3, :cond_2

    iget v1, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->binding:I

    const/16 v3, 0x1000

    if-eq v1, v3, :cond_1

    const-string v1, "jump"

    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->id:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_1
    if-nez v10, :cond_2

    move-object v1, v0

    move-object v10, v1

    .line 50
    .end local v0    # "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    :cond_2
    goto :goto_0

    .line 51
    :cond_3
    if-eqz v9, :cond_12

    if-nez v10, :cond_4

    move-object/from16 v18, v9

    move-object/from16 v34, v10

    goto/16 :goto_c

    .line 55
    :cond_4
    iget v0, v9, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->x:F

    invoke-direct {v7, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->px(F)I

    move-result v11

    .local v11, "sx":I
    iget v0, v9, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->y:F

    invoke-direct {v7, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->py(F)I

    move-result v12

    .local v12, "sy":I
    iget v0, v10, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->x:F

    invoke-direct {v7, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->px(F)I

    move-result v13

    .local v13, "bx":I
    iget v0, v10, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->y:F

    invoke-direct {v7, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->py(F)I

    move-result v14

    .line 56
    .local v14, "by":I
    const v0, 0x3ee66666    # 0.45f

    invoke-direct {v7, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->px(F)I

    move-result v15

    .local v15, "cx":I
    const v0, 0x3ecccccd    # 0.4f

    invoke-direct {v7, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->py(F)I

    move-result v6

    .line 57
    .local v6, "cy":I
    const-wide/16 v0, 0x12c

    .line 59
    .local v0, "t":J
    new-instance v2, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda0;

    invoke-direct {v2, v7, v11, v12}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda0;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;II)V

    invoke-direct {v7, v0, v1, v2}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .line 60
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_1
    const-wide/16 v16, 0x28

    const/16 v5, 0xa

    if-gt v2, v5, :cond_5

    move v3, v2

    .local v3, "k":I
    int-to-long v4, v2

    mul-long v4, v4, v16

    add-long/2addr v4, v0

    move-object/from16 v18, v9

    .end local v9    # "stick":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .local v18, "stick":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    new-instance v9, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda2;

    invoke-direct {v9, v7, v11, v12, v3}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda2;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;III)V

    invoke-direct {v7, v4, v5, v9}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .end local v3    # "k":I
    add-int/lit8 v2, v2, 0x1

    move-object/from16 v9, v18

    goto :goto_1

    .end local v18    # "stick":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .restart local v9    # "stick":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    :cond_5
    move-object/from16 v18, v9

    .line 61
    .end local v2    # "i":I
    .end local v9    # "stick":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .restart local v18    # "stick":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    const-wide/16 v19, 0x1f4

    add-long v2, v0, v19

    new-instance v4, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda14;

    invoke-direct {v4, v7, v15, v6}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda14;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;II)V

    invoke-direct {v7, v2, v3, v4}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .line 62
    const/4 v2, 0x1

    .restart local v2    # "i":I
    :goto_2
    const/16 v3, 0xf

    const-wide/16 v21, 0x208

    const-wide/16 v23, 0x21

    if-gt v2, v3, :cond_6

    move v3, v2

    .restart local v3    # "k":I
    add-long v21, v0, v21

    move v9, v6

    .end local v6    # "cy":I
    .local v9, "cy":I
    int-to-long v5, v2

    mul-long v5, v5, v23

    add-long v4, v21, v5

    new-instance v6, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda16;

    invoke-direct {v6, v7, v15, v3, v9}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda16;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;III)V

    invoke-direct {v7, v4, v5, v6}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .end local v3    # "k":I
    add-int/lit8 v2, v2, 0x1

    move v6, v9

    const/16 v5, 0xa

    goto :goto_2

    .end local v9    # "cy":I
    .restart local v6    # "cy":I
    :cond_6
    move v9, v6

    .line 63
    .end local v2    # "i":I
    .end local v6    # "cy":I
    .restart local v9    # "cy":I
    const-wide/16 v2, 0x44c

    add-long/2addr v2, v0

    new-instance v4, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda17;

    invoke-direct {v4, v7, v13, v14}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda17;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;II)V

    invoke-direct {v7, v2, v3, v4}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .line 64
    const/4 v2, 0x1

    .restart local v2    # "i":I
    :goto_3
    const/16 v5, 0xa

    if-gt v2, v5, :cond_7

    move v3, v2

    .restart local v3    # "k":I
    const-wide/16 v25, 0x47e

    add-long v25, v0, v25

    int-to-long v5, v2

    mul-long v5, v5, v23

    add-long v4, v25, v5

    new-instance v6, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda18;

    invoke-direct {v6, v7, v15, v9, v3}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda18;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;III)V

    invoke-direct {v7, v4, v5, v6}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .end local v3    # "k":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 65
    .end local v2    # "i":I
    :cond_7
    const-wide/16 v2, 0x640

    add-long/2addr v2, v0

    new-instance v4, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda19;

    invoke-direct {v4, v7}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda19;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;)V

    invoke-direct {v7, v2, v3, v4}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .line 66
    const-wide/16 v2, 0x708

    add-long/2addr v2, v0

    new-instance v4, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda20;

    invoke-direct {v4, v7}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda20;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;)V

    invoke-direct {v7, v2, v3, v4}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .line 67
    const-wide/16 v25, 0x7d0

    add-long v2, v0, v25

    new-instance v4, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda21;

    invoke-direct {v4, v7}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda21;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;)V

    invoke-direct {v7, v2, v3, v4}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .line 69
    const-wide/16 v28, 0xbb8

    add-long v5, v0, v28

    .line 70
    .end local v0    # "t":J
    .local v5, "t":J
    new-instance v0, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda23;

    invoke-direct {v0, v7, v15, v9}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda23;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;II)V

    invoke-direct {v7, v5, v6, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .line 71
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_4
    const/16 v4, 0x8

    if-gt v0, v4, :cond_8

    move v1, v0

    .local v1, "k":I
    int-to-long v2, v0

    mul-long v2, v2, v23

    add-long/2addr v2, v5

    new-instance v4, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda11;

    invoke-direct {v4, v7, v15, v1, v9}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda11;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;III)V

    invoke-direct {v7, v2, v3, v4}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .end local v1    # "k":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 72
    .end local v0    # "i":I
    :cond_8
    const-wide/16 v0, 0x190

    add-long/2addr v0, v5

    new-instance v2, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda22;

    invoke-direct {v2, v7, v11, v12}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda22;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;II)V

    invoke-direct {v7, v0, v1, v2}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .line 73
    const/4 v0, 0x1

    move v2, v0

    .restart local v2    # "i":I
    :goto_5
    if-gt v2, v4, :cond_9

    move v3, v2

    .restart local v3    # "k":I
    const-wide/16 v0, 0x1a4

    add-long/2addr v0, v5

    move-wide/from16 v30, v5

    .end local v5    # "t":J
    .local v30, "t":J
    int-to-long v4, v2

    mul-long v4, v4, v16

    add-long/2addr v4, v0

    new-instance v1, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda24;

    move-object v0, v1

    move/from16 v32, v9

    move-object v9, v1

    .end local v9    # "cy":I
    .local v32, "cy":I
    move-object/from16 v1, p0

    move/from16 v33, v2

    .end local v2    # "i":I
    .local v33, "i":I
    move v2, v11

    move-wide v5, v4

    move-object/from16 v34, v10

    const/16 v10, 0x8

    .end local v10    # "button":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .local v34, "button":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    move v4, v12

    move/from16 v27, v11

    move-wide v10, v5

    const/16 v6, 0xa

    .end local v11    # "sx":I
    .local v27, "sx":I
    move v5, v15

    move/from16 v35, v32

    move/from16 v32, v12

    move v12, v6

    .end local v12    # "sy":I
    .local v32, "sy":I
    .local v35, "cy":I
    move/from16 v6, v35

    invoke-direct/range {v0 .. v6}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda24;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;IIIII)V

    invoke-direct {v7, v10, v11, v9}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .end local v3    # "k":I
    add-int/lit8 v2, v33, 0x1

    move/from16 v11, v27

    move-wide/from16 v5, v30

    move/from16 v12, v32

    move-object/from16 v10, v34

    move/from16 v9, v35

    const/16 v4, 0x8

    .end local v33    # "i":I
    .restart local v2    # "i":I
    goto :goto_5

    .end local v27    # "sx":I
    .end local v30    # "t":J
    .end local v32    # "sy":I
    .end local v34    # "button":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .end local v35    # "cy":I
    .restart local v5    # "t":J
    .restart local v9    # "cy":I
    .restart local v10    # "button":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .restart local v11    # "sx":I
    .restart local v12    # "sy":I
    :cond_9
    move/from16 v33, v2

    move-wide/from16 v30, v5

    move/from16 v35, v9

    move-object/from16 v34, v10

    move/from16 v27, v11

    move/from16 v32, v12

    const/16 v12, 0xa

    .line 74
    .end local v2    # "i":I
    .end local v5    # "t":J
    .end local v9    # "cy":I
    .end local v10    # "button":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .end local v11    # "sx":I
    .end local v12    # "sy":I
    .restart local v27    # "sx":I
    .restart local v30    # "t":J
    .restart local v32    # "sy":I
    .restart local v34    # "button":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .restart local v35    # "cy":I
    const-wide/16 v0, 0x384

    add-long v5, v30, v0

    new-instance v0, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda25;

    invoke-direct {v0, v7}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda25;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;)V

    invoke-direct {v7, v5, v6, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .line 75
    const/4 v0, 0x1

    .restart local v0    # "i":I
    :goto_6
    const/4 v1, 0x5

    if-gt v0, v1, :cond_a

    move v1, v0

    .restart local v1    # "k":I
    const-wide/16 v2, 0x398

    add-long v5, v30, v2

    int-to-long v2, v0

    mul-long v2, v2, v23

    add-long/2addr v5, v2

    new-instance v2, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda26;

    move/from16 v3, v35

    .end local v35    # "cy":I
    .local v3, "cy":I
    invoke-direct {v2, v7, v15, v1, v3}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda26;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;III)V

    invoke-direct {v7, v5, v6, v2}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .end local v1    # "k":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .end local v3    # "cy":I
    .restart local v35    # "cy":I
    :cond_a
    move/from16 v3, v35

    .line 76
    .end local v0    # "i":I
    .end local v35    # "cy":I
    .restart local v3    # "cy":I
    const-wide/16 v0, 0x4b0

    add-long v5, v30, v0

    new-instance v0, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda27;

    invoke-direct {v0, v7}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda27;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;)V

    invoke-direct {v7, v5, v6, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .line 78
    const-string v0, "shoot"

    invoke-virtual {v8, v0}, Lorg/wiiucoop/bo2android/T6TouchLayout;->find(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v0

    .local v0, "shoot":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    const-string v1, "ads"

    invoke-virtual {v8, v1}, Lorg/wiiucoop/bo2android/T6TouchLayout;->find(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v1

    .line 79
    .local v1, "ads":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    if-eqz v0, :cond_b

    if-nez v1, :cond_d

    .line 80
    :cond_b
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    .local v2, "ids":Ljava/lang/StringBuilder;
    iget-object v4, v8, Lorg/wiiucoop/bo2android/T6TouchLayout;->controls:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_7
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_c

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    .local v5, "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    iget-object v6, v5, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->id:Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v9, 0x20

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_7

    .line 82
    .end local v5    # "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    :cond_c
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "C: skipped (profile "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v8, Lorg/wiiucoop/bo2android/T6TouchLayout;->profile:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v7, v4}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->log(Ljava/lang/String;)V

    .line 84
    .end local v2    # "ids":Ljava/lang/StringBuilder;
    :cond_d
    if-eqz v0, :cond_11

    if-eqz v1, :cond_11

    .line 85
    iget v2, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->x:F

    invoke-direct {v7, v2}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->px(F)I

    move-result v2

    .local v2, "fx":I
    iget v4, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->y:F

    invoke-direct {v7, v4}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->py(F)I

    move-result v4

    .local v4, "fy":I
    iget v5, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->x:F

    invoke-direct {v7, v5}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->px(F)I

    move-result v5

    .local v5, "ax":I
    iget v6, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->y:F

    invoke-direct {v7, v6}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->py(F)I

    move-result v6

    .line 86
    .local v6, "ay":I
    add-long v9, v30, v25

    .line 87
    .end local v30    # "t":J
    .local v9, "t":J
    new-instance v11, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda28;

    invoke-direct {v11, v7, v2, v4}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda28;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;II)V

    invoke-direct {v7, v9, v10, v11}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .line 88
    move v11, v13

    .end local v13    # "bx":I
    .local v11, "bx":I
    add-long v12, v9, v19

    move-object/from16 v19, v0

    .end local v0    # "shoot":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .local v19, "shoot":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    new-instance v0, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda29;

    invoke-direct {v0, v7, v15, v3}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda29;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;II)V

    invoke-direct {v7, v12, v13, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .line 89
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_8
    const/16 v12, 0xa

    if-gt v0, v12, :cond_e

    move v13, v0

    .local v13, "k":I
    add-long v25, v9, v21

    move/from16 v30, v13

    .end local v13    # "k":I
    .local v30, "k":I
    int-to-long v12, v0

    mul-long v12, v12, v23

    add-long v12, v25, v12

    move-object/from16 v25, v1

    .end local v1    # "ads":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .local v25, "ads":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    new-instance v1, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda30;

    move/from16 v8, v30

    .end local v30    # "k":I
    .local v8, "k":I
    invoke-direct {v1, v7, v15, v8, v3}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda30;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;III)V

    invoke-direct {v7, v12, v13, v1}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .end local v8    # "k":I
    add-int/lit8 v0, v0, 0x1

    move-object/from16 v8, p1

    move-object/from16 v1, v25

    goto :goto_8

    .end local v25    # "ads":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .restart local v1    # "ads":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    :cond_e
    move-object/from16 v25, v1

    .line 90
    .end local v0    # "i":I
    .end local v1    # "ads":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .restart local v25    # "ads":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    const-wide/16 v0, 0x3e8

    add-long/2addr v0, v9

    new-instance v8, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda1;

    invoke-direct {v8, v7}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda1;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;)V

    invoke-direct {v7, v0, v1, v8}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .line 91
    const-wide/16 v0, 0x514

    add-long/2addr v0, v9

    new-instance v8, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda3;

    invoke-direct {v8, v7, v11, v14}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda3;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;II)V

    invoke-direct {v7, v0, v1, v8}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .line 92
    const-wide/16 v0, 0x5aa

    add-long/2addr v0, v9

    new-instance v8, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda4;

    invoke-direct {v8, v7}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda4;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;)V

    invoke-direct {v7, v0, v1, v8}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .line 93
    const-wide/16 v0, 0x6a4

    add-long/2addr v0, v9

    new-instance v8, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda5;

    invoke-direct {v8, v7, v5, v6}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda5;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;II)V

    invoke-direct {v7, v0, v1, v8}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .line 94
    const-wide/16 v0, 0x8fc

    add-long/2addr v0, v9

    new-instance v8, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda6;

    invoke-direct {v8, v7}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda6;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;)V

    invoke-direct {v7, v0, v1, v8}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .line 95
    const-wide/16 v0, 0x9c4

    add-long/2addr v0, v9

    new-instance v8, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda7;

    move/from16 v12, v27

    move/from16 v13, v32

    .end local v27    # "sx":I
    .end local v32    # "sy":I
    .local v12, "sx":I
    .local v13, "sy":I
    invoke-direct {v8, v7, v12, v13}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda7;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;II)V

    invoke-direct {v7, v0, v1, v8}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .line 96
    const/4 v0, 0x1

    .restart local v0    # "i":I
    :goto_9
    const/16 v1, 0x8

    if-gt v0, v1, :cond_f

    move v8, v0

    .restart local v8    # "k":I
    const-wide/16 v20, 0x9d8

    add-long v20, v9, v20

    move/from16 v22, v2

    .end local v2    # "fx":I
    .local v22, "fx":I
    int-to-long v1, v0

    mul-long v1, v1, v16

    add-long v1, v20, v1

    move/from16 v35, v3

    .end local v3    # "cy":I
    .restart local v35    # "cy":I
    new-instance v3, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda8;

    invoke-direct {v3, v7, v12, v13, v8}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda8;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;III)V

    invoke-direct {v7, v1, v2, v3}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .end local v8    # "k":I
    add-int/lit8 v0, v0, 0x1

    move/from16 v2, v22

    move/from16 v3, v35

    goto :goto_9

    .end local v22    # "fx":I
    .end local v35    # "cy":I
    .restart local v2    # "fx":I
    .restart local v3    # "cy":I
    :cond_f
    move/from16 v22, v2

    move/from16 v35, v3

    .line 97
    .end local v0    # "i":I
    .end local v2    # "fx":I
    .end local v3    # "cy":I
    .restart local v22    # "fx":I
    .restart local v35    # "cy":I
    add-long v0, v9, v28

    new-instance v2, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda9;

    invoke-direct {v2, v7}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda9;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;)V

    invoke-direct {v7, v0, v1, v2}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .line 98
    const-wide/16 v0, 0xce4

    add-long v2, v9, v0

    new-instance v8, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda10;

    invoke-direct {v8, v7}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda10;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;)V

    invoke-direct {v7, v2, v3, v8}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .line 99
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_a
    const/16 v3, 0xc

    if-gt v2, v3, :cond_10

    move v3, v2

    .local v3, "k":I
    add-long v16, v9, v0

    int-to-long v0, v2

    mul-long v0, v0, v23

    add-long v0, v16, v0

    new-instance v8, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda12;

    move/from16 v16, v5

    move/from16 v5, v22

    .end local v22    # "fx":I
    .local v5, "fx":I
    .local v16, "ax":I
    invoke-direct {v8, v7, v5, v3, v4}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda12;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;III)V

    invoke-direct {v7, v0, v1, v8}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .end local v3    # "k":I
    add-int/lit8 v2, v2, 0x1

    move/from16 v5, v16

    const-wide/16 v0, 0xce4

    goto :goto_a

    .end local v16    # "ax":I
    .local v5, "ax":I
    .restart local v22    # "fx":I
    :cond_10
    move/from16 v16, v5

    move/from16 v5, v22

    .line 100
    .end local v2    # "i":I
    .end local v22    # "fx":I
    .local v5, "fx":I
    .restart local v16    # "ax":I
    const-wide/16 v0, 0xf3c

    add-long v2, v9, v0

    new-instance v8, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda13;

    invoke-direct {v8, v7}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda13;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;)V

    invoke-direct {v7, v2, v3, v8}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .line 101
    add-long/2addr v0, v9

    move-wide v5, v0

    .end local v9    # "t":J
    .local v0, "t":J
    goto :goto_b

    .line 84
    .end local v4    # "fy":I
    .end local v5    # "fx":I
    .end local v6    # "ay":I
    .end local v11    # "bx":I
    .end local v12    # "sx":I
    .end local v16    # "ax":I
    .end local v19    # "shoot":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .end local v25    # "ads":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .end local v35    # "cy":I
    .local v0, "shoot":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .restart local v1    # "ads":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .local v3, "cy":I
    .local v13, "bx":I
    .restart local v27    # "sx":I
    .local v30, "t":J
    .restart local v32    # "sy":I
    :cond_11
    move-object/from16 v19, v0

    move-object/from16 v25, v1

    move/from16 v35, v3

    move v11, v13

    move/from16 v12, v27

    move/from16 v13, v32

    .line 103
    .end local v0    # "shoot":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .end local v1    # "ads":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .end local v3    # "cy":I
    .end local v27    # "sx":I
    .end local v32    # "sy":I
    .restart local v11    # "bx":I
    .restart local v12    # "sx":I
    .local v13, "sy":I
    .restart local v19    # "shoot":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .restart local v25    # "ads":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .restart local v35    # "cy":I
    move-wide/from16 v5, v30

    .end local v30    # "t":J
    .local v5, "t":J
    :goto_b
    const-wide/16 v0, 0x5dc

    add-long/2addr v0, v5

    new-instance v2, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda15;

    invoke-direct {v2, v7}, Lorg/wiiucoop/bo2android/T6TouchSelfTest$$ExternalSyntheticLambda15;-><init>(Lorg/wiiucoop/bo2android/T6TouchSelfTest;)V

    invoke-direct {v7, v0, v1, v2}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->at(JLjava/lang/Runnable;)V

    .line 104
    return-void

    .line 51
    .end local v5    # "t":J
    .end local v11    # "bx":I
    .end local v12    # "sx":I
    .end local v13    # "sy":I
    .end local v14    # "by":I
    .end local v15    # "cx":I
    .end local v18    # "stick":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .end local v19    # "shoot":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .end local v25    # "ads":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .end local v34    # "button":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .end local v35    # "cy":I
    .local v9, "stick":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .restart local v10    # "button":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    :cond_12
    move-object/from16 v18, v9

    move-object/from16 v34, v10

    .line 52
    .end local v9    # "stick":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .end local v10    # "button":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .restart local v18    # "stick":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .restart local v34    # "button":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    :goto_c
    const-string v0, "t6android"

    const-string v1, "touch selftest: the layout has no stick or jump button; not run"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    return-void
.end method

.method private up(I)V
    .locals 3
    .param p1, "id"    # I

    .line 131
    invoke-direct {p0, p1}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->indexOf(I)I

    move-result v0

    .line 132
    .local v0, "i":I
    if-gez v0, :cond_0

    return-void

    .line 133
    :cond_0
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->active:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    goto :goto_0

    .line 134
    :cond_1
    shl-int/lit8 v1, v0, 0x8

    or-int/lit8 v2, v1, 0x6

    :goto_0
    move v1, v2

    .line 135
    .local v1, "action":I
    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->dispatch(I)V

    .line 136
    iget-object v2, p0, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->active:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 137
    return-void
.end method


# virtual methods
.method synthetic lambda$schedule$0$org-wiiucoop-bo2android-T6TouchSelfTest(II)V
    .locals 1
    .param p1, "sx"    # I
    .param p2, "sy"    # I

    .line 59
    const-string v0, "A: stick down"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->log(Ljava/lang/String;)V

    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->down(III)V

    return-void
.end method

.method synthetic lambda$schedule$1$org-wiiucoop-bo2android-T6TouchSelfTest(III)V
    .locals 2
    .param p1, "sx"    # I
    .param p2, "sy"    # I
    .param p3, "k"    # I

    .line 60
    mul-int/lit8 v0, p3, 0xc

    sub-int v0, p2, v0

    const/4 v1, 0x0

    invoke-direct {p0, v1, p1, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->move(III)V

    return-void
.end method

.method synthetic lambda$schedule$10$org-wiiucoop-bo2android-T6TouchSelfTest(III)V
    .locals 2
    .param p1, "cx"    # I
    .param p2, "k"    # I
    .param p3, "cy"    # I

    .line 71
    mul-int/lit8 v0, p2, 0x14

    sub-int v0, p1, v0

    const/4 v1, 0x3

    invoke-direct {p0, v1, v0, p3}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->move(III)V

    return-void
.end method

.method synthetic lambda$schedule$11$org-wiiucoop-bo2android-T6TouchSelfTest(II)V
    .locals 1
    .param p1, "sx"    # I
    .param p2, "sy"    # I

    .line 72
    const-string v0, "B: stick down while looking"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->log(Ljava/lang/String;)V

    const/4 v0, 0x4

    invoke-direct {p0, v0, p1, p2}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->down(III)V

    return-void
.end method

.method synthetic lambda$schedule$12$org-wiiucoop-bo2android-T6TouchSelfTest(IIIII)V
    .locals 2
    .param p1, "sx"    # I
    .param p2, "k"    # I
    .param p3, "sy"    # I
    .param p4, "cx"    # I
    .param p5, "cy"    # I

    .line 73
    mul-int/lit8 v0, p2, 0xc

    add-int/2addr v0, p1

    const/4 v1, 0x4

    invoke-direct {p0, v1, v0, p3}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->move(III)V

    add-int/lit16 v0, p4, -0xa0

    mul-int/lit8 v1, p2, 0xf

    sub-int/2addr v0, v1

    const/4 v1, 0x3

    invoke-direct {p0, v1, v0, p5}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->move(III)V

    return-void
.end method

.method synthetic lambda$schedule$13$org-wiiucoop-bo2android-T6TouchSelfTest()V
    .locals 1

    .line 74
    const-string v0, "B: stick lifts before the camera"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->log(Ljava/lang/String;)V

    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->up(I)V

    return-void
.end method

.method synthetic lambda$schedule$14$org-wiiucoop-bo2android-T6TouchSelfTest(III)V
    .locals 2
    .param p1, "cx"    # I
    .param p2, "k"    # I
    .param p3, "cy"    # I

    .line 75
    add-int/lit16 v0, p1, -0x118

    mul-int/lit8 v1, p2, 0xf

    sub-int/2addr v0, v1

    const/4 v1, 0x3

    invoke-direct {p0, v1, v0, p3}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->move(III)V

    return-void
.end method

.method synthetic lambda$schedule$15$org-wiiucoop-bo2android-T6TouchSelfTest()V
    .locals 1

    .line 76
    const-string v0, "B: camera lifts"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->log(Ljava/lang/String;)V

    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->up(I)V

    return-void
.end method

.method synthetic lambda$schedule$16$org-wiiucoop-bo2android-T6TouchSelfTest(II)V
    .locals 1
    .param p1, "fx"    # I
    .param p2, "fy"    # I

    .line 87
    const-string v0, "C: fire held"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->log(Ljava/lang/String;)V

    const/4 v0, 0x5

    invoke-direct {p0, v0, p1, p2}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->down(III)V

    return-void
.end method

.method synthetic lambda$schedule$17$org-wiiucoop-bo2android-T6TouchSelfTest(II)V
    .locals 1
    .param p1, "cx"    # I
    .param p2, "cy"    # I

    .line 88
    const-string v0, "C: camera drag while firing"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->log(Ljava/lang/String;)V

    const/4 v0, 0x6

    invoke-direct {p0, v0, p1, p2}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->down(III)V

    return-void
.end method

.method synthetic lambda$schedule$18$org-wiiucoop-bo2android-T6TouchSelfTest(III)V
    .locals 2
    .param p1, "cx"    # I
    .param p2, "k"    # I
    .param p3, "cy"    # I

    .line 89
    mul-int/lit8 v0, p2, 0xf

    add-int/2addr v0, p1

    const/4 v1, 0x6

    invoke-direct {p0, v1, v0, p3}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->move(III)V

    return-void
.end method

.method synthetic lambda$schedule$19$org-wiiucoop-bo2android-T6TouchSelfTest()V
    .locals 1

    .line 90
    const-string v0, "C: camera lifts, fire still held"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->log(Ljava/lang/String;)V

    const/4 v0, 0x6

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->up(I)V

    return-void
.end method

.method synthetic lambda$schedule$2$org-wiiucoop-bo2android-T6TouchSelfTest(II)V
    .locals 1
    .param p1, "cx"    # I
    .param p2, "cy"    # I

    .line 61
    const-string v0, "A: camera finger down while walking"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->log(Ljava/lang/String;)V

    const/4 v0, 0x1

    invoke-direct {p0, v0, p1, p2}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->down(III)V

    return-void
.end method

.method synthetic lambda$schedule$20$org-wiiucoop-bo2android-T6TouchSelfTest(II)V
    .locals 1
    .param p1, "bx"    # I
    .param p2, "by"    # I

    .line 91
    const-string v0, "C: jump tap while firing"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->log(Ljava/lang/String;)V

    const/4 v0, 0x7

    invoke-direct {p0, v0, p1, p2}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->down(III)V

    return-void
.end method

.method synthetic lambda$schedule$21$org-wiiucoop-bo2android-T6TouchSelfTest()V
    .locals 1

    .line 92
    const-string v0, "C: jump lifts"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->log(Ljava/lang/String;)V

    const/4 v0, 0x7

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->up(I)V

    return-void
.end method

.method synthetic lambda$schedule$22$org-wiiucoop-bo2android-T6TouchSelfTest(II)V
    .locals 1
    .param p1, "ax"    # I
    .param p2, "ay"    # I

    .line 93
    const-string v0, "C: ads held while firing"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->log(Ljava/lang/String;)V

    const/16 v0, 0x8

    invoke-direct {p0, v0, p1, p2}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->down(III)V

    return-void
.end method

.method synthetic lambda$schedule$23$org-wiiucoop-bo2android-T6TouchSelfTest()V
    .locals 1

    .line 94
    const-string v0, "C: ads lifts"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->log(Ljava/lang/String;)V

    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->up(I)V

    return-void
.end method

.method synthetic lambda$schedule$24$org-wiiucoop-bo2android-T6TouchSelfTest(II)V
    .locals 1
    .param p1, "sx"    # I
    .param p2, "sy"    # I

    .line 95
    const-string v0, "C: walk while firing"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->log(Ljava/lang/String;)V

    const/16 v0, 0x9

    invoke-direct {p0, v0, p1, p2}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->down(III)V

    return-void
.end method

.method synthetic lambda$schedule$25$org-wiiucoop-bo2android-T6TouchSelfTest(III)V
    .locals 2
    .param p1, "sx"    # I
    .param p2, "sy"    # I
    .param p3, "k"    # I

    .line 96
    mul-int/lit8 v0, p3, 0xc

    sub-int v0, p2, v0

    const/16 v1, 0x9

    invoke-direct {p0, v1, p1, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->move(III)V

    return-void
.end method

.method synthetic lambda$schedule$26$org-wiiucoop-bo2android-T6TouchSelfTest()V
    .locals 1

    .line 97
    const-string v0, "C: stick lifts, fire still held"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->log(Ljava/lang/String;)V

    const/16 v0, 0x9

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->up(I)V

    return-void
.end method

.method synthetic lambda$schedule$27$org-wiiucoop-bo2android-T6TouchSelfTest()V
    .locals 1

    .line 98
    const-string v0, "C: fire finger drags (aims while firing)"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->log(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$schedule$28$org-wiiucoop-bo2android-T6TouchSelfTest(III)V
    .locals 2
    .param p1, "fx"    # I
    .param p2, "k"    # I
    .param p3, "fy"    # I

    .line 99
    mul-int/lit8 v0, p2, 0x12

    sub-int v0, p1, v0

    const/4 v1, 0x5

    invoke-direct {p0, v1, v0, p3}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->move(III)V

    return-void
.end method

.method synthetic lambda$schedule$29$org-wiiucoop-bo2android-T6TouchSelfTest()V
    .locals 1

    .line 100
    const-string v0, "C: fire lifts"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->log(Ljava/lang/String;)V

    const/4 v0, 0x5

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->up(I)V

    return-void
.end method

.method synthetic lambda$schedule$3$org-wiiucoop-bo2android-T6TouchSelfTest(III)V
    .locals 2
    .param p1, "cx"    # I
    .param p2, "k"    # I
    .param p3, "cy"    # I

    .line 62
    mul-int/lit8 v0, p2, 0x14

    add-int/2addr v0, p1

    const/4 v1, 0x1

    invoke-direct {p0, v1, v0, p3}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->move(III)V

    return-void
.end method

.method synthetic lambda$schedule$30$org-wiiucoop-bo2android-T6TouchSelfTest()V
    .locals 1

    .line 103
    const-string v0, "done"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->log(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$schedule$4$org-wiiucoop-bo2android-T6TouchSelfTest(II)V
    .locals 1
    .param p1, "bx"    # I
    .param p2, "by"    # I

    .line 63
    const-string v0, "A: button held while walking and looking"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->log(Ljava/lang/String;)V

    const/4 v0, 0x2

    invoke-direct {p0, v0, p1, p2}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->down(III)V

    return-void
.end method

.method synthetic lambda$schedule$5$org-wiiucoop-bo2android-T6TouchSelfTest(III)V
    .locals 3
    .param p1, "cx"    # I
    .param p2, "cy"    # I
    .param p3, "k"    # I

    .line 64
    add-int/lit16 v0, p1, 0x12c

    mul-int/lit8 v1, p3, 0xc

    add-int/2addr v1, p2

    const/4 v2, 0x1

    invoke-direct {p0, v2, v0, v1}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->move(III)V

    return-void
.end method

.method synthetic lambda$schedule$6$org-wiiucoop-bo2android-T6TouchSelfTest()V
    .locals 1

    .line 65
    const-string v0, "A: camera lifts first"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->log(Ljava/lang/String;)V

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->up(I)V

    return-void
.end method

.method synthetic lambda$schedule$7$org-wiiucoop-bo2android-T6TouchSelfTest()V
    .locals 1

    .line 66
    const-string v0, "A: button lifts"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->log(Ljava/lang/String;)V

    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->up(I)V

    return-void
.end method

.method synthetic lambda$schedule$8$org-wiiucoop-bo2android-T6TouchSelfTest()V
    .locals 1

    .line 67
    const-string v0, "A: stick lifts"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->log(Ljava/lang/String;)V

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->up(I)V

    return-void
.end method

.method synthetic lambda$schedule$9$org-wiiucoop-bo2android-T6TouchSelfTest(II)V
    .locals 1
    .param p1, "cx"    # I
    .param p2, "cy"    # I

    .line 70
    const-string v0, "B: camera finger down first"

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->log(Ljava/lang/String;)V

    const/4 v0, 0x3

    invoke-direct {p0, v0, p1, p2}, Lorg/wiiucoop/bo2android/T6TouchSelfTest;->down(III)V

    return-void
.end method
