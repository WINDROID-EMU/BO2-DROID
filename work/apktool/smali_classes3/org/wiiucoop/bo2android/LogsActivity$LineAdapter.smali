.class final Lorg/wiiucoop/bo2android/LogsActivity$LineAdapter;
.super Landroid/widget/BaseAdapter;
.source "LogsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/wiiucoop/bo2android/LogsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "LineAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/wiiucoop/bo2android/LogsActivity;


# direct methods
.method private constructor <init>(Lorg/wiiucoop/bo2android/LogsActivity;)V
    .locals 0

    .line 289
    iput-object p1, p0, Lorg/wiiucoop/bo2android/LogsActivity$LineAdapter;->this$0:Lorg/wiiucoop/bo2android/LogsActivity;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/wiiucoop/bo2android/LogsActivity;Lorg/wiiucoop/bo2android/LogsActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/wiiucoop/bo2android/LogsActivity;
    .param p2, "x1"    # Lorg/wiiucoop/bo2android/LogsActivity$1;

    .line 289
    invoke-direct {p0, p1}, Lorg/wiiucoop/bo2android/LogsActivity$LineAdapter;-><init>(Lorg/wiiucoop/bo2android/LogsActivity;)V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 290
    iget-object v0, p0, Lorg/wiiucoop/bo2android/LogsActivity$LineAdapter;->this$0:Lorg/wiiucoop/bo2android/LogsActivity;

    invoke-static {v0}, Lorg/wiiucoop/bo2android/LogsActivity;->access$200(Lorg/wiiucoop/bo2android/LogsActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I

    .line 291
    iget-object v0, p0, Lorg/wiiucoop/bo2android/LogsActivity$LineAdapter;->this$0:Lorg/wiiucoop/bo2android/LogsActivity;

    invoke-static {v0}, Lorg/wiiucoop/bo2android/LogsActivity;->access$200(Lorg/wiiucoop/bo2android/LogsActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .line 292
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .line 296
    instance-of v0, p2, Landroid/widget/TextView;

    if-eqz v0, :cond_0

    move-object v0, p2

    check-cast v0, Landroid/widget/TextView;

    goto :goto_0

    :cond_0
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/LogsActivity$LineAdapter;->this$0:Lorg/wiiucoop/bo2android/LogsActivity;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 297
    .local v0, "view":Landroid/widget/TextView;
    :goto_0
    if-nez p2, :cond_1

    .line 298
    sget-object v1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 299
    const/high16 v1, 0x41300000    # 11.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 300
    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 302
    :cond_1
    iget-object v1, p0, Lorg/wiiucoop/bo2android/LogsActivity$LineAdapter;->this$0:Lorg/wiiucoop/bo2android/LogsActivity;

    invoke-static {v1}, Lorg/wiiucoop/bo2android/LogsActivity;->access$200(Lorg/wiiucoop/bo2android/LogsActivity;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/wiiucoop/bo2android/T6Logs$Line;

    .line 303
    .local v1, "line":Lorg/wiiucoop/bo2android/T6Logs$Line;
    invoke-virtual {v1}, Lorg/wiiucoop/bo2android/T6Logs$Line;->format()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 305
    iget-char v2, v1, Lorg/wiiucoop/bo2android/T6Logs$Line;->level:C

    const/16 v3, 0x45

    if-eq v2, v3, :cond_5

    iget-char v2, v1, Lorg/wiiucoop/bo2android/T6Logs$Line;->level:C

    const/16 v3, 0x46

    if-ne v2, v3, :cond_2

    goto :goto_2

    .line 306
    :cond_2
    iget-char v2, v1, Lorg/wiiucoop/bo2android/T6Logs$Line;->level:C

    const/16 v3, 0x57

    if-ne v2, v3, :cond_3

    iget-object v2, p0, Lorg/wiiucoop/bo2android/LogsActivity$LineAdapter;->this$0:Lorg/wiiucoop/bo2android/LogsActivity;

    sget v3, Lorg/wiiucoop/bo2android/R$color;->t6_warning:I

    invoke-virtual {v2, v3}, Lorg/wiiucoop/bo2android/LogsActivity;->getColor(I)I

    move-result v2

    goto :goto_3

    .line 307
    :cond_3
    invoke-virtual {v0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-char v3, v1, Lorg/wiiucoop/bo2android/T6Logs$Line;->level:C

    const/16 v4, 0x49

    if-ne v3, v4, :cond_4

    sget v3, Lorg/wiiucoop/bo2android/R$attr;->t6c_text_ff:I

    goto :goto_1

    :cond_4
    sget v3, Lorg/wiiucoop/bo2android/R$attr;->t6c_text_dim_ff:I

    :goto_1
    invoke-static {v2, v3}, Lorg/wiiucoop/bo2android/T6Ui;->themeColor(Landroid/content/Context;I)I

    move-result v2

    goto :goto_3

    .line 305
    :cond_5
    :goto_2
    iget-object v2, p0, Lorg/wiiucoop/bo2android/LogsActivity$LineAdapter;->this$0:Lorg/wiiucoop/bo2android/LogsActivity;

    sget v3, Lorg/wiiucoop/bo2android/R$color;->t6_danger:I

    invoke-virtual {v2, v3}, Lorg/wiiucoop/bo2android/LogsActivity;->getColor(I)I

    move-result v2

    .line 307
    :goto_3
    nop

    .line 308
    .local v2, "color":I
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 309
    return-object v0
.end method
