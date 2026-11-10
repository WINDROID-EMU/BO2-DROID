.class public final Lorg/wiiucoop/bo2android/T6TouchOverlay;
.super Landroid/view/View;
.source "T6TouchOverlay.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/wiiucoop/bo2android/T6TouchOverlay$CommandListener;,
        Lorg/wiiucoop/bo2android/T6TouchOverlay$PadSink;,
        Lorg/wiiucoop/bo2android/T6TouchOverlay$ConsoleListener;,
        Lorg/wiiucoop/bo2android/T6TouchOverlay$SelectionListener;,
        Lorg/wiiucoop/bo2android/T6TouchOverlay$CameraSink;,
        Lorg/wiiucoop/bo2android/T6TouchOverlay$KeyListener;,
        Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    }
.end annotation


# static fields
.field public static final CAMERA_CANCEL:I = 0x3

.field public static final CAMERA_DOWN:I = 0x0

.field public static final CAMERA_MOVE:I = 0x1

.field public static final CAMERA_UP:I = 0x2

.field public static final VK_TAB:I = 0x9


# instance fields
.field private adsFire:Z

.field private final adsFireState:Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;

.field private aimDrag:Z

.field private cameraOwner:I

.field private cameraSink:Lorg/wiiucoop/bo2android/T6TouchOverlay$CameraSink;

.field private commandListener:Lorg/wiiucoop/bo2android/T6TouchOverlay$CommandListener;

.field private consoleListener:Lorg/wiiucoop/bo2android/T6TouchOverlay$ConsoleListener;

.field private editMode:Z

.field private final fingers:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;",
            ">;"
        }
    .end annotation
.end field

.field private keyListener:Lorg/wiiucoop/bo2android/T6TouchOverlay$KeyListener;

.field private lastActive:Z

.field private lastButtons:I

.field private lastLt:I

.field private lastLx:I

.field private lastLy:I

.field private lastRt:I

.field private lastRx:I

.field private lastRy:I

.field private layout:Lorg/wiiucoop/bo2android/T6TouchLayout;

.field private padActive:Z

.field private final paint:Landroid/graphics/Paint;

.field private final rect:Landroid/graphics/RectF;

.field private selected:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

.field private selectionListener:Lorg/wiiucoop/bo2android/T6TouchOverlay$SelectionListener;

.field private sink:Lorg/wiiucoop/bo2android/T6TouchOverlay$PadSink;

.field private sprintThreshold:F

.field private sprinting:Z

.field private final sprites:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private stickSprint:Z

.field private final stroke:Landroid/graphics/Paint;

.field private final text:Landroid/graphics/Paint;

.field private final touchSlop:F


