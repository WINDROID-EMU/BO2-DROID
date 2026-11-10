.class public Lorg/wiiucoop/bo2android/LogsActivity;
.super Landroid/app/Activity;
.source "LogsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/wiiucoop/bo2android/LogsActivity$LineAdapter;
    }
.end annotation


# static fields
.field private static final COPY_LIMIT:I = 0x7d0

.field private static final LEVELS:[C

.field private static final REFRESH_MS:J = 0xbb8L

.field private static final REQUEST_EXPORT:I = 0x29

.field private static final SNAPSHOT_LINES:I = 0x4e20

.field private static final TAG:Ljava/lang/String; = "t6android"


# instance fields
.field private adapter:Lorg/wiiucoop/bo2android/LogsActivity$LineAdapter;

.field private final buffer:Lorg/wiiucoop/bo2android/T6Logs$Buffer;

.field private category:I

.field private countText:Landroid/widget/TextView;

.field private exportCategory:I

.field private exportText:Ljava/lang/String;

.field private final handler:Landroid/os/Handler;

.field private levelIndex:I

.field private loading:Z

.field private paused:Z

.field private resumed:Z

.field private search:Landroid/widget/EditText;

.field private final shown:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/wiiucoop/bo2android/T6Logs$Line;",
            ">;"
        }
    .end annotation
.end field

.field private final tick:Ljava/lang/Runnable;


