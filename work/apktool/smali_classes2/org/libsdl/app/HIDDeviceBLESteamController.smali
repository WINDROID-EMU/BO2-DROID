.class Lorg/libsdl/app/HIDDeviceBLESteamController;
.super Landroid/bluetooth/BluetoothGattCallback;
.source "HIDDeviceBLESteamController.java"

# interfaces
.implements Lorg/libsdl/app/HIDDevice;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;
    }
.end annotation


# static fields
.field private static final CHROMEBOOK_CONNECTION_CHECK_INTERVAL:I = 0x2710

.field private static final D0G_BLE2_PID:I = 0x1106

.field private static final TAG:Ljava/lang/String; = "hidapi"

.field private static final TRANSPORT_AUTO:I = 0x0

.field private static final TRANSPORT_BREDR:I = 0x1

.field private static final TRANSPORT_LE:I = 0x2

.field private static final TRITON_BLE_PID:I = 0x1303

.field private static final enterValveMode:[B

.field static final inputCharacteristicD0G:Ljava/util/UUID;

.field static final inputCharacteristicTriton_0x45:Ljava/util/UUID;

.field static final inputCharacteristicTriton_0x47:Ljava/util/UUID;

.field static final reportCharacteristic:Ljava/util/UUID;

.field static final steamControllerService:Ljava/util/UUID;


# instance fields
.field mCurrentOperation:Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;

.field private mDevice:Landroid/bluetooth/BluetoothDevice;

.field private mDeviceId:I

.field private mFrozen:Z

.field private mGatt:Landroid/bluetooth/BluetoothGatt;

.field private mHandler:Landroid/os/Handler;

.field private mHasEnabledNotifications:Z

.field private mHasSeenInputUpdate:Z

.field private mInputCharacteristic:Ljava/util/UUID;

.field private mIsChromebook:Z

.field private mIsConnected:Z

.field private mIsReconnecting:Z

.field private mIsRegistered:Z

.field private mManager:Lorg/libsdl/app/HIDDeviceManager;

.field private mOperations:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;",
            ">;"
        }
    .end annotation
.end field

.field private mOutputReportChars:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Landroid/bluetooth/BluetoothGattCharacteristic;",
            ">;"
        }
    .end annotation
.end field

.field private mProductId:I

