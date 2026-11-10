.class public final Lorg/wiiucoop/bo2android/GraphicsDriverActivity;
.super Landroid/app/Activity;
.source "GraphicsDriverActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final REQUEST_IMPORT:I = 0x29

.field private static final TAG:Ljava/lang/String; = "t6android"


# instance fields
.field private store:Lorg/wiiucoop/bo2android/T6DriverStore;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private addRow(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "list"    # Landroid/widget/LinearLayout;
    .param p2, "id"    # Ljava/lang/String;
    .param p3, "title"    # Ljava/lang/String;
    .param p4, "detail"    # Ljava/lang/String;
    .param p5, "selected"    # Ljava/lang/String;

    .line 196
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lorg/wiiucoop/bo2android/R$layout;->view_driver_row:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 197
    .local v0, "row":Landroid/view/View;
    sget v1, Lorg/wiiucoop/bo2android/R$id;->text_driver_row_title:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 198
    sget v1, Lorg/wiiucoop/bo2android/R$id;->text_driver_row_detail:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 199
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_driver_row_select:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 200
    .local v1, "select":Landroid/widget/Button;
    invoke-virtual {p2, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 201
    .local v3, "isSelected":Z
    if-eqz v3, :cond_0

    sget v4, Lorg/wiiucoop/bo2android/R$string;->driver_row_selected:I

    goto :goto_0

    :cond_0
    sget v4, Lorg/wiiucoop/bo2android/R$string;->driver_row_select:I

    :goto_0
    invoke-virtual {v1, v4}, Landroid/widget/Button;->setText(I)V

    .line 202
    xor-int/lit8 v4, v3, 0x1

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 203
    new-instance v4, Lorg/wiiucoop/bo2android/GraphicsDriverActivity$$ExternalSyntheticLambda1;

    invoke-direct {v4, p0, p2}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity$$ExternalSyntheticLambda1;-><init>(Lorg/wiiucoop/bo2android/GraphicsDriverActivity;Ljava/lang/String;)V

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 204
    sget v4, Lorg/wiiucoop/bo2android/R$id;->button_driver_row_remove:I

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Button;

    .line 205
    .local v4, "remove":Landroid/widget/Button;
    const-string v5, "system"

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    const/16 v2, 0x8

    :cond_1
    invoke-virtual {v4, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 206
    new-instance v2, Lorg/wiiucoop/bo2android/GraphicsDriverActivity$$ExternalSyntheticLambda2;

    invoke-direct {v2, p0, p2}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity$$ExternalSyntheticLambda2;-><init>(Lorg/wiiucoop/bo2android/GraphicsDriverActivity;Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 211
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 212
    return-void
.end method

.method private choose(Ljava/lang/String;)V
    .locals 2
    .param p1, "id"    # Ljava/lang/String;

    .line 152
    iget-object v0, p0, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->store:Lorg/wiiucoop/bo2android/T6DriverStore;

    invoke-virtual {v0, p1}, Lorg/wiiucoop/bo2android/T6DriverStore;->select(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 153
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "driver: selected for the next start: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "t6android"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    sget v0, Lorg/wiiucoop/bo2android/R$string;->driver_restart_needed:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->toast(Ljava/lang/String;)V

    goto :goto_0

    .line 156
    :cond_0
    sget v0, Lorg/wiiucoop/bo2android/R$string;->driver_select_failed:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->toast(Ljava/lang/String;)V

    .line 158
    :goto_0
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->refresh()V

    .line 159
    return-void
.end method

.method private displayName(Landroid/net/Uri;)Ljava/lang/String;
    .locals 7
    .param p1, "uri"    # Landroid/net/Uri;

    .line 123
    :try_start_0
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/String;

    const-string v1, "_display_name"

    const/4 v6, 0x0

    aput-object v1, v2, v6

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v3, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 125
    .local v0, "c":Landroid/database/Cursor;
    if-eqz v0, :cond_2

    :try_start_1
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 126
    if-eqz v0, :cond_0

    :try_start_2
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    .line 125
    :cond_0
    return-object v1

    .line 123
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    :try_start_3
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    :try_start_4
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p1    # "uri":Landroid/net/Uri;
    :cond_1
    :goto_0
    throw v1

    .line 126
    .restart local p1    # "uri":Landroid/net/Uri;
    :cond_2
    if-eqz v0, :cond_3

    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0

    .line 128
    .end local v0    # "c":Landroid/database/Cursor;
    :cond_3
    goto :goto_1

    .line 126
    :catch_0
    move-exception v0

    .line 129
    :goto_1
    const-string v0, "driver.zip"

    return-object v0
.end method

.method private static failure(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;
    .locals 1
    .param p0, "problem"    # Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;
    .param p1, "reason"    # Ljava/lang/String;

    .line 133
    invoke-static {p0, p1}, Lorg/wiiucoop/bo2android/T6DriverPackage;->refused(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v0

    return-object v0
.end method

.method private importFromUri(Landroid/net/Uri;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;
    .locals 10
    .param p1, "uri"    # Landroid/net/Uri;

    .line 101
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getCacheDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "driver-import.zip"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 102
    .local v0, "copy":Ljava/io/File;
    :try_start_0
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .local v1, "in":Ljava/io/InputStream;
    :try_start_1
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 103
    .local v2, "out":Ljava/io/OutputStream;
    if-nez v1, :cond_1

    :try_start_2
    sget-object v3, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->CANNOT_READ:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    const-string v4, "n\u00e3o foi poss\u00edvel abrir o documento"

    invoke-static {v3, v4}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->failure(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 111
    :try_start_3
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    if-eqz v1, :cond_0

    :try_start_4
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_4 .. :try_end_4} :catch_0

    .line 103
    :cond_0
    return-object v3

    .line 104
    :cond_1
    const/high16 v3, 0x10000

    :try_start_5
    new-array v3, v3, [B

    .line 105
    .local v3, "buf":[B
    const-wide/16 v4, 0x0

    .line 106
    .local v4, "total":J
    :goto_0
    invoke-virtual {v1, v3}, Ljava/io/InputStream;->read([B)I

    move-result v6

    move v7, v6

    .local v7, "n":I
    if-lez v6, :cond_4

    .line 107
    int-to-long v8, v7

    add-long/2addr v4, v8

    .line 108
    const-wide/32 v8, 0x4000000

    cmp-long v6, v4, v8

    if-lez v6, :cond_3

    sget-object v6, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->TOO_LARGE:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    const-string v8, "ZIP maior que 64 MB"

    invoke-static {v6, v8}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->failure(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v6
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 111
    :try_start_6
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    if-eqz v1, :cond_2

    :try_start_7
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_7 .. :try_end_7} :catch_0

    .line 108
    :cond_2
    return-object v6

    .line 109
    :cond_3
    const/4 v6, 0x0

    :try_start_8
    invoke-virtual {v2, v3, v6, v7}, Ljava/io/OutputStream;->write([BII)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    goto :goto_0

    .line 111
    .end local v3    # "buf":[B
    .end local v4    # "total":J
    .end local v7    # "n":I
    :cond_4
    :try_start_9
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .end local v2    # "out":Ljava/io/OutputStream;
    if-eqz v1, :cond_5

    :try_start_a
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_a .. :try_end_a} :catch_0

    .line 113
    .end local v1    # "in":Ljava/io/InputStream;
    :cond_5
    nop

    .line 115
    :try_start_b
    iget-object v1, p0, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->store:Lorg/wiiucoop/bo2android/T6DriverStore;

    invoke-virtual {v1}, Lorg/wiiucoop/bo2android/T6DriverStore;->driversDir()Ljava/io/File;

    move-result-object v1

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-direct {p0, p1}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->displayName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lorg/wiiucoop/bo2android/T6DriverPackage;->importZip(Ljava/io/File;Ljava/io/File;ILjava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v1
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 118
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 115
    return-object v1

    .line 118
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 119
    throw v1

    .line 102
    .restart local v1    # "in":Ljava/io/InputStream;
    .restart local v2    # "out":Ljava/io/OutputStream;
    :catchall_1
    move-exception v3

    :try_start_c
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    goto :goto_1

    :catchall_2
    move-exception v4

    :try_start_d
    invoke-virtual {v3, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "copy":Ljava/io/File;
    .end local v1    # "in":Ljava/io/InputStream;
    .end local p1    # "uri":Landroid/net/Uri;
    :goto_1
    throw v3
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    .end local v2    # "out":Ljava/io/OutputStream;
    .restart local v0    # "copy":Ljava/io/File;
    .restart local v1    # "in":Ljava/io/InputStream;
    .restart local p1    # "uri":Landroid/net/Uri;
    :catchall_3
    move-exception v2

    if-eqz v1, :cond_6

    :try_start_e
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_4

    goto :goto_2

    :catchall_4
    move-exception v3

    :try_start_f
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "copy":Ljava/io/File;
    .end local p1    # "uri":Landroid/net/Uri;
    :cond_6
    :goto_2
    throw v2
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_f .. :try_end_f} :catch_0

    .line 111
    .end local v1    # "in":Ljava/io/InputStream;
    .restart local v0    # "copy":Ljava/io/File;
    .restart local p1    # "uri":Landroid/net/Uri;
    :catch_0
    move-exception v1

    goto :goto_3

    :catch_1
    move-exception v1

    .line 112
    .local v1, "e":Ljava/lang/Exception;
    :goto_3
    sget-object v2, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->CANNOT_READ:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "falha ao ler o documento: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->failure(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;Ljava/lang/String;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v2

    return-object v2
.end method

.method private label(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;
    .locals 3
    .param p1, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lorg/wiiucoop/bo2android/T6DriverStore$Entry;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 215
    .local p2, "drivers":Ljava/util/List;, "Ljava/util/List<Lorg/wiiucoop/bo2android/T6DriverStore$Entry;>;"
    if-eqz p1, :cond_4

    const-string v0, "system"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    .line 216
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/wiiucoop/bo2android/T6DriverStore$Entry;

    .local v1, "e":Lorg/wiiucoop/bo2android/T6DriverStore$Entry;
    iget-object v2, v1, Lorg/wiiucoop/bo2android/T6DriverStore$Entry;->id:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v0, v1, Lorg/wiiucoop/bo2android/T6DriverStore$Entry;->meta:Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;

    iget-object v0, v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, v1, Lorg/wiiucoop/bo2android/T6DriverStore$Entry;->id:Ljava/lang/String;

    goto :goto_1

    :cond_1
    iget-object v0, v1, Lorg/wiiucoop/bo2android/T6DriverStore$Entry;->meta:Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;

    iget-object v0, v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->name:Ljava/lang/String;

    :goto_1
    return-object v0

    .end local v1    # "e":Lorg/wiiucoop/bo2android/T6DriverStore$Entry;
    :cond_2
    goto :goto_0

    .line 217
    :cond_3
    return-object p1

    .line 215
    :cond_4
    :goto_2
    sget v0, Lorg/wiiucoop/bo2android/R$string;->driver_system:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private problemText(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;)Ljava/lang/String;
    .locals 2
    .param p1, "problem"    # Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    .line 138
    if-nez p1, :cond_0

    sget v0, Lorg/wiiucoop/bo2android/R$string;->driver_problem_corrupt:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 139
    :cond_0
    sget-object v0, Lorg/wiiucoop/bo2android/GraphicsDriverActivity$1;->$SwitchMap$org$wiiucoop$bo2android$T6DriverPackage$Problem:[I

    invoke-virtual {p1}, Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 147
    sget v0, Lorg/wiiucoop/bo2android/R$string;->driver_problem_corrupt:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 146
    :pswitch_0
    sget v0, Lorg/wiiucoop/bo2android/R$string;->driver_problem_install_failed:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 145
    :pswitch_1
    sget v0, Lorg/wiiucoop/bo2android/R$string;->driver_problem_bad_library:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 144
    :pswitch_2
    sget v0, Lorg/wiiucoop/bo2android/R$string;->driver_problem_needs_newer_android:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 143
    :pswitch_3
    sget v0, Lorg/wiiucoop/bo2android/R$string;->driver_problem_not_a_driver:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 142
    :pswitch_4
    sget v0, Lorg/wiiucoop/bo2android/R$string;->driver_problem_bad_entries:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 141
    :pswitch_5
    sget v0, Lorg/wiiucoop/bo2android/R$string;->driver_problem_too_large:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 140
    :pswitch_6
    sget v0, Lorg/wiiucoop/bo2android/R$string;->driver_problem_cannot_read:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private refresh()V
    .locals 20

    .line 162
    move-object/from16 v6, p0

    iget-object v0, v6, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->store:Lorg/wiiucoop/bo2android/T6DriverStore;

    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6DriverStore;->selected()Ljava/lang/String;

    move-result-object v7

    .line 163
    .local v7, "selected":Ljava/lang/String;
    iget-object v0, v6, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->store:Lorg/wiiucoop/bo2android/T6DriverStore;

    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6DriverStore;->lastStatus()Ljava/util/Map;

    move-result-object v8

    .line 164
    .local v8, "status":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, v6, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->store:Lorg/wiiucoop/bo2android/T6DriverStore;

    invoke-virtual {v0}, Lorg/wiiucoop/bo2android/T6DriverStore;->list()Ljava/util/List;

    move-result-object v9

    .line 166
    .local v9, "drivers":Ljava/util/List;, "Ljava/util/List<Lorg/wiiucoop/bo2android/T6DriverStore$Entry;>;"
    sget v0, Lorg/wiiucoop/bo2android/R$id;->text_driver_selected:I

    sget v1, Lorg/wiiucoop/bo2android/R$string;->driver_selected_line:I

    invoke-direct {v6, v7, v9}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->label(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v6, v1, v2}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v6, v0, v1}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->setText(ILjava/lang/String;)V

    .line 167
    const-string v0, "loaded"

    invoke-interface {v8, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Ljava/lang/String;

    .line 168
    .local v10, "loaded":Ljava/lang/String;
    const-string v0, "device"

    invoke-interface {v8, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Ljava/lang/String;

    .line 169
    .local v11, "device":Ljava/lang/String;
    const-string v0, "driver_name"

    invoke-interface {v8, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v12, v0

    check-cast v12, Ljava/lang/String;

    .line 170
    .local v12, "driverName":Ljava/lang/String;
    const-string v13, ""

    if-eqz v10, :cond_2

    if-nez v11, :cond_0

    goto :goto_1

    .line 173
    :cond_0
    const-string v0, "api"

    invoke-interface {v8, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " \u00b7 Vulkan "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v8, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    move-object v0, v13

    .line 174
    .local v0, "api":Ljava/lang/String;
    :goto_0
    sget v1, Lorg/wiiucoop/bo2android/R$id;->text_driver_active:I

    sget v2, Lorg/wiiucoop/bo2android/R$string;->driver_active_line:I

    invoke-direct {v6, v10, v9}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->label(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    filled-new-array {v3, v4}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v6, v2, v3}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v6, v1, v2}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->setText(ILjava/lang/String;)V

    goto :goto_2

    .line 171
    .end local v0    # "api":Ljava/lang/String;
    :cond_2
    :goto_1
    sget v0, Lorg/wiiucoop/bo2android/R$id;->text_driver_active:I

    sget v1, Lorg/wiiucoop/bo2android/R$string;->driver_active_unknown:I

    invoke-virtual {v6, v1}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v6, v0, v1}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->setText(ILjava/lang/String;)V

    .line 176
    :goto_2
    sget v0, Lorg/wiiucoop/bo2android/R$id;->text_driver_gpu:I

    sget v1, Lorg/wiiucoop/bo2android/R$string;->driver_gpu_line:I

    if-eqz v11, :cond_4

    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_3

    :cond_3
    move-object v2, v11

    goto :goto_4

    :cond_4
    :goto_3
    const-string v2, "\u2014"

    :goto_4
    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v6, v1, v2}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v6, v0, v1}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->setText(ILjava/lang/String;)V

    .line 177
    const-string v0, "reason"

    invoke-interface {v8, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v14, v0

    check-cast v14, Ljava/lang/String;

    .line 179
    .local v14, "reason":Ljava/lang/String;
    invoke-interface {v8}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5

    sget v0, Lorg/wiiucoop/bo2android/R$string;->driver_last_none:I

    invoke-virtual {v6, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .local v0, "last":Ljava/lang/String;
    goto :goto_5

    .line 180
    .end local v0    # "last":Ljava/lang/String;
    :cond_5
    if-eqz v14, :cond_6

    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    sget v0, Lorg/wiiucoop/bo2android/R$string;->driver_last_fallback:I

    filled-new-array {v14}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "last":Ljava/lang/String;
    goto :goto_5

    .line 181
    .end local v0    # "last":Ljava/lang/String;
    :cond_6
    sget v0, Lorg/wiiucoop/bo2android/R$string;->driver_last_ok:I

    invoke-virtual {v6, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 182
    .restart local v0    # "last":Ljava/lang/String;
    :goto_5
    if-nez v10, :cond_7

    const-string v1, "system"

    goto :goto_6

    :cond_7
    move-object v1, v10

    :goto_6
    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lorg/wiiucoop/bo2android/R$string;->driver_restart_needed:I

    invoke-virtual {v6, v2}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_8
    move-object v15, v0

    .line 183
    .end local v0    # "last":Ljava/lang/String;
    .local v15, "last":Ljava/lang/String;
    sget v0, Lorg/wiiucoop/bo2android/R$id;->text_driver_last:I

    invoke-direct {v6, v0, v15}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->setText(ILjava/lang/String;)V

    .line 185
    sget v0, Lorg/wiiucoop/bo2android/R$id;->list_drivers:I

    invoke-virtual {v6, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object/from16 v16, v0

    check-cast v16, Landroid/widget/LinearLayout;

    .line 186
    .local v16, "list":Landroid/widget/LinearLayout;
    invoke-virtual/range {v16 .. v16}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 187
    sget v0, Lorg/wiiucoop/bo2android/R$string;->driver_system:I

    invoke-virtual {v6, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    sget v0, Lorg/wiiucoop/bo2android/R$string;->driver_system_desc:I

    invoke-virtual {v6, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    const-string v2, "system"

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object v5, v7

    invoke-direct/range {v0 .. v5}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->addRow(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_7
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lorg/wiiucoop/bo2android/T6DriverStore$Entry;

    .line 189
    .local v5, "e":Lorg/wiiucoop/bo2android/T6DriverStore$Entry;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, v5, Lorg/wiiucoop/bo2android/T6DriverStore$Entry;->meta:Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->driverVersion:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, v5, Lorg/wiiucoop/bo2android/T6DriverStore$Entry;->meta:Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->author:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_9

    move-object v1, v13

    goto :goto_8

    :cond_9
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " \u00b7 "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v5, Lorg/wiiucoop/bo2android/T6DriverStore$Entry;->meta:Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;

    iget-object v2, v2, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->author:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 190
    iget-object v1, v5, Lorg/wiiucoop/bo2android/T6DriverStore$Entry;->librarySha256:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_a

    move-object v1, v13

    goto :goto_9

    :cond_a
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\nSHA-256 "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v5, Lorg/wiiucoop/bo2android/T6DriverStore$Entry;->librarySha256:Ljava/lang/String;

    const/4 v3, 0x0

    const/16 v4, 0x10

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\u2026"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_9
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 191
    .local v18, "detail":Ljava/lang/String;
    iget-object v2, v5, Lorg/wiiucoop/bo2android/T6DriverStore$Entry;->id:Ljava/lang/String;

    iget-object v0, v5, Lorg/wiiucoop/bo2android/T6DriverStore$Entry;->meta:Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;

    iget-object v0, v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_b

    iget-object v0, v5, Lorg/wiiucoop/bo2android/T6DriverStore$Entry;->id:Ljava/lang/String;

    goto :goto_a

    :cond_b
    iget-object v0, v5, Lorg/wiiucoop/bo2android/T6DriverStore$Entry;->meta:Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;

    iget-object v0, v0, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->name:Ljava/lang/String;

    :goto_a
    move-object v3, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v4, v18

    move-object/from16 v19, v5

    .end local v5    # "e":Lorg/wiiucoop/bo2android/T6DriverStore$Entry;
    .local v19, "e":Lorg/wiiucoop/bo2android/T6DriverStore$Entry;
    move-object v5, v7

    invoke-direct/range {v0 .. v5}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->addRow(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    .end local v18    # "detail":Ljava/lang/String;
    .end local v19    # "e":Lorg/wiiucoop/bo2android/T6DriverStore$Entry;
    goto/16 :goto_7

    .line 193
    :cond_c
    return-void
.end method

.method private setText(ILjava/lang/String;)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "text"    # Ljava/lang/String;

    .line 221
    invoke-virtual {p0, p1}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 222
    return-void
.end method

.method private toast(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .line 225
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 226
    return-void
.end method


# virtual methods
.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 1
    .param p1, "base"    # Landroid/content/Context;

    .line 41
    invoke-static {p1}, Lorg/wiiucoop/bo2android/T6Ui;->wrapLocale(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/app/Activity;->attachBaseContext(Landroid/content/Context;)V

    .line 42
    return-void
.end method

.method synthetic lambda$addRow$2$org-wiiucoop-bo2android-GraphicsDriverActivity(Ljava/lang/String;Landroid/view/View;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "v"    # Landroid/view/View;

    .line 203
    invoke-direct {p0, p1}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->choose(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$addRow$3$org-wiiucoop-bo2android-GraphicsDriverActivity(Ljava/lang/String;Landroid/view/View;)V
    .locals 2
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "v"    # Landroid/view/View;

    .line 207
    iget-object v0, p0, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->store:Lorg/wiiucoop/bo2android/T6DriverStore;

    invoke-virtual {v0, p1}, Lorg/wiiucoop/bo2android/T6DriverStore;->remove(Ljava/lang/String;)Z

    .line 208
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "driver: removed "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "t6android"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 209
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->refresh()V

    .line 210
    return-void
.end method

.method synthetic lambda$onActivityResult$0$org-wiiucoop-bo2android-GraphicsDriverActivity(Lorg/wiiucoop/bo2android/T6DriverPackage$Result;)V
    .locals 3
    .param p1, "result"    # Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    .line 87
    iget-boolean v0, p1, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->ok:Z

    const-string v1, "t6android"

    if-eqz v0, :cond_1

    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "driver: imported "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p1, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->id:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " ("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p1, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->meta:Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;

    iget-object v2, v2, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->name:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", lib sha256 "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p1, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->librarySha256:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    sget v0, Lorg/wiiucoop/bo2android/R$string;->driver_imported:I

    iget-object v1, p1, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->meta:Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->name:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p1, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->id:Ljava/lang/String;

    goto :goto_0

    :cond_0
    iget-object v1, p1, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->meta:Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;

    iget-object v1, v1, Lorg/wiiucoop/bo2android/T6DriverPackage$Meta;->name:Ljava/lang/String;

    :goto_0
    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->toast(Ljava/lang/String;)V

    goto :goto_1

    .line 91
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "driver: import refused: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p1, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->reason:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    sget v0, Lorg/wiiucoop/bo2android/R$string;->driver_import_refused:I

    iget-object v1, p1, Lorg/wiiucoop/bo2android/T6DriverPackage$Result;->problem:Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->problemText(Lorg/wiiucoop/bo2android/T6DriverPackage$Problem;)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->toast(Ljava/lang/String;)V

    .line 94
    :goto_1
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->refresh()V

    .line 95
    return-void
.end method

.method synthetic lambda$onActivityResult$1$org-wiiucoop-bo2android-GraphicsDriverActivity(Landroid/net/Uri;)V
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;

    .line 85
    invoke-direct {p0, p1}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->importFromUri(Landroid/net/Uri;)Lorg/wiiucoop/bo2android/T6DriverPackage$Result;

    move-result-object v0

    .line 86
    .local v0, "result":Lorg/wiiucoop/bo2android/T6DriverPackage$Result;
    new-instance v1, Lorg/wiiucoop/bo2android/GraphicsDriverActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity$$ExternalSyntheticLambda0;-><init>(Lorg/wiiucoop/bo2android/GraphicsDriverActivity;Lorg/wiiucoop/bo2android/T6DriverPackage$Result;)V

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 96
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .line 80
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 81
    const/16 v0, 0x29

    if-ne p1, v0, :cond_1

    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    if-eqz p3, :cond_1

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 82
    :cond_0
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    .line 83
    .local v0, "uri":Landroid/net/Uri;
    sget v1, Lorg/wiiucoop/bo2android/R$string;->driver_importing:I

    invoke-virtual {p0, v1}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->toast(Ljava/lang/String;)V

    .line 84
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lorg/wiiucoop/bo2android/GraphicsDriverActivity$$ExternalSyntheticLambda3;

    invoke-direct {v2, p0, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity$$ExternalSyntheticLambda3;-><init>(Lorg/wiiucoop/bo2android/GraphicsDriverActivity;Landroid/net/Uri;)V

    const-string v3, "t6-driver-import"

    invoke-direct {v1, v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 96
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 97
    return-void

    .line 81
    .end local v0    # "uri":Landroid/net/Uri;
    :cond_1
    :goto_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .line 64
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 65
    .local v0, "id":I
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_back:I

    if-ne v0, v1, :cond_0

    .line 66
    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->finish()V

    goto :goto_1

    .line 67
    :cond_0
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_driver_import:I

    if-ne v0, v1, :cond_1

    .line 68
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 69
    .local v1, "pick":Landroid/content/Intent;
    const-string v2, "android.intent.category.OPENABLE"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 70
    const-string v2, "*/*"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 71
    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "application/zip"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "application/x-zip-compressed"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, "application/octet-stream"

    aput-object v4, v2, v3

    const-string v3, "android.intent.extra.MIME_TYPES"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 72
    const/16 v2, 0x29

    invoke-virtual {p0, v1, v2}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .end local v1    # "pick":Landroid/content/Intent;
    goto :goto_0

    .line 73
    :cond_1
    sget v1, Lorg/wiiucoop/bo2android/R$id;->button_driver_default:I

    if-ne v0, v1, :cond_2

    .line 74
    const-string v1, "system"

    invoke-direct {p0, v1}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->choose(Ljava/lang/String;)V

    goto :goto_1

    .line 73
    :cond_2
    :goto_0
    nop

    .line 76
    :goto_1
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 46
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->applyTheme(Landroid/app/Activity;)V

    .line 47
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 48
    sget v0, Lorg/wiiucoop/bo2android/R$layout;->activity_graphics_driver:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->setContentView(I)V

    .line 49
    new-instance v0, Lorg/wiiucoop/bo2android/T6DriverStore;

    invoke-virtual {p0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/wiiucoop/bo2android/T6DriverStore;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->store:Lorg/wiiucoop/bo2android/T6DriverStore;

    .line 50
    sget v0, Lorg/wiiucoop/bo2android/R$id;->button_back:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 51
    sget v0, Lorg/wiiucoop/bo2android/R$id;->button_driver_import:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    sget v0, Lorg/wiiucoop/bo2android/R$id;->button_driver_default:I

    invoke-virtual {p0, v0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    return-void
.end method

.method protected onResume()V
    .locals 0

    .line 57
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 58
    invoke-static {p0}, Lorg/wiiucoop/bo2android/T6Ui;->applyImmersive(Landroid/app/Activity;)V

    .line 59
    invoke-direct {p0}, Lorg/wiiucoop/bo2android/GraphicsDriverActivity;->refresh()V

    .line 60
    return-void
.end method