# direct methods
.method public static synthetic $r8$lambda$voq3szJVC-YHE-BcZLzyUZxnnbs(Lorg/wiiucoop/bo2android/LogsActivity;)V
    .locals 0

    invoke-direct {p0}, Lorg/wiiucoop/bo2android/LogsActivity;->refreshNow()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 50
    const/4 v0, 0x5

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lorg/wiiucoop/bo2android/LogsActivity;->LEVELS:[C

    return-void

    nop

    :array_0
    .array-data 2
        0x56s
        0x44s
        0x49s
        0x57s
        0x45s
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    .line 43
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 52
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->handler:Landroid/os/Handler;

    .line 53
    new-instance v0, Lorg/wiiucoop/bo2android/T6Logs$Buffer;

    invoke-direct {v0}, Lorg/wiiucoop/bo2android/T6Logs$Buffer;-><init>()V

    iput-object v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->buffer:Lorg/wiiucoop/bo2android/T6Logs$Buffer;

    .line 54
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->shown:Ljava/util/List;

    .line 55
    new-instance v0, Lorg/wiiucoop/bo2android/LogsActivity$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Lorg/wiiucoop/bo2android/LogsActivity$$ExternalSyntheticLambda4;-><init>(Lorg/wiiucoop/bo2android/LogsActivity;)V

    iput-object v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->tick:Ljava/lang/Runnable;

    .line 57
    const/4 v0, -0x1

    iput v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->category:I

    .line 58
    const/4 v1, 0x0

    iput v1, p0, Lorg/wiiucoop/bo2android/LogsActivity;->levelIndex:I

    .line 62
    iput v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->exportCategory:I

    .line 63
    const-string v0, ""

    iput-object v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->exportText:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$100(Lorg/wiiucoop/bo2android/LogsActivity;)V
    .locals 0
    .param p0, "x0"    # Lorg/wiiucoop/bo2android/LogsActivity;

    .line 43
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/LogsActivity;->applyFilter()V

    return-void
.end method

.method static synthetic access$200(Lorg/wiiucoop/bo2android/LogsActivity;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lorg/wiiucoop/bo2android/LogsActivity;

    .line 43
    iget-object v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->shown:Ljava/util/List;

    return-object v0
.end method

.method private applyFilter()V
    .locals 5

    .line 207
    iget-object v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->shown:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 208
    iget-object v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->shown:Ljava/util/List;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/LogsActivity;->buffer:Lorg/wiiucoop/bo2android/T6Logs$Buffer;

    iget v2, p0, Lorg/wiiucoop/bo2android/LogsActivity;->category:I

    sget-object v3, Lorg/wiiucoop/bo2android/LogsActivity;->LEVELS:[C

    iget v4, p0, Lorg/wiiucoop/bo2android/LogsActivity;->levelIndex:I

    aget-char v3, v3, v4

    iget-object v4, p0, Lorg/wiiucoop/bo2android/LogsActivity;->search:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Lorg/wiiucoop/bo2android/T6Logs$Buffer;->filter(ICLjava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 209
    iget-object v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->adapter:Lorg/wiiucoop/bo2android/LogsActivity$LineAdapter;

    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/LogsActivity$LineAdapter;->notifyDataSetChanged()V

    .line 210
    iget-object v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->countText:Landroid/widget/TextView;

    sget v1, Lorg/wiiucoop/bo2android/R$string;->logs_count:I

    iget-object v2, p0, Lorg/wiiucoop/bo2android/LogsActivity;->shown:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/wiiucoop/bo2android/LogsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 211
    return-void
.end method

.method private categoryName(I)Ljava/lang/String;
    .locals 1
    .param p1, "c"    # I

    .line 276
    packed-switch p1, :pswitch_data_0

    .line 281
    sget v0, Lorg/wiiucoop/bo2android/R$string;->logs_cat_all:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/LogsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 280
    :pswitch_0
    sget v0, Lorg/wiiucoop/bo2android/R$string;->logs_cat_audio_net:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/LogsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 279
    :pswitch_1
    sget v0, Lorg/wiiucoop/bo2android/R$string;->logs_cat_host:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/LogsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 278
    :pswitch_2
    sget v0, Lorg/wiiucoop/bo2android/R$string;->logs_cat_graphics:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/LogsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 277
    :pswitch_3
    sget v0, Lorg/wiiucoop/bo2android/R$string;->logs_cat_engine:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/LogsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private chooseExport()V
    .locals 5

    .line 223
    iget v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->category:I

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/LogsActivity;->categoryName(I)Ljava/lang/String;

    move-result-object v0

    .line 224
    .local v0, "current":Ljava/lang/String;
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    sget v2, Lorg/wiiucoop/bo2android/R$string;->logs_export_current:I

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lorg/wiiucoop/bo2android/LogsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    sget v2, Lorg/wiiucoop/bo2android/R$string;->logs_export_all:I

    invoke-virtual {p0, v2}, Lorg/wiiucoop/bo2android/LogsActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    .line 225
    .local v1, "items":[Ljava/lang/String;
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v3, Lorg/wiiucoop/bo2android/R$string;->logs_export:I

    .line 226
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lorg/wiiucoop/bo2android/LogsActivity$$ExternalSyntheticLambda1;

    invoke-direct {v3, p0}, Lorg/wiiucoop/bo2android/LogsActivity$$ExternalSyntheticLambda1;-><init>(Lorg/wiiucoop/bo2android/LogsActivity;)V

    .line 227
    invoke-virtual {v2, v1, v3}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    sget v3, Lorg/wiiucoop/bo2android/R$string;->action_cancel:I

    .line 228
    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 229
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 230
    return-void
.end method

.method private copyShown()V
    .locals 5

    .line 214
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 215
    .local v0, "sb":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lorg/wiiucoop/bo2android/LogsActivity;->shown:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit16 v1, v1, -0x7d0

    const/4 v2, 0x0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 216
    .local v1, "from":I
    move v2, v1

    .local v2, "i":I
    :goto_0
    iget-object v3, p0, Lorg/wiiucoop/bo2android/LogsActivity;->shown:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    iget-object v3, p0, Lorg/wiiucoop/bo2android/LogsActivity;->shown:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/wiiucoop/bo2android/T6Logs$Line;

    invoke-virtual {v3}, Lorg/wiiucoop/bo2android/T6Logs$Line;->format()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 217
    .end local v2    # "i":I
    :cond_0
    const-string v2, "clipboard"

    invoke-virtual {p0, v2}, Lorg/wiiucoop/bo2android/LogsActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/ClipboardManager;

    .line 218
    .local v2, "clipboard":Landroid/content/ClipboardManager;
    if-eqz v2, :cond_1

    const-string v3, "T6 logs"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 219
    :cond_1
    sget v3, Lorg/wiiucoop/bo2android/R$string;->logs_copied:I

    iget-object v4, p0, Lorg/wiiucoop/bo2android/LogsActivity;->shown:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    sub-int/2addr v4, v1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lorg/wiiucoop/bo2android/LogsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/wiiucoop/bo2android/LogsActivity;->toast(Ljava/lang/String;)V

    .line 220
    return-void
.end method

.method private static readLogcat()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 188
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 189
    .local v0, "lines":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 191
    .local v1, "process":Ljava/lang/Process;
    :try_start_0
    new-instance v2, Ljava/lang/ProcessBuilder;

    const/4 v3, 0x6

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "logcat"

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, "-d"

    const/4 v5, 0x1

    aput-object v4, v3, v5

    const-string v4, "-v"

    const/4 v6, 0x2

    aput-object v4, v3, v6

    const-string v4, "threadtime"

    const/4 v6, 0x3

    aput-object v4, v3, v6

    const-string v4, "-t"

    const/4 v6, 0x4

    aput-object v4, v3, v6

    const/16 v4, 0x4e20

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x5

    aput-object v4, v3, v6

    invoke-direct {v2, v3}, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V

    .line 192
    invoke-virtual {v2, v5}, Ljava/lang/ProcessBuilder;->redirectErrorStream(Z)Ljava/lang/ProcessBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;

    move-result-object v2

    move-object v1, v2

    .line 193
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-virtual {v1}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    sget-object v5, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v3, v4, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 195
    .local v2, "reader":Ljava/io/BufferedReader;
    :goto_0
    :try_start_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    move-object v4, v3

    .local v4, "line":Ljava/lang/String;
    if-eqz v3, :cond_0

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 196
    .end local v4    # "line":Ljava/lang/String;
    :cond_0
    :try_start_2
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 197
    .end local v2    # "reader":Ljava/io/BufferedReader;
    nop

    .line 202
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/Process;->destroy()V

    .line 197
    :cond_1
    return-object v0

    .line 193
    .restart local v2    # "reader":Ljava/io/BufferedReader;
    :catchall_0
    move-exception v3

    :try_start_3
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v4

    :try_start_4
    invoke-virtual {v3, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "lines":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v1    # "process":Ljava/lang/Process;
    :goto_1
    throw v3
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 202
    .end local v2    # "reader":Ljava/io/BufferedReader;
    .restart local v0    # "lines":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v1    # "process":Ljava/lang/Process;
    :catchall_2
    move-exception v2

    goto :goto_2

    .line 198
    :catch_0
    move-exception v2

    .line 199
    .local v2, "e":Ljava/lang/Exception;
    :try_start_5
    const-string v3, "t6android"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "logs: logcat could not be read: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 200
    nop

    .line 202
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/lang/Process;->destroy()V

    .line 200
    :cond_2
    const/4 v3, 0x0

    return-object v3

    .line 202
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_2
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/lang/Process;->destroy()V

    .line 203
    :cond_3
    throw v2
.end method

.method private refreshNow()V
    .locals 3

    .line 171
    iget-object v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/LogsActivity;->tick:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 172
    iget-boolean v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->loading:Z

    if-eqz v0, :cond_0

    return-void

    .line 173
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->loading:Z

    .line 174
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lorg/wiiucoop/bo2android/LogsActivity$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lorg/wiiucoop/bo2android/LogsActivity$$ExternalSyntheticLambda2;-><init>(Lorg/wiiucoop/bo2android/LogsActivity;)V

    const-string v2, "t6-logs"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 184
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 185
    return-void
.end method

.method private setCategory(I)V
    .locals 0
    .param p1, "c"    # I

    .line 154
    iput p1, p0, Lorg/wiiucoop/bo2android/LogsActivity;->category:I

    .line 155
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/LogsActivity;->updateToolbar()V

    .line 156
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/LogsActivity;->applyFilter()V

    .line 157
    return-void
.end method

.method private startExport(I)V
    .locals 7
    .param p1, "c"    # I

    .line 233
    iput p1, p0, Lorg/wiiucoop/bo2android/LogsActivity;->exportCategory:I

    .line 234
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMdd-HHmmss"

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 235
    .local v0, "stamp":Ljava/lang/String;
    iget-object v1, p0, Lorg/wiiucoop/bo2android/LogsActivity;->buffer:Lorg/wiiucoop/bo2android/T6Logs$Buffer;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "T6Requiem logs; "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "all"

    if-gez p1, :cond_0

    move-object v4, v3

    goto :goto_0

    :cond_0
    sget-object v4, Lorg/wiiucoop/bo2android/T6Logs;->CATEGORY_IDS:[Ljava/lang/String;

    aget-object v4, v4, p1

    :goto_0
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "; exported "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v5, "yyyy-MM-dd HH:mm:ss"

    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-direct {v4, v5, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    .line 236
    invoke-virtual {v4, v5}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 235
    invoke-virtual {v1, p1, v2}, Lorg/wiiucoop/bo2android/T6Logs$Buffer;->export(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/wiiucoop/bo2android/LogsActivity;->exportText:Ljava/lang/String;

    .line 237
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.CREATE_DOCUMENT"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 238
    .local v1, "create":Landroid/content/Intent;
    const-string v2, "android.intent.category.OPENABLE"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 239
    const-string v2, "text/plain"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 240
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "t6-logs-"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-gez p1, :cond_1

    goto :goto_1

    :cond_1
    sget-object v3, Lorg/wiiucoop/bo2android/T6Logs;->CATEGORY_IDS:[Ljava/lang/String;

    aget-object v3, v3, p1

    :goto_1
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".txt"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "android.intent.extra.TITLE"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 242
    const/16 v2, 0x29

    :try_start_0
    invoke-virtual {p0, v1, v2}, Lorg/wiiucoop/bo2android/LogsActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 245
    goto :goto_2

    .line 243
    :catch_0
    move-exception v2

    .line 244
    .local v2, "e":Ljava/lang/RuntimeException;
    sget v3, Lorg/wiiucoop/bo2android/R$string;->logs_export_failed:I

    invoke-virtual {v2}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lorg/wiiucoop/bo2android/LogsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/wiiucoop/bo2android/LogsActivity;->toast(Ljava/lang/String;)V

    .line 246
    .end local v2    # "e":Ljava/lang/RuntimeException;
    :goto_2
    return-void
.end method

.method private toast(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .line 286
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 287
    return-void
.end method

.method private updateToolbar()V
    .locals 5

    .line 160
    sget v0, Lorg/wiiucoop/bo2android/R$id;->button_logs_cat_all:I

    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_logs_cat_engine:I

    sget v2, Lorg/wiiucoop/bo2android/R$id;->button_logs_cat_graphics:I

    sget v3, Lorg/wiiucoop/bo2android/R$id;->button_logs_cat_host:I

    sget v4, Lorg/wiiucoop/bo2android/R$id;->button_logs_cat_audio:I

    filled-new-array {v0, v1, v2, v3, v4}, [I

    move-result-object v0

    .line 162
    .local v0, "ids":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 163
    aget v2, v0, v1

    invoke-virtual {p0, v2}, Lorg/wiiucoop/bo2android/LogsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    add-int/lit8 v3, v1, -0x1

    iget v4, p0, Lorg/wiiucoop/bo2android/LogsActivity;->category:I

    if-ne v3, v4, :cond_0

    sget v3, Lorg/wiiucoop/bo2android/R$attr;->t6c_accent_bright_ff:I

    goto :goto_1

    :cond_0
    sget v3, Lorg/wiiucoop/bo2android/R$attr;->t6c_text_dim_ff:I

    :goto_1
    invoke-static {p0, v3}, Lorg/wiiucoop/bo2android/T6Ui;->themeColor(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setTextColor(I)V

    .line 162
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 165
    .end local v1    # "i":I
    :cond_1
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_logs_level:I

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/LogsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    sget v2, Lorg/wiiucoop/bo2android/R$string;->logs_level:I

    sget-object v3, Lorg/wiiucoop/bo2android/LogsActivity;->LEVELS:[C

    iget v4, p0, Lorg/wiiucoop/bo2android/LogsActivity;->levelIndex:I

    aget-char v3, v3, v4

    invoke-static {v3}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lorg/wiiucoop/bo2android/LogsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 166
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_logs_pause:I

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/LogsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iget-boolean v2, p0, Lorg/wiiucoop/bo2android/LogsActivity;->paused:Z

    if-eqz v2, :cond_2

    sget v2, Lorg/wiiucoop/bo2android/R$string;->logs_resume:I

    goto :goto_2

    :cond_2
    sget v2, Lorg/wiiucoop/bo2android/R$string;->logs_pause:I

    :goto_2
    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(I)V

    .line 167
    return-void
.end method


# virtual methods
.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 1
    .param p1, "base"    # Landroid/content/Context;

    .line 71
    invoke-static {p1}, Lorg/wiiucoop/bo2android/T6Ui;->wrapLocale(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/app/Activity;->attachBaseContext(Landroid/content/Context;)V

    .line 72
    return-void
.end method

.method synthetic lambda$chooseExport$2$org-wiiucoop-bo2android-LogsActivity(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 227
    if-nez p2, :cond_0

    iget v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->category:I

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    :goto_0
    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/LogsActivity;->startExport(I)V

    return-void
.end method

.method synthetic lambda$onActivityResult$3$org-wiiucoop-bo2android-LogsActivity(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "failure"    # Ljava/lang/String;
    .param p2, "text"    # Ljava/lang/String;

    .line 264
    if-nez p1, :cond_1

    .line 265
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "logs: exported "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/wiiucoop/bo2android/LogsActivity;->exportCategory:I

    if-gez v1, :cond_0

    const-string v1, "all"

    goto :goto_0

    :cond_0
    sget-object v1, Lorg/wiiucoop/bo2android/T6Logs;->CATEGORY_IDS:[Ljava/lang/String;

    iget v2, p0, Lorg/wiiucoop/bo2android/LogsActivity;->exportCategory:I

    aget-object v1, v1, v2

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 266
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " chars)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 265
    const-string v1, "t6android"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 267
    sget v0, Lorg/wiiucoop/bo2android/R$string;->logs_exported:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/LogsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/LogsActivity;->toast(Ljava/lang/String;)V

    goto :goto_1

    .line 269
    :cond_1
    sget v0, Lorg/wiiucoop/bo2android/R$string;->logs_export_failed:I

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/wiiucoop/bo2android/LogsActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/LogsActivity;->toast(Ljava/lang/String;)V

    .line 271
    :goto_1
    return-void
.end method

.method synthetic lambda$onActivityResult$4$org-wiiucoop-bo2android-LogsActivity(Landroid/net/Uri;Ljava/lang/String;)V
    .locals 4
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "text"    # Ljava/lang/String;

    .line 255
    const/4 v0, 0x0

    .line 256
    .local v0, "error":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/LogsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "wt"

    invoke-virtual {v1, p1, v2}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 257
    .local v1, "out":Ljava/io/OutputStream;
    if-eqz v1, :cond_1

    .line 258
    :try_start_1
    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p2, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 259
    if-eqz v1, :cond_0

    :try_start_2
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 261
    .end local v1    # "out":Ljava/io/OutputStream;
    :cond_0
    goto :goto_3

    .line 256
    .restart local v1    # "out":Ljava/io/OutputStream;
    :catchall_0
    move-exception v2

    goto :goto_0

    .line 257
    :cond_1
    :try_start_3
    new-instance v2, Ljava/io/IOException;

    const-string v3, "no output stream"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v0    # "error":Ljava/lang/String;
    .end local v1    # "out":Ljava/io/OutputStream;
    .end local p1    # "uri":Landroid/net/Uri;
    .end local p2    # "text":Ljava/lang/String;
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 256
    .restart local v0    # "error":Ljava/lang/String;
    .restart local v1    # "out":Ljava/io/OutputStream;
    .restart local p1    # "uri":Landroid/net/Uri;
    .restart local p2    # "text":Ljava/lang/String;
    :goto_0
    if-eqz v1, :cond_2

    :try_start_4
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v3

    :try_start_5
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "error":Ljava/lang/String;
    .end local p1    # "uri":Landroid/net/Uri;
    .end local p2    # "text":Ljava/lang/String;
    :cond_2
    :goto_1
    throw v2
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 259
    .end local v1    # "out":Ljava/io/OutputStream;
    .restart local v0    # "error":Ljava/lang/String;
    .restart local p1    # "uri":Landroid/net/Uri;
    .restart local p2    # "text":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 260
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    :cond_3
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    :goto_2
    move-object v0, v2

    .line 262
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_3
    move-object v1, v0

    .line 263
    .local v1, "failure":Ljava/lang/String;
    new-instance v2, Lorg/wiiucoop/bo2android/LogsActivity$$ExternalSyntheticLambda5;

    invoke-direct {v2, p0, v1, p2}, Lorg/wiiucoop/bo2android/LogsActivity$$ExternalSyntheticLambda5;-><init>(Lorg/wiiucoop/bo2android/LogsActivity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Lorg/wiiucoop/bo2android/LogsActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 272
    return-void
.end method

.method synthetic lambda$refreshNow$0$org-wiiucoop-bo2android-LogsActivity(Ljava/util/List;)V
    .locals 4
    .param p1, "raw"    # Ljava/util/List;

    .line 177
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->loading:Z

    .line 178
    if-eqz p1, :cond_0

    .line 179
    iget-object v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->buffer:Lorg/wiiucoop/bo2android/T6Logs$Buffer;

    invoke-virtual {v0, p1}, Lorg/wiiucoop/bo2android/T6Logs$Buffer;->load(Ljava/util/List;)V

    .line 180
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/LogsActivity;->applyFilter()V

    .line 182
    :cond_0
    iget-boolean v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->resumed:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->paused:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/LogsActivity;->tick:Ljava/lang/Runnable;

    const-wide/16 v2, 0xbb8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 183
    :cond_1
    return-void
.end method

.method synthetic lambda$refreshNow$1$org-wiiucoop-bo2android-LogsActivity()V
    .locals 2

    .line 175
    invoke-static {}, Lorg/wiiucoop/bo2android/LogsActivity;->readLogcat()Ljava/util/List;

    move-result-object v0

    .line 176
    .local v0, "raw":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v1, Lorg/wiiucoop/bo2android/LogsActivity$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, v0}, Lorg/wiiucoop/bo2android/LogsActivity$$ExternalSyntheticLambda3;-><init>(Lorg/wiiucoop/bo2android/LogsActivity;Ljava/util/List;)V

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/LogsActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 184
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 5
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .line 250
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 251
    const/16 v0, 0x29

    if-ne p1, v0, :cond_1

    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    if-eqz p3, :cond_1

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 252
    :cond_0
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    .line 253
    .local v0, "uri":Landroid/net/Uri;
    iget-object v1, p0, Lorg/wiiucoop/bo2android/LogsActivity;->exportText:Ljava/lang/String;

    .line 254
    .local v1, "text":Ljava/lang/String;
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lorg/wiiucoop/bo2android/LogsActivity$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, v0, v1}, Lorg/wiiucoop/bo2android/LogsActivity$$ExternalSyntheticLambda0;-><init>(Lorg/wiiucoop/bo2android/LogsActivity;Landroid/net/Uri;Ljava/lang/String;)V

    const-string v4, "t6-logs-export"

    invoke-direct {v2, v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 272
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 273
    return-void

    .line 251
    .end local v0    # "uri":Landroid/net/Uri;
    .end local v1    # "text":Ljava/lang/String;
    :cond_1
    :goto_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .line 119
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 120
    .local v0, "id":I
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_back:I

    if-ne v0, v1, :cond_0

    .line 121
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/LogsActivity;->finish()V

    goto/16 :goto_0

    .line 122
    :cond_0
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_logs_cat_all:I

    if-ne v0, v1, :cond_1

    .line 123
    const/4 v1, -0x1

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/LogsActivity;->setCategory(I)V

    goto/16 :goto_0

    .line 124
    :cond_1
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_logs_cat_engine:I

    if-ne v0, v1, :cond_2

    .line 125
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/LogsActivity;->setCategory(I)V

    goto/16 :goto_0

    .line 126
    :cond_2
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_logs_cat_graphics:I

    const/4 v2, 0x1

    if-ne v0, v1, :cond_3

    .line 127
    invoke-direct {p0, v2}, Lorg/wiiucoop/bo2android/LogsActivity;->setCategory(I)V

    goto/16 :goto_0

    .line 128
    :cond_3
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_logs_cat_host:I

    if-ne v0, v1, :cond_4

    .line 129
    const/4 v1, 0x2

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/LogsActivity;->setCategory(I)V

    goto :goto_0

    .line 130
    :cond_4
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_logs_cat_audio:I

    if-ne v0, v1, :cond_5

    .line 131
    const/4 v1, 0x3

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/LogsActivity;->setCategory(I)V

    goto :goto_0

    .line 132
    :cond_5
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_logs_level:I

    if-ne v0, v1, :cond_6

    .line 133
    iget v1, p0, Lorg/wiiucoop/bo2android/LogsActivity;->levelIndex:I

    add-int/2addr v1, v2

    sget-object v2, Lorg/wiiucoop/bo2android/LogsActivity;->LEVELS:[C

    array-length v2, v2

    rem-int/2addr v1, v2

    iput v1, p0, Lorg/wiiucoop/bo2android/LogsActivity;->levelIndex:I

    .line 134
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/LogsActivity;->updateToolbar()V

    .line 135
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/LogsActivity;->applyFilter()V

    goto :goto_0

    .line 136
    :cond_6
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_logs_pause:I

    if-ne v0, v1, :cond_7

    .line 137
    iget-boolean v1, p0, Lorg/wiiucoop/bo2android/LogsActivity;->paused:Z

    xor-int/2addr v1, v2

    iput-boolean v1, p0, Lorg/wiiucoop/bo2android/LogsActivity;->paused:Z

    .line 138
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/LogsActivity;->updateToolbar()V

    .line 139
    iget-boolean v1, p0, Lorg/wiiucoop/bo2android/LogsActivity;->paused:Z

    if-nez v1, :cond_b

    invoke-direct {p0}, Lorg/wiiucoop/bo2android/LogsActivity;->refreshNow()V

    goto :goto_0

    .line 140
    :cond_7
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_logs_refresh:I

    if-ne v0, v1, :cond_8

    .line 141
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/LogsActivity;->refreshNow()V

    goto :goto_0

    .line 142
    :cond_8
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_logs_copy:I

    if-ne v0, v1, :cond_9

    .line 143
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/LogsActivity;->copyShown()V

    goto :goto_0

    .line 144
    :cond_9
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_logs_clear:I

    if-ne v0, v1, :cond_a

    .line 145
    iget-object v1, p0, Lorg/wiiucoop/bo2android/LogsActivity;->buffer:Lorg/wiiucoop/bo2android/T6Logs$Buffer;

    invoke-virtual {v1}, Lorg/wiiucoop/bo2android/T6Logs$Buffer;->clear()V

    .line 146
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/LogsActivity;->applyFilter()V

    .line 147
    sget v1, Lorg/wiiucoop/bo2android/R$string;->logs_cleared:I

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/LogsActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/LogsActivity;->toast(Ljava/lang/String;)V

    goto :goto_0

    .line 148
    :cond_a
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_logs_export:I

    if-ne v0, v1, :cond_b

    .line 149
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/LogsActivity;->chooseExport()V

    .line 151
    :cond_b
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 14
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 76
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->applyTheme(Landroid/app/Activity;)V

    .line 77
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 78
    sget v0, Lorg/wiiucoop/bo2android/R$layout;->activity_logs:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/LogsActivity;->setContentView(I)V

    .line 79
    sget v0, Lorg/wiiucoop/bo2android/R$id;->text_logs_count:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/LogsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->countText:Landroid/widget/TextView;

    .line 80
    sget v0, Lorg/wiiucoop/bo2android/R$id;->edit_logs_search:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/LogsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->search:Landroid/widget/EditText;

    .line 81
    new-instance v0, Lorg/wiiucoop/bo2android/LogsActivity$LineAdapter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/wiiucoop/bo2android/LogsActivity$LineAdapter;-><init>(Lorg/wiiucoop/bo2android/LogsActivity;Lorg/wiiucoop/bo2android/LogsActivity$1;)V

    iput-object v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->adapter:Lorg/wiiucoop/bo2android/LogsActivity$LineAdapter;

    .line 82
    sget v0, Lorg/wiiucoop/bo2android/R$id;->list_logs:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/LogsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/LogsActivity;->adapter:Lorg/wiiucoop/bo2android/LogsActivity$LineAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 83
    sget v2, Lorg/wiiucoop/bo2android/R$id;->button_back:I

    sget v3, Lorg/wiiucoop/bo2android/R$id;->button_logs_cat_all:I

    sget v4, Lorg/wiiucoop/bo2android/R$id;->button_logs_cat_engine:I

    sget v5, Lorg/wiiucoop/bo2android/R$id;->button_logs_cat_graphics:I

    sget v6, Lorg/wiiucoop/bo2android/R$id;->button_logs_cat_host:I

    sget v7, Lorg/wiiucoop/bo2android/R$id;->button_logs_cat_audio:I

    sget v8, Lorg/wiiucoop/bo2android/R$id;->button_logs_level:I

    sget v9, Lorg/wiiucoop/bo2android/R$id;->button_logs_pause:I

    sget v10, Lorg/wiiucoop/bo2android/R$id;->button_logs_refresh:I

    sget v11, Lorg/wiiucoop/bo2android/R$id;->button_logs_copy:I

    sget v12, Lorg/wiiucoop/bo2android/R$id;->button_logs_clear:I

    sget v13, Lorg/wiiucoop/bo2android/R$id;->button_logs_export:I

    filled-new-array/range {v2 .. v13}, [I

    move-result-object v0

    .line 87
    .local v0, "buttons":[I
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget v3, v0, v2

    .local v3, "id":I
    invoke-virtual {p0, v3}, Lorg/wiiucoop/bo2android/LogsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .end local v3    # "id":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 88
    :cond_0
    iget-object v1, p0, Lorg/wiiucoop/bo2android/LogsActivity;->search:Landroid/widget/EditText;

    new-instance v2, Lorg/wiiucoop/bo2android/LogsActivity$1;

    invoke-direct {v2, p0}, Lorg/wiiucoop/bo2android/LogsActivity$1;-><init>(Lorg/wiiucoop/bo2android/LogsActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 93
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/LogsActivity;->updateToolbar()V

    .line 94
    return-void
.end method

.method protected onPause()V
    .locals 2

    .line 106
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 107
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->resumed:Z

    .line 108
    iget-object v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lorg/wiiucoop/bo2android/LogsActivity;->tick:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 109
    return-void
.end method

.method protected onResume()V
    .locals 1

    .line 98
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 99
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->applyImmersive(Landroid/app/Activity;)V

    .line 100
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/wiiucoop/bo2android/LogsActivity;->resumed:Z

    .line 101
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/LogsActivity;->refreshNow()V

    .line 102
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0
    .param p1, "hasFocus"    # Z

    .line 113
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 114
    if-eqz p1, :cond_0

    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->applyImmersive(Landroid/app/Activity;)V

    .line 115
    :cond_0
    return-void
.end method
