.class public Lorg/libsdl/app/SDLActivity;
.super Landroid/app/Activity;
.source "SDLActivity.java"

# interfaces
.implements Landroid/view/View$OnSystemUiVisibilityChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/libsdl/app/SDLActivity$SDLCommandHandler;,
        Lorg/libsdl/app/SDLActivity$NativeState;,
        Lorg/libsdl/app/SDLActivity$SDLFileDialogState;,
        Lorg/libsdl/app/SDLActivity$ShowTextInputTask;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field protected static final COMMAND_CHANGE_TITLE:I = 0x1

.field protected static final COMMAND_CHANGE_WINDOW_STYLE:I = 0x2

.field protected static final COMMAND_SET_KEEP_SCREEN_ON:I = 0x5

.field protected static final COMMAND_TEXTEDIT_HIDE:I = 0x3

.field protected static final COMMAND_USER:I = 0x8000

.field private static final SDL_FILEDIALOG_OPENFILE:I = 0x0

.field private static final SDL_FILEDIALOG_OPENFOLDER:I = 0x2

.field private static final SDL_FILEDIALOG_SAVEFILE:I = 0x1

.field private static final SDL_MAJOR_VERSION:I = 0x3

.field private static final SDL_MICRO_VERSION:I = 0x0

.field private static final SDL_MINOR_VERSION:I = 0x5

.field protected static final SDL_ORIENTATION_LANDSCAPE:I = 0x1

.field protected static final SDL_ORIENTATION_LANDSCAPE_FLIPPED:I = 0x2

.field protected static final SDL_ORIENTATION_PORTRAIT:I = 0x3

.field protected static final SDL_ORIENTATION_PORTRAIT_FLIPPED:I = 0x4

.field protected static final SDL_ORIENTATION_UNKNOWN:I = 0x0

.field private static final SDL_SYSTEM_CURSOR_ALIAS:I = 0x18

.field private static final SDL_SYSTEM_CURSOR_ALL_SCROLL:I = 0x1f

.field private static final SDL_SYSTEM_CURSOR_CELL:I = 0x16

.field private static final SDL_SYSTEM_CURSOR_COL_RESIZE:I = 0x1d

.field private static final SDL_SYSTEM_CURSOR_CONTEXT_MENU:I = 0x14

.field private static final SDL_SYSTEM_CURSOR_COPY:I = 0x19

.field private static final SDL_SYSTEM_CURSOR_CROSSHAIR:I = 0x3

.field private static final SDL_SYSTEM_CURSOR_DEFAULT:I = 0x0

.field private static final SDL_SYSTEM_CURSOR_EW_RESIZE:I = 0x7

.field private static final SDL_SYSTEM_CURSOR_E_RESIZE:I = 0xf

.field private static final SDL_SYSTEM_CURSOR_GRAB:I = 0x1b

.field private static final SDL_SYSTEM_CURSOR_GRABBING:I = 0x1c

.field private static final SDL_SYSTEM_CURSOR_HELP:I = 0x15

.field private static final SDL_SYSTEM_CURSOR_MOVE:I = 0x9

.field private static final SDL_SYSTEM_CURSOR_NESW_RESIZE:I = 0x6

.field private static final SDL_SYSTEM_CURSOR_NE_RESIZE:I = 0xe

.field private static final SDL_SYSTEM_CURSOR_NOT_ALLOWED:I = 0xa

.field private static final SDL_SYSTEM_CURSOR_NO_DROP:I = 0x1a

.field private static final SDL_SYSTEM_CURSOR_NS_RESIZE:I = 0x8

.field private static final SDL_SYSTEM_CURSOR_NWSE_RESIZE:I = 0x5

.field private static final SDL_SYSTEM_CURSOR_NW_RESIZE:I = 0xc

.field private static final SDL_SYSTEM_CURSOR_N_RESIZE:I = 0xd

.field private static final SDL_SYSTEM_CURSOR_POINTER:I = 0xb

.field private static final SDL_SYSTEM_CURSOR_PROGRESS:I = 0x4

.field private static final SDL_SYSTEM_CURSOR_ROW_RESIZE:I = 0x1e

.field private static final SDL_SYSTEM_CURSOR_SE_RESIZE:I = 0x10

.field private static final SDL_SYSTEM_CURSOR_SW_RESIZE:I = 0x12

.field private static final SDL_SYSTEM_CURSOR_S_RESIZE:I = 0x11

.field private static final SDL_SYSTEM_CURSOR_TEXT:I = 0x1

.field private static final SDL_SYSTEM_CURSOR_VERTICAL_TEXT:I = 0x17

.field private static final SDL_SYSTEM_CURSOR_WAIT:I = 0x2

.field private static final SDL_SYSTEM_CURSOR_W_RESIZE:I = 0x13

.field private static final SDL_SYSTEM_CURSOR_ZOOM_IN:I = 0x20

.field private static final SDL_SYSTEM_CURSOR_ZOOM_OUT:I = 0x21

.field private static final TAG:Ljava/lang/String; = "SDL"

.field static backButtonCallback:Landroid/window/OnBackInvokedCallback;

.field protected static mActivityCreated:Z

.field static mBackKeyTrapEnabled:Z

.field public static mBrokenLibraries:Z

.field protected static mClipboardHandler:Lorg/libsdl/app/SDLClipboardHandler;

.field protected static mCurrentLocale:Ljava/util/Locale;

.field public static mCurrentNativeState:Lorg/libsdl/app/SDLActivity$NativeState;

.field protected static mCurrentRotation:I

.field protected static mCursors:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable<",
            "Ljava/lang/Integer;",
            "Landroid/view/PointerIcon;",
            ">;"
        }
    .end annotation
.end field

.field protected static mDispatchingKeyEvent:Z

.field private static mFileDialogState:Lorg/libsdl/app/SDLActivity$SDLFileDialogState;

.field protected static mFullscreenModeActive:Z

.field protected static mHIDDeviceManager:Lorg/libsdl/app/HIDDeviceManager;

.field public static mHasFocus:Z

.field public static final mHasMultiWindow:Z

.field public static mIsResumedCalled:Z

.field protected static mLastCursorID:I

.field protected static mLayout:Landroid/view/ViewGroup;

.field protected static mMotionListener:Lorg/libsdl/app/SDLGenericMotionListener_API14;

.field public static mNextNativeState:Lorg/libsdl/app/SDLActivity$NativeState;

.field protected static mSDLMainFinished:Z

.field protected static mSDLThread:Ljava/lang/Thread;

.field protected static mSingleton:Lorg/libsdl/app/SDLActivity;

.field protected static mSurface:Lorg/libsdl/app/SDLSurface;

.field protected static mTextEdit:Lorg/libsdl/app/SDLDummyEdit;


# instance fields
.field commandHandler:Landroid/os/Handler;

