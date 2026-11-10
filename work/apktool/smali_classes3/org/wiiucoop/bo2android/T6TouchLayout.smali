.class public final Lorg/wiiucoop/bo2android/T6TouchLayout;
.super Ljava/lang/Object;
.source "T6TouchLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/wiiucoop/bo2android/T6TouchLayout$Control;,
        Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;,
        Lorg/wiiucoop/bo2android/T6TouchLayout$AdsFire;
    }
.end annotation


# static fields
.field public static final A:I = 0x1000

.field public static final ADS_FIRE_AIM_HOLD_MS:J = 0x12cL

.field public static final ADS_FIRE_DELAY_MS:J = 0x78L

.field public static final ADS_FIRE_MIN_PRESS_MS:J = 0x64L

.field public static final ADS_FIRE_RELEASE_GAP_MS:J = 0x46L

.field public static final AIM:I = 0x1

.field public static final B:I = 0x2000

.field public static final BACK:I = 0x20

.field public static final CONSOLE:I = 0x40000

.field public static final DEFAULT_DEADZONE:F = 0.12f

.field public static final DPAD_DOWN:I = 0x2

.field public static final DPAD_LEFT:I = 0x4

.field public static final DPAD_RIGHT:I = 0x8

.field public static final DPAD_UP:I = 0x1

.field public static final FIRE:I = 0x2

.field public static final LEFT_SHOULDER:I = 0x100

.field public static final LEFT_THUMB:I = 0x40

.field public static final LEFT_TRIGGER:I = 0x10000

.field public static final MAX_DEADZONE:F = 0.6f

.field public static final MAX_SENSITIVITY:F = 3.0f

.field public static final MAX_SIZE:F = 0.9f

.field public static final MIN_SENSITIVITY:F = 0.2f

.field public static final MIN_SIZE:F = 0.06f

.field public static final PLACE_ITEM:I = 0x100000

.field public static final PROFILE_CODM:Ljava/lang/String; = "codm"

.field public static final PROFILE_X360:Ljava/lang/String; = "x360"

.field public static final PRONE:I = 0x200000

.field public static final RIGHT_SHOULDER:I = 0x200

.field public static final RIGHT_THUMB:I = 0x80

.field public static final RIGHT_TRIGGER:I = 0x20000

.field public static final SCOREBOARD:I = 0x80000

.field public static final START:I = 0x10

.field public static final X:I = 0x4000

.field public static final Y:I = 0x8000


# instance fields
.field public final controls:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/wiiucoop/bo2android/T6TouchLayout$Control;",
            ">;"
        }
    .end annotation
.end field

.field public final profile:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/util/List;)V
    .locals 0
    .param p1, "profile"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lorg/wiiucoop/bo2android/T6TouchLayout$Control;",
            ">;)V"
        }
    .end annotation

    .line 95
    .local p2, "controls":Ljava/util/List;, "Ljava/util/List<Lorg/wiiucoop/bo2android/T6TouchLayout$Control;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6TouchLayout;->profile:Ljava/lang/String;

    .line 97
    iput-object p2, p0, Lorg/wiiucoop/bo2android/T6TouchLayout;->controls:Ljava/util/List;

    .line 98
    return-void
.end method

.method public static aimsWhileHeld(Lorg/wiiucoop/bo2android/T6TouchLayout$Control;)Z
    .locals 2
    .param p0, "c"    # Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    .line 108
    if-eqz p0, :cond_1

    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->kind:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    sget-object v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;->BUTTON:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    if-ne v0, v1, :cond_1

    iget v0, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->binding:I

    const/high16 v1, 0x20000

    if-ne v0, v1, :cond_1

    const-string v0, "shoot"

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "hipfire"

    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .locals 10
    .param p0, "id"    # Ljava/lang/String;
    .param p1, "sprite"    # Ljava/lang/String;
    .param p2, "label"    # Ljava/lang/String;
    .param p3, "binding"    # I
    .param p4, "x"    # F
    .param p5, "y"    # F
    .param p6, "size"    # F

    .line 117
    new-instance v9, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    sget-object v2, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;->BUTTON:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    move-object v0, v9

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    move/from16 v8, p6

    invoke-direct/range {v0 .. v8}, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;-><init>(Ljava/lang/String;Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;Ljava/lang/String;Ljava/lang/String;IFFF)V

    return-object v9
