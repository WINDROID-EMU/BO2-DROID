.class public final Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
.super Ljava/lang/Object;
.source "T6TouchLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/T6TouchLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Control"
.end annotation


# instance fields
.field public final binding:I

.field public deadzone:F

.field public enabled:Z

.field public final id:Ljava/lang/String;

.field public final kind:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

.field public final label:Ljava/lang/String;

.field public opacity:F

.field public sensitivity:F

.field public size:F

.field public final sprite:Ljava/lang/String;

.field public x:F

.field public y:F


# direct methods
.method constructor <init>(Ljava/lang/String;Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;Ljava/lang/String;Ljava/lang/String;IFFF)V
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "kind"    # Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;
    .param p3, "sprite"    # Ljava/lang/String;
    .param p4, "label"    # Ljava/lang/String;
    .param p5, "binding"    # I
    .param p6, "x"    # F
    .param p7, "y"    # F
    .param p8, "size"    # F

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    const/high16 v0, 0x3f400000    # 0.75f

    iput v0, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->opacity:F

    .line 67
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->enabled:Z

    .line 68
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->sensitivity:F

    .line 69
    const v0, 0x3df5c28f    # 0.12f

    iput v0, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->deadzone:F

    .line 72
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->id:Ljava/lang/String;

    .line 73
    iput-object p2, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->kind:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    .line 74
    iput-object p3, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->sprite:Ljava/lang/String;

    .line 75
    iput-object p4, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->label:Ljava/lang/String;

    .line 76
    iput p5, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->binding:I

    .line 77
    iput p6, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->x:F

    .line 78
    iput p7, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->y:F

    .line 79
    iput p8, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->size:F

    .line 80
    return-void
.end method


# virtual methods
.method copy()Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .locals 10

    .line 83
    new-instance v9, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->id:Ljava/lang/String;

    iget-object v2, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->kind:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    iget-object v3, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->sprite:Ljava/lang/String;

    iget-object v4, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->label:Ljava/lang/String;

    iget v5, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->binding:I

    iget v6, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->x:F

    iget v7, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->y:F

    iget v8, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->size:F

    move-object v0, v9

    invoke-direct/range {v0 .. v8}, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;-><init>(Ljava/lang/String;Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;Ljava/lang/String;Ljava/lang/String;IFFF)V

    .line 84
    .local v0, "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    iget v1, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->opacity:F

    iput v1, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->opacity:F

    .line 85
    iget-boolean v1, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->enabled:Z

    iput-boolean v1, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->enabled:Z

    .line 86
    iget v1, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->sensitivity:F

    iput v1, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->sensitivity:F

    .line 87
    iget v1, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->deadzone:F

    iput v1, v0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->deadzone:F

    .line 88
    return-object v0
.end method