# direct methods
.method public static synthetic $r8$lambda$3mdbtEr-gS6EI7eCmbwQYDM_UMs(Lorg/wiiucoop/bo2android/T6TouchOverlay;)V
    .locals 0

    invoke-direct {p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->publish()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .line 119
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 84
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->aimDrag:Z

    .line 86
    const v1, 0x3f59999a    # 0.85f

    iput v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->sprintThreshold:F

    .line 90
    new-instance v1, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;

    invoke-direct {v1}, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;-><init>()V

    iput-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->adsFireState:Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;

    .line 92
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->sprites:Ljava/util/Map;

    .line 93
    new-instance v1, Landroid/graphics/Paint;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->paint:Landroid/graphics/Paint;

    .line 94
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->stroke:Landroid/graphics/Paint;

    .line 95
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->text:Landroid/graphics/Paint;

    .line 96
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->rect:Landroid/graphics/RectF;

    .line 109
    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    iput-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    .line 114
    const/4 v1, -0x1

    iput v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraOwner:I

    .line 120
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    int-to-float v1, v1

    iput v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->touchSlop:F

    .line 121
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->stroke:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 122
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->text:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 123
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->text:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 124
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->text:Landroid/graphics/Paint;

    const v1, -0x150805

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 125
    return-void
.end method

.method private aimHeldBy(I)Z
    .locals 4
    .param p1, "exceptId"    # I

    .line 198
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 199
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v1

    if-ne v1, p1, :cond_0

    goto :goto_1

    .line 200
    :cond_0
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->control:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    .line 201
    .local v1, "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    if-eqz v1, :cond_2

    iget-object v2, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->kind:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    sget-object v3, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;->BUTTON:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    if-ne v2, v3, :cond_2

    iget v2, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->binding:I

    const/high16 v3, 0x10000

    and-int/2addr v2, v3

    if-nez v2, :cond_1

    .line 202
    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->isAdsFire(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_1
    const/4 v2, 0x1

    return v2

    .line 198
    .end local v1    # "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    :cond_2
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 204
    .end local v0    # "i":I
    :cond_3
    const/4 v0, 0x0

    return v0
.end method

.method private cx(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)F
    .locals 2
    .param p1, "c"    # Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    .line 249
    iget v0, p1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->x:F

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getWidth()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v0, v1

    return v0
.end method

.method private cy(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)F
    .locals 2
    .param p1, "c"    # Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    .line 250
    iget v0, p1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->y:F

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getHeight()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v0, v1

    return v0
.end method

.method private static describe(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    .line 244
    if-nez p0, :cond_0

    const-string v0, "camera"

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->kind:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    sget-object v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;->STICK_LEFT:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    if-ne v0, v1, :cond_1

    const-string v0, "stick"

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "button "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method private fingerOn(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    .locals 2
    .param p1, "c"    # Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    .line 491
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->control:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    if-ne v1, p1, :cond_0

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;

    return-object v1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 492
    .end local v0    # "i":I
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private hitTest(FFZ)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .locals 9
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "includeDisabled"    # Z

    .line 263
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->layout:Lorg/wiiucoop/bo2android/T6TouchLayout;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 264
    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    sget-object v2, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;->BUTTON:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    const/4 v3, 0x0

    aput-object v2, v0, v3

    sget-object v2, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;->STICK_LEFT:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    const/4 v4, 0x1

    aput-object v2, v0, v4

    .line 265
    .local v0, "order":[Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;
    array-length v2, v0

    :goto_0
    if-ge v3, v2, :cond_5

    aget-object v5, v0, v3

    .line 266
    .local v5, "kind":Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;
    iget-object v6, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->layout:Lorg/wiiucoop/bo2android/T6TouchLayout;

    iget-object v6, v6, Lorg/wiiucoop/bo2android/T6TouchLayout;->controls:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    sub-int/2addr v6, v4

    .local v6, "i":I
    :goto_1
    if-ltz v6, :cond_4

    .line 267
    iget-object v7, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->layout:Lorg/wiiucoop/bo2android/T6TouchLayout;

    iget-object v7, v7, Lorg/wiiucoop/bo2android/T6TouchLayout;->controls:Ljava/util/List;

    invoke-interface {v7, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    .line 268
    .local v7, "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    iget-object v8, v7, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->kind:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    if-ne v8, v5, :cond_3

    iget-boolean v8, v7, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->enabled:Z

    if-nez v8, :cond_1

    if-nez p3, :cond_1

    goto :goto_3

    .line 269
    :cond_1
    sget-object v8, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;->BUTTON:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    if-ne v5, v8, :cond_2

    const/high16 v8, 0x3f800000    # 1.0f

    goto :goto_2

    :cond_2
    const v8, 0x3f933333    # 1.15f

    :goto_2
    invoke-direct {p0, v7, p1, p2, v8}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->hits(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;FFF)Z

    move-result v8

    if-eqz v8, :cond_3

    return-object v7

    .line 266
    .end local v7    # "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    :cond_3
    :goto_3
    add-int/lit8 v6, v6, -0x1

    goto :goto_1

    .line 265
    .end local v5    # "kind":Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;
    .end local v6    # "i":I
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 272
    :cond_5
    return-object v1
.end method

.method private hits(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;FFF)Z
    .locals 5
    .param p1, "c"    # Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "slack"    # F

    .line 254
    invoke-direct {p0, p1}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cx(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)F

    move-result v0

    sub-float v0, p2, v0

    .local v0, "dx":F
    invoke-direct {p0, p1}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cy(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)F

    move-result v1

    sub-float v1, p3, v1

    .local v1, "dy":F
    invoke-direct {p0, p1}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->radius(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)F

    move-result v2

    mul-float/2addr v2, p4

    .line 255
    .local v2, "r":F
    mul-float v3, v0, v0

    mul-float v4, v1, v1

    add-float/2addr v3, v4

    mul-float v4, v2, v2

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    return v3
.end method

.method private holdsKey(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)Z
    .locals 2
    .param p1, "c"    # Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    .line 174
    if-eqz p1, :cond_0

    iget-object v0, p1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->kind:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    sget-object v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;->BUTTON:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    if-ne v0, v1, :cond_0

    iget v0, p1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->binding:I

    const/high16 v1, 0x80000

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isAdsFire(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)Z
    .locals 2
    .param p1, "c"    # Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    .line 179
    iget-boolean v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->adsFire:Z

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    const-string v0, "hipfire"

    iget-object v1, p1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private onEditTouch(Landroid/view/MotionEvent;)Z
    .locals 8
    .param p1, "e"    # Landroid/view/MotionEvent;

    .line 384
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    .line 405
    :pswitch_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    goto/16 :goto_0

    .line 395
    :pswitch_1
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;

    .line 396
    .local v0, "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    if-eqz v0, :cond_1

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->selected:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getWidth()I

    move-result v1

    if-lez v1, :cond_1

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getHeight()I

    move-result v1

    if-lez v1, :cond_1

    .line 397
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->selected:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    iget-object v3, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->selected:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    iget v3, v3, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->x:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    iget v5, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->lastX:F

    sub-float/2addr v4, v5

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getWidth()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v4, v5

    add-float/2addr v3, v4

    const/4 v4, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-static {v3, v4, v5}, Lorg/wiiucoop/bo2android/T6TouchLayout;->clamp(FFF)F

    move-result v3

    iput v3, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->x:F

    .line 398
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->selected:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    iget-object v3, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->selected:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    iget v3, v3, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->y:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    iget v7, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->lastY:F

    sub-float/2addr v6, v7

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getHeight()I

    move-result v7

    int-to-float v7, v7

    div-float/2addr v6, v7

    add-float/2addr v3, v6

    invoke-static {v3, v4, v5}, Lorg/wiiucoop/bo2android/T6TouchLayout;->clamp(FFF)F

    move-result v3

    iput v3, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->y:F

    .line 399
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    iput v1, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->lastX:F

    .line 400
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    iput v1, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->lastY:F

    goto :goto_0

    .line 386
    .end local v0    # "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    :pswitch_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-direct {p0, v0, v3, v2}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->hitTest(FFZ)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->selected:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    .line 387
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->selectionListener:Lorg/wiiucoop/bo2android/T6TouchOverlay$SelectionListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->selectionListener:Lorg/wiiucoop/bo2android/T6TouchOverlay$SelectionListener;

    iget-object v3, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->selected:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    invoke-interface {v0, v3}, Lorg/wiiucoop/bo2android/T6TouchOverlay$SelectionListener;->onSelected(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)V

    .line 388
    :cond_0
    new-instance v0, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;

    const/4 v3, 0x0

    invoke-direct {v0, v3}, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;-><init>(Lorg/wiiucoop/bo2android/T6TouchOverlay$1;)V

    .line 389
    .restart local v0    # "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    iput v3, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->lastX:F

    .line 390
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    iput v3, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->lastY:F

    .line 391
    iget-object v3, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v3, v1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 392
    nop

    .line 408
    .end local v0    # "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->invalidate()V

    .line 409
    return v2

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private onPlayTouch(Landroid/view/MotionEvent;)Z
    .locals 17
    .param p1, "e"    # Landroid/view/MotionEvent;

    .line 284
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-boolean v2, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->padActive:Z

    const/4 v3, 0x0

    if-nez v2, :cond_0

    return v3

    .line 285
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    .line 286
    .local v2, "action":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v4

    .line 287
    .local v4, "index":I
    const/16 v5, 0x9

    const/4 v6, -0x1

    const-string v7, "touch: pointer "

    const-string v8, "t6android"

    const/4 v9, 0x1

    packed-switch v2, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_2

    .line 373
    :pswitch_1
    invoke-virtual/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->releaseAll()V

    .line 374
    return v9

    .line 330
    :pswitch_2
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v6

    if-ge v5, v6, :cond_7

    .line 331
    invoke-virtual {v1, v5}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    .line 332
    .local v6, "id":I
    iget-object v7, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v7, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;

    .line 333
    .local v7, "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    if-nez v7, :cond_1

    goto/16 :goto_1

    .line 334
    :cond_1
    invoke-virtual {v1, v5}, Landroid/view/MotionEvent;->getX(I)F

    move-result v8

    iput v8, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->x:F

    .line 335
    invoke-virtual {v1, v5}, Landroid/view/MotionEvent;->getY(I)F

    move-result v8

    iput v8, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->y:F

    .line 336
    iget-boolean v8, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->moved:Z

    if-nez v8, :cond_2

    iget v8, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->x:F

    iget v10, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->downX:F

    sub-float/2addr v8, v10

    float-to-double v10, v8

    iget v8, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->y:F

    iget v12, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->downY:F

    sub-float/2addr v8, v12

    float-to-double v12, v8

    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v10

    iget v8, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->touchSlop:F

    float-to-double v12, v8

    cmpl-double v8, v10, v12

    if-lez v8, :cond_2

    iput-boolean v9, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->moved:Z

    .line 340
    :cond_2
    iget-boolean v8, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->moved:Z

    if-eqz v8, :cond_3

    iget-boolean v8, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->aiming:Z

    if-nez v8, :cond_3

    iget v8, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraOwner:I

    if-gez v8, :cond_3

    iget-object v8, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->control:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    invoke-direct {v0, v8}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->turnsCamera(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)Z

    move-result v8

    if-eqz v8, :cond_3

    iget-object v8, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraSink:Lorg/wiiucoop/bo2android/T6TouchOverlay$CameraSink;

    if-eqz v8, :cond_3

    .line 341
    invoke-virtual/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getWidth()I

    move-result v8

    if-lez v8, :cond_3

    .line 342
    iput-boolean v9, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->aiming:Z

    .line 343
    iput v6, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraOwner:I

    .line 344
    iget-object v8, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraSink:Lorg/wiiucoop/bo2android/T6TouchOverlay$CameraSink;

    iget v10, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->lastX:F

    invoke-virtual/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getWidth()I

    move-result v11

    int-to-float v11, v11

    div-float/2addr v10, v11

    iget v11, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->lastY:F

    invoke-virtual/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getHeight()I

    move-result v12

    int-to-float v12, v12

    div-float/2addr v11, v12

    invoke-interface {v8, v3, v6, v10, v11}, Lorg/wiiucoop/bo2android/T6TouchOverlay$CameraSink;->onCamera(IIFF)V

    .line 346
    :cond_3
    iget-object v8, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->control:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    if-eqz v8, :cond_4

    iget-boolean v8, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->aiming:Z

    if-eqz v8, :cond_6

    :cond_4
    iget-object v8, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraSink:Lorg/wiiucoop/bo2android/T6TouchOverlay$CameraSink;

    if-eqz v8, :cond_6

    iget v8, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->x:F

    iget v10, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->lastX:F

    cmpl-float v8, v8, v10

    if-nez v8, :cond_5

    iget v8, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->y:F

    iget v10, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->lastY:F

    cmpl-float v8, v8, v10

    if-eqz v8, :cond_6

    :cond_5
    invoke-virtual/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getWidth()I

    move-result v8

    if-lez v8, :cond_6

    .line 347
    iget-object v8, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraSink:Lorg/wiiucoop/bo2android/T6TouchOverlay$CameraSink;

    iget v10, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->x:F

    invoke-virtual/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getWidth()I

    move-result v11

    int-to-float v11, v11

    div-float/2addr v10, v11

    iget v11, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->y:F

    invoke-virtual/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getHeight()I

    move-result v12

    int-to-float v12, v12

    div-float/2addr v11, v12

    invoke-interface {v8, v9, v6, v10, v11}, Lorg/wiiucoop/bo2android/T6TouchOverlay$CameraSink;->onCamera(IIFF)V

    .line 348
    :cond_6
    iget v8, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->x:F

    iput v8, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->lastX:F

    .line 349
    iget v8, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->y:F

    iput v8, v7, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->lastY:F

    .line 330
    .end local v6    # "id":I
    .end local v7    # "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    .line 351
    .end local v5    # "i":I
    :cond_7
    goto/16 :goto_2

    .line 354
    :pswitch_3
    invoke-virtual {v1, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v10

    .line 355
    .local v10, "id":I
    iget-object v11, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v11, v10}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;

    .line 356
    .local v11, "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    if-eqz v11, :cond_b

    .line 357
    iget-object v12, v11, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->control:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    if-eqz v12, :cond_8

    iget-boolean v12, v11, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->aiming:Z

    if-eqz v12, :cond_9

    :cond_8
    iget-object v12, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraSink:Lorg/wiiucoop/bo2android/T6TouchOverlay$CameraSink;

    if-eqz v12, :cond_9

    invoke-virtual/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getWidth()I

    move-result v12

    if-lez v12, :cond_9

    .line 358
    iget-object v12, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraSink:Lorg/wiiucoop/bo2android/T6TouchOverlay$CameraSink;

    invoke-virtual {v1, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v13

    invoke-virtual/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getWidth()I

    move-result v14

    int-to-float v14, v14

    div-float/2addr v13, v14

    invoke-virtual {v1, v4}, Landroid/view/MotionEvent;->getY(I)F

    move-result v14

    invoke-virtual/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getHeight()I

    move-result v15

    int-to-float v15, v15

    div-float/2addr v14, v15

    const/4 v15, 0x2

    invoke-interface {v12, v15, v10, v13, v14}, Lorg/wiiucoop/bo2android/T6TouchOverlay$CameraSink;->onCamera(IIFF)V

    .line 359
    :cond_9
    iget-object v12, v11, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->control:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    invoke-direct {v0, v12}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->holdsKey(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)Z

    move-result v12

    if-eqz v12, :cond_a

    iget-object v12, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->keyListener:Lorg/wiiucoop/bo2android/T6TouchOverlay$KeyListener;

    if-eqz v12, :cond_a

    iget-object v12, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->keyListener:Lorg/wiiucoop/bo2android/T6TouchOverlay$KeyListener;

    invoke-interface {v12, v5, v3}, Lorg/wiiucoop/bo2android/T6TouchOverlay$KeyListener;->onKey(IZ)V

    .line 360
    :cond_a
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " up ("

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, v11, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->control:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    invoke-static {v5}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->describe(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ")"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v8, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 361
    iget-object v3, v11, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->control:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    invoke-direct {v0, v3}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->isAdsFire(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)Z

    move-result v3

    if-eqz v3, :cond_b

    iget-object v3, v11, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->control:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    invoke-direct {v0, v3, v10}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->otherFingerOn(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;I)Z

    move-result v3

    if-nez v3, :cond_b

    .line 363
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v7

    .line 364
    .local v7, "now":J
    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->adsFireState:Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;

    invoke-virtual {v3, v7, v8}, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->up(J)V

    .line 365
    invoke-direct {v0, v7, v8}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->scheduleAdsFire(J)V

    .line 368
    .end local v7    # "now":J
    :cond_b
    iget v3, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraOwner:I

    if-ne v10, v3, :cond_c

    iput v6, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraOwner:I

    .line 369
    :cond_c
    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v3, v10}, Landroid/util/SparseArray;->remove(I)V

    .line 370
    goto/16 :goto_2

    .line 290
    .end local v10    # "id":I
    .end local v11    # "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    :pswitch_4
    invoke-virtual {v1, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v10

    .local v10, "x":F
    invoke-virtual {v1, v4}, Landroid/view/MotionEvent;->getY(I)F

    move-result v11

    .line 291
    .local v11, "y":F
    invoke-virtual {v1, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v12

    .line 292
    .local v12, "id":I
    invoke-direct {v0, v10, v11, v3}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->hitTest(FFZ)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v13

    .line 293
    .local v13, "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    new-instance v14, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;

    const/4 v15, 0x0

    invoke-direct {v14, v15}, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;-><init>(Lorg/wiiucoop/bo2android/T6TouchOverlay$1;)V

    .line 294
    .local v14, "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    iput-object v13, v14, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->control:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    .line 295
    iput v10, v14, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->x:F

    iput v10, v14, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->lastX:F

    iput v10, v14, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->downX:F

    .line 296
    iput v11, v14, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->y:F

    iput v11, v14, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->lastY:F

    iput v11, v14, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->downY:F

    .line 297
    move/from16 v16, v10

    .end local v10    # "x":F
    .local v16, "x":F
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v9

    iput-wide v9, v14, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->downTime:J

    .line 298
    iget-object v9, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v9, v12, v14}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 299
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " down -> "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {v13}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->describe(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " ("

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v10}, Landroid/util/SparseArray;->size()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " active)"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 300
    if-nez v13, :cond_11

    .line 301
    iget v5, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraOwner:I

    if-ltz v5, :cond_d

    iget-object v5, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    iget v9, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraOwner:I

    invoke-virtual {v5, v9}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    move-object v15, v5

    check-cast v15, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;

    :cond_d
    move-object v5, v15

    .line 302
    .local v5, "owner":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    if-eqz v5, :cond_e

    iget-boolean v9, v5, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->aiming:Z

    if-eqz v9, :cond_e

    iget-object v9, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraSink:Lorg/wiiucoop/bo2android/T6TouchOverlay$CameraSink;

    if-eqz v9, :cond_e

    .line 304
    iget-object v9, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraSink:Lorg/wiiucoop/bo2android/T6TouchOverlay$CameraSink;

    const/4 v10, 0x3

    iget v15, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraOwner:I

    const/4 v6, 0x0

    invoke-interface {v9, v10, v15, v6, v6}, Lorg/wiiucoop/bo2android/T6TouchOverlay$CameraSink;->onCamera(IIFF)V

    .line 305
    iput-boolean v3, v5, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->aiming:Z

    .line 306
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " takes the camera from aiming pointer "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraOwner:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v8, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 307
    const/4 v6, -0x1

    iput v6, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraOwner:I

    .line 309
    :cond_e
    iget v6, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraOwner:I

    if-gez v6, :cond_f

    iput v12, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraOwner:I

    .line 310
    :cond_f
    iget-object v6, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraSink:Lorg/wiiucoop/bo2android/T6TouchOverlay$CameraSink;

    if-eqz v6, :cond_10

    invoke-virtual/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getWidth()I

    move-result v6

    if-lez v6, :cond_10

    invoke-virtual/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getHeight()I

    move-result v6

    if-lez v6, :cond_10

    .line 311
    iget-object v6, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraSink:Lorg/wiiucoop/bo2android/T6TouchOverlay$CameraSink;

    invoke-virtual/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getWidth()I

    move-result v7

    int-to-float v7, v7

    div-float v10, v16, v7

    invoke-virtual/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getHeight()I

    move-result v7

    int-to-float v7, v7

    div-float v7, v11, v7

    invoke-interface {v6, v3, v12, v10, v7}, Lorg/wiiucoop/bo2android/T6TouchOverlay$CameraSink;->onCamera(IIFF)V

    .line 312
    .end local v5    # "owner":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    :cond_10
    goto/16 :goto_2

    :cond_11
    iget v3, v13, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->binding:I

    const/high16 v6, 0x40000

    and-int/2addr v3, v6

    if-eqz v3, :cond_12

    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->consoleListener:Lorg/wiiucoop/bo2android/T6TouchOverlay$ConsoleListener;

    if-eqz v3, :cond_12

    .line 313
    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->consoleListener:Lorg/wiiucoop/bo2android/T6TouchOverlay$ConsoleListener;

    invoke-interface {v3}, Lorg/wiiucoop/bo2android/T6TouchOverlay$ConsoleListener;->onConsole()V

    goto/16 :goto_2

    .line 314
    :cond_12
    iget v3, v13, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->binding:I

    const/high16 v6, 0x100000

    and-int/2addr v3, v6

    if-eqz v3, :cond_13

    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->commandListener:Lorg/wiiucoop/bo2android/T6TouchOverlay$CommandListener;

    if-eqz v3, :cond_13

    .line 315
    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->commandListener:Lorg/wiiucoop/bo2android/T6TouchOverlay$CommandListener;

    const-string v5, "t6r_placeitem"

    invoke-interface {v3, v5}, Lorg/wiiucoop/bo2android/T6TouchOverlay$CommandListener;->onCommand(Ljava/lang/String;)V

    goto :goto_2

    .line 316
    :cond_13
    iget v3, v13, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->binding:I

    const/high16 v6, 0x200000

    and-int/2addr v3, v6

    if-eqz v3, :cond_14

    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->commandListener:Lorg/wiiucoop/bo2android/T6TouchOverlay$CommandListener;

    if-eqz v3, :cond_14

    .line 317
    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->commandListener:Lorg/wiiucoop/bo2android/T6TouchOverlay$CommandListener;

    const-string v5, "toggleprone"

    invoke-interface {v3, v5}, Lorg/wiiucoop/bo2android/T6TouchOverlay$CommandListener;->onCommand(Ljava/lang/String;)V

    goto :goto_2

    .line 318
    :cond_14
    invoke-direct {v0, v13}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->holdsKey(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)Z

    move-result v3

    if-eqz v3, :cond_15

    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->keyListener:Lorg/wiiucoop/bo2android/T6TouchOverlay$KeyListener;

    if-eqz v3, :cond_15

    .line 319
    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->keyListener:Lorg/wiiucoop/bo2android/T6TouchOverlay$KeyListener;

    const/4 v6, 0x1

    invoke-interface {v3, v5, v6}, Lorg/wiiucoop/bo2android/T6TouchOverlay$KeyListener;->onKey(IZ)V

    goto :goto_2

    .line 320
    :cond_15
    invoke-direct {v0, v13}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->isAdsFire(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)Z

    move-result v3

    if-eqz v3, :cond_16

    .line 321
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    .line 322
    .local v5, "now":J
    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->adsFireState:Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;

    invoke-direct {v0, v12}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->aimHeldBy(I)Z

    move-result v7

    invoke-virtual {v3, v5, v6, v7}, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->down(JZ)V

    .line 323
    invoke-direct {v0, v5, v6}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->scheduleAdsFire(J)V

    .line 324
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "touch: aim and fire down, triggers "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v7, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->adsFireState:Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;

    invoke-virtual {v7, v5, v6}, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->triggers(J)I

    move-result v7

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ", next change in "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v7, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->adsFireState:Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;

    .line 325
    invoke-virtual {v7, v5, v6}, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->nextChange(J)J

    move-result-wide v9

    sub-long/2addr v9, v5

    invoke-virtual {v3, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, " ms"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 324
    invoke-static {v8, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 326
    .end local v5    # "now":J
    nop

    .line 378
    .end local v11    # "y":F
    .end local v12    # "id":I
    .end local v13    # "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .end local v14    # "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    .end local v16    # "x":F
    :cond_16
    :goto_2
    invoke-direct/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->publish()V

    .line 379
    invoke-virtual/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->invalidate()V

    .line 380
    const/4 v3, 0x1

    return v3

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method private otherFingerOn(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;I)Z
    .locals 2
    .param p1, "c"    # Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .param p2, "exceptId"    # I

    .line 191
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 192
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v1

    if-eq v1, p2, :cond_0

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->control:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    if-ne v1, p1, :cond_0

    const/4 v1, 0x1

    return v1

    .line 191
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 194
    .end local v0    # "i":I
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private pressed(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)Z
    .locals 2
    .param p1, "c"    # Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    .line 486
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->control:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    if-ne v1, p1, :cond_0

    const/4 v1, 0x1

    return v1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 487
    .end local v0    # "i":I
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private publish()V
    .locals 24

    .line 415
    move-object/from16 v0, p0

    const/4 v1, 0x0

    .local v1, "buttons":I
    const/4 v2, 0x0

    .local v2, "lt":I
    const/4 v3, 0x0

    .local v3, "rt":I
    const/4 v4, 0x0

    .local v4, "lx":I
    const/4 v5, 0x0

    .local v5, "ly":I
    const/4 v15, 0x0

    .local v15, "rx":I
    const/4 v14, 0x0

    .line 416
    .local v14, "ry":I
    const/4 v6, 0x0

    .line 417
    .local v6, "stickHeld":Z
    iget-boolean v7, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->padActive:Z

    if-eqz v7, :cond_c

    iget-boolean v7, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->editMode:Z

    if-nez v7, :cond_c

    .line 418
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    iget-object v10, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v10}, Landroid/util/SparseArray;->size()I

    move-result v10

    if-ge v7, v10, :cond_b

    .line 419
    iget-object v10, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v10, v7}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;

    .line 420
    .local v10, "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    iget-object v11, v10, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->control:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    .line 421
    .local v11, "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    if-nez v11, :cond_0

    move/from16 v19, v2

    move/from16 v20, v3

    goto/16 :goto_6

    .line 422
    :cond_0
    sget-object v12, Lorg/wiiucoop/bo2android/T6TouchOverlay$1;->$SwitchMap$org$wiiucoop$bo2android$T6TouchLayout$Kind:[I

    iget-object v13, v11, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->kind:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    invoke-virtual {v13}, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;->ordinal()I

    move-result v13

    aget v12, v12, v13

    packed-switch v12, :pswitch_data_0

    move/from16 v19, v2

    move/from16 v20, v3

    move-object/from16 v17, v10

    .end local v2    # "lt":I
    .end local v3    # "rt":I
    .end local v10    # "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    .local v17, "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    .local v19, "lt":I
    .local v20, "rt":I
    goto/16 :goto_6

    .line 430
    .end local v17    # "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    .end local v19    # "lt":I
    .end local v20    # "rt":I
    .restart local v2    # "lt":I
    .restart local v3    # "rt":I
    .restart local v10    # "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    :pswitch_0
    invoke-direct {v0, v11}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->radius(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)F

    move-result v12

    .line 431
    .local v12, "r":F
    const/4 v13, 0x0

    cmpl-float v16, v12, v13

    if-lez v16, :cond_1

    iget v13, v10, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->x:F

    invoke-direct {v0, v11}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cx(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)F

    move-result v17

    sub-float v13, v13, v17

    div-float/2addr v13, v12

    iget v8, v10, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->y:F

    invoke-direct {v0, v11}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cy(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)F

    move-result v18

    sub-float v8, v8, v18

    div-float/2addr v8, v12

    iget v9, v11, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->deadzone:F

    move/from16 v19, v2

    .end local v2    # "lt":I
    .restart local v19    # "lt":I
    iget v2, v11, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->sensitivity:F

    invoke-static {v13, v8, v9, v2}, Lorg/wiiucoop/bo2android/T6TouchLayout;->stickAxes(FFFF)[I

    move-result-object v2

    const/4 v8, 0x0

    const/4 v9, 0x1

    goto :goto_1

    .line 432
    .end local v19    # "lt":I
    .restart local v2    # "lt":I
    :cond_1
    move/from16 v19, v2

    .end local v2    # "lt":I
    .restart local v19    # "lt":I
    const/4 v2, 0x2

    new-array v2, v2, [I

    const/4 v8, 0x0

    aput v8, v2, v8

    const/4 v9, 0x1

    aput v8, v2, v9

    :goto_1
    nop

    .line 433
    .local v2, "a":[I
    aget v4, v2, v8

    .line 434
    aget v5, v2, v9

    .line 435
    const/4 v6, 0x1

    .line 436
    iget-boolean v8, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->stickSprint:Z

    if-eqz v8, :cond_7

    const/4 v8, 0x0

    cmpl-float v13, v12, v8

    if-lez v13, :cond_7

    .line 440
    iget v8, v10, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->x:F

    invoke-direct {v0, v11}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cx(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)F

    move-result v13

    sub-float/2addr v8, v13

    div-float/2addr v8, v12

    .local v8, "vx":F
    iget v13, v10, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->y:F

    invoke-direct {v0, v11}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cy(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)F

    move-result v17

    sub-float v13, v13, v17

    div-float/2addr v13, v12

    .line 441
    .local v13, "vy":F
    move-object/from16 v17, v10

    .end local v10    # "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    .restart local v17    # "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    float-to-double v9, v8

    move-object/from16 v21, v2

    move/from16 v20, v3

    .end local v2    # "a":[I
    .end local v3    # "rt":I
    .restart local v20    # "rt":I
    .local v21, "a":[I
    float-to-double v2, v13

    invoke-static {v9, v10, v2, v3}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v2

    const-wide/high16 v9, 0x3ff0000000000000L    # 1.0

    invoke-static {v9, v10, v2, v3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v2

    double-to-float v2, v2

    .line 442
    .local v2, "len":F
    const/4 v3, 0x0

    cmpl-float v3, v2, v3

    if-lez v3, :cond_2

    neg-float v3, v13

    float-to-double v9, v3

    move/from16 v16, v4

    .end local v4    # "lx":I
    .local v16, "lx":I
    float-to-double v3, v8

    move/from16 v22, v5

    move/from16 v23, v6

    .end local v5    # "ly":I
    .end local v6    # "stickHeld":Z
    .local v22, "ly":I
    .local v23, "stickHeld":Z
    float-to-double v5, v13

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v3

    div-double/2addr v9, v3

    const-wide v3, 0x3fea353f7ced9168L    # 0.819

    cmpl-double v3, v9, v3

    if-ltz v3, :cond_3

    const/4 v3, 0x1

    goto :goto_2

    .end local v16    # "lx":I
    .end local v22    # "ly":I
    .end local v23    # "stickHeld":Z
    .restart local v4    # "lx":I
    .restart local v5    # "ly":I
    .restart local v6    # "stickHeld":Z
    :cond_2
    move/from16 v16, v4

    move/from16 v22, v5

    move/from16 v23, v6

    .end local v4    # "lx":I
    .end local v5    # "ly":I
    .end local v6    # "stickHeld":Z
    .restart local v16    # "lx":I
    .restart local v22    # "ly":I
    .restart local v23    # "stickHeld":Z
    :cond_3
    const/4 v3, 0x0

    .line 443
    .local v3, "forward":Z
    :goto_2
    iget-boolean v4, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->sprinting:Z

    if-eqz v4, :cond_4

    iget v4, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->sprintThreshold:F

    const v5, 0x3f666666    # 0.9f

    mul-float/2addr v4, v5

    goto :goto_3

    :cond_4
    iget v4, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->sprintThreshold:F

    .line 444
    .local v4, "need":F
    :goto_3
    if-eqz v3, :cond_5

    cmpl-float v5, v2, v4

    if-ltz v5, :cond_5

    const/4 v5, 0x1

    goto :goto_4

    :cond_5
    const/4 v5, 0x0

    :goto_4
    iput-boolean v5, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->sprinting:Z

    .line 445
    iget-boolean v5, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->sprinting:Z

    if-eqz v5, :cond_6

    or-int/lit8 v1, v1, 0x40

    .line 446
    .end local v2    # "len":F
    .end local v3    # "forward":Z
    .end local v4    # "need":F
    .end local v8    # "vx":F
    .end local v13    # "vy":F
    :cond_6
    move/from16 v4, v16

    move/from16 v2, v19

    move/from16 v3, v20

    move/from16 v5, v22

    move/from16 v6, v23

    goto :goto_7

    .line 436
    .end local v16    # "lx":I
    .end local v17    # "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    .end local v20    # "rt":I
    .end local v21    # "a":[I
    .end local v22    # "ly":I
    .end local v23    # "stickHeld":Z
    .local v2, "a":[I
    .local v3, "rt":I
    .local v4, "lx":I
    .restart local v5    # "ly":I
    .restart local v6    # "stickHeld":Z
    .restart local v10    # "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    :cond_7
    move-object/from16 v21, v2

    move/from16 v20, v3

    move/from16 v16, v4

    move/from16 v22, v5

    move/from16 v23, v6

    move-object/from16 v17, v10

    .line 418
    .end local v2    # "a":[I
    .end local v3    # "rt":I
    .end local v4    # "lx":I
    .end local v5    # "ly":I
    .end local v6    # "stickHeld":Z
    .end local v10    # "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    .end local v11    # "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .end local v12    # "r":F
    .restart local v16    # "lx":I
    .restart local v20    # "rt":I
    .restart local v22    # "ly":I
    .restart local v23    # "stickHeld":Z
    move/from16 v4, v16

    move/from16 v2, v19

    move/from16 v3, v20

    move/from16 v5, v22

    move/from16 v6, v23

    goto :goto_7

    .line 424
    .end local v16    # "lx":I
    .end local v19    # "lt":I
    .end local v20    # "rt":I
    .end local v22    # "ly":I
    .end local v23    # "stickHeld":Z
    .local v2, "lt":I
    .restart local v3    # "rt":I
    .restart local v4    # "lx":I
    .restart local v5    # "ly":I
    .restart local v6    # "stickHeld":Z
    .restart local v10    # "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    .restart local v11    # "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    :pswitch_1
    move/from16 v19, v2

    move/from16 v20, v3

    move-object/from16 v17, v10

    .end local v2    # "lt":I
    .end local v3    # "rt":I
    .end local v10    # "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    .restart local v17    # "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    .restart local v19    # "lt":I
    .restart local v20    # "rt":I
    iget v2, v11, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->binding:I

    const v3, 0xffff

    and-int/2addr v2, v3

    or-int/2addr v1, v2

    .line 425
    invoke-direct {v0, v11}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->isAdsFire(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)Z

    move-result v2

    if-eqz v2, :cond_8

    move/from16 v2, v19

    move/from16 v3, v20

    goto :goto_7

    .line 426
    :cond_8
    iget v2, v11, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->binding:I

    const/high16 v3, 0x10000

    and-int/2addr v2, v3

    if-eqz v2, :cond_9

    const/16 v2, 0xff

    .end local v19    # "lt":I
    .restart local v2    # "lt":I
    goto :goto_5

    .end local v2    # "lt":I
    .restart local v19    # "lt":I
    :cond_9
    move/from16 v2, v19

    .line 427
    .end local v19    # "lt":I
    .restart local v2    # "lt":I
    :goto_5
    iget v3, v11, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->binding:I

    const/high16 v8, 0x20000

    and-int/2addr v3, v8

    if-eqz v3, :cond_a

    const/16 v3, 0xff

    .end local v20    # "rt":I
    .restart local v3    # "rt":I
    goto :goto_7

    .end local v3    # "rt":I
    .restart local v20    # "rt":I
    :cond_a
    move/from16 v3, v20

    goto :goto_7

    .line 418
    .end local v2    # "lt":I
    .end local v11    # "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .end local v17    # "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    .restart local v19    # "lt":I
    :goto_6
    move/from16 v2, v19

    move/from16 v3, v20

    .end local v19    # "lt":I
    .end local v20    # "rt":I
    .restart local v2    # "lt":I
    .restart local v3    # "rt":I
    :goto_7
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_0

    :cond_b
    move/from16 v19, v2

    move/from16 v20, v3

    .end local v2    # "lt":I
    .end local v3    # "rt":I
    .restart local v19    # "lt":I
    .restart local v20    # "rt":I
    move/from16 v16, v6

    goto :goto_8

    .line 452
    .end local v7    # "i":I
    .end local v19    # "lt":I
    .end local v20    # "rt":I
    .restart local v2    # "lt":I
    .restart local v3    # "rt":I
    :cond_c
    move/from16 v16, v6

    .end local v6    # "stickHeld":Z
    .local v16, "stickHeld":Z
    :goto_8
    iget-boolean v6, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->padActive:Z

    if-eqz v6, :cond_e

    iget-boolean v6, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->editMode:Z

    if-nez v6, :cond_e

    .line 453
    iget-object v6, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->adsFireState:Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v7

    invoke-virtual {v6, v7, v8}, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->triggers(J)I

    move-result v6

    .line 454
    .local v6, "t":I
    and-int/lit8 v7, v6, 0x1

    if-eqz v7, :cond_d

    const/16 v2, 0xff

    .line 455
    :cond_d
    and-int/lit8 v7, v6, 0x2

    if-eqz v7, :cond_e

    const/16 v3, 0xff

    .line 457
    .end local v6    # "t":I
    :cond_e
    if-nez v16, :cond_f

    const/4 v6, 0x0

    iput-boolean v6, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->sprinting:Z

    goto :goto_9

    :cond_f
    const/4 v6, 0x0

    .line 458
    :goto_9
    iget-boolean v7, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->padActive:Z

    if-eqz v7, :cond_10

    iget-boolean v7, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->editMode:Z

    if-nez v7, :cond_10

    const/4 v8, 0x1

    goto :goto_a

    :cond_10
    move v8, v6

    :goto_a
    move v13, v8

    .line 459
    .local v13, "active":Z
    iget-boolean v6, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->lastActive:Z

    if-ne v13, v6, :cond_12

    iget v6, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->lastButtons:I

    if-ne v1, v6, :cond_12

    iget v6, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->lastLt:I

    if-ne v2, v6, :cond_12

    iget v6, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->lastRt:I

    if-ne v3, v6, :cond_12

    iget v6, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->lastLx:I

    if-ne v4, v6, :cond_12

    iget v6, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->lastLy:I

    if-ne v5, v6, :cond_12

    iget v6, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->lastRx:I

    if-ne v15, v6, :cond_12

    iget v6, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->lastRy:I

    if-eq v14, v6, :cond_11

    goto :goto_b

    :cond_11
    move/from16 v17, v13

    move/from16 v18, v14

    goto :goto_c

    .line 461
    :cond_12
    :goto_b
    iput-boolean v13, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->lastActive:Z

    .line 462
    iput v1, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->lastButtons:I

    .line 463
    iput v2, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->lastLt:I

    .line 464
    iput v3, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->lastRt:I

    .line 465
    iput v4, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->lastLx:I

    .line 466
    iput v5, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->lastLy:I

    .line 467
    iput v15, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->lastRx:I

    .line 468
    iput v14, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->lastRy:I

    .line 469
    iget-object v6, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->sink:Lorg/wiiucoop/bo2android/T6TouchOverlay$PadSink;

    if-eqz v6, :cond_13

    iget-object v6, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->sink:Lorg/wiiucoop/bo2android/T6TouchOverlay$PadSink;

    move v7, v13

    move v8, v1

    move v9, v2

    move v10, v3

    move v11, v4

    move v12, v5

    move/from16 v17, v13

    .end local v13    # "active":Z
    .local v17, "active":Z
    move v13, v15

    move/from16 v18, v14

    .end local v14    # "ry":I
    .local v18, "ry":I
    invoke-interface/range {v6 .. v14}, Lorg/wiiucoop/bo2android/T6TouchOverlay$PadSink;->onPad(ZIIIIIII)V

    goto :goto_c

    .end local v17    # "active":Z
    .end local v18    # "ry":I
    .restart local v13    # "active":Z
    .restart local v14    # "ry":I
    :cond_13
    move/from16 v17, v13

    move/from16 v18, v14

    .line 471
    .end local v13    # "active":Z
    .end local v14    # "ry":I
    .restart local v17    # "active":Z
    .restart local v18    # "ry":I
    :goto_c
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private radius(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)F
    .locals 2
    .param p1, "c"    # Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    .line 251
    iget v0, p1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->size:F

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getHeight()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v0, v1

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float/2addr v0, v1

    return v0
.end method

.method private scheduleAdsFire(J)V
    .locals 7
    .param p1, "now"    # J

    .line 185
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->adsFireState:Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;

    invoke-virtual {v0, p1, p2}, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->nextChange(J)J

    move-result-wide v0

    .line 186
    .local v0, "next":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    new-instance v2, Lorg/wiiucoop/bo2android/T6TouchOverlay$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay$$ExternalSyntheticLambda0;-><init>(Lorg/wiiucoop/bo2android/T6TouchOverlay;)V

    sub-long v3, v0, p1

    const-wide/16 v5, 0x2

    add-long/2addr v3, v5

    invoke-virtual {p0, v2, v3, v4}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 187
    :cond_0
    return-void
.end method

.method private sprite(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 5
    .param p1, "name"    # Ljava/lang/String;

    .line 476
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 477
    :cond_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->sprites:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->sprites:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    return-object v0

    .line 478
    :cond_1
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "touch_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 479
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    .line 478
    const-string v4, "drawable"

    invoke-virtual {v0, v2, v4, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 480
    .local v0, "id":I
    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 481
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    :goto_0
    iget-object v2, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->sprites:Ljava/util/Map;

    invoke-interface {v2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 482
    return-object v1
.end method

.method private turnsCamera(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)Z
    .locals 3
    .param p1, "c"    # Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    .line 209
    invoke-static {p1}, Lorg/wiiucoop/bo2android/T6TouchLayout;->aimsWhileHeld(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 210
    :cond_0
    iget-boolean v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->aimDrag:Z

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    iget-object v0, p1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->kind:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    sget-object v2, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;->BUTTON:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    if-ne v0, v2, :cond_1

    iget v0, p1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->binding:I

    const/high16 v2, 0x10000

    if-ne v0, v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return v1
.end method


# virtual methods
.method public getLayout()Lorg/wiiucoop/bo2android/T6TouchLayout;
    .locals 1

    .line 135
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->layout:Lorg/wiiucoop/bo2android/T6TouchLayout;

    return-object v0
.end method

.method public getSelected()Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .locals 1

    .line 214
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->selected:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    return-object v0
.end method

.method protected onDetachedFromWindow()V
    .locals 10

    .line 550
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 551
    iget-boolean v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->padActive:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->sink:Lorg/wiiucoop/bo2android/T6TouchOverlay$PadSink;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->sink:Lorg/wiiucoop/bo2android/T6TouchOverlay$PadSink;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-interface/range {v1 .. v9}, Lorg/wiiucoop/bo2android/T6TouchOverlay$PadSink;->onPad(ZIIIIIII)V

    .line 552
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 553
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->control:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->holdsKey(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->keyListener:Lorg/wiiucoop/bo2android/T6TouchOverlay$KeyListener;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->keyListener:Lorg/wiiucoop/bo2android/T6TouchOverlay$KeyListener;

    const/16 v2, 0x9

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Lorg/wiiucoop/bo2android/T6TouchOverlay$KeyListener;->onKey(IZ)V

    .line 552
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 554
    .end local v0    # "i":I
    :cond_2
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 19
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 497
    move-object/from16 v0, p0

    move-object/from16 v7, p1

    iget-object v1, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->layout:Lorg/wiiucoop/bo2android/T6TouchLayout;

    if-nez v1, :cond_0

    return-void

    .line 498
    :cond_0
    iget-object v1, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->layout:Lorg/wiiucoop/bo2android/T6TouchLayout;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6TouchLayout;->controls:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_d

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    .line 499
    .local v9, "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    iget-boolean v1, v9, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->enabled:Z

    if-nez v1, :cond_1

    iget-boolean v1, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->editMode:Z

    if-nez v1, :cond_1

    goto :goto_0

    .line 500
    :cond_1
    iget-boolean v1, v9, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->enabled:Z

    if-eqz v1, :cond_2

    iget v1, v9, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->opacity:F

    goto :goto_1

    :cond_2
    const v1, 0x3e4ccccd    # 0.2f

    .line 501
    .local v1, "alpha":F
    :goto_1
    iget-boolean v2, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->editMode:Z

    if-nez v2, :cond_3

    invoke-direct {v0, v9}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->pressed(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)Z

    move-result v2

    if-eqz v2, :cond_3

    const/high16 v2, 0x3e800000    # 0.25f

    add-float/2addr v2, v1

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v3, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    move v10, v1

    goto :goto_2

    .line 502
    :cond_3
    move v10, v1

    .end local v1    # "alpha":F
    .local v10, "alpha":F
    :goto_2
    invoke-direct {v0, v9}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->radius(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)F

    move-result v11

    .local v11, "r":F
    invoke-direct {v0, v9}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cx(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)F

    move-result v12

    .local v12, "x":F
    invoke-direct {v0, v9}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cy(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)F

    move-result v13

    .line 503
    .local v13, "y":F
    iget-object v1, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x437f0000    # 255.0f

    mul-float v3, v10, v2

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 504
    iget-object v1, v9, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->sprite:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->sprite(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v14

    .line 505
    .local v14, "bmp":Landroid/graphics/Bitmap;
    const/4 v3, 0x0

    if-eqz v14, :cond_4

    .line 506
    iget-object v2, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->rect:Landroid/graphics/RectF;

    sub-float v4, v12, v11

    sub-float v5, v13, v11

    add-float v6, v12, v11

    add-float v15, v13, v11

    invoke-virtual {v2, v4, v5, v6, v15}, Landroid/graphics/RectF;->set(FFFF)V

    .line 507
    iget-object v2, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->rect:Landroid/graphics/RectF;

    iget-object v4, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v14, v3, v2, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    goto :goto_4

    .line 509
    :cond_4
    iget-object v4, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->stroke:Landroid/graphics/Paint;

    const v5, -0x150805

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 510
    iget-object v4, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->stroke:Landroid/graphics/Paint;

    mul-float v5, v10, v2

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 511
    iget-object v4, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->stroke:Landroid/graphics/Paint;

    const v5, 0x3da3d70a    # 0.08f

    mul-float/2addr v5, v11

    const/high16 v6, 0x40000000    # 2.0f

    invoke-static {v6, v5}, Ljava/lang/Math;->max(FF)F

    move-result v5

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 512
    const v4, 0x3f6b851f    # 0.92f

    mul-float/2addr v4, v11

    iget-object v5, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->stroke:Landroid/graphics/Paint;

    invoke-virtual {v7, v12, v13, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 513
    iget-object v4, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->text:Landroid/graphics/Paint;

    iget-object v5, v9, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->label:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v15, 0x2

    if-le v5, v15, :cond_5

    const v5, 0x3ee66666    # 0.45f

    goto :goto_3

    :cond_5
    const v5, 0x3f4ccccd    # 0.8f

    :goto_3
    mul-float/2addr v5, v11

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 514
    iget-object v4, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->text:Landroid/graphics/Paint;

    mul-float/2addr v2, v10

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 515
    iget-object v2, v9, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->label:Ljava/lang/String;

    iget-object v4, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->text:Landroid/graphics/Paint;

    invoke-virtual {v4}, Landroid/graphics/Paint;->descent()F

    move-result v4

    iget-object v5, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->text:Landroid/graphics/Paint;

    invoke-virtual {v5}, Landroid/graphics/Paint;->ascent()F

    move-result v5

    add-float/2addr v4, v5

    div-float/2addr v4, v6

    sub-float v4, v13, v4

    iget-object v5, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->text:Landroid/graphics/Paint;

    invoke-virtual {v7, v2, v12, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 517
    :goto_4
    iget-object v2, v9, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->kind:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    sget-object v4, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;->STICK_LEFT:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    if-ne v2, v4, :cond_a

    .line 518
    const-string v2, "analog_midle_ball"

    invoke-direct {v0, v2}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->sprite(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 519
    .local v2, "knob":Landroid/graphics/Bitmap;
    move v4, v12

    .local v4, "kx":F
    move v5, v13

    .line 520
    .local v5, "ky":F
    iget-boolean v6, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->editMode:Z

    if-eqz v6, :cond_6

    move-object v6, v3

    goto :goto_5

    :cond_6
    invoke-direct {v0, v9}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingerOn(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;

    move-result-object v6

    .line 521
    .local v6, "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    :goto_5
    if-eqz v6, :cond_8

    .line 522
    iget v15, v6, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->x:F

    sub-float/2addr v15, v12

    .local v15, "dx":F
    iget v3, v6, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->y:F

    sub-float/2addr v3, v13

    move-object/from16 v16, v2

    .end local v2    # "knob":Landroid/graphics/Bitmap;
    .local v3, "dy":F
    .local v16, "knob":Landroid/graphics/Bitmap;
    float-to-double v1, v15

    move/from16 v17, v12

    move/from16 v18, v13

    .end local v12    # "x":F
    .end local v13    # "y":F
    .local v17, "x":F
    .local v18, "y":F
    float-to-double v12, v3

    invoke-static {v1, v2, v12, v13}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v1

    double-to-float v1, v1

    .line 523
    .local v1, "len":F
    cmpl-float v2, v1, v11

    if-lez v2, :cond_7

    div-float v2, v15, v1

    mul-float v15, v2, v11

    div-float v2, v3, v1

    mul-float v3, v2, v11

    .line 524
    :cond_7
    add-float/2addr v4, v15

    .line 525
    add-float/2addr v5, v3

    goto :goto_6

    .line 521
    .end local v1    # "len":F
    .end local v3    # "dy":F
    .end local v15    # "dx":F
    .end local v16    # "knob":Landroid/graphics/Bitmap;
    .end local v17    # "x":F
    .end local v18    # "y":F
    .restart local v2    # "knob":Landroid/graphics/Bitmap;
    .restart local v12    # "x":F
    .restart local v13    # "y":F
    :cond_8
    move-object/from16 v16, v2

    move/from16 v17, v12

    move/from16 v18, v13

    .line 527
    .end local v2    # "knob":Landroid/graphics/Bitmap;
    .end local v12    # "x":F
    .end local v13    # "y":F
    .restart local v16    # "knob":Landroid/graphics/Bitmap;
    .restart local v17    # "x":F
    .restart local v18    # "y":F
    :goto_6
    const v1, 0x3ee66666    # 0.45f

    mul-float/2addr v1, v11

    .line 528
    .local v1, "kr":F
    if-eqz v16, :cond_9

    .line 529
    iget-object v2, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->rect:Landroid/graphics/RectF;

    sub-float v3, v4, v1

    sub-float v12, v5, v1

    add-float v13, v4, v1

    add-float v15, v5, v1

    invoke-virtual {v2, v3, v12, v13, v15}, Landroid/graphics/RectF;->set(FFFF)V

    .line 530
    iget-object v2, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->rect:Landroid/graphics/RectF;

    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->paint:Landroid/graphics/Paint;

    move-object/from16 v12, v16

    const/4 v13, 0x0

    .end local v16    # "knob":Landroid/graphics/Bitmap;
    .local v12, "knob":Landroid/graphics/Bitmap;
    invoke-virtual {v7, v12, v13, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    goto :goto_7

    .line 528
    .end local v12    # "knob":Landroid/graphics/Bitmap;
    .restart local v16    # "knob":Landroid/graphics/Bitmap;
    :cond_9
    move-object/from16 v12, v16

    .end local v16    # "knob":Landroid/graphics/Bitmap;
    .restart local v12    # "knob":Landroid/graphics/Bitmap;
    goto :goto_7

    .line 517
    .end local v1    # "kr":F
    .end local v4    # "kx":F
    .end local v5    # "ky":F
    .end local v6    # "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    .end local v17    # "x":F
    .end local v18    # "y":F
    .local v12, "x":F
    .restart local v13    # "y":F
    :cond_a
    move/from16 v17, v12

    move/from16 v18, v13

    .line 533
    .end local v12    # "x":F
    .end local v13    # "y":F
    .restart local v17    # "x":F
    .restart local v18    # "y":F
    :goto_7
    iget-boolean v1, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->editMode:Z

    const/high16 v2, 0x40800000    # 4.0f

    if-eqz v1, :cond_b

    iget-object v1, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->selected:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    if-ne v9, v1, :cond_b

    .line 534
    iget-object v1, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->stroke:Landroid/graphics/Paint;

    const v3, -0xb01c01

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 535
    iget-object v1, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->stroke:Landroid/graphics/Paint;

    const/16 v3, 0xff

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 536
    iget-object v1, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->stroke:Landroid/graphics/Paint;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 537
    const/high16 v1, 0x40c00000    # 6.0f

    add-float/2addr v1, v11

    iget-object v3, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->stroke:Landroid/graphics/Paint;

    move/from16 v12, v17

    move/from16 v13, v18

    .end local v17    # "x":F
    .end local v18    # "y":F
    .restart local v12    # "x":F
    .restart local v13    # "y":F
    invoke-virtual {v7, v12, v13, v1, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_8

    .line 533
    .end local v12    # "x":F
    .end local v13    # "y":F
    .restart local v17    # "x":F
    .restart local v18    # "y":F
    :cond_b
    move/from16 v12, v17

    move/from16 v13, v18

    .line 539
    .end local v17    # "x":F
    .end local v18    # "y":F
    .restart local v12    # "x":F
    .restart local v13    # "y":F
    :goto_8
    iget-boolean v1, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->editMode:Z

    if-eqz v1, :cond_c

    iget-boolean v1, v9, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->enabled:Z

    if-nez v1, :cond_c

    .line 540
    iget-object v1, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->stroke:Landroid/graphics/Paint;

    const v3, -0x1da9b6

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 541
    iget-object v1, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->stroke:Landroid/graphics/Paint;

    const/16 v3, 0xc8

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 542
    iget-object v1, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->stroke:Landroid/graphics/Paint;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 543
    const v1, 0x3f19999a    # 0.6f

    mul-float v2, v11, v1

    sub-float v2, v12, v2

    mul-float v3, v11, v1

    sub-float v3, v13, v3

    mul-float v4, v11, v1

    add-float/2addr v4, v12

    mul-float/2addr v1, v11

    add-float v5, v13, v1

    iget-object v6, v0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->stroke:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 545
    .end local v9    # "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .end local v10    # "alpha":F
    .end local v11    # "r":F
    .end local v12    # "x":F
    .end local v13    # "y":F
    .end local v14    # "bmp":Landroid/graphics/Bitmap;
    :cond_c
    goto/16 :goto_0

    .line 546
    :cond_d
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "e"    # Landroid/view/MotionEvent;

    .line 279
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->layout:Lorg/wiiucoop/bo2android/T6TouchLayout;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 280
    :cond_0
    iget-boolean v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->editMode:Z

    if-eqz v0, :cond_1

    invoke-direct {p0, p1}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->onEditTouch(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_0

    :cond_1
    invoke-direct {p0, p1}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->onPlayTouch(Landroid/view/MotionEvent;)Z

    move-result v0

    :goto_0
    return v0
.end method

.method public releaseAll()V
    .locals 7

    .line 229
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    const/4 v2, 0x0

    if-ge v0, v1, :cond_3

    .line 230
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;

    .line 231
    .local v1, "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    iget-object v3, v1, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->control:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    if-eqz v3, :cond_0

    iget-boolean v3, v1, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->aiming:Z

    if-eqz v3, :cond_1

    :cond_0
    iget-object v3, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraSink:Lorg/wiiucoop/bo2android/T6TouchOverlay$CameraSink;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraSink:Lorg/wiiucoop/bo2android/T6TouchOverlay$CameraSink;

    iget-object v4, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v4, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v4

    const/4 v5, 0x3

    const/4 v6, 0x0

    invoke-interface {v3, v5, v4, v6, v6}, Lorg/wiiucoop/bo2android/T6TouchOverlay$CameraSink;->onCamera(IIFF)V

    .line 232
    :cond_1
    iget-object v3, v1, Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;->control:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    invoke-direct {p0, v3}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->holdsKey(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->keyListener:Lorg/wiiucoop/bo2android/T6TouchOverlay$KeyListener;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->keyListener:Lorg/wiiucoop/bo2android/T6TouchOverlay$KeyListener;

    const/16 v4, 0x9

    invoke-interface {v3, v4, v2}, Lorg/wiiucoop/bo2android/T6TouchOverlay$KeyListener;->onKey(IZ)V

    .line 229
    .end local v1    # "f":Lorg/wiiucoop/bo2android/T6TouchOverlay$Finger;
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 234
    .end local v0    # "i":I
    :cond_3
    iput-boolean v2, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->sprinting:Z

    .line 235
    const/4 v0, -0x1

    iput v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraOwner:I

    .line 236
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->adsFireState:Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;

    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;->cancel()V

    .line 237
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    if-lez v0, :cond_4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "touch: all gestures ended ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " pointer(s))"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "t6android"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    :cond_4
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->fingers:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 239
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->publish()V

    .line 240
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->invalidate()V

    .line 241
    return-void
.end method

.method public setCameraSink(Lorg/wiiucoop/bo2android/T6TouchOverlay$CameraSink;)V
    .locals 0
    .param p1, "sink"    # Lorg/wiiucoop/bo2android/T6TouchOverlay$CameraSink;

    .line 156
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->cameraSink:Lorg/wiiucoop/bo2android/T6TouchOverlay$CameraSink;

    .line 157
    return-void
.end method

.method public setCommandListener(Lorg/wiiucoop/bo2android/T6TouchOverlay$CommandListener;)V
    .locals 0
    .param p1, "listener"    # Lorg/wiiucoop/bo2android/T6TouchOverlay$CommandListener;

    .line 53
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->commandListener:Lorg/wiiucoop/bo2android/T6TouchOverlay$CommandListener;

    .line 54
    return-void
.end method

.method public setConsoleListener(Lorg/wiiucoop/bo2android/T6TouchOverlay$ConsoleListener;)V
    .locals 0
    .param p1, "listener"    # Lorg/wiiucoop/bo2android/T6TouchOverlay$ConsoleListener;

    .line 148
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->consoleListener:Lorg/wiiucoop/bo2android/T6TouchOverlay$ConsoleListener;

    .line 149
    return-void
.end method

.method public setEditMode(Z)V
    .locals 0
    .param p1, "edit"    # Z

    .line 139
    iput-boolean p1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->editMode:Z

    .line 140
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->invalidate()V

    .line 141
    return-void
.end method

.method public setKeyListener(Lorg/wiiucoop/bo2android/T6TouchOverlay$KeyListener;)V
    .locals 0
    .param p1, "listener"    # Lorg/wiiucoop/bo2android/T6TouchOverlay$KeyListener;

    .line 160
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->keyListener:Lorg/wiiucoop/bo2android/T6TouchOverlay$KeyListener;

    .line 161
    return-void
.end method

.method public setLayout(Lorg/wiiucoop/bo2android/T6TouchLayout;)V
    .locals 1
    .param p1, "layout"    # Lorg/wiiucoop/bo2android/T6TouchLayout;

    .line 128
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->releaseAll()V

    .line 129
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->layout:Lorg/wiiucoop/bo2android/T6TouchLayout;

    .line 130
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->selected:Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    .line 131
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->invalidate()V

    .line 132
    return-void
.end method

.method public setOptions(ZZFZ)V
    .locals 2
    .param p1, "aimDrag"    # Z
    .param p2, "stickSprint"    # Z
    .param p3, "sprintThreshold"    # F
    .param p4, "adsFire"    # Z

    .line 165
    iput-boolean p1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->aimDrag:Z

    .line 166
    iput-boolean p2, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->stickSprint:Z

    .line 167
    const/high16 v0, 0x3f000000    # 0.5f

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {p3, v0, v1}, Lorg/wiiucoop/bo2android/T6TouchLayout;->clamp(FFF)F

    move-result v0

    iput v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->sprintThreshold:F

    .line 168
    iput-boolean p4, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->adsFire:Z

    .line 169
    if-nez p2, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->sprinting:Z

    .line 170
    :cond_0
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->publish()V

    .line 171
    return-void
.end method

.method public setPadActive(Z)V
    .locals 0
    .param p1, "active"    # Z

    .line 219
    iput-boolean p1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->padActive:Z

    .line 220
    if-nez p1, :cond_0

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->releaseAll()V

    .line 221
    :cond_0
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/T6TouchOverlay;->publish()V

    .line 222
    return-void
.end method

.method public setPadSink(Lorg/wiiucoop/bo2android/T6TouchOverlay$PadSink;)V
    .locals 0
    .param p1, "sink"    # Lorg/wiiucoop/bo2android/T6TouchOverlay$PadSink;

    .line 144
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->sink:Lorg/wiiucoop/bo2android/T6TouchOverlay$PadSink;

    .line 145
    return-void
.end method

.method public setSelectionListener(Lorg/wiiucoop/bo2android/T6TouchOverlay$SelectionListener;)V
    .locals 0
    .param p1, "listener"    # Lorg/wiiucoop/bo2android/T6TouchOverlay$SelectionListener;

    .line 152
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6TouchOverlay;->selectionListener:Lorg/wiiucoop/bo2android/T6TouchOverlay$SelectionListener;

    .line 153
    return-void
.end method
