.class public final Lorg/wiiucoop/bo2android/EnvVarsActivity;
.super Landroid/app/Activity;
.source "EnvVarsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/wiiucoop/bo2android/EnvVarsActivity$Watcher;,
        Lorg/wiiucoop/bo2android/EnvVarsActivity$OnText;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "t6android"


# instance fields
.field private rows:Landroid/widget/LinearLayout;

.field private saved:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/wiiucoop/bo2android/T6EnvVars$Var;",
            ">;"
        }
    .end annotation
.end field

.field private status:Landroid/widget/TextView;

.field private final vars:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/wiiucoop/bo2android/T6EnvVars$Var;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 27
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->vars:Ljava/util/List;

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->saved:Ljava/util/List;

    return-void
.end method

.method static synthetic access$000(Lorg/wiiucoop/bo2android/EnvVarsActivity;)V
    .locals 0
    .param p0, "x0"    # Lorg/wiiucoop/bo2android/EnvVarsActivity;

    .line 27
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->refreshStatus()V

    return-void
.end method

.method private gameRunning()Z
    .locals 7

    .line 200
    const-string v0, "activity"

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 201
    .local v0, "am":Landroid/app/ActivityManager;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v1

    .line 202
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    :goto_0
    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 203
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 204
    .local v4, "p":Landroid/app/ActivityManager$RunningAppProcessInfo;
    iget-object v5, v4, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    if-eqz v5, :cond_2

    iget-object v5, v4, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    const-string v6, ":game"

    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    const/4 v2, 0x1

    return v2

    .line 205
    .end local v4    # "p":Landroid/app/ActivityManager$RunningAppProcessInfo;
    :cond_3
    return v2
.end method

.method static synthetic lambda$rebuildRows$2(Lorg/wiiucoop/bo2android/T6EnvVars$Var;Ljava/lang/String;)V
    .locals 1
    .param p0, "v"    # Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    .param p1, "text"    # Ljava/lang/String;

    .line 118
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->name:Ljava/lang/String;

    return-void
.end method