.end method

.method public static clamp(FFF)F
    .locals 1
    .param p0, "v"    # F
    .param p1, "lo"    # F
    .param p2, "hi"    # F

    .line 372
    cmpg-float v0, p0, p1

    if-gez v0, :cond_0

    move v0, p1

    goto :goto_0

    :cond_0
    cmpl-float v0, p0, p2

    if-lez v0, :cond_1

    move v0, p2

    goto :goto_0

    :cond_1
    move v0, p0

    :goto_0
    return v0
.end method

.method public static defaults(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6TouchLayout;
    .locals 20
    .param p0, "profile"    # Ljava/lang/String;

    .line 128
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 129
    .local v0, "l":Ljava/util/List;, "Ljava/util/List<Lorg/wiiucoop/bo2android/T6TouchLayout$Control;>;"
    const-string v1, "x360"

    move-object/from16 v2, p0

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 130
    new-instance v3, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    sget-object v6, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;->STICK_LEFT:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    const v11, 0x3f333333    # 0.7f

    const v12, 0x3eb851ec    # 0.36f

    const/4 v9, 0x0

    const v10, 0x3e0f5c29    # 0.14f

    const-string v5, "stick_left"

    const-string v7, "analog"

    const-string v8, "LS"

    move-object v4, v3

    invoke-direct/range {v4 .. v12}, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;-><init>(Ljava/lang/String;Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;Ljava/lang/String;Ljava/lang/String;IFFF)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 131
    const v18, 0x3f333333    # 0.7f

    const v19, 0x3e0f5c29    # 0.14f

    const/16 v16, 0x1000

    const v17, 0x3f6147ae    # 0.88f

    const-string v13, "a"

    const-string v14, ""

    const-string v15, "A"

    invoke-static/range {v13 .. v19}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 132
    const v9, 0x3f0f5c29    # 0.56f

    const/16 v7, 0x2000

    const v8, 0x3f733333    # 0.95f

    const-string v4, "b"

    const-string v5, ""

    const-string v6, "B"

    invoke-static/range {v4 .. v10}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 133
    const/16 v7, 0x4000

    const v8, 0x3f4f5c29    # 0.81f

    const-string v4, "x"

    const-string v5, ""

    const-string v6, "X"

    invoke-static/range {v4 .. v10}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    const v9, 0x3ed70a3d    # 0.42f

    const v7, 0x8000

    const v8, 0x3f6147ae    # 0.88f

    const-string v4, "y"

    const-string v5, ""

    const-string v6, "Y"

    invoke-static/range {v4 .. v10}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 135
    const v9, 0x3dcccccd    # 0.1f

    const v10, 0x3e051eb8    # 0.13f

    const/high16 v7, 0x10000

    const v8, 0x3e3851ec    # 0.18f

    const-string v4, "lt"

    const-string v5, ""

    const-string v6, "LT"

    invoke-static/range {v4 .. v10}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 136
    const v9, 0x3e8f5c29    # 0.28f

    const/16 v7, 0x100

    const-string v4, "lb"

    const-string v5, ""

    const-string v6, "LB"

    invoke-static/range {v4 .. v10}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 137
    const v9, 0x3df5c28f    # 0.12f

    const/high16 v7, 0x20000

    const v8, 0x3f70a3d7    # 0.94f

    const-string v4, "rt"

    const-string v5, ""

    const-string v6, "RT"

    invoke-static/range {v4 .. v10}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    const v9, 0x3e8f5c29    # 0.28f

    const/16 v7, 0x200

    const-string v4, "rb"

    const-string v5, ""

    const-string v6, "RB"

    invoke-static/range {v4 .. v10}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    const v9, 0x3f6147ae    # 0.88f

    const v10, 0x3de147ae    # 0.11f

    const/16 v7, 0x40

    const v8, 0x3e8a3d71    # 0.27f

    const-string v4, "ls_click"

    const-string v5, ""

    const-string v6, "L3"

    invoke-static/range {v4 .. v10}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 140
    const v9, 0x3f666666    # 0.9f

    const/16 v7, 0x80

    const v8, 0x3f07ae14    # 0.53f

    const-string v4, "rs_click"

    const-string v5, ""

    const-string v6, "R3"

    invoke-static/range {v4 .. v10}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    const/high16 v9, 0x3f000000    # 0.5f

    const v10, 0x3dcccccd    # 0.1f

    const/4 v7, 0x1

    const v8, 0x3ea8f5c3    # 0.33f

    const-string v4, "dpad_up"

    const-string v5, ""

    const-string v6, "\u2191"

    invoke-static/range {v4 .. v10}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    const v9, 0x3f333333    # 0.7f

    const/4 v7, 0x2

    const-string v4, "dpad_down"

    const-string v5, ""

    const-string v6, "\u2193"

    invoke-static/range {v4 .. v10}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    const v9, 0x3f19999a    # 0.6f

    const/4 v7, 0x4

    const v8, 0x3e8f5c29    # 0.28f

    const-string v4, "dpad_left"

    const-string v5, ""

    const-string v6, "\u2190"

    invoke-static/range {v4 .. v10}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    const/16 v7, 0x8

    const v8, 0x3ec28f5c    # 0.38f

    const-string v4, "dpad_right"

    const-string v5, ""

    const-string v6, "\u2192"

    invoke-static/range {v4 .. v10}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 145
    const v9, 0x3da3d70a    # 0.08f

    const/high16 v7, 0x80000

    const v8, 0x3ed70a3d    # 0.42f

    const-string v4, "back"

    const-string v5, ""

    const-string v6, "BACK"

    invoke-static/range {v4 .. v10}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 146
    const/high16 v7, 0x40000

    const/high16 v8, 0x3f000000    # 0.5f

    const-string v4, "console"

    const-string v5, "OpenCMD"

    const-string v6, "CMD"

    invoke-static/range {v4 .. v10}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 147
    const/16 v7, 0x10

    const v8, 0x3f147ae1    # 0.58f

    const-string v4, "start"

    const-string v5, "settings"

    const-string v6, "START"

    invoke-static/range {v4 .. v10}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 148
    new-instance v3, Lorg/wiiucoop/bo2android/T6TouchLayout;

    invoke-direct {v3, v1, v0}, Lorg/wiiucoop/bo2android/T6TouchLayout;-><init>(Ljava/lang/String;Ljava/util/List;)V

    return-object v3

    .line 152
    :cond_0
    new-instance v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    sget-object v6, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;->STICK_LEFT:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    const v11, 0x3f2e147b    # 0.68f

    const v12, 0x3ecccccd    # 0.4f

    const/4 v9, 0x0

    const v10, 0x3e19999a    # 0.15f

    const-string v5, "move"

    const-string v7, "analog"

    const-string v8, ""

    move-object v4, v1

    invoke-direct/range {v4 .. v12}, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;-><init>(Ljava/lang/String;Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;Ljava/lang/String;Ljava/lang/String;IFFF)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    const v18, 0x3ed70a3d    # 0.42f

    const v19, 0x3e4ccccd    # 0.2f

    const/high16 v16, 0x20000

    const v17, 0x3f4ccccd    # 0.8f

    const-string v13, "shoot"

    const-string v14, "shoot"

    const-string v15, ""

    invoke-static/range {v13 .. v19}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    const v8, 0x3ed70a3d    # 0.42f

    const v9, 0x3e19999a    # 0.15f

    const/high16 v6, 0x20000

    const v7, 0x3d8f5c29    # 0.07f

    const-string v3, "hipfire"

    const-string v4, "hipfire"

    const-string v5, ""

    invoke-static/range {v3 .. v9}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 155
    const v8, 0x3ecccccd    # 0.4f

    const/high16 v6, 0x10000

    const v7, 0x3f70a3d7    # 0.94f

    const-string v3, "ads"

    const-string v4, "ads"

    const-string v5, ""

    invoke-static/range {v3 .. v9}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 156
    const v8, 0x3f1eb852    # 0.62f

    const v9, 0x3e0f5c29    # 0.14f

    const/16 v6, 0x1000

    const v7, 0x3f6e147b    # 0.93f

    const-string v3, "jump"

    const-string v4, "jump"

    const-string v5, ""

    invoke-static/range {v3 .. v9}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 157
    const v8, 0x3f4ccccd    # 0.8f

    const/16 v6, 0x2000

    const v7, 0x3f5c28f6    # 0.86f

    const-string v3, "crouch"

    const-string v4, "crouch"

    const-string v5, ""

    invoke-static/range {v3 .. v9}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 158
    const v8, 0x3f59999a    # 0.85f

    const/high16 v6, 0x200000

    const v7, 0x3f733333    # 0.95f

    const-string v3, "prone"

    const-string v4, "prone"

    const-string v5, ""

    invoke-static/range {v3 .. v9}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 159
    const v8, 0x3f4ccccd    # 0.8f

    const v9, 0x3e051eb8    # 0.13f

    const/16 v6, 0x4000

    const v7, 0x3f3d70a4    # 0.74f

    const-string v3, "reload"

    const-string v4, "reload"

    const-string v5, ""

    invoke-static/range {v3 .. v9}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 160
    const v8, 0x3f1eb852    # 0.62f

    const v7, 0x3f1eb852    # 0.62f

    const-string v3, "interact"

    const-string v4, "Interact"

    const-string v5, ""

    invoke-static/range {v3 .. v9}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 161
    const v8, 0x3f6147ae    # 0.88f

    const v6, 0x8000

    const-string v3, "change_weapon"

    const-string v4, "change_weapon"

    const-string v5, ""

    invoke-static/range {v3 .. v9}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 162
    const v8, 0x3e6147ae    # 0.22f

    const/16 v6, 0x80

    const v7, 0x3f4ccccd    # 0.8f

    const-string v3, "melee"

    const-string v4, "melee"

    const-string v5, ""

    invoke-static/range {v3 .. v9}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 163
    const v8, 0x3df5c28f    # 0.12f

    const v9, 0x3df5c28f    # 0.12f

    const/16 v6, 0x200

    const v7, 0x3f28f5c3    # 0.66f

    const-string v3, "lethal"

    const-string v4, "letal"

    const-string v5, ""

    invoke-static/range {v3 .. v9}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 164
    const/16 v6, 0x100

    const v7, 0x3f0a3d71    # 0.54f

    const-string v3, "tactical"

    const-string v4, "tatical"

    const-string v5, ""

    invoke-static/range {v3 .. v9}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    const v8, 0x3e99999a    # 0.3f

    const v9, 0x3e0f5c29    # 0.14f

    const/16 v6, 0x40

    const v7, 0x3e19999a    # 0.15f

    const-string v3, "run"

    const-string v4, "run"

    const-string v5, ""

    invoke-static/range {v3 .. v9}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 166
    const v8, 0x3e3851ec    # 0.18f

    const v9, 0x3df5c28f    # 0.12f

    const v7, 0x3f70a3d7    # 0.94f

    const-string v3, "hold_breath"

    const-string v4, "hold_breathe"

    const-string v5, ""

    invoke-static/range {v3 .. v9}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 167
    const v8, 0x3df5c28f    # 0.12f

    const v9, 0x3dcccccd    # 0.1f

    const/high16 v6, 0x100000

    const v7, 0x3ed70a3d    # 0.42f

    const-string v3, "special_item"

    const-string v4, "SpecialItem"

    const-string v5, ""

    invoke-static/range {v3 .. v9}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    const v8, 0x3d75c28f    # 0.06f

    const v9, 0x3db851ec    # 0.09f

    const/high16 v6, 0x40000

    const v7, 0x3e99999a    # 0.3f

    const-string v3, "console"

    const-string v4, "OpenCMD"

    const-string v5, "CMD"

    invoke-static/range {v3 .. v9}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    const v8, 0x3d8f5c29    # 0.07f

    const v9, 0x3da3d70a    # 0.08f

    const/16 v6, 0x10

    const v7, 0x3e6147ae    # 0.22f

    const-string v3, "pause"

    const-string v4, "settings"

    const-string v5, ""

    invoke-static/range {v3 .. v9}, Lorg/wiiucoop/bo2android/T6TouchLayout;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IFFF)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    new-instance v1, Lorg/wiiucoop/bo2android/T6TouchLayout;

    const-string v3, "codm"

    invoke-direct {v1, v3, v0}, Lorg/wiiucoop/bo2android/T6TouchLayout;-><init>(Ljava/lang/String;Ljava/util/List;)V

    return-object v1