.field protected final messageboxSelection:[I

.field private final rehideSystemUi:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 66
    nop

    .line 175
    const/4 v0, 0x1

    sput-boolean v0, Lorg/libsdl/app/SDLActivity;->mHasMultiWindow:Z

    .line 232
    sput-boolean v0, Lorg/libsdl/app/SDLActivity;->mBrokenLibraries:Z

    .line 247
    const/4 v0, 0x0

    sput-boolean v0, Lorg/libsdl/app/SDLActivity;->mSDLMainFinished:Z

    .line 248
    sput-boolean v0, Lorg/libsdl/app/SDLActivity;->mActivityCreated:Z

    .line 249
    const/4 v1, 0x0

    sput-object v1, Lorg/libsdl/app/SDLActivity;->mFileDialogState:Lorg/libsdl/app/SDLActivity$SDLFileDialogState;

    .line 250
    sput-boolean v0, Lorg/libsdl/app/SDLActivity;->mDispatchingKeyEvent:Z

    .line 794
    sput-boolean v0, Lorg/libsdl/app/SDLActivity;->mBackKeyTrapEnabled:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 66
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 1128
    new-instance v0, Lorg/libsdl/app/SDLActivity$SDLCommandHandler;

    invoke-direct {v0}, Lorg/libsdl/app/SDLActivity$SDLCommandHandler;-><init>()V

    iput-object v0, p0, Lorg/libsdl/app/SDLActivity;->commandHandler:Landroid/os/Handler;

    .line 1744
    const/4 v0, 0x1

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/libsdl/app/SDLActivity;->messageboxSelection:[I

    .line 1942
    new-instance v0, Lorg/libsdl/app/SDLActivity$8;

    invoke-direct {v0, p0}, Lorg/libsdl/app/SDLActivity$8;-><init>(Lorg/libsdl/app/SDLActivity;)V

    iput-object v0, p0, Lorg/libsdl/app/SDLActivity;->rehideSystemUi:Ljava/lang/Runnable;

    return-void
.end method

.method public static clipboardGetText()Ljava/lang/String;
    .locals 1

    .line 1987
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mClipboardHandler:Lorg/libsdl/app/SDLClipboardHandler;

    invoke-virtual {v0}, Lorg/libsdl/app/SDLClipboardHandler;->clipboardGetText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static clipboardHasText()Z
    .locals 1

    .line 1980
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mClipboardHandler:Lorg/libsdl/app/SDLClipboardHandler;

    invoke-virtual {v0}, Lorg/libsdl/app/SDLClipboardHandler;->clipboardHasText()Z

    move-result v0

    return v0
.end method

.method public static clipboardSetText(Ljava/lang/String;)V
    .locals 1
    .param p0, "string"    # Ljava/lang/String;

    .line 1994
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mClipboardHandler:Lorg/libsdl/app/SDLClipboardHandler;

    invoke-virtual {v0, p0}, Lorg/libsdl/app/SDLClipboardHandler;->clipboardSetText(Ljava/lang/String;)V

    .line 1995
    return-void
.end method

.method public static createCustomCursor([IIIII)I
    .locals 5
    .param p0, "colors"    # [I
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "hotSpotX"    # I
    .param p4, "hotSpotY"    # I

    .line 2001
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p0, p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 2002
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    sget v1, Lorg/libsdl/app/SDLActivity;->mLastCursorID:I

    add-int/lit8 v1, v1, 0x1

    sput v1, Lorg/libsdl/app/SDLActivity;->mLastCursorID:I

    .line 2004
    nop

    .line 2006
    :try_start_0
    sget-object v1, Lorg/libsdl/app/SDLActivity;->mCursors:Ljava/util/Hashtable;

    sget v2, Lorg/libsdl/app/SDLActivity;->mLastCursorID:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    int-to-float v3, p3

    int-to-float v4, p4

    invoke-static {v0, v3, v4}, Landroid/view/PointerIcon;->create(Landroid/graphics/Bitmap;FF)Landroid/view/PointerIcon;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2009
    nop

    .line 2013
    sget v1, Lorg/libsdl/app/SDLActivity;->mLastCursorID:I

    return v1

    .line 2007
    :catch_0
    move-exception v1

    .line 2008
    .local v1, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    return v2
.end method

.method public static destroyCustomCursor(I)V
    .locals 2
    .param p0, "cursorID"    # I

    .line 2020
    nop

    .line 2022
    :try_start_0
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mCursors:Ljava/util/Hashtable;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2024
    goto :goto_0

    .line 2023
    :catch_0
    move-exception v0

    .line 2026
    :goto_0
    return-void
.end method

.method public static dispatchingKeyEvent()Z
    .locals 1

    .line 932
    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mDispatchingKeyEvent:Z

    return v0
.end method

.method public static formatLocale(Ljava/util/Locale;)Ljava/lang/String;
    .locals 5
    .param p0, "locale"    # Ljava/util/Locale;

    .line 2418
    const-string v0, ""

    .line 2419
    .local v0, "result":Ljava/lang/String;
    const-string v1, ""

    .line 2420
    .local v1, "lang":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    const-string v3, "in"

    const-string v4, ""

    if-ne v2, v3, :cond_0

    .line 2422
    const-string v1, "id"

    goto :goto_0

    .line 2423
    :cond_0
    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    if-ne v2, v4, :cond_1

    .line 2425
    const-string v1, "und"

    goto :goto_0

    .line 2427
    :cond_1
    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    .line 2430
    :goto_0
    invoke-virtual {p0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v2

    if-ne v2, v4, :cond_2

    .line 2431
    move-object v0, v1

    goto :goto_1

    .line 2433
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2435
    :goto_1
    return-object v0
.end method

.method public static getContentView()Landroid/view/View;
    .locals 1

    .line 1548
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mLayout:Landroid/view/ViewGroup;

    return-object v0
.end method

.method public static getContext()Landroid/app/Activity;
    .locals 1

    .line 1406
    invoke-static {}, Lorg/libsdl/app/SDL;->getContext()Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method public static getCurrentRotation()I
    .locals 4

    .line 643
    const/4 v0, 0x0

    .line 645
    .local v0, "result":I
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContext()Landroid/app/Activity;

    move-result-object v1

    .line 646
    .local v1, "activity":Landroid/app/Activity;
    if-eqz v1, :cond_0

    .line 647
    invoke-virtual {v1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    .line 648
    .local v2, "display":Landroid/view/Display;
    invoke-virtual {v2}, Landroid/view/Display;->getRotation()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    goto :goto_0

    .line 659
    :pswitch_0
    const/16 v0, 0x10e

    goto :goto_0

    .line 656
    :pswitch_1
    const/16 v0, 0xb4

    .line 657
    goto :goto_0

    .line 653
    :pswitch_2
    const/16 v0, 0x5a

    .line 654
    goto :goto_0

    .line 650
    :pswitch_3
    const/4 v0, 0x0

    .line 651
    nop

    .line 663
    .end local v2    # "display":Landroid/view/Display;
    :cond_0
    :goto_0
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static getDeviceFormFactor()Ljava/lang/String;
    .locals 1

    .line 1445
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->isAndroidTV()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1446
    const-string v0, "tv"

    return-object v0

    .line 1447
    :cond_0
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->isVRHeadset()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1448
    const-string v0, "headset"

    return-object v0

    .line 1449
    :cond_1
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->isTablet()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1450
    const-string v0, "tablet"

    return-object v0

    .line 1454
    :cond_2
    const-string v0, "phone"

    return-object v0
.end method

.method public static getDiagonal()D
    .locals 10

    .line 1460
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 1461
    .local v0, "metrics":Landroid/util/DisplayMetrics;
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContext()Landroid/app/Activity;

    move-result-object v1

    .line 1462
    .local v1, "activity":Landroid/app/Activity;
    if-nez v1, :cond_0

    .line 1463
    const-wide/16 v2, 0x0

    return-wide v2

    .line 1465
    :cond_0
    invoke-virtual {v1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 1467
    iget v2, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-double v2, v2

    iget v4, v0, Landroid/util/DisplayMetrics;->xdpi:F

    float-to-double v4, v4

    div-double/2addr v2, v4

    .line 1468
    .local v2, "dWidthInches":D
    iget v4, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-double v4, v4

    iget v6, v0, Landroid/util/DisplayMetrics;->ydpi:F

    float-to-double v6, v6

    div-double/2addr v4, v6

    .line 1470
    .local v4, "dHeightInches":D
    mul-double v6, v2, v2

    mul-double v8, v4, v4

    add-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v6

    return-wide v6
.end method

.method public static getManifestEnvironmentVariables()Z
    .locals 9

    .line 1520
    const/4 v0, 0x0

    :try_start_0
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContext()Landroid/app/Activity;

    move-result-object v1

    if-nez v1, :cond_0

    .line 1521
    return v0

    .line 1524
    :cond_0
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContext()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContext()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x80

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    .line 1525
    .local v1, "applicationInfo":Landroid/content/pm/ApplicationInfo;
    iget-object v2, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 1526
    .local v2, "bundle":Landroid/os/Bundle;
    if-nez v2, :cond_1

    .line 1527
    return v0

    .line 1529
    :cond_1
    const-string v3, "SDL_ENV."

    .line 1530
    .local v3, "prefix":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    .line 1531
    .local v4, "trimLength":I
    invoke-virtual {v2}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 1532
    .local v6, "key":Ljava/lang/String;
    invoke-virtual {v6, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 1533
    invoke-virtual {v6, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    .line 1534
    .local v7, "name":Ljava/lang/String;
    invoke-virtual {v2, v6}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1535
    .local v8, "value":Ljava/lang/String;
    invoke-static {v7, v8}, Lorg/libsdl/app/SDLActivity;->nativeSetenv(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1537
    .end local v6    # "key":Ljava/lang/String;
    .end local v7    # "name":Ljava/lang/String;
    .end local v8    # "value":Ljava/lang/String;
    :cond_2
    goto :goto_0

    .line 1539
    :cond_3
    const/4 v0, 0x1

    return v0

    .line 1540
    .end local v1    # "applicationInfo":Landroid/content/pm/ApplicationInfo;
    .end local v2    # "bundle":Landroid/os/Bundle;
    .end local v3    # "prefix":Ljava/lang/String;
    .end local v4    # "trimLength":I
    :catch_0
    move-exception v1

    .line 1541
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "exception "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "SDL"

    invoke-static {v3, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1543
    .end local v1    # "e":Ljava/lang/Exception;
    return v0
.end method

.method public static getMotionListener()Lorg/libsdl/app/SDLGenericMotionListener_API14;
    .locals 2

    .line 253
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mMotionListener:Lorg/libsdl/app/SDLGenericMotionListener_API14;

    if-nez v0, :cond_1

    .line 254
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    .line 255
    new-instance v0, Lorg/libsdl/app/SDLGenericMotionListener_API29;

    invoke-direct {v0}, Lorg/libsdl/app/SDLGenericMotionListener_API29;-><init>()V

    sput-object v0, Lorg/libsdl/app/SDLActivity;->mMotionListener:Lorg/libsdl/app/SDLGenericMotionListener_API14;

    goto :goto_0

    .line 256
    :cond_0
    nop

    .line 257
    new-instance v0, Lorg/libsdl/app/SDLGenericMotionListener_API26;

    invoke-direct {v0}, Lorg/libsdl/app/SDLGenericMotionListener_API26;-><init>()V

    sput-object v0, Lorg/libsdl/app/SDLActivity;->mMotionListener:Lorg/libsdl/app/SDLGenericMotionListener_API14;

    .line 265
    :cond_1
    :goto_0
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mMotionListener:Lorg/libsdl/app/SDLGenericMotionListener_API14;

    return-object v0
.end method

.method public static getNativeSurface()Landroid/view/Surface;
    .locals 1

    .line 1716
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    if-nez v0, :cond_0

    .line 1717
    const/4 v0, 0x0

    return-object v0

    .line 1719
    :cond_0
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    invoke-virtual {v0}, Lorg/libsdl/app/SDLSurface;->getNativeSurface()Landroid/view/Surface;

    move-result-object v0

    return-object v0
.end method

.method public static getNaturalOrientation()I
    .locals 7

    .line 623
    const/4 v0, 0x0

    .line 625
    .local v0, "result":I
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContext()Landroid/app/Activity;

    move-result-object v1

    .line 626
    .local v1, "activity":Landroid/app/Activity;
    if-eqz v1, :cond_5

    .line 627
    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    .line 628
    .local v2, "config":Landroid/content/res/Configuration;
    invoke-virtual {v1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v3

    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    .line 629
    .local v3, "display":Landroid/view/Display;
    invoke-virtual {v3}, Landroid/view/Display;->getRotation()I

    move-result v4

    .line 630
    .local v4, "rotation":I
    const/4 v5, 0x2

    if-eqz v4, :cond_0

    if-ne v4, v5, :cond_1

    :cond_0
    iget v6, v2, Landroid/content/res/Configuration;->orientation:I

    if-eq v6, v5, :cond_4

    :cond_1
    const/4 v5, 0x1

    if-eq v4, v5, :cond_2

    const/4 v6, 0x3

    if-ne v4, v6, :cond_3

    :cond_2
    iget v6, v2, Landroid/content/res/Configuration;->orientation:I

    if-ne v6, v5, :cond_3

    goto :goto_0

    .line 636
    :cond_3
    const/4 v0, 0x3

    goto :goto_1

    .line 634
    :cond_4
    :goto_0
    const/4 v0, 0x1

    .line 639
    .end local v2    # "config":Landroid/content/res/Configuration;
    .end local v3    # "display":Landroid/view/Display;
    .end local v4    # "rotation":I
    :cond_5
    :goto_1
    return v0
.end method

.method public static getPreferredLocales()Ljava/lang/String;
    .locals 5

    .line 2404
    const-string v0, ""

    .line 2405
    .local v0, "result":Ljava/lang/String;
    nop

    .line 2406
    invoke-static {}, Landroid/os/LocaleList;->getAdjustedDefault()Landroid/os/LocaleList;

    move-result-object v1

    .line 2407
    .local v1, "locales":Landroid/os/LocaleList;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v1}, Landroid/os/LocaleList;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 2408
    if-eqz v2, :cond_0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2409
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1, v2}, Landroid/os/LocaleList;->get(I)Ljava/util/Locale;

    move-result-object v4

    invoke-static {v4}, Lorg/libsdl/app/SDLActivity;->formatLocale(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2407
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2411
    .end local v1    # "locales":Landroid/os/LocaleList;
    .end local v2    # "i":I
    :cond_1
    nop

    .line 2414
    return-object v0
.end method

.method public static handleKeyEvent(Landroid/view/View;ILandroid/view/KeyEvent;Landroid/view/inputmethod/InputConnection;)Z
    .locals 6
    .param p0, "v"    # Landroid/view/View;
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;
    .param p3, "ic"    # Landroid/view/inputmethod/InputConnection;

    .line 1632
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getDeviceId()I

    move-result v0

    .line 1633
    .local v0, "deviceId":I
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getSource()I

    move-result v1

    .line 1634
    .local v1, "source":I
    invoke-static {v0}, Landroid/view/InputDevice;->getDevice(I)Landroid/view/InputDevice;

    move-result-object v2

    .line 1636
    .local v2, "device":Landroid/view/InputDevice;
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getFlags()I

    move-result v3

    and-int/lit16 v3, v3, 0x400

    const/4 v4, 0x1

    if-eqz v3, :cond_0

    .line 1640
    return v4

    .line 1643
    :cond_0
    if-nez v1, :cond_1

    .line 1644
    if-eqz v2, :cond_1

    .line 1645
    invoke-virtual {v2}, Landroid/view/InputDevice;->getSources()I

    move-result v1

    .line 1662
    :cond_1
    invoke-static {}, Lorg/libsdl/app/SDL;->isControllerManagerReady()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-static {v2}, Lorg/libsdl/app/SDLControllerManager;->isDeviceSDLJoystick(Landroid/view/InputDevice;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1664
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v3

    if-nez v3, :cond_2

    .line 1665
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getScanCode()I

    move-result v3

    invoke-static {v0, p1, v3}, Lorg/libsdl/app/SDLControllerManager;->onNativePadDown(III)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1666
    return v4

    .line 1668
    :cond_2
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v3

    if-ne v3, v4, :cond_3

    .line 1669
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getScanCode()I

    move-result v3

    invoke-static {v0, p1, v3}, Lorg/libsdl/app/SDLControllerManager;->onNativePadUp(III)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1670
    return v4

    .line 1675
    :cond_3
    and-int/lit16 v3, v1, 0x2002

    const/16 v5, 0x2002

    if-ne v3, v5, :cond_6

    .line 1676
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->isVRHeadset()Z

    move-result v3

    if-eqz v3, :cond_4

    goto :goto_0

    .line 1681
    :cond_4
    const/4 v3, 0x4

    if-eq p1, v3, :cond_5

    const/16 v3, 0x7d

    if-ne p1, v3, :cond_6

    .line 1682
    :cond_5
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    goto :goto_0

    .line 1687
    :pswitch_0
    return v4

    .line 1693
    :cond_6
    :goto_0
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v3

    if-nez v3, :cond_9

    .line 1694
    invoke-static {p1}, Lorg/libsdl/app/SDLActivity;->onNativeKeyDown(I)V

    .line 1696
    invoke-static {p2}, Lorg/libsdl/app/SDLActivity;->isTextInputEvent(Landroid/view/KeyEvent;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 1697
    if-eqz p3, :cond_7

    .line 1698
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getUnicodeChar()I

    move-result v3

    int-to-char v3, v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p3, v3, v4}, Landroid/view/inputmethod/InputConnection;->commitText(Ljava/lang/CharSequence;I)Z

    goto :goto_1

    .line 1700
    :cond_7
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getUnicodeChar()I

    move-result v3

    int-to-char v3, v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v4}, Lorg/libsdl/app/SDLInputConnection;->nativeCommitText(Ljava/lang/String;I)V

    .line 1703
    :cond_8
    :goto_1
    return v4

    .line 1704
    :cond_9
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v3

    if-ne v3, v4, :cond_a

    .line 1705
    invoke-static {p1}, Lorg/libsdl/app/SDLActivity;->onNativeKeyUp(I)V

    .line 1706
    return v4

    .line 1709
    :cond_a
    const/4 v3, 0x0

    return v3

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static handleNativeState()V
    .locals 5

    .line 938
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mNextNativeState:Lorg/libsdl/app/SDLActivity$NativeState;

    sget-object v1, Lorg/libsdl/app/SDLActivity;->mCurrentNativeState:Lorg/libsdl/app/SDLActivity$NativeState;

    if-ne v0, v1, :cond_0

    .line 940
    return-void

    .line 944
    :cond_0
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mNextNativeState:Lorg/libsdl/app/SDLActivity$NativeState;

    sget-object v1, Lorg/libsdl/app/SDLActivity$NativeState;->INIT:Lorg/libsdl/app/SDLActivity$NativeState;

    if-ne v0, v1, :cond_1

    .line 946
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mNextNativeState:Lorg/libsdl/app/SDLActivity$NativeState;

    sput-object v0, Lorg/libsdl/app/SDLActivity;->mCurrentNativeState:Lorg/libsdl/app/SDLActivity$NativeState;

    .line 947
    return-void

    .line 951
    :cond_1
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mNextNativeState:Lorg/libsdl/app/SDLActivity$NativeState;

    sget-object v1, Lorg/libsdl/app/SDLActivity$NativeState;->PAUSED:Lorg/libsdl/app/SDLActivity$NativeState;

    if-ne v0, v1, :cond_4

    .line 952
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSDLThread:Ljava/lang/Thread;

    if-eqz v0, :cond_2

    .line 953
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->nativePause()V

    .line 955
    :cond_2
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    if-eqz v0, :cond_3

    .line 956
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    invoke-virtual {v0}, Lorg/libsdl/app/SDLSurface;->handlePause()V

    .line 958
    :cond_3
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mNextNativeState:Lorg/libsdl/app/SDLActivity$NativeState;

    sput-object v0, Lorg/libsdl/app/SDLActivity;->mCurrentNativeState:Lorg/libsdl/app/SDLActivity$NativeState;

    .line 959
    return-void

    .line 963
    :cond_4
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mNextNativeState:Lorg/libsdl/app/SDLActivity$NativeState;

    sget-object v1, Lorg/libsdl/app/SDLActivity$NativeState;->RESUMED:Lorg/libsdl/app/SDLActivity$NativeState;

    if-ne v0, v1, :cond_b

    .line 964
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    const/4 v1, 0x1

    if-nez v0, :cond_5

    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mIsResumedCalled:Z

    goto :goto_0

    .line 965
    :cond_5
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    iget-boolean v0, v0, Lorg/libsdl/app/SDLSurface;->mIsSurfaceReady:Z

    if-eqz v0, :cond_7

    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mHasFocus:Z

    if-nez v0, :cond_6

    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mHasMultiWindow:Z

    if-eqz v0, :cond_7

    :cond_6
    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mIsResumedCalled:Z

    if-eqz v0, :cond_7

    move v0, v1

    goto :goto_0

    :cond_7
    const/4 v0, 0x0

    :goto_0
    nop

    .line 966
    .local v0, "readyToRun":Z
    if-eqz v0, :cond_b

    .line 967
    sget-object v2, Lorg/libsdl/app/SDLActivity;->mSDLThread:Ljava/lang/Thread;

    if-nez v2, :cond_9

    .line 972
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lorg/libsdl/app/SDLMain;

    invoke-direct {v3}, Lorg/libsdl/app/SDLMain;-><init>()V

    const-string v4, "SDLThread"

    invoke-direct {v2, v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    sput-object v2, Lorg/libsdl/app/SDLActivity;->mSDLThread:Ljava/lang/Thread;

    .line 973
    sget-object v2, Lorg/libsdl/app/SDLActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    if-eqz v2, :cond_8

    .line 974
    sget-object v2, Lorg/libsdl/app/SDLActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    invoke-virtual {v2, v1, v1}, Lorg/libsdl/app/SDLSurface;->enableSensor(IZ)V

    .line 976
    :cond_8
    sget-object v1, Lorg/libsdl/app/SDLActivity;->mSDLThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    goto :goto_1

    .line 980
    :cond_9
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->nativeResume()V

    .line 982
    :goto_1
    sget-object v1, Lorg/libsdl/app/SDLActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    if-eqz v1, :cond_a

    .line 983
    sget-object v1, Lorg/libsdl/app/SDLActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    invoke-virtual {v1}, Lorg/libsdl/app/SDLSurface;->handleResume()V

    .line 986
    :cond_a
    sget-object v1, Lorg/libsdl/app/SDLActivity;->mNextNativeState:Lorg/libsdl/app/SDLActivity$NativeState;

    sput-object v1, Lorg/libsdl/app/SDLActivity;->mCurrentNativeState:Lorg/libsdl/app/SDLActivity$NativeState;

    .line 989
    .end local v0    # "readyToRun":Z
    :cond_b
    return-void
.end method

.method public static initTouch()V
    .locals 7

    .line 1728
    invoke-static {}, Landroid/view/InputDevice;->getDeviceIds()[I

    move-result-object v0

    .line 1730
    .local v0, "ids":[I
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget v3, v0, v2

    .line 1731
    .local v3, "id":I
    invoke-static {v3}, Landroid/view/InputDevice;->getDevice(I)Landroid/view/InputDevice;

    move-result-object v4

    .line 1733
    .local v4, "device":Landroid/view/InputDevice;
    if-eqz v4, :cond_1

    invoke-virtual {v4}, Landroid/view/InputDevice;->getSources()I

    move-result v5

    const/16 v6, 0x1002

    and-int/2addr v5, v6

    if-eq v5, v6, :cond_0

    .line 1734
    invoke-virtual {v4}, Landroid/view/InputDevice;->isVirtual()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1736
    :cond_0
    invoke-virtual {v4}, Landroid/view/InputDevice;->getId()I

    move-result v5

    invoke-virtual {v4}, Landroid/view/InputDevice;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lorg/libsdl/app/SDLActivity;->nativeAddTouch(ILjava/lang/String;)V

    .line 1730
    .end local v3    # "id":I
    .end local v4    # "device":Landroid/view/InputDevice;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1739
    :cond_2
    return-void
.end method

.method public static initialize()V
    .locals 2

    .line 360
    const/4 v0, 0x0

    sput-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    .line 361
    sput-object v0, Lorg/libsdl/app/SDLActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    .line 362
    sput-object v0, Lorg/libsdl/app/SDLActivity;->mTextEdit:Lorg/libsdl/app/SDLDummyEdit;

    .line 363
    sput-object v0, Lorg/libsdl/app/SDLActivity;->mLayout:Landroid/view/ViewGroup;

    .line 364
    sput-object v0, Lorg/libsdl/app/SDLActivity;->mClipboardHandler:Lorg/libsdl/app/SDLClipboardHandler;

    .line 365
    new-instance v1, Ljava/util/Hashtable;

    invoke-direct {v1}, Ljava/util/Hashtable;-><init>()V

    sput-object v1, Lorg/libsdl/app/SDLActivity;->mCursors:Ljava/util/Hashtable;

    .line 366
    const/4 v1, 0x0

    sput v1, Lorg/libsdl/app/SDLActivity;->mLastCursorID:I

    .line 367
    sput-object v0, Lorg/libsdl/app/SDLActivity;->mSDLThread:Ljava/lang/Thread;

    .line 368
    sput-boolean v1, Lorg/libsdl/app/SDLActivity;->mIsResumedCalled:Z

    .line 369
    const/4 v0, 0x1

    sput-boolean v0, Lorg/libsdl/app/SDLActivity;->mHasFocus:Z

    .line 370
    sget-object v0, Lorg/libsdl/app/SDLActivity$NativeState;->INIT:Lorg/libsdl/app/SDLActivity$NativeState;

    sput-object v0, Lorg/libsdl/app/SDLActivity;->mNextNativeState:Lorg/libsdl/app/SDLActivity$NativeState;

    .line 371
    sget-object v0, Lorg/libsdl/app/SDLActivity$NativeState;->INIT:Lorg/libsdl/app/SDLActivity$NativeState;

    sput-object v0, Lorg/libsdl/app/SDLActivity;->mCurrentNativeState:Lorg/libsdl/app/SDLActivity$NativeState;

    .line 372
    return-void
.end method

.method public static isAndroidTV()Z
    .locals 4

    .line 1413
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContext()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "uimode"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/UiModeManager;

    .line 1414
    .local v0, "uiModeManager":Landroid/app/UiModeManager;
    invoke-virtual {v0}, Landroid/app/UiModeManager;->getCurrentModeType()I

    move-result v1

    const/4 v2, 0x4

    const/4 v3, 0x1

    if-ne v1, v2, :cond_0

    .line 1415
    return v3

    .line 1417
    :cond_0
    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    const-string v2, "MINIX"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v2, "NEO-U1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1418
    return v3

    .line 1420
    :cond_1
    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    const-string v2, "Amlogic"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 1421
    const-string v2, "TV"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 1422
    const-string v2, "X96-W"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 1423
    const-string v2, "A95X-R1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1424
    :cond_2
    return v3

    .line 1426
    :cond_3
    const/4 v1, 0x0

    return v1
.end method

.method public static isChromebook()Z
    .locals 3

    .line 1486
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContext()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 1487
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContext()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v2, "org.chromium.arc"

    invoke-virtual {v0, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1488
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContext()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v2, "org.chromium.arc.device_management"

    invoke-virtual {v0, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1489
    :cond_0
    return v1

    .line 1494
    :cond_1
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    if-eqz v0, :cond_2

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v2, "sdk_gpc_"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    move v0, v1

    .line 1495
    .local v0, "isChromebookEmulator":Z
    return v0
.end method

.method public static isDeXMode()Z
    .locals 5

    .line 1502
    nop

    .line 1506
    const/4 v0, 0x0

    :try_start_0
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContext()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    .line 1507
    .local v1, "config":Landroid/content/res/Configuration;
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    .line 1508
    .local v2, "configClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "SEM_DESKTOP_MODE_ENABLED"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v3

    const-string v4, "semDesktopModeEnabled"

    .line 1509
    invoke-virtual {v2, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-ne v3, v4, :cond_0

    const/4 v0, 0x1

    .line 1508
    :cond_0
    return v0

    .line 1510
    .end local v1    # "config":Landroid/content/res/Configuration;
    .end local v2    # "configClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_0
    move-exception v1

    .line 1511
    .local v1, "ignored":Ljava/lang/Exception;
    return v0
.end method

.method public static isTablet()Z
    .locals 4

    .line 1478
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getDiagonal()D

    move-result-wide v0

    const-wide/high16 v2, 0x401c000000000000L    # 7.0

    cmpl-double v0, v0, v2

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isTextInputEvent(Landroid/view/KeyEvent;)Z
    .locals 3
    .param p0, "event"    # Landroid/view/KeyEvent;

    .line 1624
    invoke-virtual {p0}, Landroid/view/KeyEvent;->isCtrlPressed()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1625
    return v1

    .line 1628
    :cond_0
    invoke-virtual {p0}, Landroid/view/KeyEvent;->isPrintingKey()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/16 v2, 0x3e

    if-ne v0, v2, :cond_2

    :cond_1
    const/4 v1, 0x1

    :cond_2
    return v1
.end method

.method public static isVRHeadset()Z
    .locals 3

    .line 1430
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    const-string v1, "Oculus"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v2, "Quest"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1431
    return v1

    .line 1433
    :cond_0
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    const-string v2, "Pico"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1434
    return v1

    .line 1436
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public static manualBackButton()V
    .locals 1

    .line 888
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    invoke-virtual {v0}, Lorg/libsdl/app/SDLActivity;->pressBackButton()V

    .line 889
    return-void
.end method

.method public static minimizeWindow()V
    .locals 2

    .line 1344
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    if-nez v0, :cond_0

    .line 1345
    return-void

    .line 1348
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1349
    .local v0, "startMain":Landroid/content/Intent;
    const-string v1, "android.intent.category.HOME"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 1350
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1351
    sget-object v1, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    invoke-virtual {v1, v0}, Lorg/libsdl/app/SDLActivity;->startActivity(Landroid/content/Intent;)V

    .line 1352
    return-void
.end method

.method public static native nativeAddTouch(ILjava/lang/String;)V
.end method

.method public static native nativeAllowRecreateActivity()Z
.end method

.method public static native nativeCheckSDLThreadCounter()I
.end method

.method public static native nativeCleanupMainThread()V
.end method

.method public static native nativeFocusChanged(Z)V
.end method

.method public static native nativeGetCompiledSubsystems()I
.end method

.method public static native nativeGetHint(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static native nativeGetHintBoolean(Ljava/lang/String;Z)Z
.end method

.method public static native nativeGetVersion()Ljava/lang/String;
.end method

.method public static native nativeInitMainThread()V
.end method

.method public static native nativeIsHIDAPIEnabled()Z
.end method

.method public static native nativeLowMemory()V
.end method

.method public static native nativePause()V
.end method

.method public static native nativePermissionResult(IZ)V
.end method

.method public static native nativeQuit()V
.end method

.method public static native nativeResume()V
.end method

.method public static native nativeRunMain(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)I
.end method

.method public static native nativeSendQuit()V
.end method

.method public static native nativeSetNaturalOrientation(I)V
.end method

.method public static native nativeSetScreenResolution(IIIIFF)V
.end method

.method public static native nativeSetenv(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public static native nativeSetupJNI()V
.end method

.method public static native onNativeClipboardChanged()V
.end method

.method public static native onNativeDarkModeChanged(Z)V
.end method

.method public static native onNativeDropFile(Ljava/lang/String;)V
.end method

.method public static native onNativeFileDialog(I[Ljava/lang/String;I)V
.end method

.method public static native onNativeInsetsChanged(IIII)V
.end method

.method public static native onNativeKeyDown(I)V
.end method

.method public static native onNativeKeyUp(I)V
.end method

.method public static native onNativeKeyboardFocusLost()V
.end method

.method public static native onNativeLocaleChanged()V
.end method

.method public static native onNativeMouse(IIFFZ)V
.end method

.method public static native onNativePen(IIIIFFF)V
.end method

.method public static native onNativePinchEnd()V
.end method

.method public static native onNativePinchStart(FFFF)V
.end method

.method public static native onNativePinchUpdate(FFFFF)V
.end method

.method public static native onNativeResize()V
.end method

.method public static native onNativeRotationChanged(I)V
.end method

.method public static native onNativeScreenKeyboardHidden()V
.end method

.method public static native onNativeScreenKeyboardShown()V
.end method

.method public static native onNativeSoftReturnKey()Z
.end method

.method public static native onNativeSurfaceChanged()V
.end method

.method public static native onNativeSurfaceCreated()V
.end method

.method public static native onNativeSurfaceDestroyed()V
.end method

.method public static native onNativeTouch(IIIFFF)V
.end method

.method public static openFileDescriptor(Ljava/lang/String;Ljava/lang/String;)I
    .locals 3
    .param p0, "uri"    # Ljava/lang/String;
    .param p1, "mode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 2259
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 2260
    return v1

    .line 2264
    :cond_0
    :try_start_0
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    invoke-virtual {v0}, Lorg/libsdl/app/SDLActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v2, p1}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    .line 2265
    .local v0, "pfd":Landroid/os/ParcelFileDescriptor;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->detachFd()I

    move-result v1
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    return v1

    .line 2266
    .end local v0    # "pfd":Landroid/os/ParcelFileDescriptor;
    :catch_0
    move-exception v0

    .line 2267
    .local v0, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    .line 2268
    return v1
.end method

.method public static openURL(Ljava/lang/String;)Z
    .locals 3
    .param p0, "url"    # Ljava/lang/String;

    .line 2194
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2195
    .local v0, "i":Landroid/content/Intent;
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 2197
    const/high16 v1, 0x48080000    # 139264.0f

    .line 2200
    .local v1, "flags":I
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 2202
    sget-object v2, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    invoke-virtual {v2, v0}, Lorg/libsdl/app/SDLActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2205
    .end local v0    # "i":Landroid/content/Intent;
    .end local v1    # "flags":I
    nop

    .line 2206
    const/4 v0, 0x1

    return v0

    .line 2203
    :catch_0
    move-exception v0

    .line 2204
    .local v0, "ex":Ljava/lang/Exception;
    const/4 v1, 0x0

    return v1
.end method

.method public static requestPermission(Ljava/lang/String;I)V
    .locals 3
    .param p0, "permission"    # Ljava/lang/String;
    .param p1, "requestCode"    # I

    .line 2169
    nop

    .line 2174
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContext()Landroid/app/Activity;

    move-result-object v0

    .line 2175
    .local v0, "activity":Landroid/app/Activity;
    invoke-virtual {v0, p0}, Landroid/app/Activity;->checkSelfPermission(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    .line 2176
    new-array v1, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    invoke-virtual {v0, v1, p1}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V

    goto :goto_0

    .line 2178
    :cond_0
    invoke-static {p1, v2}, Lorg/libsdl/app/SDLActivity;->nativePermissionResult(IZ)V

    .line 2180
    :goto_0
    return-void
.end method

.method public static sendMessage(II)Z
    .locals 2
    .param p0, "command"    # I
    .param p1, "param"    # I

    .line 1396
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    if-nez v0, :cond_0

    .line 1397
    const/4 v0, 0x0

    return v0

    .line 1399
    :cond_0
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Lorg/libsdl/app/SDLActivity;->sendCommand(ILjava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static setActivityTitle(Ljava/lang/String;)Z
    .locals 2
    .param p0, "title"    # Ljava/lang/String;

    .line 1245
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p0}, Lorg/libsdl/app/SDLActivity;->sendCommand(ILjava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static setBackButtonTrapEnabled(Z)V
    .locals 3
    .param p0, "enabled"    # Z

    .line 797
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-ge v0, v1, :cond_0

    .line 799
    return-void

    .line 803
    :cond_0
    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mBackKeyTrapEnabled:Z

    if-ne p0, v0, :cond_1

    .line 804
    return-void

    .line 807
    :cond_1
    sget-object v0, Lorg/libsdl/app/SDLActivity;->backButtonCallback:Landroid/window/OnBackInvokedCallback;

    if-nez v0, :cond_2

    .line 808
    new-instance v0, Lorg/libsdl/app/SDLActivity$2;

    invoke-direct {v0}, Lorg/libsdl/app/SDLActivity$2;-><init>()V

    sput-object v0, Lorg/libsdl/app/SDLActivity;->backButtonCallback:Landroid/window/OnBackInvokedCallback;

    .line 828
    :cond_2
    if-eqz p0, :cond_3

    .line 829
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    invoke-virtual {v0}, Lorg/libsdl/app/SDLActivity;->getOnBackInvokedDispatcher()Landroid/window/OnBackInvokedDispatcher;

    move-result-object v0

    const/4 v1, 0x0

    sget-object v2, Lorg/libsdl/app/SDLActivity;->backButtonCallback:Landroid/window/OnBackInvokedCallback;

    invoke-interface {v0, v1, v2}, Landroid/window/OnBackInvokedDispatcher;->registerOnBackInvokedCallback(ILandroid/window/OnBackInvokedCallback;)V

    goto :goto_0

    .line 832
    :cond_3
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    invoke-virtual {v0}, Lorg/libsdl/app/SDLActivity;->getOnBackInvokedDispatcher()Landroid/window/OnBackInvokedDispatcher;

    move-result-object v0

    sget-object v1, Lorg/libsdl/app/SDLActivity;->backButtonCallback:Landroid/window/OnBackInvokedCallback;

    invoke-interface {v0, v1}, Landroid/window/OnBackInvokedDispatcher;->unregisterOnBackInvokedCallback(Landroid/window/OnBackInvokedCallback;)V

    .line 834
    :goto_0
    sput-boolean p0, Lorg/libsdl/app/SDLActivity;->mBackKeyTrapEnabled:Z

    .line 835
    return-void
.end method

.method public static setCustomCursor(I)Z
    .locals 3
    .param p0, "cursorID"    # I

    .line 2034
    nop

    .line 2036
    :try_start_0
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    sget-object v1, Lorg/libsdl/app/SDLActivity;->mCursors:Ljava/util/Hashtable;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/PointerIcon;

    invoke-virtual {v0, v1}, Lorg/libsdl/app/SDLSurface;->setPointerIcon(Landroid/view/PointerIcon;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2039
    nop

    .line 2043
    const/4 v0, 0x1

    return v0

    .line 2037
    :catch_0
    move-exception v0

    .line 2038
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    return v1
.end method

.method public static setOrientation(IIZLjava/lang/String;)V
    .locals 1
    .param p0, "w"    # I
    .param p1, "h"    # I
    .param p2, "resizable"    # Z
    .param p3, "hint"    # Ljava/lang/String;

    .line 1263
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    if-eqz v0, :cond_0

    .line 1264
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    invoke-virtual {v0, p0, p1, p2, p3}, Lorg/libsdl/app/SDLActivity;->setOrientationBis(IIZLjava/lang/String;)V

    .line 1266
    :cond_0
    return-void
.end method

.method public static setRelativeMouseEnabled(Z)Z
    .locals 1
    .param p0, "enabled"    # Z

    .line 1385
    if-eqz p0, :cond_0

    invoke-static {}, Lorg/libsdl/app/SDLActivity;->supportsRelativeMouse()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1386
    const/4 v0, 0x0

    return v0

    .line 1389
    :cond_0
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getMotionListener()Lorg/libsdl/app/SDLGenericMotionListener_API14;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/libsdl/app/SDLGenericMotionListener_API14;->setRelativeMouseEnabled(Z)Z

    move-result v0

    return v0
.end method

.method public static setSystemCursor(I)Z
    .locals 3
    .param p0, "cursorID"    # I

    .line 2050
    const/4 v0, 0x0

    .line 2051
    .local v0, "cursor_type":I
    packed-switch p0, :pswitch_data_0

    goto/16 :goto_0

    .line 2152
    :pswitch_0
    const/16 v0, 0x3fb

    goto/16 :goto_0

    .line 2149
    :pswitch_1
    const/16 v0, 0x3fa

    .line 2150
    goto/16 :goto_0

    .line 2146
    :pswitch_2
    const/16 v0, 0x3f5

    .line 2147
    goto/16 :goto_0

    .line 2143
    :pswitch_3
    const/16 v0, 0x3f7

    .line 2144
    goto/16 :goto_0

    .line 2140
    :pswitch_4
    const/16 v0, 0x3f6

    .line 2141
    goto/16 :goto_0

    .line 2137
    :pswitch_5
    const/16 v0, 0x3fd

    .line 2138
    goto/16 :goto_0

    .line 2134
    :pswitch_6
    const/16 v0, 0x3fc

    .line 2135
    goto/16 :goto_0

    .line 2131
    :pswitch_7
    const/16 v0, 0x3f4

    .line 2132
    goto/16 :goto_0

    .line 2128
    :pswitch_8
    const/16 v0, 0x3f3

    .line 2129
    goto :goto_0

    .line 2125
    :pswitch_9
    const/16 v0, 0x3f2

    .line 2126
    goto :goto_0

    .line 2122
    :pswitch_a
    const/16 v0, 0x3f1

    .line 2123
    goto :goto_0

    .line 2119
    :pswitch_b
    const/16 v0, 0x3ee

    .line 2120
    goto :goto_0

    .line 2116
    :pswitch_c
    const/16 v0, 0x3eb

    .line 2117
    goto :goto_0

    .line 2113
    :pswitch_d
    const/16 v0, 0x3e9

    .line 2114
    goto :goto_0

    .line 2110
    :pswitch_e
    const/16 v0, 0x3f6

    .line 2111
    goto :goto_0

    .line 2107
    :pswitch_f
    const/16 v0, 0x3f8

    .line 2108
    goto :goto_0

    .line 2104
    :pswitch_10
    const/16 v0, 0x3f7

    .line 2105
    goto :goto_0

    .line 2101
    :pswitch_11
    const/16 v0, 0x3f9

    .line 2102
    goto :goto_0

    .line 2098
    :pswitch_12
    const/16 v0, 0x3f6

    .line 2099
    goto :goto_0

    .line 2095
    :pswitch_13
    const/16 v0, 0x3f8

    .line 2096
    goto :goto_0

    .line 2092
    :pswitch_14
    const/16 v0, 0x3f7

    .line 2093
    goto :goto_0

    .line 2089
    :pswitch_15
    const/16 v0, 0x3f9

    .line 2090
    goto :goto_0

    .line 2086
    :pswitch_16
    const/16 v0, 0x3ea

    .line 2087
    goto :goto_0

    .line 2083
    :pswitch_17
    const/16 v0, 0x3f4

    .line 2084
    goto :goto_0

    .line 2080
    :pswitch_18
    const/16 v0, 0x3fc

    .line 2081
    goto :goto_0

    .line 2077
    :pswitch_19
    const/16 v0, 0x3f7

    .line 2078
    goto :goto_0

    .line 2074
    :pswitch_1a
    const/16 v0, 0x3f6

    .line 2075
    goto :goto_0

    .line 2071
    :pswitch_1b
    const/16 v0, 0x3f8

    .line 2072
    goto :goto_0

    .line 2068
    :pswitch_1c
    const/16 v0, 0x3f9

    .line 2069
    goto :goto_0

    .line 2065
    :pswitch_1d
    const/16 v0, 0x3ec

    .line 2066
    goto :goto_0

    .line 2062
    :pswitch_1e
    const/16 v0, 0x3ef

    .line 2063
    goto :goto_0

    .line 2059
    :pswitch_1f
    const/16 v0, 0x3ec

    .line 2060
    goto :goto_0

    .line 2056
    :pswitch_20
    const/16 v0, 0x3f0

    .line 2057
    goto :goto_0

    .line 2053
    :pswitch_21
    const/16 v0, 0x3e8

    .line 2054
    nop

    .line 2155
    :goto_0
    nop

    .line 2157
    :try_start_0
    sget-object v1, Lorg/libsdl/app/SDLActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContext()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2, v0}, Landroid/view/PointerIcon;->getSystemIcon(Landroid/content/Context;I)Landroid/view/PointerIcon;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/libsdl/app/SDLSurface;->setPointerIcon(Landroid/view/PointerIcon;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2160
    nop

    .line 2162
    const/4 v1, 0x1

    return v1

    .line 2158
    :catch_0
    move-exception v1

    .line 2159
    .local v1, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    return v2

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
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

.method public static setWindowStyle(Z)V
    .locals 3
    .param p0, "fullscreen"    # Z

    .line 1253
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Lorg/libsdl/app/SDLActivity;->sendCommand(ILjava/lang/Object;)Z

    .line 1254
    return-void
.end method

.method public static shouldMinimizeOnFocusLoss()Z
    .locals 1

    .line 1358
    const/4 v0, 0x0

    return v0
.end method

.method public static showFileDialog([Ljava/lang/String;ZILjava/lang/String;I)Z
    .locals 16
    .param p0, "filters"    # [Ljava/lang/String;
    .param p1, "allowMultiple"    # Z
    .param p2, "type"    # I
    .param p3, "initialPath"    # Ljava/lang/String;
    .param p4, "requestCode"    # I

    .line 2277
    move-object/from16 v1, p0

    move/from16 v2, p2

    move-object/from16 v3, p3

    move/from16 v4, p4

    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    const/4 v5, 0x0

    if-nez v0, :cond_0

    .line 2278
    return v5

    .line 2282
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v6, v0

    .line 2283
    .local v6, "mimes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v7

    .line 2284
    .local v7, "mimeTypeMap":Landroid/webkit/MimeTypeMap;
    const/4 v8, 0x2

    const-string v9, "*/*"

    const/4 v10, 0x1

    if-eqz v1, :cond_4

    if-eq v2, v8, :cond_4

    .line 2285
    array-length v0, v1

    move v11, v5

    :goto_0
    if-ge v11, v0, :cond_4

    aget-object v12, v1, v11

    .line 2286
    .local v12, "pattern":Ljava/lang/String;
    const-string v13, ";"

    invoke-virtual {v12, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v13

    .line 2288
    .local v13, "extensions":[Ljava/lang/String;
    array-length v14, v13

    if-ne v14, v10, :cond_1

    aget-object v14, v13, v5

    const-string v15, "*"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_1

    .line 2290
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 2292
    :cond_1
    array-length v14, v13

    move v15, v5

    :goto_1
    if-ge v15, v14, :cond_3

    aget-object v10, v13, v15

    .line 2293
    .local v10, "ext":Ljava/lang/String;
    invoke-virtual {v7, v10}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 2294
    .local v8, "mime":Ljava/lang/String;
    if-eqz v8, :cond_2

    .line 2295
    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2292
    .end local v8    # "mime":Ljava/lang/String;
    .end local v10    # "ext":Ljava/lang/String;
    :cond_2
    add-int/lit8 v15, v15, 0x1

    const/4 v8, 0x2

    const/4 v10, 0x1

    goto :goto_1

    .line 2285
    .end local v12    # "pattern":Ljava/lang/String;
    .end local v13    # "extensions":[Ljava/lang/String;
    :cond_3
    :goto_2
    add-int/lit8 v11, v11, 0x1

    const/4 v8, 0x2

    const/4 v10, 0x1

    goto :goto_0

    .line 2303
    :cond_4
    const/4 v8, 0x0

    .line 2305
    .local v8, "initialPathUri":Landroid/net/Uri;
    const-string v10, "SDL"

    if-eqz v3, :cond_5

    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    .line 2307
    :try_start_0
    invoke-static/range {p3 .. p3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v8, v0

    .line 2310
    goto :goto_3

    .line 2308
    :catch_0
    move-exception v0

    move-object v11, v0

    move-object v0, v11

    .line 2309
    .local v0, "e":Ljava/lang/Exception;
    const-string v11, "Failed to parse initial path URI, ignoring initial path"

    invoke-static {v10, v11, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2313
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_5
    :goto_3
    const-string v0, "SDL_ANDROID_ALLOW_PERSISTENT_FOLDER_ACCESS"

    invoke-static {v0, v5}, Lorg/libsdl/app/SDLActivity;->nativeGetHintBoolean(Ljava/lang/String;Z)Z

    move-result v11

    .line 2317
    .local v11, "persistable":Z
    packed-switch v2, :pswitch_data_0

    .line 2329
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unsupported file dialog type: "

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v10, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2330
    return v5

    .line 2326
    :pswitch_0
    const-string v0, "android.intent.action.OPEN_DOCUMENT_TREE"

    .line 2327
    .local v0, "action":Ljava/lang/String;
    move/from16 v12, p1

    move-object v13, v0

    goto :goto_4

    .line 2322
    .end local v0    # "action":Ljava/lang/String;
    :pswitch_1
    const-string v0, "android.intent.action.CREATE_DOCUMENT"

    .line 2323
    .restart local v0    # "action":Ljava/lang/String;
    const/4 v12, 0x0

    .line 2324
    .end local p1    # "allowMultiple":Z
    .local v12, "allowMultiple":Z
    move-object v13, v0

    goto :goto_4

    .line 2319
    .end local v0    # "action":Ljava/lang/String;
    .end local v12    # "allowMultiple":Z
    .restart local p1    # "allowMultiple":Z
    :pswitch_2
    const-string v0, "android.intent.action.OPEN_DOCUMENT"

    .line 2320
    .restart local v0    # "action":Ljava/lang/String;
    move/from16 v12, p1

    move-object v13, v0

    .line 2334
    .end local v0    # "action":Ljava/lang/String;
    .end local p1    # "allowMultiple":Z
    .restart local v12    # "allowMultiple":Z
    .local v13, "action":Ljava/lang/String;
    :goto_4
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, v13}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    move-object v14, v0

    .line 2335
    .local v14, "intent":Landroid/content/Intent;
    const/4 v15, 0x2

    if-eq v2, v15, :cond_6

    .line 2336
    const-string v0, "android.intent.category.OPENABLE"

    invoke-virtual {v14, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 2337
    const-string v0, "android.intent.extra.ALLOW_MULTIPLE"

    invoke-virtual {v14, v0, v12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 2338
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    packed-switch v0, :pswitch_data_1

    .line 2346
    invoke-virtual {v14, v9}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 2347
    new-array v0, v5, [Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    const-string v9, "android.intent.extra.MIME_TYPES"

    invoke-virtual {v14, v9, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_5

    .line 2343
    :pswitch_3
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v14, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 2344
    goto :goto_5

    .line 2340
    :pswitch_4
    invoke-virtual {v14, v9}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 2341
    goto :goto_5

    .line 2350
    :cond_6
    const/4 v0, 0x3

    .line 2352
    .local v0, "intent_flags":I
    if-eqz v11, :cond_7

    .line 2353
    or-int/lit16 v0, v0, 0xc0

    .line 2356
    :cond_7
    invoke-virtual {v14, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 2359
    .end local v0    # "intent_flags":I
    :goto_5
    if-eqz v8, :cond_8

    .line 2360
    const-string v0, "android.provider.extra.INITIAL_URI"

    invoke-virtual {v14, v0, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 2364
    :cond_8
    const/4 v9, 0x1

    if-ne v2, v9, :cond_a

    if-eqz v3, :cond_a

    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_a

    .line 2365
    const-string v0, "/"

    invoke-virtual {v3, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_a

    const-string v0, "\\"

    invoke-virtual {v3, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_a

    .line 2366
    move-object/from16 v0, p3

    .line 2367
    .local v0, "title":Ljava/lang/String;
    const/16 v9, 0x2f

    invoke-virtual {v0, v9}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v9

    const/16 v15, 0x5c

    invoke-virtual {v0, v15}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v15

    invoke-static {v9, v15}, Ljava/lang/Math;->max(II)I

    move-result v9

    .line 2368
    .local v9, "lastSeparator":I
    if-ltz v9, :cond_9

    .line 2369
    add-int/lit8 v15, v9, 0x1

    invoke-virtual {v0, v15}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 2371
    :cond_9
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v15

    if-nez v15, :cond_a

    .line 2372
    const-string v15, "android.intent.extra.TITLE"

    invoke-virtual {v14, v15, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2378
    .end local v0    # "title":Ljava/lang/String;
    .end local v9    # "lastSeparator":I
    :cond_a
    :try_start_1
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    invoke-virtual {v0, v14, v4}, Lorg/libsdl/app/SDLActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 2382
    nop

    .line 2385
    new-instance v0, Lorg/libsdl/app/SDLActivity$SDLFileDialogState;

    invoke-direct {v0}, Lorg/libsdl/app/SDLActivity$SDLFileDialogState;-><init>()V

    sput-object v0, Lorg/libsdl/app/SDLActivity;->mFileDialogState:Lorg/libsdl/app/SDLActivity$SDLFileDialogState;

    .line 2386
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mFileDialogState:Lorg/libsdl/app/SDLActivity$SDLFileDialogState;

    iput v4, v0, Lorg/libsdl/app/SDLActivity$SDLFileDialogState;->requestCode:I

    .line 2387
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mFileDialogState:Lorg/libsdl/app/SDLActivity$SDLFileDialogState;

    iput v2, v0, Lorg/libsdl/app/SDLActivity$SDLFileDialogState;->type:I

    .line 2388
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mFileDialogState:Lorg/libsdl/app/SDLActivity$SDLFileDialogState;

    iput-boolean v11, v0, Lorg/libsdl/app/SDLActivity$SDLFileDialogState;->persistable:Z

    .line 2390
    const/4 v5, 0x1

    return v5

    .line 2379
    :catch_1
    move-exception v0

    .line 2380
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    const-string v9, "Unable to open dialog."

    invoke-static {v10, v9, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2381
    return v5

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method public static showTextInput(IIIII)Z
    .locals 8
    .param p0, "input_type"    # I
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "w"    # I
    .param p4, "h"    # I

    .line 1613
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mLayout:Landroid/view/ViewGroup;

    if-nez v0, :cond_0

    .line 1614
    const/4 v0, 0x0

    return v0

    .line 1618
    :cond_0
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    iget-object v0, v0, Lorg/libsdl/app/SDLActivity;->commandHandler:Landroid/os/Handler;

    new-instance v7, Lorg/libsdl/app/SDLActivity$ShowTextInputTask;

    move-object v1, v7

    move v2, p0

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-direct/range {v1 .. v6}, Lorg/libsdl/app/SDLActivity$ShowTextInputTask;-><init>(IIIII)V

    invoke-virtual {v0, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    move-result v0

    return v0
.end method

.method public static showToast(Ljava/lang/String;IIII)Z
    .locals 9
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "duration"    # I
    .param p2, "gravity"    # I
    .param p3, "xOffset"    # I
    .param p4, "yOffset"    # I

    .line 2214
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 2215
    return v1

    .line 2248
    :cond_0
    :try_start_0
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    new-instance v8, Lorg/libsdl/app/SDLActivity$1OneShotTask;

    move-object v2, v8

    move-object v3, p0

    move v4, p1

    move v5, p2

    move v6, p3

    move v7, p4

    invoke-direct/range {v2 .. v7}, Lorg/libsdl/app/SDLActivity$1OneShotTask;-><init>(Ljava/lang/String;IIII)V

    invoke-virtual {v0, v8}, Lorg/libsdl/app/SDLActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2251
    nop

    .line 2252
    const/4 v0, 0x1

    return v0

    .line 2249
    :catch_0
    move-exception v0

    .line 2250
    .local v0, "ex":Ljava/lang/Exception;
    return v1
.end method

.method public static supportsRelativeMouse()Z
    .locals 2

    .line 1373
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1b

    if-ge v0, v1, :cond_0

    invoke-static {}, Lorg/libsdl/app/SDLActivity;->isDeXMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1374
    const/4 v0, 0x0

    return v0

    .line 1377
    :cond_0
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getMotionListener()Lorg/libsdl/app/SDLGenericMotionListener_API14;

    move-result-object v0

    invoke-virtual {v0}, Lorg/libsdl/app/SDLGenericMotionListener_API14;->supportsRelativeMouse()Z

    move-result v0

    return v0
.end method


# virtual methods
.method protected createSDLSurface(Landroid/content/Context;)Lorg/libsdl/app/SDLSurface;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 375
    new-instance v0, Lorg/libsdl/app/SDLSurface;

    invoke-direct {v0, p1}, Lorg/libsdl/app/SDLSurface;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "event"    # Landroid/view/KeyEvent;

    .line 911
    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mBrokenLibraries:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 912
    return v1

    .line 915
    :cond_0
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    .line 917
    .local v0, "keyCode":I
    const/16 v2, 0x19

    if-eq v0, v2, :cond_2

    const/16 v2, 0x18

    if-eq v0, v2, :cond_2

    const/16 v2, 0x1b

    if-eq v0, v2, :cond_2

    const/16 v2, 0xa8

    if-eq v0, v2, :cond_2

    const/16 v2, 0xa9

    if-ne v0, v2, :cond_1

    goto :goto_0

    .line 925
    :cond_1
    const/4 v2, 0x1

    sput-boolean v2, Lorg/libsdl/app/SDLActivity;->mDispatchingKeyEvent:Z

    .line 926
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v2

    .line 927
    .local v2, "result":Z
    sput-boolean v1, Lorg/libsdl/app/SDLActivity;->mDispatchingKeyEvent:Z

    .line 928
    return v2

    .line 923
    .end local v2    # "result":Z
    :cond_2
    :goto_0
    return v1
.end method

.method protected getArguments()[Ljava/lang/String;
    .locals 1

    .line 340
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    return-object v0
.end method

.method protected getInitSubsystems()I
    .locals 1

    .line 354
    const v0, 0x1b230

    return v0
.end method

.method protected getLibraries()[Ljava/lang/String;
    .locals 3

    .line 316
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "SDL3"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "main"

    aput-object v2, v0, v1

    return-object v0
.end method

.method protected getMainFunction()Ljava/lang/String;
    .locals 1

    .line 304
    const-string v0, "SDL_main"

    return-object v0
.end method

.method protected getMainSharedObject()Ljava/lang/String;
    .locals 4

    .line 290
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    invoke-virtual {v0}, Lorg/libsdl/app/SDLActivity;->getLibraries()[Ljava/lang/String;

    move-result-object v0

    .line 291
    .local v0, "libraries":[Ljava/lang/String;
    array-length v1, v0

    if-lez v1, :cond_0

    .line 292
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "lib"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    aget-object v2, v0, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".so"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .local v1, "library":Ljava/lang/String;
    goto :goto_0

    .line 294
    .end local v1    # "library":Ljava/lang/String;
    :cond_0
    const-string v1, "libmain.so"

    .line 296
    .restart local v1    # "library":Ljava/lang/String;
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContext()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public loadLibraries()V
    .locals 4

    .line 328
    invoke-virtual {p0}, Lorg/libsdl/app/SDLActivity;->getLibraries()[Ljava/lang/String;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 329
    .local v3, "lib":Ljava/lang/String;
    invoke-static {v3, p0}, Lorg/libsdl/app/SDL;->loadLibrary(Ljava/lang/String;Landroid/content/Context;)V

    .line 328
    .end local v3    # "lib":Ljava/lang/String;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 331
    :cond_0
    return-void
.end method

.method protected main()V
    .locals 5

    .line 275
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    invoke-virtual {v0}, Lorg/libsdl/app/SDLActivity;->getMainSharedObject()Ljava/lang/String;

    move-result-object v0

    .line 276
    .local v0, "library":Ljava/lang/String;
    sget-object v1, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    invoke-virtual {v1}, Lorg/libsdl/app/SDLActivity;->getMainFunction()Ljava/lang/String;

    move-result-object v1

    .line 277
    .local v1, "function":Ljava/lang/String;
    sget-object v2, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    invoke-virtual {v2}, Lorg/libsdl/app/SDLActivity;->getArguments()[Ljava/lang/String;

    move-result-object v2

    .line 279
    .local v2, "arguments":[Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Running main function "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " from library "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "SDL"

    invoke-static {v4, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 280
    invoke-static {v0, v1, v2}, Lorg/libsdl/app/SDLActivity;->nativeRunMain(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)I

    .line 281
    const-string v3, "Finished main function"

    invoke-static {v4, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 282
    return-void
.end method

.method protected messageboxCreateAndShow(Landroid/os/Bundle;)V
    .locals 20
    .param p1, "args"    # Landroid/os/Bundle;

    .line 1815
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v2, "colors"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v2

    .line 1821
    .local v2, "colors":[I
    const/4 v3, 0x1

    if-eqz v2, :cond_0

    .line 1822
    const/4 v4, -0x1

    .line 1823
    .local v4, "i":I
    add-int/2addr v4, v3

    aget v5, v2, v4

    .line 1824
    .local v5, "backgroundColor":I
    add-int/2addr v4, v3

    aget v6, v2, v4

    .line 1825
    .local v6, "textColor":I
    add-int/2addr v4, v3

    aget v7, v2, v4

    .line 1826
    .local v7, "buttonBorderColor":I
    add-int/2addr v4, v3

    aget v8, v2, v4

    .line 1827
    .local v8, "buttonBackgroundColor":I
    add-int/2addr v4, v3

    aget v4, v2, v4

    .line 1828
    .local v4, "buttonSelectedColor":I
    goto :goto_0

    .line 1829
    .end local v4    # "buttonSelectedColor":I
    .end local v5    # "backgroundColor":I
    .end local v6    # "textColor":I
    .end local v7    # "buttonBorderColor":I
    .end local v8    # "buttonBackgroundColor":I
    :cond_0
    const/4 v5, 0x0

    .line 1830
    .restart local v5    # "backgroundColor":I
    const/4 v6, 0x0

    .line 1831
    .restart local v6    # "textColor":I
    const/4 v7, 0x0

    .line 1832
    .restart local v7    # "buttonBorderColor":I
    const/4 v8, 0x0

    .line 1833
    .restart local v8    # "buttonBackgroundColor":I
    const/4 v4, 0x0

    .line 1838
    .restart local v4    # "buttonSelectedColor":I
    :goto_0
    new-instance v9, Landroid/app/AlertDialog$Builder;

    invoke-direct {v9, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v9}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v9

    .line 1839
    .local v9, "dialog":Landroid/app/AlertDialog;
    const-string v10, "title"

    invoke-virtual {v1, v10}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 1840
    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/app/AlertDialog;->setCancelable(Z)V

    .line 1841
    new-instance v11, Lorg/libsdl/app/SDLActivity$5;

    invoke-direct {v11, v0}, Lorg/libsdl/app/SDLActivity$5;-><init>(Lorg/libsdl/app/SDLActivity;)V

    invoke-virtual {v9, v11}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 1852
    new-instance v11, Landroid/widget/TextView;

    invoke-direct {v11, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1853
    .local v11, "message":Landroid/widget/TextView;
    const/16 v12, 0x11

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setGravity(I)V

    .line 1854
    const-string v13, "message"

    invoke-virtual {v1, v13}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1855
    if-eqz v6, :cond_1

    .line 1856
    invoke-virtual {v11, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1861
    :cond_1
    const-string v13, "buttonFlags"

    invoke-virtual {v1, v13}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v13

    .line 1862
    .local v13, "buttonFlags":[I
    const-string v14, "buttonIds"

    invoke-virtual {v1, v14}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v14

    .line 1863
    .local v14, "buttonIds":[I
    const-string v15, "buttonTexts"

    invoke-virtual {v1, v15}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 1865
    .local v15, "buttonTexts":[Ljava/lang/String;
    new-instance v16, Landroid/util/SparseArray;

    invoke-direct/range {v16 .. v16}, Landroid/util/SparseArray;-><init>()V

    move-object/from16 v17, v16

    .line 1867
    .local v17, "mapping":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/widget/Button;>;"
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1868
    .local v3, "buttons":Landroid/widget/LinearLayout;
    invoke-virtual {v3, v10}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1869
    invoke-virtual {v3, v12}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 1870
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_1
    array-length v12, v15

    if-ge v10, v12, :cond_8

    .line 1871
    new-instance v12, Landroid/widget/Button;

    invoke-direct {v12, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 1872
    .local v12, "button":Landroid/widget/Button;
    aget v1, v14, v10

    .line 1873
    .local v1, "id":I
    move-object/from16 v18, v2

    .end local v2    # "colors":[I
    .local v18, "colors":[I
    new-instance v2, Lorg/libsdl/app/SDLActivity$6;

    invoke-direct {v2, v0, v1, v9}, Lorg/libsdl/app/SDLActivity$6;-><init>(Lorg/libsdl/app/SDLActivity;ILandroid/app/AlertDialog;)V

    invoke-virtual {v12, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1880
    aget v2, v13, v10

    if-eqz v2, :cond_3

    .line 1882
    aget v2, v13, v10

    const/16 v16, 0x1

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_2

    .line 1883
    const/16 v2, 0x42

    move/from16 v19, v1

    move-object/from16 v1, v17

    .end local v17    # "mapping":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/widget/Button;>;"
    .local v1, "mapping":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/widget/Button;>;"
    .local v19, "id":I
    invoke-virtual {v1, v2, v12}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_2

    .line 1882
    .end local v19    # "id":I
    .local v1, "id":I
    .restart local v17    # "mapping":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/widget/Button;>;"
    :cond_2
    move/from16 v19, v1

    move-object/from16 v1, v17

    .line 1885
    .end local v17    # "mapping":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/widget/Button;>;"
    .local v1, "mapping":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/widget/Button;>;"
    .restart local v19    # "id":I
    :goto_2
    aget v2, v13, v10

    and-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_4

    .line 1886
    const/16 v2, 0x6f

    invoke-virtual {v1, v2, v12}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_3

    .line 1880
    .end local v19    # "id":I
    .local v1, "id":I
    .restart local v17    # "mapping":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/widget/Button;>;"
    :cond_3
    move/from16 v19, v1

    move-object/from16 v1, v17

    .line 1889
    .end local v17    # "mapping":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/widget/Button;>;"
    .local v1, "mapping":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/widget/Button;>;"
    .restart local v19    # "id":I
    :cond_4
    :goto_3
    aget-object v2, v15, v10

    invoke-virtual {v12, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1890
    if-eqz v6, :cond_5

    .line 1891
    invoke-virtual {v12, v6}, Landroid/widget/Button;->setTextColor(I)V

    .line 1893
    :cond_5
    nop

    .line 1896
    if-eqz v8, :cond_7

    .line 1897
    invoke-virtual {v12}, Landroid/widget/Button;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 1898
    .local v2, "drawable":Landroid/graphics/drawable/Drawable;
    if-nez v2, :cond_6

    .line 1900
    invoke-virtual {v12, v8}, Landroid/widget/Button;->setBackgroundColor(I)V

    move/from16 v17, v4

    goto :goto_4

    .line 1903
    :cond_6
    move/from16 v17, v4

    .end local v4    # "buttonSelectedColor":I
    .local v17, "buttonSelectedColor":I
    sget-object v4, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v2, v8, v4}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    goto :goto_4

    .line 1896
    .end local v2    # "drawable":Landroid/graphics/drawable/Drawable;
    .end local v17    # "buttonSelectedColor":I
    .restart local v4    # "buttonSelectedColor":I
    :cond_7
    move/from16 v17, v4

    .line 1906
    .end local v4    # "buttonSelectedColor":I
    .restart local v17    # "buttonSelectedColor":I
    :goto_4
    nop

    .line 1909
    invoke-virtual {v3, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1870
    .end local v12    # "button":Landroid/widget/Button;
    .end local v19    # "id":I
    add-int/lit8 v10, v10, 0x1

    move/from16 v4, v17

    move-object/from16 v2, v18

    move-object/from16 v17, v1

    move-object/from16 v1, p1

    goto :goto_1

    .end local v1    # "mapping":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/widget/Button;>;"
    .end local v18    # "colors":[I
    .local v2, "colors":[I
    .restart local v4    # "buttonSelectedColor":I
    .local v17, "mapping":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/widget/Button;>;"
    :cond_8
    move-object/from16 v18, v2

    move-object/from16 v1, v17

    move/from16 v17, v4

    .line 1914
    .end local v2    # "colors":[I
    .end local v4    # "buttonSelectedColor":I
    .end local v10    # "i":I
    .restart local v1    # "mapping":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/widget/Button;>;"
    .local v17, "buttonSelectedColor":I
    .restart local v18    # "colors":[I
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1915
    .local v2, "content":Landroid/widget/LinearLayout;
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1916
    invoke-virtual {v2, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1917
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1918
    if-eqz v5, :cond_9

    .line 1919
    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 1924
    :cond_9
    invoke-virtual {v9, v2}, Landroid/app/AlertDialog;->setView(Landroid/view/View;)V

    .line 1925
    new-instance v4, Lorg/libsdl/app/SDLActivity$7;

    invoke-direct {v4, v0, v1}, Lorg/libsdl/app/SDLActivity$7;-><init>(Lorg/libsdl/app/SDLActivity;Landroid/util/SparseArray;)V

    invoke-virtual {v9, v4}, Landroid/app/AlertDialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 1939
    invoke-virtual {v9}, Landroid/app/AlertDialog;->show()V

    .line 1940
    return-void
.end method

.method public messageboxShowMessageBox(ILjava/lang/String;Ljava/lang/String;[I[I[Ljava/lang/String;[I)I
    .locals 5
    .param p1, "flags"    # I
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "buttonFlags"    # [I
    .param p5, "buttonIds"    # [I
    .param p6, "buttonTexts"    # [Ljava/lang/String;
    .param p7, "colors"    # [I

    .line 1765
    iget-object v0, p0, Lorg/libsdl/app/SDLActivity;->messageboxSelection:[I

    const/4 v1, 0x0

    const/4 v2, -0x1

    aput v2, v0, v1

    .line 1769
    array-length v0, p4

    array-length v3, p5

    if-eq v0, v3, :cond_0

    array-length v0, p5

    array-length v3, p6

    if-eq v0, v3, :cond_0

    .line 1770
    return v2

    .line 1775
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1776
    .local v0, "args":Landroid/os/Bundle;
    const-string v3, "flags"

    invoke-virtual {v0, v3, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1777
    const-string v3, "title"

    invoke-virtual {v0, v3, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1778
    const-string v3, "message"

    invoke-virtual {v0, v3, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1779
    const-string v3, "buttonFlags"

    invoke-virtual {v0, v3, p4}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 1780
    const-string v3, "buttonIds"

    invoke-virtual {v0, v3, p5}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 1781
    const-string v3, "buttonTexts"

    invoke-virtual {v0, v3, p6}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 1782
    const-string v3, "colors"

    invoke-virtual {v0, v3, p7}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 1786
    new-instance v3, Lorg/libsdl/app/SDLActivity$4;

    invoke-direct {v3, p0, v0}, Lorg/libsdl/app/SDLActivity$4;-><init>(Lorg/libsdl/app/SDLActivity;Landroid/os/Bundle;)V

    invoke-virtual {p0, v3}, Lorg/libsdl/app/SDLActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1795
    iget-object v3, p0, Lorg/libsdl/app/SDLActivity;->messageboxSelection:[I

    monitor-enter v3

    .line 1797
    :try_start_0
    iget-object v4, p0, Lorg/libsdl/app/SDLActivity;->messageboxSelection:[I

    invoke-virtual {v4}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1801
    nop

    .line 1802
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1806
    iget-object v2, p0, Lorg/libsdl/app/SDLActivity;->messageboxSelection:[I

    aget v1, v2, v1

    return v1

    .line 1802
    :catchall_0
    move-exception v1

    goto :goto_0

    .line 1798
    :catch_0
    move-exception v1

    .line 1799
    .local v1, "ex":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 1800
    monitor-exit v3

    return v2

    .line 1802
    .end local v1    # "ex":Ljava/lang/InterruptedException;
    :goto_0
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 6
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .line 844
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 846
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mFileDialogState:Lorg/libsdl/app/SDLActivity$SDLFileDialogState;

    if-eqz v0, :cond_5

    sget-object v0, Lorg/libsdl/app/SDLActivity;->mFileDialogState:Lorg/libsdl/app/SDLActivity$SDLFileDialogState;

    iget v0, v0, Lorg/libsdl/app/SDLActivity$SDLFileDialogState;->requestCode:I

    if-ne v0, p1, :cond_5

    .line 848
    const/4 v0, 0x0

    .line 850
    .local v0, "filelist":[Ljava/lang/String;
    const/4 v1, -0x1

    const/4 v2, 0x0

    if-eqz p3, :cond_4

    if-ne p2, v1, :cond_4

    .line 851
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v3

    .line 853
    .local v3, "singleFileUri":Landroid/net/Uri;
    if-nez v3, :cond_2

    .line 855
    invoke-virtual {p3}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    move-result-object v2

    .line 856
    .local v2, "clipData":Landroid/content/ClipData;
    if-eqz v2, :cond_1

    .line 858
    invoke-virtual {v2}, Landroid/content/ClipData;->getItemCount()I

    move-result v4

    new-array v0, v4, [Ljava/lang/String;

    .line 860
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v5, v0

    if-ge v4, v5, :cond_0

    .line 861
    invoke-virtual {v2, v4}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/ClipData$Item;->getUri()Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    .line 862
    .local v5, "uri":Ljava/lang/String;
    aput-object v5, v0, v4

    .line 860
    .end local v5    # "uri":Ljava/lang/String;
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 864
    .end local v2    # "clipData":Landroid/content/ClipData;
    .end local v4    # "i":I
    :cond_0
    goto :goto_1

    .line 856
    .restart local v2    # "clipData":Landroid/content/ClipData;
    :cond_1
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 867
    .end local v2    # "clipData":Landroid/content/ClipData;
    :cond_2
    sget-object v4, Lorg/libsdl/app/SDLActivity;->mFileDialogState:Lorg/libsdl/app/SDLActivity$SDLFileDialogState;

    iget v4, v4, Lorg/libsdl/app/SDLActivity$SDLFileDialogState;->type:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_3

    sget-object v4, Lorg/libsdl/app/SDLActivity;->mFileDialogState:Lorg/libsdl/app/SDLActivity$SDLFileDialogState;

    iget-boolean v4, v4, Lorg/libsdl/app/SDLActivity$SDLFileDialogState;->persistable:Z

    if-eqz v4, :cond_3

    .line 868
    sget-object v4, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    invoke-virtual {v4}, Lorg/libsdl/app/SDLActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const/4 v5, 0x3

    invoke-virtual {v4, v3, v5}, Landroid/content/ContentResolver;->takePersistableUriPermission(Landroid/net/Uri;I)V

    .line 873
    :cond_3
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v2

    move-object v0, v4

    .line 875
    .end local v3    # "singleFileUri":Landroid/net/Uri;
    :goto_1
    goto :goto_2

    .line 877
    :cond_4
    new-array v0, v2, [Ljava/lang/String;

    .line 881
    :goto_2
    invoke-static {p1, v0, v1}, Lorg/libsdl/app/SDLActivity;->onNativeFileDialog(I[Ljava/lang/String;I)V

    .line 882
    const/4 v1, 0x0

    sput-object v1, Lorg/libsdl/app/SDLActivity;->mFileDialogState:Lorg/libsdl/app/SDLActivity$SDLFileDialogState;

    .line 884
    .end local v0    # "filelist":[Ljava/lang/String;
    :cond_5
    return-void
.end method

.method public onBackPressed()V
    .locals 2

    .line 781
    const-string v0, "SDL_ANDROID_TRAP_BACK_BUTTON"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/libsdl/app/SDLActivity;->nativeGetHintBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 782
    .local v0, "trapBack":Z
    if-eqz v0, :cond_0

    .line 784
    return-void

    .line 788
    :cond_0
    invoke-virtual {p0}, Lorg/libsdl/app/SDLActivity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_1

    .line 789
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    .line 791
    :cond_1
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .line 714
    const-string v0, "SDL"

    const-string v1, "onConfigurationChanged()"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 715
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 717
    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mBrokenLibraries:Z

    if-eqz v0, :cond_0

    .line 718
    return-void

    .line 721
    :cond_0
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mCurrentLocale:Ljava/util/Locale;

    if-eqz v0, :cond_1

    sget-object v0, Lorg/libsdl/app/SDLActivity;->mCurrentLocale:Ljava/util/Locale;

    iget-object v1, p1, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 722
    :cond_1
    iget-object v0, p1, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    sput-object v0, Lorg/libsdl/app/SDLActivity;->mCurrentLocale:Ljava/util/Locale;

    .line 723
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->onNativeLocaleChanged()V

    .line 726
    :cond_2
    iget v0, p1, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v0, v0, 0x30

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    .line 731
    :sswitch_0
    const/4 v0, 0x1

    invoke-static {v0}, Lorg/libsdl/app/SDLActivity;->onNativeDarkModeChanged(Z)V

    goto :goto_0

    .line 728
    :sswitch_1
    const/4 v0, 0x0

    invoke-static {v0}, Lorg/libsdl/app/SDLActivity;->onNativeDarkModeChanged(Z)V

    .line 729
    nop

    .line 734
    :goto_0
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0x10 -> :sswitch_1
        0x20 -> :sswitch_0
    .end sparse-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 381
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Manufacturer: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SDL"

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 382
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Device: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 383
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Model: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 384
    const-string v0, "onCreate()"

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 385
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 387
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    const/4 v3, 0x0

    if-lt v0, v2, :cond_0

    .line 388
    invoke-virtual {p0}, Lorg/libsdl/app/SDLActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/Window;->setDecorFitsSystemWindows(Z)V

    .line 392
    :cond_0
    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mSDLMainFinished:Z

    if-nez v0, :cond_1

    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mActivityCreated:Z

    if-eqz v0, :cond_3

    .line 393
    :cond_1
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->nativeAllowRecreateActivity()Z

    move-result v0

    .line 394
    .local v0, "allow_recreate":Z
    sget-boolean v2, Lorg/libsdl/app/SDLActivity;->mSDLMainFinished:Z

    if-eqz v2, :cond_2

    .line 395
    const-string v2, "SDL main() finished"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 397
    :cond_2
    if-eqz v0, :cond_e

    .line 398
    const-string v2, "activity re-created"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 406
    .end local v0    # "allow_recreate":Z
    :cond_3
    const/4 v0, 0x1

    sput-boolean v0, Lorg/libsdl/app/SDLActivity;->mActivityCreated:Z

    .line 409
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    const-string v4, "SDLActivity"

    invoke-virtual {v2, v4}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 412
    goto :goto_0

    .line 410
    :catch_0
    move-exception v2

    .line 411
    .local v2, "e":Ljava/lang/Exception;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "modify thread properties failed "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 415
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_0
    const-string v2, ""

    .line 417
    .local v2, "errorMsgBrokenLib":Ljava/lang/String;
    :try_start_1
    invoke-virtual {p0}, Lorg/libsdl/app/SDLActivity;->loadLibraries()V

    .line 418
    sput-boolean v3, Lorg/libsdl/app/SDLActivity;->mBrokenLibraries:Z
    :try_end_1
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 423
    :catch_1
    move-exception v4

    .line 424
    .local v4, "e":Ljava/lang/Exception;
    sget-object v5, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v4}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 425
    sput-boolean v0, Lorg/libsdl/app/SDLActivity;->mBrokenLibraries:Z

    .line 426
    invoke-virtual {v4}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    .line 419
    .end local v4    # "e":Ljava/lang/Exception;
    :catch_2
    move-exception v4

    .line 420
    .local v4, "e":Ljava/lang/UnsatisfiedLinkError;
    sget-object v5, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v4}, Ljava/lang/UnsatisfiedLinkError;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 421
    sput-boolean v0, Lorg/libsdl/app/SDLActivity;->mBrokenLibraries:Z

    .line 422
    invoke-virtual {v4}, Ljava/lang/UnsatisfiedLinkError;->getMessage()Ljava/lang/String;

    move-result-object v2

    .line 427
    .end local v4    # "e":Ljava/lang/UnsatisfiedLinkError;
    :goto_1
    nop

    .line 429
    :goto_2
    sget-boolean v4, Lorg/libsdl/app/SDLActivity;->mBrokenLibraries:Z

    if-nez v4, :cond_4

    .line 430
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v5, 0x3

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 431
    const/4 v6, 0x5

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 432
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 433
    .local v4, "expected_version":Ljava/lang/String;
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->nativeGetVersion()Ljava/lang/String;

    move-result-object v5

    .line 434
    .local v5, "version":Ljava/lang/String;
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_4

    .line 435
    sput-boolean v0, Lorg/libsdl/app/SDLActivity;->mBrokenLibraries:Z

    .line 436
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "SDL C/Java version mismatch (expected "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", got "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 440
    .end local v4    # "expected_version":Ljava/lang/String;
    .end local v5    # "version":Ljava/lang/String;
    :cond_4
    sget-boolean v4, Lorg/libsdl/app/SDLActivity;->mBrokenLibraries:Z

    if-eqz v4, :cond_5

    .line 441
    sput-object p0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    .line 442
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 443
    .local v0, "dlgAlert":Landroid/app/AlertDialog$Builder;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "An error occurred while trying to start the application. Please try again and/or reinstall."

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 444
    const-string v4, "line.separator"

    invoke-static {v4}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 445
    invoke-static {v4}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "Error: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 443
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 447
    const-string v1, "SDL Error"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 448
    new-instance v1, Lorg/libsdl/app/SDLActivity$1;

    invoke-direct {v1, p0}, Lorg/libsdl/app/SDLActivity$1;-><init>(Lorg/libsdl/app/SDLActivity;)V

    const-string v4, "Exit"

    invoke-virtual {v0, v4, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 456
    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 457
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 459
    return-void

    .line 467
    .end local v0    # "dlgAlert":Landroid/app/AlertDialog$Builder;
    :cond_5
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->nativeCheckSDLThreadCounter()I

    move-result v4

    .line 468
    .local v4, "run_count":I
    if-eqz v4, :cond_7

    .line 469
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->nativeAllowRecreateActivity()Z

    move-result v5

    .line 470
    .local v5, "allow_recreate":Z
    if-eqz v5, :cond_6

    .line 471
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "activity re-created // run_count: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 473
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "activity finished // run_count: "

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 474
    invoke-static {v3}, Ljava/lang/System;->exit(I)V

    .line 475
    return-void

    .line 481
    .end local v4    # "run_count":I
    .end local v5    # "allow_recreate":Z
    :cond_7
    :goto_3
    invoke-virtual {p0}, Lorg/libsdl/app/SDLActivity;->getInitSubsystems()I

    move-result v4

    invoke-static {v4}, Lorg/libsdl/app/SDL;->setupJNI(I)V

    .line 484
    invoke-static {}, Lorg/libsdl/app/SDL;->initialize()V

    .line 487
    sput-object p0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    .line 488
    invoke-static {p0}, Lorg/libsdl/app/SDL;->setContext(Landroid/app/Activity;)V

    .line 490
    invoke-static {}, Lorg/libsdl/app/SDL;->isControllerManagerReady()Z

    move-result v4

    if-eqz v4, :cond_8

    .line 491
    invoke-static {}, Lorg/libsdl/app/SDLControllerManager;->initializeDeviceListener()V

    .line 494
    :cond_8
    const/16 v4, 0x20

    invoke-static {v4}, Lorg/libsdl/app/SDL;->isSubsystemCompiled(I)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 495
    new-instance v5, Lorg/libsdl/app/SDLClipboardHandler;

    invoke-direct {v5}, Lorg/libsdl/app/SDLClipboardHandler;-><init>()V

    sput-object v5, Lorg/libsdl/app/SDLActivity;->mClipboardHandler:Lorg/libsdl/app/SDLClipboardHandler;

    .line 498
    :cond_9
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->nativeIsHIDAPIEnabled()Z

    move-result v5

    if-eqz v5, :cond_a

    .line 499
    invoke-static {p0}, Lorg/libsdl/app/HIDDeviceManager;->acquire(Landroid/content/Context;)Lorg/libsdl/app/HIDDeviceManager;

    move-result-object v5

    sput-object v5, Lorg/libsdl/app/SDLActivity;->mHIDDeviceManager:Lorg/libsdl/app/HIDDeviceManager;

    .line 503
    :cond_a
    invoke-static {v4}, Lorg/libsdl/app/SDL;->isSubsystemInitialized(I)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 504
    invoke-virtual {p0, p0}, Lorg/libsdl/app/SDLActivity;->createSDLSurface(Landroid/content/Context;)Lorg/libsdl/app/SDLSurface;

    move-result-object v5

    sput-object v5, Lorg/libsdl/app/SDLActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    .line 506
    new-instance v5, Landroid/widget/RelativeLayout;

    invoke-direct {v5, p0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    sput-object v5, Lorg/libsdl/app/SDLActivity;->mLayout:Landroid/view/ViewGroup;

    .line 507
    sget-object v5, Lorg/libsdl/app/SDLActivity;->mLayout:Landroid/view/ViewGroup;

    sget-object v6, Lorg/libsdl/app/SDLActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 510
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getNaturalOrientation()I

    move-result v5

    invoke-static {v5}, Lorg/libsdl/app/SDLActivity;->nativeSetNaturalOrientation(I)V

    .line 511
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getCurrentRotation()I

    move-result v5

    sput v5, Lorg/libsdl/app/SDLActivity;->mCurrentRotation:I

    .line 512
    sget v5, Lorg/libsdl/app/SDLActivity;->mCurrentRotation:I

    invoke-static {v5}, Lorg/libsdl/app/SDLActivity;->onNativeRotationChanged(I)V

    .line 516
    :cond_b
    nop

    .line 519
    :try_start_2
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContext()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Configuration;->getLocales()Landroid/os/LocaleList;

    move-result-object v5

    invoke-virtual {v5, v3}, Landroid/os/LocaleList;->get(I)Ljava/util/Locale;

    move-result-object v5

    sput-object v5, Lorg/libsdl/app/SDLActivity;->mCurrentLocale:Ljava/util/Locale;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    .line 522
    goto :goto_4

    .line 521
    :catch_3
    move-exception v5

    .line 524
    :goto_4
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContext()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v5

    iget v5, v5, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v5, v5, 0x30

    sparse-switch v5, :sswitch_data_0

    goto :goto_5

    .line 529
    :sswitch_0
    invoke-static {v0}, Lorg/libsdl/app/SDLActivity;->onNativeDarkModeChanged(Z)V

    goto :goto_5

    .line 526
    :sswitch_1
    invoke-static {v3}, Lorg/libsdl/app/SDLActivity;->onNativeDarkModeChanged(Z)V

    .line 527
    nop

    .line 533
    :goto_5
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mLayout:Landroid/view/ViewGroup;

    if-eqz v0, :cond_c

    .line 534
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mLayout:Landroid/view/ViewGroup;

    invoke-virtual {p0, v0}, Lorg/libsdl/app/SDLActivity;->setContentView(Landroid/view/View;)V

    .line 535
    invoke-static {v3}, Lorg/libsdl/app/SDLActivity;->setWindowStyle(Z)V

    .line 538
    :cond_c
    invoke-virtual {p0}, Lorg/libsdl/app/SDLActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnSystemUiVisibilityChangeListener(Landroid/view/View$OnSystemUiVisibilityChangeListener;)V

    .line 541
    invoke-static {v4}, Lorg/libsdl/app/SDL;->isSubsystemInitialized(I)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 542
    invoke-virtual {p0}, Lorg/libsdl/app/SDLActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 543
    .local v0, "intent":Landroid/content/Intent;
    if-eqz v0, :cond_d

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v3

    if-eqz v3, :cond_d

    .line 544
    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    .line 545
    .local v3, "filename":Ljava/lang/String;
    if-eqz v3, :cond_d

    .line 546
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Got filename: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 547
    invoke-static {v3}, Lorg/libsdl/app/SDLActivity;->onNativeDropFile(Ljava/lang/String;)V

    .line 551
    .end local v0    # "intent":Landroid/content/Intent;
    .end local v3    # "filename":Ljava/lang/String;
    :cond_d
    return-void

    .line 400
    .end local v2    # "errorMsgBrokenLib":Ljava/lang/String;
    .local v0, "allow_recreate":Z
    :cond_e
    const-string v2, "activity finished"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 401
    invoke-static {v3}, Ljava/lang/System;->exit(I)V

    .line 402
    return-void

    :sswitch_data_0
    .sparse-switch
        0x10 -> :sswitch_1
        0x20 -> :sswitch_0
    .end sparse-switch
.end method

.method protected onDestroy()V
    .locals 4

    .line 738
    const-string v0, "onDestroy()"

    const-string v1, "SDL"

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 740
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mHIDDeviceManager:Lorg/libsdl/app/HIDDeviceManager;

    if-eqz v0, :cond_0

    .line 741
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mHIDDeviceManager:Lorg/libsdl/app/HIDDeviceManager;

    invoke-static {v0}, Lorg/libsdl/app/HIDDeviceManager;->release(Lorg/libsdl/app/HIDDeviceManager;)V

    .line 742
    const/4 v0, 0x0

    sput-object v0, Lorg/libsdl/app/SDLActivity;->mHIDDeviceManager:Lorg/libsdl/app/HIDDeviceManager;

    .line 745
    :cond_0
    invoke-static {p0}, Lorg/libsdl/app/SDLAudioManager;->release(Landroid/content/Context;)V

    .line 747
    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mBrokenLibraries:Z

    if-eqz v0, :cond_1

    .line 748
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 749
    return-void

    .line 752
    :cond_1
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSDLThread:Ljava/lang/Thread;

    if-eqz v0, :cond_2

    .line 755
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->nativeSendQuit()V

    .line 763
    :try_start_0
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSDLThread:Ljava/lang/Thread;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v2, v3}, Ljava/lang/Thread;->join(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 766
    goto :goto_0

    .line 764
    :catch_0
    move-exception v0

    .line 765
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Problem stopping SDLThread: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 769
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    :goto_0
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->nativeQuit()V

    .line 771
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 772
    return-void
.end method

.method protected onPause()V
    .locals 2

    .line 578
    const-string v0, "SDL"

    const-string v1, "onPause()"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 579
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 581
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mHIDDeviceManager:Lorg/libsdl/app/HIDDeviceManager;

    if-eqz v0, :cond_0

    .line 582
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mHIDDeviceManager:Lorg/libsdl/app/HIDDeviceManager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/libsdl/app/HIDDeviceManager;->setFrozen(Z)V

    .line 585
    :cond_0
    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mHasMultiWindow:Z

    if-nez v0, :cond_1

    .line 586
    invoke-virtual {p0}, Lorg/libsdl/app/SDLActivity;->pauseNativeThread()V

    .line 588
    :cond_1
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I

    .line 2184
    array-length v0, p3

    const/4 v1, 0x0

    if-lez v0, :cond_0

    aget v0, p3, v1

    if-nez v0, :cond_0

    const/4 v1, 0x1

    :cond_0
    move v0, v1

    .line 2185
    .local v0, "result":Z
    invoke-static {p1, v0}, Lorg/libsdl/app/SDLActivity;->nativePermissionResult(IZ)V

    .line 2186
    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 592
    const-string v0, "SDL"

    const-string v1, "onResume()"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 593
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 595
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mHIDDeviceManager:Lorg/libsdl/app/HIDDeviceManager;

    if-eqz v0, :cond_0

    .line 596
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mHIDDeviceManager:Lorg/libsdl/app/HIDDeviceManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/libsdl/app/HIDDeviceManager;->setFrozen(Z)V

    .line 599
    :cond_0
    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mHasMultiWindow:Z

    if-nez v0, :cond_1

    .line 600
    invoke-virtual {p0}, Lorg/libsdl/app/SDLActivity;->resumeNativeThread()V

    .line 602
    :cond_1
    return-void
.end method

.method protected onStart()V
    .locals 2

    .line 615
    const-string v0, "SDL"

    const-string v1, "onStart()"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 616
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 617
    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mHasMultiWindow:Z

    if-eqz v0, :cond_0

    .line 618
    invoke-virtual {p0}, Lorg/libsdl/app/SDLActivity;->resumeNativeThread()V

    .line 620
    :cond_0
    return-void
.end method

.method protected onStop()V
    .locals 2

    .line 606
    const-string v0, "SDL"

    const-string v1, "onStop()"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 607
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 608
    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mHasMultiWindow:Z

    if-eqz v0, :cond_0

    .line 609
    invoke-virtual {p0}, Lorg/libsdl/app/SDLActivity;->pauseNativeThread()V

    .line 611
    :cond_0
    return-void
.end method

.method public onSystemUiVisibilityChange(I)V
    .locals 4
    .param p1, "visibility"    # I

    .line 1965
    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mFullscreenModeActive:Z

    if-eqz v0, :cond_1

    and-int/lit8 v0, p1, 0x4

    if-eqz v0, :cond_0

    and-int/lit8 v0, p1, 0x2

    if-nez v0, :cond_1

    .line 1967
    :cond_0
    invoke-virtual {p0}, Lorg/libsdl/app/SDLActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getHandler()Landroid/os/Handler;

    move-result-object v0

    .line 1968
    .local v0, "handler":Landroid/os/Handler;
    if-eqz v0, :cond_1

    .line 1969
    iget-object v1, p0, Lorg/libsdl/app/SDLActivity;->rehideSystemUi:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1970
    iget-object v1, p0, Lorg/libsdl/app/SDLActivity;->rehideSystemUi:Ljava/lang/Runnable;

    const-wide/16 v2, 0x7d0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1974
    .end local v0    # "handler":Landroid/os/Handler;
    :cond_1
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 2
    .param p1, "level"    # I

    .line 702
    const-string v0, "SDL"

    const-string v1, "onTrimMemory()"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 703
    invoke-super {p0, p1}, Landroid/app/Activity;->onTrimMemory(I)V

    .line 705
    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mBrokenLibraries:Z

    if-eqz v0, :cond_0

    .line 706
    return-void

    .line 709
    :cond_0
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->nativeLowMemory()V

    .line 710
    return-void
.end method

.method protected onUnhandledMessage(ILjava/lang/Object;)Z
    .locals 1
    .param p1, "command"    # I
    .param p2, "param"    # Ljava/lang/Object;

    .line 1009
    const/4 v0, 0x0

    return v0
.end method

.method public onWindowFocusChanged(Z)V
    .locals 3
    .param p1, "hasFocus"    # Z

    .line 668
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 669
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onWindowFocusChanged(): "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SDL"

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 673
    const/4 v0, 0x0

    if-nez p1, :cond_0

    const-string v1, "SDL_JOYSTICK_ALLOW_BACKGROUND_EVENTS"

    invoke-static {v1, v0}, Lorg/libsdl/app/SDLActivity;->nativeGetHintBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_1

    .line 674
    :cond_0
    sget-object v1, Lorg/libsdl/app/SDLActivity;->mHIDDeviceManager:Lorg/libsdl/app/HIDDeviceManager;

    if-eqz v1, :cond_1

    .line 675
    sget-object v1, Lorg/libsdl/app/SDLActivity;->mHIDDeviceManager:Lorg/libsdl/app/HIDDeviceManager;

    xor-int/lit8 v2, p1, 0x1

    invoke-virtual {v1, v2}, Lorg/libsdl/app/HIDDeviceManager;->setFrozen(Z)V

    .line 679
    :cond_1
    sget-boolean v1, Lorg/libsdl/app/SDLActivity;->mBrokenLibraries:Z

    if-eqz v1, :cond_2

    .line 680
    return-void

    .line 683
    :cond_2
    sput-boolean p1, Lorg/libsdl/app/SDLActivity;->mHasFocus:Z

    .line 684
    if-eqz p1, :cond_3

    .line 685
    sget-object v0, Lorg/libsdl/app/SDLActivity$NativeState;->RESUMED:Lorg/libsdl/app/SDLActivity$NativeState;

    sput-object v0, Lorg/libsdl/app/SDLActivity;->mNextNativeState:Lorg/libsdl/app/SDLActivity$NativeState;

    .line 686
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getMotionListener()Lorg/libsdl/app/SDLGenericMotionListener_API14;

    move-result-object v0

    invoke-virtual {v0}, Lorg/libsdl/app/SDLGenericMotionListener_API14;->reclaimRelativeMouseModeIfNeeded()V

    .line 688
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->handleNativeState()V

    .line 689
    const/4 v0, 0x1

    invoke-static {v0}, Lorg/libsdl/app/SDLActivity;->nativeFocusChanged(Z)V

    goto :goto_0

    .line 692
    :cond_3
    invoke-static {v0}, Lorg/libsdl/app/SDLActivity;->nativeFocusChanged(Z)V

    .line 693
    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mHasMultiWindow:Z

    if-nez v0, :cond_4

    .line 694
    sget-object v0, Lorg/libsdl/app/SDLActivity$NativeState;->PAUSED:Lorg/libsdl/app/SDLActivity$NativeState;

    sput-object v0, Lorg/libsdl/app/SDLActivity;->mNextNativeState:Lorg/libsdl/app/SDLActivity$NativeState;

    .line 695
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->handleNativeState()V

    .line 698
    :cond_4
    :goto_0
    return-void
.end method

.method protected pauseNativeThread()V
    .locals 1

    .line 554
    sget-object v0, Lorg/libsdl/app/SDLActivity$NativeState;->PAUSED:Lorg/libsdl/app/SDLActivity$NativeState;

    sput-object v0, Lorg/libsdl/app/SDLActivity;->mNextNativeState:Lorg/libsdl/app/SDLActivity$NativeState;

    .line 555
    const/4 v0, 0x0

    sput-boolean v0, Lorg/libsdl/app/SDLActivity;->mIsResumedCalled:Z

    .line 557
    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mBrokenLibraries:Z

    if-eqz v0, :cond_0

    .line 558
    return-void

    .line 561
    :cond_0
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->handleNativeState()V

    .line 562
    return-void
.end method

.method public pressBackButton()V
    .locals 1

    .line 893
    new-instance v0, Lorg/libsdl/app/SDLActivity$3;

    invoke-direct {v0, p0}, Lorg/libsdl/app/SDLActivity$3;-><init>(Lorg/libsdl/app/SDLActivity;)V

    invoke-virtual {p0, v0}, Lorg/libsdl/app/SDLActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 901
    return-void
.end method

.method protected resumeNativeThread()V
    .locals 1

    .line 565
    sget-object v0, Lorg/libsdl/app/SDLActivity$NativeState;->RESUMED:Lorg/libsdl/app/SDLActivity$NativeState;

    sput-object v0, Lorg/libsdl/app/SDLActivity;->mNextNativeState:Lorg/libsdl/app/SDLActivity$NativeState;

    .line 566
    const/4 v0, 0x1

    sput-boolean v0, Lorg/libsdl/app/SDLActivity;->mIsResumedCalled:Z

    .line 568
    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mBrokenLibraries:Z

    if-eqz v0, :cond_0

    .line 569
    return-void

    .line 572
    :cond_0
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->handleNativeState()V

    .line 573
    return-void
.end method

.method protected sendCommand(ILjava/lang/Object;)Z
    .locals 9
    .param p1, "command"    # I
    .param p2, "data"    # Ljava/lang/Object;

    .line 1132
    iget-object v0, p0, Lorg/libsdl/app/SDLActivity;->commandHandler:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 1133
    .local v0, "msg":Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->arg1:I

    .line 1134
    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1135
    iget-object v1, p0, Lorg/libsdl/app/SDLActivity;->commandHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    move-result v1

    .line 1137
    .local v1, "result":Z
    const/4 v2, 0x2

    if-ne p1, v2, :cond_4

    .line 1141
    const/4 v2, 0x0

    .line 1143
    .local v2, "bShouldWait":Z
    instance-of v3, p2, Ljava/lang/Integer;

    if-eqz v3, :cond_3

    .line 1145
    const-string v3, "window"

    invoke-virtual {p0, v3}, Lorg/libsdl/app/SDLActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/WindowManager;

    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    .line 1146
    .local v3, "display":Landroid/view/Display;
    new-instance v4, Landroid/util/DisplayMetrics;

    invoke-direct {v4}, Landroid/util/DisplayMetrics;-><init>()V

    .line 1147
    .local v4, "realMetrics":Landroid/util/DisplayMetrics;
    invoke-virtual {v3, v4}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    .line 1149
    sget-object v5, Lorg/libsdl/app/SDLActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-eqz v5, :cond_0

    iget v5, v4, Landroid/util/DisplayMetrics;->widthPixels:I

    sget-object v8, Lorg/libsdl/app/SDLActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    .line 1150
    invoke-virtual {v8}, Lorg/libsdl/app/SDLSurface;->getWidth()I

    move-result v8

    if-ne v5, v8, :cond_0

    iget v5, v4, Landroid/util/DisplayMetrics;->heightPixels:I

    sget-object v8, Lorg/libsdl/app/SDLActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    .line 1151
    invoke-virtual {v8}, Lorg/libsdl/app/SDLSurface;->getHeight()I

    move-result v8

    if-ne v5, v8, :cond_0

    move v5, v7

    goto :goto_0

    :cond_0
    move v5, v6

    .line 1153
    .local v5, "bFullscreenLayout":Z
    :goto_0
    move-object v8, p2

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    if-ne v8, v7, :cond_2

    .line 1159
    if-nez v5, :cond_1

    move v6, v7

    :cond_1
    move v2, v6

    goto :goto_1

    .line 1164
    :cond_2
    move v2, v5

    .line 1168
    .end local v3    # "display":Landroid/view/Display;
    .end local v4    # "realMetrics":Landroid/util/DisplayMetrics;
    .end local v5    # "bFullscreenLayout":Z
    :cond_3
    :goto_1
    if-eqz v2, :cond_4

    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContext()Landroid/app/Activity;

    move-result-object v3

    if-eqz v3, :cond_4

    .line 1178
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContext()Landroid/app/Activity;

    move-result-object v3

    monitor-enter v3

    .line 1180
    :try_start_0
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->getContext()Landroid/app/Activity;

    move-result-object v4

    const-wide/16 v5, 0x1f4

    invoke-virtual {v4, v5, v6}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1183
    goto :goto_2

    .line 1184
    :catchall_0
    move-exception v4

    goto :goto_3

    .line 1181
    :catch_0
    move-exception v4

    .line 1182
    .local v4, "ie":Ljava/lang/InterruptedException;
    :try_start_1
    invoke-virtual {v4}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 1184
    .end local v4    # "ie":Ljava/lang/InterruptedException;
    :goto_2
    monitor-exit v3

    goto :goto_4

    :goto_3
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4

    .line 1188
    .end local v2    # "bShouldWait":Z
    :cond_4
    :goto_4
    return v1
.end method

.method public setOrientationBis(IIZLjava/lang/String;)V
    .locals 8
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "resizable"    # Z
    .param p4, "hint"    # Ljava/lang/String;

    .line 1273
    const/4 v0, -0x1

    .line 1274
    .local v0, "orientation_landscape":I
    const/4 v1, -0x1

    .line 1276
    .local v1, "orientation_portrait":I
    const/4 v2, 0x1

    if-le p1, v2, :cond_14

    if-gt p2, v2, :cond_0

    goto/16 :goto_a

    .line 1282
    :cond_0
    const-string v3, "LandscapeRight"

    invoke-virtual {p4, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    const-string v5, "LandscapeLeft"

    if-eqz v4, :cond_1

    invoke-virtual {p4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1283
    const/16 v0, 0xb

    goto :goto_0

    .line 1284
    :cond_1
    invoke-virtual {p4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1285
    const/4 v0, 0x0

    goto :goto_0

    .line 1286
    :cond_2
    invoke-virtual {p4, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1287
    const/16 v0, 0x8

    .line 1291
    :cond_3
    :goto_0
    const-string v3, "Portrait "

    invoke-virtual {p4, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    const/4 v4, 0x0

    if-nez v3, :cond_5

    const-string v3, "Portrait"

    invoke-virtual {p4, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    goto :goto_1

    :cond_4
    move v3, v4

    goto :goto_2

    :cond_5
    :goto_1
    move v3, v2

    .line 1293
    .local v3, "contains_Portrait":Z
    :goto_2
    const-string v5, "PortraitUpsideDown"

    if-eqz v3, :cond_6

    invoke-virtual {p4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 1294
    const/16 v1, 0xc

    goto :goto_3

    .line 1295
    :cond_6
    if-eqz v3, :cond_7

    .line 1296
    const/4 v1, 0x1

    goto :goto_3

    .line 1297
    :cond_7
    invoke-virtual {p4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 1298
    const/16 v1, 0x9

    .line 1301
    :cond_8
    :goto_3
    const/4 v5, -0x1

    if-eq v0, v5, :cond_9

    move v6, v2

    goto :goto_4

    :cond_9
    move v6, v4

    .line 1302
    .local v6, "is_landscape_allowed":Z
    :goto_4
    if-eq v1, v5, :cond_a

    goto :goto_5

    :cond_a
    move v2, v4

    .line 1306
    .local v2, "is_portrait_allowed":Z
    :goto_5
    if-nez v2, :cond_d

    if-nez v6, :cond_d

    .line 1307
    if-eqz p3, :cond_b

    .line 1309
    const/16 v4, 0xd

    .local v4, "req":I
    goto :goto_9

    .line 1312
    .end local v4    # "req":I
    :cond_b
    if-le p1, p2, :cond_c

    const/4 v4, 0x6

    goto :goto_6

    :cond_c
    const/4 v4, 0x7

    .restart local v4    # "req":I
    :goto_6
    goto :goto_9

    .line 1316
    .end local v4    # "req":I
    :cond_d
    if-eqz p3, :cond_10

    .line 1317
    if-eqz v2, :cond_e

    if-eqz v6, :cond_e

    .line 1319
    const/16 v4, 0xd

    .restart local v4    # "req":I
    goto :goto_9

    .line 1322
    .end local v4    # "req":I
    :cond_e
    if-eqz v6, :cond_f

    move v4, v0

    goto :goto_7

    :cond_f
    move v4, v1

    .restart local v4    # "req":I
    :goto_7
    goto :goto_9

    .line 1326
    .end local v4    # "req":I
    :cond_10
    if-eqz v2, :cond_12

    if-eqz v6, :cond_12

    .line 1327
    if-le p1, p2, :cond_11

    move v4, v0

    goto :goto_8

    :cond_11
    move v4, v1

    .restart local v4    # "req":I
    :goto_8
    goto :goto_9

    .line 1330
    .end local v4    # "req":I
    :cond_12
    if-eqz v6, :cond_13

    move v4, v0

    goto :goto_9

    :cond_13
    move v4, v1

    .line 1335
    .restart local v4    # "req":I
    :goto_9
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "setOrientation() requestedOrientation="

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " width="

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " height="

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " resizable="

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " hint="

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v7, "SDL"

    invoke-static {v7, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1336
    sget-object v5, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    invoke-virtual {v5, v4}, Lorg/libsdl/app/SDLActivity;->setRequestedOrientation(I)V

    .line 1337
    return-void

    .line 1278
    .end local v2    # "is_portrait_allowed":Z
    .end local v3    # "contains_Portrait":Z
    .end local v4    # "req":I
    .end local v6    # "is_landscape_allowed":Z
    :cond_14
    :goto_a
    return-void
.end method

.method public superOnBackPressed()V
    .locals 0

    .line 905
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    .line 906
    return-void
.end method
