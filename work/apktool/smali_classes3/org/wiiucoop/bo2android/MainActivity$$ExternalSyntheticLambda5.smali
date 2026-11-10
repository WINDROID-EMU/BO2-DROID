.class public final synthetic Lorg/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lorg/wiiucoop/bo2android/T6TouchOverlay$PadSink;


# instance fields
.field public final synthetic f$0:Lorg/wiiucoop/bo2android/MainActivity;


# direct methods
.method public synthetic constructor <init>(Lorg/wiiucoop/bo2android/MainActivity;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda5;->f$0:Lorg/wiiucoop/bo2android/MainActivity;

    return-void
.end method


# virtual methods
.method public final onPad(ZIIIIIII)V
    .locals 10

    .line 0
    move-object v0, p0

    iget-object v1, v0, Lorg/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda5;->f$0:Lorg/wiiucoop/bo2android/MainActivity;

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    invoke-virtual/range {v1 .. v9}, Lorg/wiiucoop/bo2android/MainActivity;->lambda$prepareTouchControls$4$org-wiiucoop-bo2android-MainActivity(ZIIIIIII)V

    return-void
.end method