.field private mReportId:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 60
    const-string v0, "100F6C32-1735-4313-B402-38567131E5F3"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lorg/libsdl/app/HIDDeviceBLESteamController;->steamControllerService:Ljava/util/UUID;

    .line 61
    const-string v0, "100F6C33-1735-4313-B402-38567131E5F3"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lorg/libsdl/app/HIDDeviceBLESteamController;->inputCharacteristicD0G:Ljava/util/UUID;

    .line 62
    const-string v0, "100F6C7A-1735-4313-B402-38567131E5F3"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lorg/libsdl/app/HIDDeviceBLESteamController;->inputCharacteristicTriton_0x45:Ljava/util/UUID;

    .line 63
    const-string v0, "100F6C7C-1735-4313-B402-38567131E5F3"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lorg/libsdl/app/HIDDeviceBLESteamController;->inputCharacteristicTriton_0x47:Ljava/util/UUID;

    .line 64
    const-string v0, "100F6C34-1735-4313-B402-38567131E5F3"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lorg/libsdl/app/HIDDeviceBLESteamController;->reportCharacteristic:Ljava/util/UUID;

    .line 65
    const/4 v0, 0x6

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lorg/libsdl/app/HIDDeviceBLESteamController;->enterValveMode:[B

    return-void

    nop

    :array_0
    .array-data 1
        -0x40t
        -0x79t
        0x3t
        0x8t
        0x7t
        0x0t
    .end array-data
.end method

.method constructor <init>(Lorg/libsdl/app/HIDDeviceManager;Landroid/bluetooth/BluetoothDevice;)V
    .locals 3
    .param p1, "manager"    # Lorg/libsdl/app/HIDDeviceManager;
    .param p2, "device"    # Landroid/bluetooth/BluetoothDevice;

    .line 198
    invoke-direct {p0}, Landroid/bluetooth/BluetoothGattCallback;-><init>()V

    .line 36
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsRegistered:Z

    .line 37
    iput-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsConnected:Z

    .line 38
    iput-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsChromebook:Z

    .line 39
    iput-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsReconnecting:Z

    .line 40
    iput-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mHasEnabledNotifications:Z

    .line 41
    iput-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mHasSeenInputUpdate:Z

    .line 42
    iput-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mFrozen:Z

    .line 44
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mCurrentOperation:Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;

    .line 46
    const/4 v1, -0x1

    iput v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mProductId:I

    .line 47
    iput v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mReportId:I

    .line 67
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mOutputReportChars:Ljava/util/HashMap;

    .line 199
    iput-object p1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mManager:Lorg/libsdl/app/HIDDeviceManager;

    .line 200
    iput-object p2, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mDevice:Landroid/bluetooth/BluetoothDevice;

    .line 201
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mManager:Lorg/libsdl/app/HIDDeviceManager;

    invoke-virtual {p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getIdentifier()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/libsdl/app/HIDDeviceManager;->getDeviceIDForIdentifier(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mDeviceId:I

    .line 202
    iput-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsRegistered:Z

    .line 203
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->isChromebook()Z

    move-result v1

    iput-boolean v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsChromebook:Z

    .line 204
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mOperations:Ljava/util/LinkedList;

    .line 205
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mHandler:Landroid/os/Handler;

    .line 207
    invoke-direct {p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->connectGatt()Landroid/bluetooth/BluetoothGatt;

    move-result-object v1

    iput-object v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mGatt:Landroid/bluetooth/BluetoothGatt;

    .line 208
    iput-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mHasEnabledNotifications:Z

    .line 209
    iput-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mHasSeenInputUpdate:Z

    .line 217
    return-void
.end method

.method static synthetic access$000(Lorg/libsdl/app/HIDDeviceBLESteamController;)Ljava/util/LinkedList;
    .locals 1
    .param p0, "x0"    # Lorg/libsdl/app/HIDDeviceBLESteamController;

    .line 29
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mOperations:Ljava/util/LinkedList;

    return-object v0
.end method

.method static synthetic access$100(Lorg/libsdl/app/HIDDeviceBLESteamController;)Z
    .locals 1
    .param p0, "x0"    # Lorg/libsdl/app/HIDDeviceBLESteamController;

    .line 29
    iget-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mHasEnabledNotifications:Z

    return v0
.end method

.method static synthetic access$102(Lorg/libsdl/app/HIDDeviceBLESteamController;Z)Z
    .locals 0
    .param p0, "x0"    # Lorg/libsdl/app/HIDDeviceBLESteamController;
    .param p1, "x1"    # Z

    .line 29
    iput-boolean p1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mHasEnabledNotifications:Z

    return p1
.end method

.method static synthetic access$200(Lorg/libsdl/app/HIDDeviceBLESteamController;)Z
    .locals 1
    .param p0, "x0"    # Lorg/libsdl/app/HIDDeviceBLESteamController;

    .line 29
    iget-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mHasSeenInputUpdate:Z

    return v0
.end method

.method static synthetic access$300(Lorg/libsdl/app/HIDDeviceBLESteamController;)V
    .locals 0
    .param p0, "x0"    # Lorg/libsdl/app/HIDDeviceBLESteamController;

    .line 29
    invoke-direct {p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->enableValveMode()V

    return-void
.end method

.method static synthetic access$400(Lorg/libsdl/app/HIDDeviceBLESteamController;)Landroid/bluetooth/BluetoothGatt;
    .locals 1
    .param p0, "x0"    # Lorg/libsdl/app/HIDDeviceBLESteamController;

    .line 29
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mGatt:Landroid/bluetooth/BluetoothGatt;

    return-object v0
.end method

.method static synthetic access$500(Lorg/libsdl/app/HIDDeviceBLESteamController;Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;)V
    .locals 0
    .param p0, "x0"    # Lorg/libsdl/app/HIDDeviceBLESteamController;
    .param p1, "x1"    # Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;

    .line 29
    invoke-direct {p0, p1}, Lorg/libsdl/app/HIDDeviceBLESteamController;->queueGattOperation(Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;)V

    return-void
.end method

.method private connectGatt()Landroid/bluetooth/BluetoothGatt;
    .locals 1

    .line 242
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->connectGatt(Z)Landroid/bluetooth/BluetoothGatt;

    move-result-object v0

    return-object v0
.end method

.method private connectGatt(Z)Landroid/bluetooth/BluetoothGatt;
    .locals 3
    .param p1, "managed"    # Z

    .line 230
    nop

    .line 232
    :try_start_0
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mDevice:Landroid/bluetooth/BluetoothDevice;

    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mManager:Lorg/libsdl/app/HIDDeviceManager;

    invoke-virtual {v1}, Lorg/libsdl/app/HIDDeviceManager;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v0, v1, p1, p0, v2}, Landroid/bluetooth/BluetoothDevice;->connectGatt(Landroid/content/Context;ZLandroid/bluetooth/BluetoothGattCallback;I)Landroid/bluetooth/BluetoothGatt;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 233
    :catch_0
    move-exception v0

    .line 234
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mDevice:Landroid/bluetooth/BluetoothDevice;

    iget-object v2, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mManager:Lorg/libsdl/app/HIDDeviceManager;

    invoke-virtual {v2}, Lorg/libsdl/app/HIDDeviceManager;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2, p1, p0}, Landroid/bluetooth/BluetoothDevice;->connectGatt(Landroid/content/Context;ZLandroid/bluetooth/BluetoothGattCallback;)Landroid/bluetooth/BluetoothGatt;

    move-result-object v1

    return-object v1
.end method

.method private enableNotification(Ljava/util/UUID;)V
    .locals 7
    .param p1, "chrUuid"    # Ljava/util/UUID;

    .line 489
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mGatt:Landroid/bluetooth/BluetoothGatt;

    const/16 v1, 0x1f4

    invoke-static {v0, p1, v1}, Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;->enableNotification(Landroid/bluetooth/BluetoothGatt;Ljava/util/UUID;I)Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;

    move-result-object v0

    .line 490
    .local v0, "op":Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;
    invoke-direct {p0, v0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->queueGattOperation(Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;)V

    .line 498
    move-object v1, p0

    .line 499
    .local v1, "finalThis":Lorg/libsdl/app/HIDDeviceBLESteamController;
    move-object v2, p1

    .line 500
    .local v2, "finalUuid":Ljava/util/UUID;
    iget-object v3, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mHandler:Landroid/os/Handler;

    new-instance v4, Lorg/libsdl/app/HIDDeviceBLESteamController$3;

    invoke-direct {v4, p0, v1, v2}, Lorg/libsdl/app/HIDDeviceBLESteamController$3;-><init>(Lorg/libsdl/app/HIDDeviceBLESteamController;Lorg/libsdl/app/HIDDeviceBLESteamController;Ljava/util/UUID;)V

    const-wide/16 v5, 0x3e8

    invoke-virtual {v3, v4, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 520
    return-void
.end method

.method private enableValveMode()V
    .locals 21

    .line 629
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mGatt:Landroid/bluetooth/BluetoothGatt;

    sget-object v2, Lorg/libsdl/app/HIDDeviceBLESteamController;->steamControllerService:Ljava/util/UUID;

    invoke-virtual {v1, v2}, Landroid/bluetooth/BluetoothGatt;->getService(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattService;

    move-result-object v1

    .line 630
    .local v1, "valveService":Landroid/bluetooth/BluetoothGattService;
    if-nez v1, :cond_0

    .line 631
    return-void

    .line 633
    :cond_0
    sget-object v2, Lorg/libsdl/app/HIDDeviceBLESteamController;->reportCharacteristic:Ljava/util/UUID;

    invoke-virtual {v1, v2}, Landroid/bluetooth/BluetoothGattService;->getCharacteristic(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattCharacteristic;

    move-result-object v2

    .line 634
    .local v2, "reportChr":Landroid/bluetooth/BluetoothGattCharacteristic;
    if-eqz v2, :cond_2

    .line 635
    invoke-virtual/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getProductId()I

    move-result v3

    const/16 v4, 0x1303

    const-string v5, "hidapi"

    if-ne v3, v4, :cond_1

    .line 637
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Registering Triton Steam Controller with ID: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getId()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 638
    iget-object v6, v0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mManager:Lorg/libsdl/app/HIDDeviceManager;

    invoke-virtual/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getId()I

    move-result v7

    invoke-virtual/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getIdentifier()Ljava/lang/String;

    move-result-object v8

    invoke-virtual/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getVendorId()I

    move-result v9

    invoke-virtual/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getProductId()I

    move-result v10

    invoke-virtual/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getSerialNumber()Ljava/lang/String;

    move-result-object v11

    invoke-virtual/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getVersion()I

    move-result v12

    invoke-virtual/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getManufacturerName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getProductName()Ljava/lang/String;

    move-result-object v14

    const/16 v19, 0x1

    iget v3, v0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mReportId:I

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    move/from16 v20, v3

    invoke-virtual/range {v6 .. v20}, Lorg/libsdl/app/HIDDeviceManager;->HIDDeviceConnected(ILjava/lang/String;IILjava/lang/String;ILjava/lang/String;Ljava/lang/String;IIIIZI)V

    .line 639
    invoke-direct/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->setRegistered()V

    goto :goto_0

    .line 642
    :cond_1
    const-string v3, "Writing report characteristic to enter valve mode"

    invoke-static {v5, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 643
    sget-object v3, Lorg/libsdl/app/HIDDeviceBLESteamController;->enterValveMode:[B

    invoke-virtual {v2, v3}, Landroid/bluetooth/BluetoothGattCharacteristic;->setValue([B)Z

    .line 644
    iget-object v3, v0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mGatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v3, v2}, Landroid/bluetooth/BluetoothGatt;->writeCharacteristic(Landroid/bluetooth/BluetoothGattCharacteristic;)Z

    .line 647
    :cond_2
    :goto_0
    return-void
.end method

.method private executeNextGattOperation()V
    .locals 4

    .line 443
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mOperations:Ljava/util/LinkedList;

    monitor-enter v0

    .line 444
    :try_start_0
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mCurrentOperation:Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;

    if-eqz v1, :cond_0

    .line 445
    monitor-exit v0

    return-void

    .line 447
    :cond_0
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mOperations:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 448
    monitor-exit v0

    return-void

    .line 450
    :cond_1
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mOperations:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;

    iput-object v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mCurrentOperation:Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;

    .line 451
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 453
    new-instance v0, Lorg/libsdl/app/HIDDeviceBLESteamController$2;

    invoke-direct {v0, p0}, Lorg/libsdl/app/HIDDeviceBLESteamController$2;-><init>(Lorg/libsdl/app/HIDDeviceBLESteamController;)V

    .line 468
    .local v0, "gattOperationRunnable":Ljava/lang/Runnable;
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mCurrentOperation:Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;

    invoke-virtual {v1}, Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;->getDelayMs()I

    move-result v1

    if-nez v1, :cond_2

    .line 470
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 474
    :cond_2
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mCurrentOperation:Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;

    invoke-virtual {v2}, Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;->getDelayMs()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 477
    :goto_0
    return-void

    .line 451
    .end local v0    # "gattOperationRunnable":Ljava/lang/Runnable;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private finishCurrentGattOperation()V
    .locals 3

    .line 424
    const/4 v0, 0x0

    .line 425
    .local v0, "op":Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mOperations:Ljava/util/LinkedList;

    monitor-enter v1

    .line 426
    :try_start_0
    iget-object v2, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mCurrentOperation:Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;

    if-eqz v2, :cond_0

    .line 427
    iget-object v2, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mCurrentOperation:Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;

    move-object v0, v2

    .line 428
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mCurrentOperation:Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;

    .line 430
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 431
    if-eqz v0, :cond_1

    .line 432
    invoke-virtual {v0}, Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;->finish()Z

    move-result v1

    .line 435
    .local v1, "result":Z
    if-nez v1, :cond_1

    .line 436
    iget-object v2, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mOperations:Ljava/util/LinkedList;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 439
    .end local v1    # "result":Z
    :cond_1
    invoke-direct {p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->executeNextGattOperation()V

    .line 440
    return-void

    .line 430
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method private isRegistered()Z
    .locals 1

    .line 334
    iget-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsRegistered:Z

    return v0
.end method

.method private probeService(Lorg/libsdl/app/HIDDeviceBLESteamController;)Z
    .locals 11
    .param p1, "controller"    # Lorg/libsdl/app/HIDDeviceBLESteamController;

    .line 343
    invoke-direct {p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->isRegistered()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 344
    return v1

    .line 347
    :cond_0
    iget-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsConnected:Z

    const/4 v2, 0x0

    if-nez v0, :cond_1

    .line 348
    return v2

    .line 351
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "probeService controller="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v3, "hidapi"

    invoke-static {v3, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 353
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mGatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGatt;->getServices()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/bluetooth/BluetoothGattService;

    .line 354
    .local v4, "service":Landroid/bluetooth/BluetoothGattService;
    invoke-virtual {v4}, Landroid/bluetooth/BluetoothGattService;->getUuid()Ljava/util/UUID;

    move-result-object v5

    sget-object v6, Lorg/libsdl/app/HIDDeviceBLESteamController;->steamControllerService:Ljava/util/UUID;

    invoke-virtual {v5, v6}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 355
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Found Valve steam controller service "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v4}, Landroid/bluetooth/BluetoothGattService;->getUuid()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 357
    invoke-virtual {v4}, Landroid/bluetooth/BluetoothGattService;->getCharacteristics()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/bluetooth/BluetoothGattCharacteristic;

    .line 358
    .local v2, "chr":Landroid/bluetooth/BluetoothGattCharacteristic;
    invoke-virtual {v2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v5

    sget-object v6, Lorg/libsdl/app/HIDDeviceBLESteamController;->inputCharacteristicTriton_0x45:Ljava/util/UUID;

    invoke-virtual {v5, v6}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v5

    const/16 v6, 0x1303

    if-eqz v5, :cond_2

    .line 359
    const-string v5, "Found Triton input characteristic 0x45"

    invoke-static {v3, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 360
    iput v6, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mProductId:I

    .line 361
    const/16 v5, 0x45

    iput v5, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mReportId:I

    .line 362
    invoke-virtual {v2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v5

    iput-object v5, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mInputCharacteristic:Ljava/util/UUID;

    goto/16 :goto_2

    .line 363
    :cond_2
    invoke-virtual {v2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v5

    sget-object v7, Lorg/libsdl/app/HIDDeviceBLESteamController;->inputCharacteristicTriton_0x47:Ljava/util/UUID;

    invoke-virtual {v5, v7}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 364
    const-string v5, "Found Triton input characteristic 0x47"

    invoke-static {v3, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 365
    iput v6, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mProductId:I

    .line 366
    const/16 v5, 0x47

    iput v5, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mReportId:I

    .line 367
    invoke-virtual {v2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v5

    iput-object v5, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mInputCharacteristic:Ljava/util/UUID;

    goto/16 :goto_2

    .line 368
    :cond_3
    invoke-virtual {v2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v5

    sget-object v6, Lorg/libsdl/app/HIDDeviceBLESteamController;->inputCharacteristicD0G:Ljava/util/UUID;

    invoke-virtual {v5, v6}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 369
    const-string v5, "Found D0G input characteristic"

    invoke-static {v3, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 370
    const/16 v5, 0x1106

    iput v5, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mProductId:I

    .line 371
    const/4 v5, 0x3

    iput v5, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mReportId:I

    .line 372
    invoke-virtual {v2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v5

    iput-object v5, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mInputCharacteristic:Ljava/util/UUID;

    goto/16 :goto_2

    .line 374
    :cond_4
    const-string v5, "100F6C([0-9A-Z]{2})"

    const/4 v6, 0x2

    invoke-static {v5, v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v5

    .line 375
    .local v5, "reportPattern":Ljava/util/regex/Pattern;
    invoke-virtual {v2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v6

    .line 377
    .local v6, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v6}, Ljava/util/regex/Matcher;->find()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 379
    :try_start_0
    invoke-virtual {v6, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    const/16 v8, 0x10

    invoke-static {v7, v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v7

    .line 381
    .local v7, "reportId":I
    add-int/lit8 v7, v7, -0x35

    .line 382
    const/16 v9, 0x80

    if-lt v7, v9, :cond_5

    .line 384
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Found Triton output report 0x"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {v7, v8}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v3, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 385
    iget-object v8, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mOutputReportChars:Ljava/util/HashMap;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v8, v9, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 390
    .end local v7    # "reportId":I
    :cond_5
    goto :goto_2

    .line 388
    :catch_0
    move-exception v7

    .line 389
    .local v7, "nfe":Ljava/lang/NumberFormatException;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Could not parse report characteristic "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ": "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v7}, Ljava/lang/NumberFormatException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v3, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 393
    .end local v2    # "chr":Landroid/bluetooth/BluetoothGattCharacteristic;
    .end local v5    # "reportPattern":Ljava/util/regex/Pattern;
    .end local v6    # "matcher":Ljava/util/regex/Matcher;
    .end local v7    # "nfe":Ljava/lang/NumberFormatException;
    :cond_6
    :goto_2
    goto/16 :goto_1

    .line 395
    :cond_7
    invoke-virtual {v4}, Landroid/bluetooth/BluetoothGattService;->getCharacteristics()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/bluetooth/BluetoothGattCharacteristic;

    .line 396
    .restart local v2    # "chr":Landroid/bluetooth/BluetoothGattCharacteristic;
    invoke-virtual {v2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v3

    iget-object v5, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mInputCharacteristic:Ljava/util/UUID;

    invoke-virtual {v3, v5}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 398
    const-string v3, "00002902-0000-1000-8000-00805f9b34fb"

    invoke-static {v3}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/bluetooth/BluetoothGattCharacteristic;->getDescriptor(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattDescriptor;

    move-result-object v3

    .line 399
    .local v3, "cccd":Landroid/bluetooth/BluetoothGattDescriptor;
    if-eqz v3, :cond_8

    .line 400
    invoke-virtual {v2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v5

    invoke-direct {p0, v5}, Lorg/libsdl/app/HIDDeviceBLESteamController;->enableNotification(Ljava/util/UUID;)V

    .line 403
    .end local v2    # "chr":Landroid/bluetooth/BluetoothGattCharacteristic;
    .end local v3    # "cccd":Landroid/bluetooth/BluetoothGattDescriptor;
    :cond_8
    goto :goto_3

    .line 404
    :cond_9
    return v1

    .line 406
    .end local v4    # "service":Landroid/bluetooth/BluetoothGattService;
    :cond_a
    goto/16 :goto_0

    .line 408
    :cond_b
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mGatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGatt;->getServices()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_c

    iget-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsChromebook:Z

    if-eqz v0, :cond_c

    iget-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsReconnecting:Z

    if-nez v0, :cond_c

    .line 409
    const-string v0, "Chromebook: Discovered services were empty; this almost certainly means the BtGatt.ContextMap bug has bitten us."

    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 410
    iput-boolean v2, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsConnected:Z

    .line 411
    iput-boolean v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsReconnecting:Z

    .line 412
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mGatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGatt;->disconnect()V

    .line 413
    invoke-direct {p0, v2}, Lorg/libsdl/app/HIDDeviceBLESteamController;->connectGatt(Z)Landroid/bluetooth/BluetoothGatt;

    move-result-object v0

    iput-object v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mGatt:Landroid/bluetooth/BluetoothGatt;

    .line 416
    :cond_c
    return v2
.end method

.method private queueGattOperation(Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;)V
    .locals 2
    .param p1, "op"    # Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;

    .line 480
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mOperations:Ljava/util/LinkedList;

    monitor-enter v0

    .line 481
    :try_start_0
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mOperations:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 482
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 483
    invoke-direct {p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->executeNextGattOperation()V

    .line 484
    return-void

    .line 482
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private setRegistered()V
    .locals 1

    .line 338
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsRegistered:Z

    .line 339
    return-void
.end method


# virtual methods
.method protected checkConnectionForChromebookIssue()V
    .locals 6

    .line 273
    iget-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsChromebook:Z

    if-nez v0, :cond_0

    .line 276
    return-void

    .line 279
    :cond_0
    invoke-virtual {p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getConnectionState()I

    move-result v0

    .line 281
    .local v0, "connectionState":I
    const/4 v1, 0x0

    const/4 v2, 0x1

    const-string v3, "hidapi"

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 283
    :pswitch_0
    iget-boolean v4, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsConnected:Z

    if-nez v4, :cond_1

    .line 286
    const-string v4, "Chromebook: We are in a very bad state; the controller shows as connected in the underlying Bluetooth layer, but we never received a callback.  Forcing a reconnect."

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 287
    iput-boolean v2, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsReconnecting:Z

    .line 288
    iget-object v2, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mGatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothGatt;->disconnect()V

    .line 289
    invoke-direct {p0, v1}, Lorg/libsdl/app/HIDDeviceBLESteamController;->connectGatt(Z)Landroid/bluetooth/BluetoothGatt;

    move-result-object v1

    iput-object v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mGatt:Landroid/bluetooth/BluetoothGatt;

    .line 290
    goto :goto_0

    .line 292
    :cond_1
    invoke-direct {p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->isRegistered()Z

    move-result v4

    if-nez v4, :cond_3

    .line 293
    iget-object v4, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mGatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v4}, Landroid/bluetooth/BluetoothGatt;->getServices()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_2

    .line 294
    const-string v1, "Chromebook: We are connected to a controller, but never got our registration.  Trying to recover."

    invoke-static {v3, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    invoke-direct {p0, p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->probeService(Lorg/libsdl/app/HIDDeviceBLESteamController;)Z

    goto :goto_0

    .line 298
    :cond_2
    const-string v4, "Chromebook: We are connected to a controller, but never discovered services.  Trying to recover."

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 299
    iput-boolean v2, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsReconnecting:Z

    .line 300
    iget-object v2, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mGatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothGatt;->disconnect()V

    .line 301
    invoke-direct {p0, v1}, Lorg/libsdl/app/HIDDeviceBLESteamController;->connectGatt(Z)Landroid/bluetooth/BluetoothGatt;

    move-result-object v1

    iput-object v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mGatt:Landroid/bluetooth/BluetoothGatt;

    .line 302
    goto :goto_0

    .line 306
    :cond_3
    const-string v1, "Chromebook: We are connected, and registered.  Everything\'s good!"

    invoke-static {v3, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 307
    return-void

    .line 320
    :pswitch_1
    const-string v1, "Chromebook: We\'re still trying to connect.  Waiting a bit longer."

    invoke-static {v3, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 312
    :pswitch_2
    const-string v4, "Chromebook: We have either been disconnected, or the Chromebook BtGatt.ContextMap bug has bitten us.  Attempting a disconnect/reconnect, but we may not be able to recover."

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 314
    iput-boolean v2, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsReconnecting:Z

    .line 315
    iget-object v2, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mGatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothGatt;->disconnect()V

    .line 316
    invoke-direct {p0, v1}, Lorg/libsdl/app/HIDDeviceBLESteamController;->connectGatt(Z)Landroid/bluetooth/BluetoothGatt;

    move-result-object v1

    iput-object v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mGatt:Landroid/bluetooth/BluetoothGatt;

    .line 317
    nop

    .line 324
    :goto_0
    move-object v1, p0

    .line 325
    .local v1, "finalThis":Lorg/libsdl/app/HIDDeviceBLESteamController;
    iget-object v2, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mHandler:Landroid/os/Handler;

    new-instance v3, Lorg/libsdl/app/HIDDeviceBLESteamController$1;

    invoke-direct {v3, p0, v1}, Lorg/libsdl/app/HIDDeviceBLESteamController$1;-><init>(Lorg/libsdl/app/HIDDeviceBLESteamController;Lorg/libsdl/app/HIDDeviceBLESteamController;)V

    const-wide/16 v4, 0x2710

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 331
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public close()V
    .locals 0

    .line 805
    return-void
.end method

.method protected getConnectionState()I
    .locals 4

    .line 247
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mManager:Lorg/libsdl/app/HIDDeviceManager;

    invoke-virtual {v0}, Lorg/libsdl/app/HIDDeviceManager;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 248
    .local v0, "context":Landroid/content/Context;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 250
    return v1

    .line 253
    :cond_0
    const-string v2, "bluetooth"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/bluetooth/BluetoothManager;

    .line 254
    .local v2, "btManager":Landroid/bluetooth/BluetoothManager;
    if-nez v2, :cond_1

    .line 257
    return v1

    .line 260
    :cond_1
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mDevice:Landroid/bluetooth/BluetoothDevice;

    const/4 v3, 0x7

    invoke-virtual {v2, v1, v3}, Landroid/bluetooth/BluetoothManager;->getConnectionState(Landroid/bluetooth/BluetoothDevice;I)I

    move-result v1

    return v1
.end method

.method public getDevice()Landroid/hardware/usb/UsbDevice;
    .locals 1

    .line 734
    const/4 v0, 0x0

    return-object v0
.end method

.method getGatt()Landroid/bluetooth/BluetoothGatt;
    .locals 1

    .line 224
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mGatt:Landroid/bluetooth/BluetoothGatt;

    return-object v0
.end method

.method public getId()I
    .locals 1

    .line 683
    iget v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mDeviceId:I

    return v0
.end method

.method getIdentifier()Ljava/lang/String;
    .locals 2

    .line 220
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "SteamController.%s"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getManufacturerName()Ljava/lang/String;
    .locals 1

    .line 724
    const-string v0, "Valve Corporation"

    return-object v0
.end method

.method public getProductId()I
    .locals 2

    .line 695
    iget v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mProductId:I

    if-lez v0, :cond_0

    .line 697
    iget v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mProductId:I

    return v0

    .line 700
    :cond_0
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Steam Ctrl"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 702
    const/16 v0, 0x1303

    iput v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mProductId:I

    goto :goto_0

    .line 705
    :cond_1
    const/16 v0, 0x1106

    iput v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mProductId:I

    .line 708
    :goto_0
    iget v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mProductId:I

    return v0
.end method

.method public getProductName()Ljava/lang/String;
    .locals 1

    .line 729
    const-string v0, "Steam Controller"

    return-object v0
.end method

.method public getSerialNumber()Ljava/lang/String;
    .locals 1

    .line 714
    const-string v0, "12345"

    return-object v0
.end method

.method public getVendorId()I
    .locals 2

    .line 689
    const/16 v0, 0x28de

    .line 690
    .local v0, "VALVE_USB_VID":I
    const/16 v1, 0x28de

    return v1
.end method

.method public getVersion()I
    .locals 1

    .line 719
    const/4 v0, 0x0

    return v0
.end method

.method public onCharacteristicChanged(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V
    .locals 3
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "characteristic"    # Landroid/bluetooth/BluetoothGattCharacteristic;

    .line 616
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v0

    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mInputCharacteristic:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mFrozen:Z

    if-nez v0, :cond_0

    .line 617
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mHasSeenInputUpdate:Z

    .line 618
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mManager:Lorg/libsdl/app/HIDDeviceManager;

    invoke-virtual {p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getId()I

    move-result v1

    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getValue()[B

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/libsdl/app/HIDDeviceManager;->HIDDeviceInputReport(I[B)V

    .line 620
    :cond_0
    return-void
.end method

.method public onCharacteristicRead(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;I)V
    .locals 3
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "characteristic"    # Landroid/bluetooth/BluetoothGattCharacteristic;
    .param p3, "status"    # I

    .line 588
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v0

    sget-object v1, Lorg/libsdl/app/HIDDeviceBLESteamController;->reportCharacteristic:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mFrozen:Z

    if-nez v0, :cond_0

    .line 589
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mManager:Lorg/libsdl/app/HIDDeviceManager;

    invoke-virtual {p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getId()I

    move-result v1

    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getValue()[B

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/libsdl/app/HIDDeviceManager;->HIDDeviceReportResponse(I[B)V

    .line 592
    :cond_0
    invoke-direct {p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->finishCurrentGattOperation()V

    .line 593
    return-void
.end method

.method public onCharacteristicWrite(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;I)V
    .locals 18
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "characteristic"    # Landroid/bluetooth/BluetoothGattCharacteristic;
    .param p3, "status"    # I

    .line 599
    move-object/from16 v0, p0

    invoke-virtual/range {p2 .. p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v1

    sget-object v2, Lorg/libsdl/app/HIDDeviceBLESteamController;->reportCharacteristic:Ljava/util/UUID;

    invoke-virtual {v1, v2}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 601
    invoke-direct/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->isRegistered()Z

    move-result v1

    if-nez v1, :cond_0

    .line 602
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Registering Steam Controller with ID: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "hidapi"

    invoke-static {v2, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 603
    iget-object v3, v0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mManager:Lorg/libsdl/app/HIDDeviceManager;

    invoke-virtual/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getId()I

    move-result v4

    invoke-virtual/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getIdentifier()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getVendorId()I

    move-result v6

    invoke-virtual/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getProductId()I

    move-result v7

    invoke-virtual/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getSerialNumber()Ljava/lang/String;

    move-result-object v8

    invoke-virtual/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getVersion()I

    move-result v9

    invoke-virtual/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getManufacturerName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getProductName()Ljava/lang/String;

    move-result-object v11

    const/16 v16, 0x1

    iget v1, v0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mReportId:I

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    move/from16 v17, v1

    invoke-virtual/range {v3 .. v17}, Lorg/libsdl/app/HIDDeviceManager;->HIDDeviceConnected(ILjava/lang/String;IILjava/lang/String;ILjava/lang/String;Ljava/lang/String;IIIIZI)V

    .line 604
    invoke-direct/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->setRegistered()V

    .line 608
    :cond_0
    invoke-direct/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->finishCurrentGattOperation()V

    .line 609
    return-void
.end method

.method public onConnectionStateChange(Landroid/bluetooth/BluetoothGatt;II)V
    .locals 2
    .param p1, "g"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "status"    # I
    .param p3, "newState"    # I

    .line 539
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsReconnecting:Z

    .line 540
    const/4 v1, 0x2

    if-ne p3, v1, :cond_0

    .line 541
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsConnected:Z

    .line 543
    invoke-direct {p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->isRegistered()Z

    move-result v0

    if-nez v0, :cond_1

    .line 544
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mHandler:Landroid/os/Handler;

    new-instance v1, Lorg/libsdl/app/HIDDeviceBLESteamController$4;

    invoke-direct {v1, p0}, Lorg/libsdl/app/HIDDeviceBLESteamController$4;-><init>(Lorg/libsdl/app/HIDDeviceBLESteamController;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 552
    :cond_0
    if-nez p3, :cond_1

    .line 553
    iput-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsConnected:Z

    .line 557
    :cond_1
    :goto_0
    return-void
.end method

.method public onDescriptorRead(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattDescriptor;I)V
    .locals 0
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "descriptor"    # Landroid/bluetooth/BluetoothGattDescriptor;
    .param p3, "status"    # I

    .line 625
    return-void
.end method

.method public onDescriptorWrite(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattDescriptor;I)V
    .locals 3
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "descriptor"    # Landroid/bluetooth/BluetoothGattDescriptor;
    .param p3, "status"    # I

    .line 651
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattDescriptor;->getCharacteristic()Landroid/bluetooth/BluetoothGattCharacteristic;

    move-result-object v0

    .line 654
    .local v0, "chr":Landroid/bluetooth/BluetoothGattCharacteristic;
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v1

    iget-object v2, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mInputCharacteristic:Ljava/util/UUID;

    invoke-virtual {v1, v2}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 655
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mHasEnabledNotifications:Z

    .line 656
    invoke-direct {p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->enableValveMode()V

    .line 659
    :cond_0
    invoke-direct {p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->finishCurrentGattOperation()V

    .line 660
    return-void
.end method

.method public onMtuChanged(Landroid/bluetooth/BluetoothGatt;II)V
    .locals 0
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "mtu"    # I
    .param p3, "status"    # I

    .line 675
    return-void
.end method

.method public onReadRemoteRssi(Landroid/bluetooth/BluetoothGatt;II)V
    .locals 0
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "rssi"    # I
    .param p3, "status"    # I

    .line 670
    return-void
.end method

.method public onReliableWriteCompleted(Landroid/bluetooth/BluetoothGatt;I)V
    .locals 0
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "status"    # I

    .line 665
    return-void
.end method

.method public onServicesDiscovered(Landroid/bluetooth/BluetoothGatt;I)V
    .locals 2
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "status"    # I

    .line 562
    if-nez p2, :cond_2

    .line 563
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getServices()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 564
    const-string v0, "hidapi"

    const-string v1, "onServicesDiscovered returned zero services; something has gone horribly wrong down in Android\'s Bluetooth stack."

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 565
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsReconnecting:Z

    .line 566
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsConnected:Z

    .line 567
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->disconnect()V

    .line 568
    invoke-direct {p0, v0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->connectGatt(Z)Landroid/bluetooth/BluetoothGatt;

    move-result-object v0

    iput-object v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mGatt:Landroid/bluetooth/BluetoothGatt;

    goto :goto_0

    .line 570
    :cond_0
    invoke-virtual {p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getProductId()I

    move-result v0

    const/16 v1, 0x1303

    if-ne v0, v1, :cond_1

    .line 576
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mGatt:Landroid/bluetooth/BluetoothGatt;

    const/16 v1, 0x205

    invoke-virtual {v0, v1}, Landroid/bluetooth/BluetoothGatt;->requestMtu(I)Z

    .line 579
    :cond_1
    invoke-direct {p0, p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->probeService(Lorg/libsdl/app/HIDDeviceBLESteamController;)Z

    .line 582
    :cond_2
    :goto_0
    return-void
.end method

.method public open()Z
    .locals 1

    .line 739
    const/4 v0, 0x1

    return v0
.end method

.method readCharacteristic(Ljava/util/UUID;)V
    .locals 1
    .param p1, "uuid"    # Ljava/util/UUID;

    .line 528
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mGatt:Landroid/bluetooth/BluetoothGatt;

    invoke-static {v0, p1}, Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;->readCharacteristic(Landroid/bluetooth/BluetoothGatt;Ljava/util/UUID;)Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;

    move-result-object v0

    .line 529
    .local v0, "op":Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;
    invoke-direct {p0, v0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->queueGattOperation(Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;)V

    .line 530
    return-void
.end method

.method public readReport([BZ)Z
    .locals 3
    .param p1, "report"    # [B
    .param p2, "feature"    # Z

    .line 786
    invoke-direct {p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->isRegistered()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 787
    const-string v0, "hidapi"

    const-string v2, "Attempted readReport before Steam Controller is registered!"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 788
    iget-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsConnected:Z

    if-eqz v0, :cond_0

    .line 789
    invoke-direct {p0, p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->probeService(Lorg/libsdl/app/HIDDeviceBLESteamController;)Z

    .line 791
    :cond_0
    return v1

    .line 794
    :cond_1
    if-eqz p2, :cond_2

    .line 795
    sget-object v0, Lorg/libsdl/app/HIDDeviceBLESteamController;->reportCharacteristic:Ljava/util/UUID;

    invoke-virtual {p0, v0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->readCharacteristic(Ljava/util/UUID;)V

    .line 796
    const/4 v0, 0x1

    return v0

    .line 799
    :cond_2
    return v1
.end method

.method reconnect()V
    .locals 2

    .line 265
    invoke-virtual {p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getConnectionState()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 266
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mGatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGatt;->disconnect()V

    .line 267
    invoke-direct {p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->connectGatt()Landroid/bluetooth/BluetoothGatt;

    move-result-object v0

    iput-object v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mGatt:Landroid/bluetooth/BluetoothGatt;

    .line 270
    :cond_0
    return-void
.end method

.method public setFrozen(Z)V
    .locals 0
    .param p1, "frozen"    # Z

    .line 809
    iput-boolean p1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mFrozen:Z

    .line 810
    return-void
.end method

.method public shutdown()V
    .locals 2

    .line 814
    invoke-virtual {p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->close()V

    .line 816
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mGatt:Landroid/bluetooth/BluetoothGatt;

    .line 817
    .local v0, "g":Landroid/bluetooth/BluetoothGatt;
    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 818
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGatt;->disconnect()V

    .line 819
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGatt;->close()V

    .line 820
    iput-object v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mGatt:Landroid/bluetooth/BluetoothGatt;

    .line 822
    :cond_0
    iput-object v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mManager:Lorg/libsdl/app/HIDDeviceManager;

    .line 823
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsRegistered:Z

    .line 824
    iput-boolean v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsConnected:Z

    .line 825
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mOperations:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 826
    return-void
.end method

.method writeCharacteristic(Ljava/util/UUID;[B)V
    .locals 1
    .param p1, "uuid"    # Ljava/util/UUID;
    .param p2, "value"    # [B

    .line 523
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mGatt:Landroid/bluetooth/BluetoothGatt;

    invoke-static {v0, p1, p2}, Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;->writeCharacteristic(Landroid/bluetooth/BluetoothGatt;Ljava/util/UUID;[B)Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;

    move-result-object v0

    .line 524
    .local v0, "op":Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;
    invoke-direct {p0, v0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->queueGattOperation(Lorg/libsdl/app/HIDDeviceBLESteamController$GattOperation;)V

    .line 525
    return-void
.end method

.method public writeReport([BZ)I
    .locals 6
    .param p1, "report"    # [B
    .param p2, "feature"    # Z

    .line 744
    invoke-direct {p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->isRegistered()Z

    move-result v0

    const/4 v1, -0x1

    const-string v2, "hidapi"

    if-nez v0, :cond_1

    .line 745
    const-string v0, "Attempted writeReport before Steam Controller is registered!"

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 746
    iget-boolean v0, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mIsConnected:Z

    if-eqz v0, :cond_0

    .line 747
    invoke-direct {p0, p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->probeService(Lorg/libsdl/app/HIDDeviceBLESteamController;)Z

    .line 749
    :cond_0
    return v1

    .line 752
    :cond_1
    const/4 v0, 0x1

    if-eqz p2, :cond_2

    .line 754
    array-length v1, p1

    sub-int/2addr v1, v0

    invoke-static {p1, v0, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v0

    .line 756
    .local v0, "actual_report":[B
    sget-object v1, Lorg/libsdl/app/HIDDeviceBLESteamController;->reportCharacteristic:Ljava/util/UUID;

    invoke-virtual {p0, v1, v0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->writeCharacteristic(Ljava/util/UUID;[B)V

    .line 757
    array-length v1, p1

    return v1

    .line 760
    .end local v0    # "actual_report":[B
    :cond_2
    invoke-virtual {p0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getProductId()I

    move-result v3

    const/16 v4, 0x1106

    if-ne v3, v4, :cond_3

    .line 762
    sget-object v0, Lorg/libsdl/app/HIDDeviceBLESteamController;->reportCharacteristic:Ljava/util/UUID;

    invoke-virtual {p0, v0, p1}, Lorg/libsdl/app/HIDDeviceBLESteamController;->writeCharacteristic(Ljava/util/UUID;[B)V

    .line 763
    array-length v0, p1

    return v0

    .line 767
    :cond_3
    array-length v3, p1

    if-lez v3, :cond_5

    .line 768
    const/4 v3, 0x0

    aget-byte v3, p1, v3

    and-int/lit16 v3, v3, 0xff

    .line 769
    .local v3, "reportId":I
    iget-object v4, p0, Lorg/libsdl/app/HIDDeviceBLESteamController;->mOutputReportChars:Ljava/util/HashMap;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/bluetooth/BluetoothGattCharacteristic;

    .line 770
    .local v4, "targetedReportCharacteristic":Landroid/bluetooth/BluetoothGattCharacteristic;
    if-eqz v4, :cond_4

    .line 771
    array-length v1, p1

    sub-int/2addr v1, v0

    invoke-static {p1, v0, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v0

    .line 773
    .restart local v0    # "actual_report":[B
    invoke-virtual {v4}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->writeCharacteristic(Ljava/util/UUID;[B)V

    .line 774
    array-length v1, p1

    return v1

    .line 776
    .end local v0    # "actual_report":[B
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Got report write request for unknown report type 0x"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v5, 0x10

    invoke-static {v3, v5}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 781
    .end local v3    # "reportId":I
    .end local v4    # "targetedReportCharacteristic":Landroid/bluetooth/BluetoothGattCharacteristic;
    :cond_5
    return v1
.end method