.end method

.method public static fitSurface(IIII)[I
    .locals 4
    .param p0, "areaWidth"    # I
    .param p1, "areaHeight"    # I
    .param p2, "gameWidth"    # I
    .param p3, "gameHeight"    # I

    .line 225
    if-lez p0, :cond_2

    if-lez p1, :cond_2

    if-lez p2, :cond_2

    if-gtz p3, :cond_0

    goto :goto_0

    .line 227
    :cond_0
    move v0, p0

    .line 228
    .local v0, "width":I
    int-to-float v1, p0

    int-to-float v2, p3

    mul-float/2addr v1, v2

    int-to-float v2, p2

    div-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 229
    .local v1, "height":I
    if-le v1, p1, :cond_1

    .line 230
    move v1, p1

    .line 231
    int-to-float v2, p1

    int-to-float v3, p2

    mul-float/2addr v2, v3

    int-to-float v3, p3

    div-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 233
    :cond_1
    sub-int v2, p0, v0

    div-int/lit8 v2, v2, 0x2

    sub-int v3, p1, v1

    div-int/lit8 v3, v3, 0x2

    filled-new-array {v2, v3, v0, v1}, [I

    move-result-object v2

    return-object v2

    .line 226
    .end local v0    # "width":I
    .end local v1    # "height":I
    :cond_2
    :goto_0
    const/4 v0, 0x0

    invoke-static {p0, v0}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result v2

    filled-new-array {v0, v0, v1, v2}, [I

    move-result-object v0

    return-object v0
.end method

.method private static in(FFF)Z
    .locals 1
    .param p0, "v"    # F
    .param p1, "lo"    # F
    .param p2, "hi"    # F

    .line 368
    cmpl-float v0, p0, p1

    if-ltz v0, :cond_0

    cmpg-float v0, p0, p2

    if-gtz v0, :cond_0

    invoke-static {p0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static load(Ljava/lang/String;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6TouchLayout;
    .locals 17
    .param p0, "profile"    # Ljava/lang/String;
    .param p1, "saved"    # Ljava/lang/String;

    .line 190
    move-object/from16 v1, p1

    invoke-static/range {p0 .. p0}, Lorg/wiiucoop/bo2android/T6TouchLayout;->defaults(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6TouchLayout;

    move-result-object v2

    .line 191
    .local v2, "layout":Lorg/wiiucoop/bo2android/T6TouchLayout;
    if-nez v1, :cond_0

    return-object v2

    .line 192
    :cond_0
    const-string v0, "\n"

    invoke-virtual {v1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    array-length v4, v3

    const/4 v5, 0x0

    move v6, v5

    :goto_0
    if-ge v6, v4, :cond_6

    aget-object v7, v3, v6

    .line 193
    .local v7, "line":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v8, "\\s+"

    invoke-virtual {v0, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 194
    .local v8, "f":[Ljava/lang/String;
    array-length v0, v8

    const/16 v9, 0x8

    if-eq v0, v9, :cond_1

    move-object/from16 v9, p0

    goto/16 :goto_3

    .line 196
    :cond_1
    const-string v0, "codm"

    move-object/from16 v9, p0

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "scoreboard"

    aget-object v10, v8, v5

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "console"

    goto :goto_1

    :cond_2
    aget-object v0, v8, v5

    :goto_1
    invoke-virtual {v2, v0}, Lorg/wiiucoop/bo2android/T6TouchLayout;->find(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v10

    .line 197
    .local v10, "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    if-nez v10, :cond_3

    goto/16 :goto_3

    .line 199
    :cond_3
    const/4 v0, 0x1

    :try_start_0
    aget-object v0, v8, v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    .local v0, "x":F
    const/4 v11, 0x2

    aget-object v11, v8, v11

    invoke-static {v11}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v11

    .local v11, "y":F
    const/4 v12, 0x3

    aget-object v12, v8, v12

    invoke-static {v12}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v12

    .line 200
    .local v12, "size":F
    const/4 v13, 0x4

    aget-object v13, v8, v13

    invoke-static {v13}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v13

    .local v13, "opacity":F
    const/4 v14, 0x6

    aget-object v14, v8, v14

    invoke-static {v14}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v14

    .local v14, "sens":F
    const/4 v15, 0x7

    aget-object v15, v8, v15

    invoke-static {v15}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v15

    .line 201
    .local v15, "dead":F
    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    invoke-static {v0, v1, v5}, Lorg/wiiucoop/bo2android/T6TouchLayout;->in(FFF)Z

    move-result v16

    if-eqz v16, :cond_5

    invoke-static {v11, v1, v5}, Lorg/wiiucoop/bo2android/T6TouchLayout;->in(FFF)Z

    move-result v16

    if-eqz v16, :cond_5

    const v1, 0x3d75c28f    # 0.06f

    const v5, 0x3f666666    # 0.9f

    invoke-static {v12, v1, v5}, Lorg/wiiucoop/bo2android/T6TouchLayout;->in(FFF)Z

    move-result v1

    if-eqz v1, :cond_5

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    invoke-static {v13, v5, v1}, Lorg/wiiucoop/bo2android/T6TouchLayout;->in(FFF)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 202
    const v1, 0x3e4ccccd    # 0.2f

    const/high16 v5, 0x40400000    # 3.0f

    invoke-static {v14, v1, v5}, Lorg/wiiucoop/bo2android/T6TouchLayout;->in(FFF)Z

    move-result v1

    if-eqz v1, :cond_5

    const v1, 0x3f19999a    # 0.6f

    const/4 v5, 0x0

    invoke-static {v15, v5, v1}, Lorg/wiiucoop/bo2android/T6TouchLayout;->in(FFF)Z

    move-result v1

    if-nez v1, :cond_4

    goto :goto_2

    .line 203
    :cond_4
    iput v0, v10, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->x:F

    .line 204
    iput v11, v10, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->y:F

    .line 205
    iput v12, v10, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->size:F

    .line 206
    iput v13, v10, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->opacity:F

    .line 207
    const-string v1, "1"

    const/4 v5, 0x5

    aget-object v5, v8, v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    iput-boolean v1, v10, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->enabled:Z

    .line 208
    iput v14, v10, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->sensitivity:F

    .line 209
    iput v15, v10, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->deadzone:F
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 212
    .end local v0    # "x":F
    .end local v11    # "y":F
    .end local v12    # "size":F
    .end local v13    # "opacity":F
    .end local v14    # "sens":F
    .end local v15    # "dead":F
    goto :goto_3

    .line 202
    .restart local v0    # "x":F
    .restart local v11    # "y":F
    .restart local v12    # "size":F
    .restart local v13    # "opacity":F
    .restart local v14    # "sens":F
    .restart local v15    # "dead":F
    :cond_5
    :goto_2
    goto :goto_3

    .line 210
    .end local v0    # "x":F
    .end local v11    # "y":F
    .end local v12    # "size":F
    .end local v13    # "opacity":F
    .end local v14    # "sens":F
    .end local v15    # "dead":F
    :catch_0
    move-exception v0

    .line 192
    .end local v7    # "line":Ljava/lang/String;
    .end local v8    # "f":[Ljava/lang/String;
    .end local v10    # "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    :goto_3
    add-int/lit8 v6, v6, 0x1

    move-object/from16 v1, p1

    const/4 v5, 0x0

    goto/16 :goto_0

    .line 214
    :cond_6
    move-object/from16 v9, p0

    return-object v2
.end method

.method public static stickAxes(FFFF)[I
    .locals 7
    .param p0, "dx"    # F
    .param p1, "dy"    # F
    .param p2, "deadzone"    # F
    .param p3, "sensitivity"    # F

    .line 383
    mul-float v0, p0, p0

    mul-float v1, p1, p1

    add-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    .line 384
    .local v0, "len":F
    cmpg-float v1, v0, p2

    if-lez v1, :cond_2

    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 385
    :cond_0
    sub-float v1, v0, p2

    const/high16 v2, 0x3f800000    # 1.0f

    sub-float v3, v2, p2

    div-float/2addr v1, v3

    mul-float/2addr v1, p3

    .line 386
    .local v1, "scaled":F
    cmpl-float v2, v1, v2

    if-lez v2, :cond_1

    const/high16 v1, 0x3f800000    # 1.0f

    .line 387
    :cond_1
    div-float v2, p0, v0

    mul-float/2addr v2, v1

    .local v2, "nx":F
    div-float v3, p1, v0

    mul-float/2addr v3, v1

    .line 388
    .local v3, "ny":F
    const v4, 0x46fffe00    # 32767.0f

    mul-float v5, v2, v4

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    neg-float v6, v3

    mul-float/2addr v6, v4

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v4

    filled-new-array {v5, v4}, [I

    move-result-object v4

    return-object v4

    .line 384
    .end local v1    # "scaled":F
    .end local v2    # "nx":F
    .end local v3    # "ny":F
    :cond_2
    :goto_0
    const/4 v1, 0x0

    filled-new-array {v1, v1}, [I

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public copy()Lorg/wiiucoop/bo2android/T6TouchLayout;
    .locals 4

    .line 101
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 102
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lorg/wiiucoop/bo2android/T6TouchLayout$Control;>;"
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchLayout;->controls:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    .local v2, "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    invoke-virtual {v2}, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->copy()Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 103
    .end local v2    # "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    :cond_0
    new-instance v1, Lorg/wiiucoop/bo2android/T6TouchLayout;

    iget-object v2, p0, Lorg/wiiucoop/bo2android/T6TouchLayout;->profile:Ljava/lang/String;

    invoke-direct {v1, v2, v0}, Lorg/wiiucoop/bo2android/T6TouchLayout;-><init>(Ljava/lang/String;Ljava/util/List;)V

    return-object v1
.end method

.method public find(Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    .locals 3
    .param p1, "id"    # Ljava/lang/String;

    .line 112
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchLayout;->controls:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    .local v1, "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    iget-object v2, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->id:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    .end local v1    # "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    :cond_0
    goto :goto_0

    .line 113
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public serialize()Ljava/lang/String;
    .locals 12

    .line 176
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 177
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "profile "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/wiiucoop/bo2android/T6TouchLayout;->profile:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 178
    iget-object v1, p0, Lorg/wiiucoop/bo2android/T6TouchLayout;->controls:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    .line 179
    .local v2, "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    iget-object v4, v2, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->id:Ljava/lang/String;

    iget v5, v2, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->x:F

    .line 180
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    iget v6, v2, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->y:F

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    iget v7, v2, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->size:F

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    iget v8, v2, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->opacity:F

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    iget-boolean v9, v2, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->enabled:Z

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    iget v10, v2, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->sensitivity:F

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    iget v11, v2, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->deadzone:F

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    filled-new-array/range {v4 .. v11}, [Ljava/lang/Object;

    move-result-object v4

    .line 179
    const-string v5, "%s %.4f %.4f %.4f %.3f %d %.3f %.3f\n"

    invoke-static {v3, v5, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .end local v2    # "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    goto :goto_0

    .line 182
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public stickDeadzone()F
    .locals 4

    .line 363
    iget-object v0, p0, Lorg/wiiucoop/bo2android/T6TouchLayout;->controls:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;

    .local v1, "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    iget-object v2, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->kind:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    sget-object v3, Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;->STICK_LEFT:Lorg/wiiucoop/bo2android/T6TouchLayout$Kind;

    if-ne v2, v3, :cond_0

    iget v0, v1, Lorg/wiiucoop/bo2android/T6TouchLayout$Control;->deadzone:F

    const/4 v2, 0x0

    const v3, 0x3f19999a    # 0.6f

    invoke-static {v0, v2, v3}, Lorg/wiiucoop/bo2android/T6TouchLayout;->clamp(FFF)F

    move-result v0

    return v0

    .end local v1    # "c":Lorg/wiiucoop/bo2android/T6TouchLayout$Control;
    :cond_0
    goto :goto_0

    .line 364
    :cond_1
    const v0, 0x3df5c28f    # 0.12f

    return v0
.end method