.method static synthetic lambda$rebuildRows$3(Landroid/widget/EditText;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p0, "value"    # Landroid/widget/EditText;
    .param p1, "tv"    # Landroid/widget/TextView;
    .param p2, "action"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .line 121
    invoke-virtual {p0}, Landroid/widget/EditText;->requestFocus()Z

    .line 122
    const/4 v0, 0x1

    return v0
.end method

.method static synthetic lambda$rebuildRows$4(Lorg/wiiucoop/bo2android/T6EnvVars$Var;Ljava/lang/String;)V
    .locals 0
    .param p0, "v"    # Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    .param p1, "text"    # Ljava/lang/String;

    .line 124
    iput-object p1, p0, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->value:Ljava/lang/String;

    return-void
.end method

.method private leave()V
    .locals 3

    .line 91
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->sameAsSaved()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 92
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->finish()V

    .line 93
    return-void

    .line 95
    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v1, Lorg/wiiucoop/bo2android/R$string;->env_leave_unsaved:I

    .line 96
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lorg/wiiucoop/bo2android/R$string;->env_save:I

    new-instance v2, Lorg/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda5;

    invoke-direct {v2, p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda5;-><init>(Lorg/wiiucoop/bo2android/EnvVarsActivity;)V

    .line 97
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lorg/wiiucoop/bo2android/R$string;->env_discard:I

    new-instance v2, Lorg/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda6;

    invoke-direct {v2, p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda6;-><init>(Lorg/wiiucoop/bo2android/EnvVarsActivity;)V

    .line 101
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lorg/wiiucoop/bo2android/R$string;->action_cancel:I

    .line 102
    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 103
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 104
    return-void
.end method

.method private problemText(Lorg/wiiucoop/bo2android/T6EnvVars$Problem;)Ljava/lang/String;
    .locals 2
    .param p1, "p"    # Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    .line 209
    sget-object v0, Lorg/wiiucoop/bo2android/EnvVarsActivity$1;->$SwitchMap$org$wiiucoop$bo2android$T6EnvVars$Problem:[I

    invoke-virtual {p1}, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 219
    const-string v0, ""

    return-object v0

    .line 218
    :pswitch_0
    sget v0, Lorg/wiiucoop/bo2android/R$string;->env_problem_duplicate:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 217
    :pswitch_1
    sget v0, Lorg/wiiucoop/bo2android/R$string;->env_problem_line_break:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 216
    :pswitch_2
    sget v0, Lorg/wiiucoop/bo2android/R$string;->env_problem_value_long:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 215
    :pswitch_3
    sget v0, Lorg/wiiucoop/bo2android/R$string;->env_problem_wsi:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 214
    :pswitch_4
    sget v0, Lorg/wiiucoop/bo2android/R$string;->env_problem_android:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 213
    :pswitch_5
    sget v0, Lorg/wiiucoop/bo2android/R$string;->env_problem_linker:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 212
    :pswitch_6
    sget v0, Lorg/wiiucoop/bo2android/R$string;->env_problem_syntax:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 211
    :pswitch_7
    sget v0, Lorg/wiiucoop/bo2android/R$string;->env_problem_name_long:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 210
    :pswitch_8
    sget v0, Lorg/wiiucoop/bo2android/R$string;->env_problem_empty:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private rebuildRows()V
    .locals 10

    .line 107
    iget-object v0, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 108
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 109
    .local v0, "inflater":Landroid/view/LayoutInflater;
    iget-object v1, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->vars:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/wiiucoop/bo2android/T6EnvVars$Var;

    .line 110
    .local v2, "v":Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    sget v4, Lorg/wiiucoop/bo2android/R$layout;->view_env_row:I

    iget-object v5, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v4, v5, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 111
    .local v3, "row":Landroid/view/View;
    sget v4, Lorg/wiiucoop/bo2android/R$id;->edit_env_name:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/EditText;

    .line 112
    .local v4, "name":Landroid/widget/EditText;
    sget v5, Lorg/wiiucoop/bo2android/R$id;->edit_env_value:I

    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    .line 113
    .local v5, "value":Landroid/widget/EditText;
    sget v6, Lorg/wiiucoop/bo2android/R$id;->switch_env_enabled:I

    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/Switch;

    .line 114
    .local v6, "enabled":Landroid/widget/Switch;
    sget v7, Lorg/wiiucoop/bo2android/R$id;->button_env_remove:I

    invoke-virtual {v3, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/Button;

    .line 115
    .local v7, "remove":Landroid/widget/Button;
    iget-object v8, v2, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->name:Ljava/lang/String;

    invoke-virtual {v4, v8}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 116
    iget-object v8, v2, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->value:Ljava/lang/String;

    invoke-virtual {v5, v8}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 117
    iget-boolean v8, v2, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->enabled:Z

    invoke-virtual {v6, v8}, Landroid/widget/Switch;->setChecked(Z)V

    .line 118
    new-instance v8, Lorg/wiiucoop/bo2android/EnvVarsActivity$Watcher;

    new-instance v9, Lorg/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda0;

    invoke-direct {v9, v2}, Lorg/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda0;-><init>(Lorg/wiiucoop/bo2android/T6EnvVars$Var;)V

    invoke-direct {v8, p0, v9}, Lorg/wiiucoop/bo2android/EnvVarsActivity$Watcher;-><init>(Lorg/wiiucoop/bo2android/EnvVarsActivity;Lorg/wiiucoop/bo2android/EnvVarsActivity$OnText;)V

    invoke-virtual {v4, v8}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 120
    new-instance v8, Lorg/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda1;

    invoke-direct {v8, v5}, Lorg/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda1;-><init>(Landroid/widget/EditText;)V

    invoke-virtual {v4, v8}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 124
    new-instance v8, Lorg/wiiucoop/bo2android/EnvVarsActivity$Watcher;

    new-instance v9, Lorg/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda2;

    invoke-direct {v9, v2}, Lorg/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda2;-><init>(Lorg/wiiucoop/bo2android/T6EnvVars$Var;)V

    invoke-direct {v8, p0, v9}, Lorg/wiiucoop/bo2android/EnvVarsActivity$Watcher;-><init>(Lorg/wiiucoop/bo2android/EnvVarsActivity;Lorg/wiiucoop/bo2android/EnvVarsActivity$OnText;)V

    invoke-virtual {v5, v8}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 125
    new-instance v8, Lorg/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda3;

    invoke-direct {v8, p0, v2}, Lorg/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda3;-><init>(Lorg/wiiucoop/bo2android/EnvVarsActivity;Lorg/wiiucoop/bo2android/T6EnvVars$Var;)V

    invoke-virtual {v6, v8}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 129
    new-instance v8, Lorg/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda4;

    invoke-direct {v8, p0, v2}, Lorg/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda4;-><init>(Lorg/wiiucoop/bo2android/EnvVarsActivity;Lorg/wiiucoop/bo2android/T6EnvVars$Var;)V

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 134
    iget-object v8, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v8, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 135
    .end local v2    # "v":Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    .end local v3    # "row":Landroid/view/View;
    .end local v4    # "name":Landroid/widget/EditText;
    .end local v5    # "value":Landroid/widget/EditText;
    .end local v6    # "enabled":Landroid/widget/Switch;
    .end local v7    # "remove":Landroid/widget/Button;
    goto :goto_0

    .line 136
    :cond_0
    sget v1, Lorg/wiiucoop/bo2android/R$id;->text_env_empty:I

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->vars:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_1

    :cond_1
    const/16 v3, 0x8

    :goto_1
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 137
    return-void
.end method

.method private refreshStatus()V
    .locals 6

    .line 172
    iget-object v0, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->status:Landroid/widget/TextView;

    if-nez v0, :cond_0

    return-void

    .line 173
    :cond_0
    iget-object v0, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->saved:Ljava/util/List;

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6EnvVars;->effective(Ljava/util/List;)Ljava/util/Map;

    move-result-object v0

    .line 174
    .local v0, "next":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 175
    .local v1, "sb":Ljava/lang/StringBuilder;
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 176
    sget v2, Lorg/wiiucoop/bo2android/R$string;->env_status_none:I

    invoke-virtual {p0, v2}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 178
    :cond_1
    sget v2, Lorg/wiiucoop/bo2android/R$string;->env_status_next:I

    invoke-virtual {p0, v2}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .local v3, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v4, "\n"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x3d

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 181
    .end local v3    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2
    :goto_1
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->gameRunning()Z

    move-result v2

    .line 182
    .local v2, "running":Z
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-static {v3}, Lorg/wiiucoop/bo2android/T6EnvVars;->applied(Ljava/io/File;)Ljava/util/Map;

    move-result-object v3

    iget-object v4, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->saved:Ljava/util/List;

    invoke-static {v2, v3, v4}, Lorg/wiiucoop/bo2android/T6EnvVars;->pendingRestart(ZLjava/util/Map;Ljava/util/List;)Z

    move-result v3

    const-string v4, "\n\n"

    if-eqz v3, :cond_3

    .line 183
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget v5, Lorg/wiiucoop/bo2android/R$string;->env_status_restart:I

    invoke-virtual {p0, v5}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    :cond_3
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->sameAsSaved()Z

    move-result v3

    if-nez v3, :cond_4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget v4, Lorg/wiiucoop/bo2android/R$string;->env_status_unsaved:I

    invoke-virtual {p0, v4}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    :cond_4
    iget-object v3, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    return-void
.end method

.method private sameAsSaved()Z
    .locals 6

    .line 190
    iget-object v0, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->vars:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->saved:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    return v2

    .line 191
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->vars:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 192
    iget-object v1, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->vars:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/wiiucoop/bo2android/T6EnvVars$Var;

    .local v1, "a":Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    iget-object v3, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->saved:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/wiiucoop/bo2android/T6EnvVars$Var;

    .line 193
    .local v3, "b":Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    iget-object v4, v1, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->name:Ljava/lang/String;

    iget-object v5, v3, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    iget-object v4, v1, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->value:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, v3, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->value:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    iget-boolean v4, v1, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->enabled:Z

    iget-boolean v5, v3, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->enabled:Z

    if-eq v4, v5, :cond_1

    goto :goto_1

    .line 191
    .end local v1    # "a":Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    .end local v3    # "b":Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 193
    .restart local v1    # "a":Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    .restart local v3    # "b":Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    :cond_2
    :goto_1
    return v2

    .line 195
    .end local v0    # "i":I
    .end local v1    # "a":Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    .end local v3    # "b":Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    :cond_3
    const/4 v0, 0x1

    return v0
.end method

.method private save()V
    .locals 8

    .line 141
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 142
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lorg/wiiucoop/bo2android/T6EnvVars$Var;>;"
    iget-object v1, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->vars:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/wiiucoop/bo2android/T6EnvVars$Var;

    .local v2, "v":Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    iget-object v3, v2, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->name:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, v2, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->value:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v3, v2, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->value:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    :cond_1
    invoke-virtual {v2}, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->copy()Lorg/wiiucoop/bo2android/T6EnvVars$Var;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 143
    .end local v2    # "v":Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    :cond_2
    const/4 v1, 0x0

    filled-new-array {v1}, [I

    move-result-object v2

    .line 144
    .local v2, "at":[I
    invoke-static {v0, v2}, Lorg/wiiucoop/bo2android/T6EnvVars;->listProblem(Ljava/util/List;[I)Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    move-result-object v3

    .line 145
    .local v3, "p":Lorg/wiiucoop/bo2android/T6EnvVars$Problem;
    sget-object v4, Lorg/wiiucoop/bo2android/T6EnvVars$Problem;->OK:Lorg/wiiucoop/bo2android/T6EnvVars$Problem;

    const-string v5, "settings: env vars not saved: "

    const-string v6, "t6android"

    if-eq v3, v4, :cond_4

    .line 146
    aget v4, v2, v1

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/wiiucoop/bo2android/T6EnvVars$Var;

    iget-object v4, v4, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->name:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "#"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget v1, v2, v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_3
    aget v1, v2, v1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/wiiucoop/bo2android/T6EnvVars$Var;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->name:Ljava/lang/String;

    .line 147
    .local v1, "who":Ljava/lang/String;
    :goto_1
    sget v4, Lorg/wiiucoop/bo2android/R$string;->env_invalid:I

    invoke-direct {p0, v3}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->problemText(Lorg/wiiucoop/bo2android/T6EnvVars$Problem;)Ljava/lang/String;

    move-result-object v7

    filled-new-array {v1, v7}, [Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {p0, v4, v7}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->toast(Ljava/lang/String;)V

    .line 148
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    return-void

    .line 151
    .end local v1    # "who":Ljava/lang/String;
    :cond_4
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/16 v4, 0x40

    if-le v1, v4, :cond_5

    .line 152
    sget v1, Lorg/wiiucoop/bo2android/R$string;->env_too_many:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v1, v4}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->toast(Ljava/lang/String;)V

    .line 153
    return-void

    .line 156
    :cond_5
    :try_start_0
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-static {v1, v0}, Lorg/wiiucoop/bo2android/T6EnvVars;->save(Ljava/io/File;Ljava/util/List;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    nop

    .line 162
    iput-object v0, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->saved:Ljava/util/List;

    .line 163
    iget-object v1, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->vars:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 164
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/wiiucoop/bo2android/T6EnvVars$Var;

    .local v4, "v":Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    iget-object v5, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->vars:Ljava/util/List;

    invoke-virtual {v4}, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->copy()Lorg/wiiucoop/bo2android/T6EnvVars$Var;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 165
    .end local v4    # "v":Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    :cond_6
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->rebuildRows()V

    .line 166
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "settings: env vars saved: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6EnvVars;->effective(Ljava/util/List;)Ljava/util/Map;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, " ("

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, " line(s))"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v6, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->gameRunning()Z

    move-result v1

    if-eqz v1, :cond_7

    sget v1, Lorg/wiiucoop/bo2android/R$string;->env_saved_restart:I

    goto :goto_3

    :cond_7
    sget v1, Lorg/wiiucoop/bo2android/R$string;->env_saved:I

    :goto_3
    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->toast(Ljava/lang/String;)V

    .line 168
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->refreshStatus()V

    .line 169
    return-void

    .line 157
    :catch_0
    move-exception v1

    .line 158
    .local v1, "e":Ljava/io/IOException;
    sget v4, Lorg/wiiucoop/bo2android/R$string;->env_save_failed:I

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {p0, v4, v7}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->toast(Ljava/lang/String;)V

    .line 159
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    return-void
.end method

.method private toast(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .line 224
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 225
    return-void
.end method


# virtual methods
.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 1
    .param p1, "base"    # Landroid/content/Context;

    .line 33
    invoke-static {p1}, Lorg/wiiucoop/bo2android/T6Ui;->wrapLocale(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/app/Activity;->attachBaseContext(Landroid/content/Context;)V

    .line 34
    return-void
.end method

.method synthetic lambda$leave$0$org-wiiucoop-bo2android-EnvVarsActivity(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "d"    # Landroid/content/DialogInterface;
    .param p2, "w"    # I

    .line 98
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->save()V

    .line 99
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->sameAsSaved()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->finish()V

    .line 100
    :cond_0
    return-void
.end method

.method synthetic lambda$leave$1$org-wiiucoop-bo2android-EnvVarsActivity(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "d"    # Landroid/content/DialogInterface;
    .param p2, "w"    # I

    .line 101
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->finish()V

    return-void
.end method

.method synthetic lambda$rebuildRows$5$org-wiiucoop-bo2android-EnvVarsActivity(Lorg/wiiucoop/bo2android/T6EnvVars$Var;Landroid/widget/CompoundButton;Z)V
    .locals 0
    .param p1, "v"    # Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    .param p2, "b"    # Landroid/widget/CompoundButton;
    .param p3, "checked"    # Z

    .line 126
    iput-boolean p3, p1, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->enabled:Z

    .line 127
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->refreshStatus()V

    .line 128
    return-void
.end method

.method synthetic lambda$rebuildRows$6$org-wiiucoop-bo2android-EnvVarsActivity(Lorg/wiiucoop/bo2android/T6EnvVars$Var;Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    .param p2, "x"    # Landroid/view/View;

    .line 130
    iget-object v0, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->vars:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 131
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->rebuildRows()V

    .line 132
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->refreshStatus()V

    .line 133
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .line 86
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->leave()V

    .line 87
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .line 71
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 72
    .local v0, "id":I
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_back:I

    if-ne v0, v1, :cond_0

    .line 73
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->leave()V

    goto :goto_1

    .line 74
    :cond_0
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_env_add:I

    if-ne v0, v1, :cond_1

    .line 75
    iget-object v1, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->vars:Ljava/util/List;

    new-instance v2, Lorg/wiiucoop/bo2android/T6EnvVars$Var;

    const-string v3, ""

    const/4 v4, 0x1

    invoke-direct {v2, v3, v3, v4}, Lorg/wiiucoop/bo2android/T6EnvVars$Var;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->rebuildRows()V

    .line 77
    iget-object v1, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->rows:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    sub-int/2addr v2, v4

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 78
    .local v1, "last":Landroid/view/View;
    if-eqz v1, :cond_2

    sget v2, Lorg/wiiucoop/bo2android/R$id;->edit_env_name:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->requestFocus()Z

    goto :goto_0

    .line 79
    .end local v1    # "last":Landroid/view/View;
    :cond_1
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_env_save:I

    if-ne v0, v1, :cond_2

    .line 80
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->save()V

    goto :goto_1

    .line 79
    :cond_2
    :goto_0
    nop

    .line 82
    :goto_1
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 43
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->applyTheme(Landroid/app/Activity;)V

    .line 44
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 45
    sget v0, Lorg/wiiucoop/bo2android/R$layout;->activity_env_vars:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->setContentView(I)V

    .line 46
    sget v0, Lorg/wiiucoop/bo2android/R$id;->env_rows:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->rows:Landroid/widget/LinearLayout;

    .line 47
    sget v0, Lorg/wiiucoop/bo2android/R$id;->text_env_status:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->status:Landroid/widget/TextView;

    .line 48
    sget v0, Lorg/wiiucoop/bo2android/R$id;->button_back:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 49
    sget v0, Lorg/wiiucoop/bo2android/R$id;->button_env_add:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    sget v0, Lorg/wiiucoop/bo2android/R$id;->button_env_save:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 51
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lorg/wiiucoop/bo2android/T6EnvVars;->load(Ljava/io/File;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->saved:Ljava/util/List;

    .line 52
    iget-object v0, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->saved:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/wiiucoop/bo2android/T6EnvVars$Var;

    .local v1, "v":Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    iget-object v2, p0, Lorg/wiiucoop/bo2android/EnvVarsActivity;->vars:Ljava/util/List;

    invoke-virtual {v1}, Lorg/wiiucoop/bo2android/T6EnvVars$Var;->copy()Lorg/wiiucoop/bo2android/T6EnvVars$Var;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 53
    .end local v1    # "v":Lorg/wiiucoop/bo2android/T6EnvVars$Var;
    :cond_0
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->rebuildRows()V

    .line 54
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->refreshStatus()V

    .line 55
    return-void
.end method

.method protected onResume()V
    .locals 0

    .line 59
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 60
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/EnvVarsActivity;->refreshStatus()V

    .line 61
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0
    .param p1, "hasFocus"    # Z

    .line 65
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 66
    if-eqz p1, :cond_0

    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->applyImmersive(Landroid/app/Activity;)V

    .line 67
    :cond_0
    return-void
.end method
