.class public Lorg/libsdl/app/HIDDeviceManager;
.super Ljava/lang/Object;
.source "HIDDeviceManager.java"


# static fields
.field private static final ACTION_USB_PERMISSION:Ljava/lang/String; = "org.libsdl.app.USB_PERMISSION"

.field private static final TAG:Ljava/lang/String; = "hidapi"

.field private static sManager:Lorg/libsdl/app/HIDDeviceManager;

.field private static sManagerRefCount:I


# instance fields
.field private final mBluetoothBroadcast:Landroid/content/BroadcastReceiver;

.field private mBluetoothDevices:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Landroid/bluetooth/BluetoothDevice;",
            "Lorg/libsdl/app/HIDDeviceBLESteamController;",
            ">;"
        }
    .end annotation
.end field

.field private mBluetoothManager:Landroid/bluetooth/BluetoothManager;

.field private mContext:Landroid/content/Context;

.field private mDevicesById:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lorg/libsdl/app/HIDDevice;",
            ">;"
        }
    .end annotation
.end field

.field private mHandler:Landroid/os/Handler;

.field private mIsChromebook:Z

.field private mLastBluetoothDevices:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/bluetooth/BluetoothDevice;",
            ">;"
        }
    .end annotation
.end field

.field private mNextDeviceId:I

.field private mSharedPreferences:Landroid/content/SharedPreferences;

.field private final mUsbBroadcast:Landroid/content/BroadcastReceiver;

.field private mUsbManager:Landroid/hardware/usb/UsbManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 33
    const/4 v0, 0x0

    sput v0, Lorg/libsdl/app/HIDDeviceManager;->sManagerRefCount:I

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mDevicesById:Ljava/util/HashMap;

    .line 55
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mBluetoothDevices:Ljava/util/HashMap;

    .line 56
    const/4 v0, 0x0

    iput v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mNextDeviceId:I

    .line 57
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/libsdl/app/HIDDeviceManager;->mSharedPreferences:Landroid/content/SharedPreferences;

    .line 58
    iput-boolean v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mIsChromebook:Z

    .line 64
    new-instance v1, Lorg/libsdl/app/HIDDeviceManager$1;

    invoke-direct {v1, p0}, Lorg/libsdl/app/HIDDeviceManager$1;-><init>(Lorg/libsdl/app/HIDDeviceManager;)V

    iput-object v1, p0, Lorg/libsdl/app/HIDDeviceManager;->mUsbBroadcast:Landroid/content/BroadcastReceiver;

    .line 81
    new-instance v1, Lorg/libsdl/app/HIDDeviceManager$2;

    invoke-direct {v1, p0}, Lorg/libsdl/app/HIDDeviceManager$2;-><init>(Lorg/libsdl/app/HIDDeviceManager;)V

    iput-object v1, p0, Lorg/libsdl/app/HIDDeviceManager;->mBluetoothBroadcast:Landroid/content/BroadcastReceiver;

    .line 106
    iput-object p1, p0, Lorg/libsdl/app/HIDDeviceManager;->mContext:Landroid/content/Context;

    .line 108
    invoke-direct {p0}, Lorg/libsdl/app/HIDDeviceManager;->HIDDeviceRegisterCallback()V

    .line 110
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceManager;->mContext:Landroid/content/Context;

    const-string v2, "hidapi"

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    iput-object v1, p0, Lorg/libsdl/app/HIDDeviceManager;->mSharedPreferences:Landroid/content/SharedPreferences;

    .line 111
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->isChromebook()Z

    move-result v1

    iput-boolean v1, p0, Lorg/libsdl/app/HIDDeviceManager;->mIsChromebook:Z

    .line 120
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceManager;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v2, "next_device_id"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mNextDeviceId:I

    .line 122
    return-void
.end method

.method private native HIDDeviceRegisterCallback()V
.end method

.method private native HIDDeviceReleaseCallback()V
.end method

.method static synthetic access$000(Lorg/libsdl/app/HIDDeviceManager;Landroid/hardware/usb/UsbDevice;)V
    .locals 0
    .param p0, "x0"    # Lorg/libsdl/app/HIDDeviceManager;
    .param p1, "x1"    # Landroid/hardware/usb/UsbDevice;

    .line 28
    invoke-direct {p0, p1}, Lorg/libsdl/app/HIDDeviceManager;->handleUsbDeviceAttached(Landroid/hardware/usb/UsbDevice;)V

    return-void
.end method

.method static synthetic access$100(Lorg/libsdl/app/HIDDeviceManager;Landroid/hardware/usb/UsbDevice;)V
    .locals 0
    .param p0, "x0"    # Lorg/libsdl/app/HIDDeviceManager;
    .param p1, "x1"    # Landroid/hardware/usb/UsbDevice;

    .line 28
    invoke-direct {p0, p1}, Lorg/libsdl/app/HIDDeviceManager;->handleUsbDeviceDetached(Landroid/hardware/usb/UsbDevice;)V

    return-void
.end method

.method static synthetic access$200(Lorg/libsdl/app/HIDDeviceManager;Landroid/hardware/usb/UsbDevice;Z)V
    .locals 0
    .param p0, "x0"    # Lorg/libsdl/app/HIDDeviceManager;
    .param p1, "x1"    # Landroid/hardware/usb/UsbDevice;
    .param p2, "x2"    # Z

    .line 28
    invoke-direct {p0, p1, p2}, Lorg/libsdl/app/HIDDeviceManager;->handleUsbDevicePermission(Landroid/hardware/usb/UsbDevice;Z)V

    return-void
.end method

.method public static acquire(Landroid/content/Context;)Lorg/libsdl/app/HIDDeviceManager;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .line 36
    sget v0, Lorg/libsdl/app/HIDDeviceManager;->sManagerRefCount:I

    if-nez v0, :cond_0

    .line 37
    new-instance v0, Lorg/libsdl/app/HIDDeviceManager;

    invoke-direct {v0, p0}, Lorg/libsdl/app/HIDDeviceManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lorg/libsdl/app/HIDDeviceManager;->sManager:Lorg/libsdl/app/HIDDeviceManager;

    .line 39
    :cond_0
    sget v0, Lorg/libsdl/app/HIDDeviceManager;->sManagerRefCount:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lorg/libsdl/app/HIDDeviceManager;->sManagerRefCount:I

    .line 40
    sget-object v0, Lorg/libsdl/app/HIDDeviceManager;->sManager:Lorg/libsdl/app/HIDDeviceManager;

    return-object v0
.end method

.method private close()V
    .locals 2

    .line 552
    invoke-direct {p0}, Lorg/libsdl/app/HIDDeviceManager;->shutdownUSB()V

    .line 553
    invoke-direct {p0}, Lorg/libsdl/app/HIDDeviceManager;->shutdownBluetooth()V

    .line 554
    monitor-enter p0

    .line 555
    :try_start_0
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mDevicesById:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/libsdl/app/HIDDevice;

    .line 556
    .local v1, "device":Lorg/libsdl/app/HIDDevice;
    invoke-interface {v1}, Lorg/libsdl/app/HIDDevice;->shutdown()V

    .line 557
    .end local v1    # "device":Lorg/libsdl/app/HIDDevice;
    goto :goto_0

    .line 558
    :cond_0
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mDevicesById:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 559
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mBluetoothDevices:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 560
    invoke-direct {p0}, Lorg/libsdl/app/HIDDeviceManager;->HIDDeviceReleaseCallback()V

    .line 561
    monitor-exit p0

    .line 562
    return-void

    .line 561
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private connectHIDDeviceUSB(Landroid/hardware/usb/UsbDevice;)V
    .locals 23
    .param p1, "usbDevice"    # Landroid/hardware/usb/UsbDevice;

    .line 357
    move-object/from16 v15, p0

    move-object/from16 v14, p1

    monitor-enter p0

    .line 358
    const/4 v0, 0x0

    .line 359
    .local v0, "interface_mask":I
    const/4 v1, 0x0

    move v13, v1

    .local v13, "interface_index":I
    :goto_0
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Landroid/hardware/usb/UsbDevice;->getInterfaceCount()I

    move-result v1

    if-ge v13, v1, :cond_2

    .line 360
    invoke-virtual {v14, v13}, Landroid/hardware/usb/UsbDevice;->getInterface(I)Landroid/hardware/usb/UsbInterface;

    move-result-object v1

    move-object v12, v1

    .line 361
    .local v12, "usbInterface":Landroid/hardware/usb/UsbInterface;
    invoke-direct {v15, v14, v12}, Lorg/libsdl/app/HIDDeviceManager;->isHIDDeviceInterface(Landroid/hardware/usb/UsbDevice;Landroid/hardware/usb/UsbInterface;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 364
    invoke-virtual {v12}, Landroid/hardware/usb/UsbInterface;->getId()I

    move-result v1

    move/from16 v16, v1

    .line 365
    .local v16, "interface_id":I
    const/4 v1, 0x1

    shl-int v2, v1, v16

    and-int/2addr v2, v0

    if-eqz v2, :cond_0

    .line 366
    move/from16 v18, v13

    goto :goto_1

    .line 368
    :cond_0
    shl-int v1, v1, v16

    or-int/2addr v0, v1

    .line 370
    new-instance v1, Lorg/libsdl/app/HIDDeviceUSB;

    invoke-direct {v1, v15, v14, v13}, Lorg/libsdl/app/HIDDeviceUSB;-><init>(Lorg/libsdl/app/HIDDeviceManager;Landroid/hardware/usb/UsbDevice;I)V

    move-object v11, v1

    .line 371
    .local v11, "device":Lorg/libsdl/app/HIDDeviceUSB;
    invoke-virtual {v11}, Lorg/libsdl/app/HIDDeviceUSB;->getId()I

    move-result v2

    .line 372
    .local v2, "id":I
    iget-object v1, v15, Lorg/libsdl/app/HIDDeviceManager;->mDevicesById:Ljava/util/HashMap;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 373
    invoke-virtual {v11}, Lorg/libsdl/app/HIDDeviceUSB;->getIdentifier()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11}, Lorg/libsdl/app/HIDDeviceUSB;->getVendorId()I

    move-result v4

    invoke-virtual {v11}, Lorg/libsdl/app/HIDDeviceUSB;->getProductId()I

    move-result v5

    invoke-virtual {v11}, Lorg/libsdl/app/HIDDeviceUSB;->getSerialNumber()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v11}, Lorg/libsdl/app/HIDDeviceUSB;->getVersion()I

    move-result v7

    invoke-virtual {v11}, Lorg/libsdl/app/HIDDeviceUSB;->getManufacturerName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v11}, Lorg/libsdl/app/HIDDeviceUSB;->getProductName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v12}, Landroid/hardware/usb/UsbInterface;->getId()I

    move-result v10

    invoke-virtual {v12}, Landroid/hardware/usb/UsbInterface;->getInterfaceClass()I

    move-result v17

    invoke-virtual {v12}, Landroid/hardware/usb/UsbInterface;->getInterfaceSubclass()I

    move-result v18

    invoke-virtual {v12}, Landroid/hardware/usb/UsbInterface;->getInterfaceProtocol()I

    move-result v19

    const/16 v20, 0x0

    const/16 v21, 0x0

    move-object/from16 v1, p0

    move-object/from16 v22, v11

    .end local v11    # "device":Lorg/libsdl/app/HIDDeviceUSB;
    .local v22, "device":Lorg/libsdl/app/HIDDeviceUSB;
    move/from16 v11, v17

    move-object/from16 v17, v12

    .end local v12    # "usbInterface":Landroid/hardware/usb/UsbInterface;
    .local v17, "usbInterface":Landroid/hardware/usb/UsbInterface;
    move/from16 v12, v18

    move/from16 v18, v13

    .end local v13    # "interface_index":I
    .local v18, "interface_index":I
    move/from16 v13, v19

    move/from16 v14, v20

    move/from16 v15, v21

    invoke-virtual/range {v1 .. v15}, Lorg/libsdl/app/HIDDeviceManager;->HIDDeviceConnected(ILjava/lang/String;IILjava/lang/String;ILjava/lang/String;Ljava/lang/String;IIIIZI)V

    goto :goto_1

    .line 361
    .end local v2    # "id":I
    .end local v16    # "interface_id":I
    .end local v17    # "usbInterface":Landroid/hardware/usb/UsbInterface;
    .end local v18    # "interface_index":I
    .end local v22    # "device":Lorg/libsdl/app/HIDDeviceUSB;
    .restart local v12    # "usbInterface":Landroid/hardware/usb/UsbInterface;
    .restart local v13    # "interface_index":I
    :cond_1
    move-object/from16 v17, v12

    move/from16 v18, v13

    .line 359
    .end local v12    # "usbInterface":Landroid/hardware/usb/UsbInterface;
    .end local v13    # "interface_index":I
    .restart local v18    # "interface_index":I
    :goto_1
    add-int/lit8 v13, v18, 0x1

    move-object/from16 v15, p0

    move-object/from16 v14, p1

    .end local v18    # "interface_index":I
    .restart local v13    # "interface_index":I
    goto/16 :goto_0

    :cond_2
    move/from16 v18, v13

    .line 376
    .end local v0    # "interface_mask":I
    .end local v13    # "interface_index":I
    monitor-exit p0

    .line 377
    return-void

    .line 376
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private getDevice(I)Lorg/libsdl/app/HIDDevice;
    .locals 4
    .param p1, "id"    # I

    .line 577
    monitor-enter p0

    .line 578
    :try_start_0
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mDevicesById:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/libsdl/app/HIDDevice;

    .line 579
    .local v0, "result":Lorg/libsdl/app/HIDDevice;
    if-nez v0, :cond_0

    .line 580
    const-string v1, "hidapi"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No device for id: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 581
    const-string v1, "hidapi"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Available devices: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/libsdl/app/HIDDeviceManager;->mDevicesById:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 583
    :cond_0
    monitor-exit p0

    return-object v0

    .line 584
    .end local v0    # "result":Lorg/libsdl/app/HIDDevice;
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private handleUsbDeviceAttached(Landroid/hardware/usb/UsbDevice;)V
    .locals 0
    .param p1, "usbDevice"    # Landroid/hardware/usb/UsbDevice;

    .line 326
    invoke-direct {p0, p1}, Lorg/libsdl/app/HIDDeviceManager;->connectHIDDeviceUSB(Landroid/hardware/usb/UsbDevice;)V

    .line 327
    return-void
.end method

.method private handleUsbDeviceDetached(Landroid/hardware/usb/UsbDevice;)V
    .locals 6
    .param p1, "usbDevice"    # Landroid/hardware/usb/UsbDevice;

    .line 330
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 331
    .local v0, "devices":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceManager;->mDevicesById:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/libsdl/app/HIDDevice;

    .line 332
    .local v2, "device":Lorg/libsdl/app/HIDDevice;
    invoke-interface {v2}, Lorg/libsdl/app/HIDDevice;->getDevice()Landroid/hardware/usb/UsbDevice;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroid/hardware/usb/UsbDevice;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 333
    invoke-interface {v2}, Lorg/libsdl/app/HIDDevice;->getId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 335
    .end local v2    # "device":Lorg/libsdl/app/HIDDevice;
    :cond_0
    goto :goto_0

    .line 336
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 337
    .local v2, "id":I
    iget-object v3, p0, Lorg/libsdl/app/HIDDeviceManager;->mDevicesById:Ljava/util/HashMap;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/libsdl/app/HIDDevice;

    .line 338
    .local v3, "device":Lorg/libsdl/app/HIDDevice;
    iget-object v4, p0, Lorg/libsdl/app/HIDDeviceManager;->mDevicesById:Ljava/util/HashMap;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    invoke-interface {v3}, Lorg/libsdl/app/HIDDevice;->shutdown()V

    .line 340
    invoke-virtual {p0, v2}, Lorg/libsdl/app/HIDDeviceManager;->HIDDeviceDisconnected(I)V

    .line 341
    .end local v2    # "id":I
    .end local v3    # "device":Lorg/libsdl/app/HIDDevice;
    goto :goto_1

    .line 342
    :cond_2
    return-void
.end method

.method private handleUsbDevicePermission(Landroid/hardware/usb/UsbDevice;Z)V
    .locals 4
    .param p1, "usbDevice"    # Landroid/hardware/usb/UsbDevice;
    .param p2, "permission_granted"    # Z

    .line 345
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mDevicesById:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/libsdl/app/HIDDevice;

    .line 346
    .local v1, "device":Lorg/libsdl/app/HIDDevice;
    invoke-interface {v1}, Lorg/libsdl/app/HIDDevice;->getDevice()Landroid/hardware/usb/UsbDevice;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/hardware/usb/UsbDevice;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 347
    const/4 v2, 0x0

    .line 348
    .local v2, "opened":Z
    if-eqz p2, :cond_0

    .line 349
    invoke-interface {v1}, Lorg/libsdl/app/HIDDevice;->open()Z

    move-result v2

    .line 351
    :cond_0
    invoke-interface {v1}, Lorg/libsdl/app/HIDDevice;->getId()I

    move-result v3

    invoke-virtual {p0, v3, v2}, Lorg/libsdl/app/HIDDeviceManager;->HIDDeviceOpenResult(IZ)V

    .line 353
    .end local v1    # "device":Lorg/libsdl/app/HIDDevice;
    .end local v2    # "opened":Z
    :cond_1
    goto :goto_0

    .line 354
    :cond_2
    return-void
.end method

.method private initializeBluetooth()V
    .locals 6

    .line 380
    const-string v0, "Initializing Bluetooth"

    const-string v1, "hidapi"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 382
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1f

    if-lt v0, v2, :cond_0

    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mContext:Landroid/content/Context;

    .line 383
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object v2, p0, Lorg/libsdl/app/HIDDeviceManager;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "android.permission.BLUETOOTH_CONNECT"

    invoke-virtual {v0, v3, v2}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 384
    const-string v0, "Couldn\'t initialize Bluetooth, missing android.permission.BLUETOOTH_CONNECT"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 385
    return-void

    .line 388
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-gt v0, v2, :cond_1

    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mContext:Landroid/content/Context;

    .line 389
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object v2, p0, Lorg/libsdl/app/HIDDeviceManager;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "android.permission.BLUETOOTH"

    invoke-virtual {v0, v3, v2}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_1

    .line 390
    const-string v0, "Couldn\'t initialize Bluetooth, missing android.permission.BLUETOOTH"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 391
    return-void

    .line 394
    :cond_1
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v2, "android.hardware.bluetooth_le"

    invoke-virtual {v0, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 395
    const-string v0, "Couldn\'t initialize Bluetooth, this version of Android does not support Bluetooth LE"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 396
    return-void

    .line 400
    :cond_2
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mContext:Landroid/content/Context;

    const-string v2, "bluetooth"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothManager;

    iput-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mBluetoothManager:Landroid/bluetooth/BluetoothManager;

    .line 401
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mBluetoothManager:Landroid/bluetooth/BluetoothManager;

    if-nez v0, :cond_3

    .line 403
    return-void

    .line 406
    :cond_3
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mBluetoothManager:Landroid/bluetooth/BluetoothManager;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothManager;->getAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    .line 407
    .local v0, "btAdapter":Landroid/bluetooth/BluetoothAdapter;
    if-nez v0, :cond_4

    .line 409
    return-void

    .line 413
    :cond_4
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->getBondedDevices()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/bluetooth/BluetoothDevice;

    .line 415
    .local v3, "device":Landroid/bluetooth/BluetoothDevice;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Bluetooth device available: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 416
    invoke-virtual {p0, v3}, Lorg/libsdl/app/HIDDeviceManager;->isSteamController(Landroid/bluetooth/BluetoothDevice;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 417
    invoke-virtual {p0, v3}, Lorg/libsdl/app/HIDDeviceManager;->connectBluetoothDevice(Landroid/bluetooth/BluetoothDevice;)Z

    .line 420
    .end local v3    # "device":Landroid/bluetooth/BluetoothDevice;
    :cond_5
    goto :goto_0

    .line 423
    :cond_6
    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 424
    .local v1, "filter":Landroid/content/IntentFilter;
    const-string v2, "android.bluetooth.device.action.ACL_CONNECTED"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 425
    const-string v2, "android.bluetooth.device.action.ACL_DISCONNECTED"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 426
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x21

    if-lt v2, v3, :cond_7

    .line 427
    iget-object v2, p0, Lorg/libsdl/app/HIDDeviceManager;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lorg/libsdl/app/HIDDeviceManager;->mBluetoothBroadcast:Landroid/content/BroadcastReceiver;

    const/4 v4, 0x2

    invoke-virtual {v2, v3, v1, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    goto :goto_1

    .line 429
    :cond_7
    iget-object v2, p0, Lorg/libsdl/app/HIDDeviceManager;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lorg/libsdl/app/HIDDeviceManager;->mBluetoothBroadcast:Landroid/content/BroadcastReceiver;

    invoke-virtual {v2, v3, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 432
    :goto_1
    iget-boolean v2, p0, Lorg/libsdl/app/HIDDeviceManager;->mIsChromebook:Z

    if-eqz v2, :cond_8

    .line 433
    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v2, p0, Lorg/libsdl/app/HIDDeviceManager;->mHandler:Landroid/os/Handler;

    .line 434
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lorg/libsdl/app/HIDDeviceManager;->mLastBluetoothDevices:Ljava/util/List;

    .line 444
    :cond_8
    return-void
.end method

.method private initializeUSB()V
    .locals 4

    .line 143
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mContext:Landroid/content/Context;

    const-string v1, "usb"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/usb/UsbManager;

    iput-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mUsbManager:Landroid/hardware/usb/UsbManager;

    .line 144
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mUsbManager:Landroid/hardware/usb/UsbManager;

    if-nez v0, :cond_0

    .line 145
    return-void

    .line 192
    :cond_0
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 193
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v1, "android.hardware.usb.action.USB_DEVICE_ATTACHED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 194
    const-string v1, "android.hardware.usb.action.USB_DEVICE_DETACHED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 195
    const-string v1, "org.libsdl.app.USB_PERMISSION"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 196
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x21

    if-lt v1, v2, :cond_1

    .line 197
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lorg/libsdl/app/HIDDeviceManager;->mUsbBroadcast:Landroid/content/BroadcastReceiver;

    const/4 v3, 0x2

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    goto :goto_0

    .line 199
    :cond_1
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lorg/libsdl/app/HIDDeviceManager;->mUsbBroadcast:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 202
    :goto_0
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceManager;->mUsbManager:Landroid/hardware/usb/UsbManager;

    invoke-virtual {v1}, Landroid/hardware/usb/UsbManager;->getDeviceList()Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/usb/UsbDevice;

    .line 203
    .local v2, "usbDevice":Landroid/hardware/usb/UsbDevice;
    invoke-direct {p0, v2}, Lorg/libsdl/app/HIDDeviceManager;->handleUsbDeviceAttached(Landroid/hardware/usb/UsbDevice;)V

    .line 204
    .end local v2    # "usbDevice":Landroid/hardware/usb/UsbDevice;
    goto :goto_1

    .line 205
    :cond_2
    return-void
.end method

.method private isHIDDeviceInterface(Landroid/hardware/usb/UsbDevice;Landroid/hardware/usb/UsbInterface;)Z
    .locals 3
    .param p1, "usbDevice"    # Landroid/hardware/usb/UsbDevice;
    .param p2, "usbInterface"    # Landroid/hardware/usb/UsbInterface;

    .line 220
    invoke-virtual {p2}, Landroid/hardware/usb/UsbInterface;->getInterfaceClass()I

    move-result v0

    const/4 v1, 0x3

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    .line 221
    return v2

    .line 223
    :cond_0
    invoke-direct {p0, p1, p2}, Lorg/libsdl/app/HIDDeviceManager;->isXbox360Controller(Landroid/hardware/usb/UsbDevice;Landroid/hardware/usb/UsbInterface;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-direct {p0, p1, p2}, Lorg/libsdl/app/HIDDeviceManager;->isXboxOneController(Landroid/hardware/usb/UsbDevice;Landroid/hardware/usb/UsbInterface;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 226
    :cond_1
    const/4 v0, 0x0

    return v0

    .line 224
    :cond_2
    :goto_0
    return v2
.end method

.method private isXbox360Controller(Landroid/hardware/usb/UsbDevice;Landroid/hardware/usb/UsbInterface;)Z
    .locals 10
    .param p1, "usbDevice"    # Landroid/hardware/usb/UsbDevice;
    .param p2, "usbInterface"    # Landroid/hardware/usb/UsbInterface;

    .line 230
    const/16 v0, 0x5d

    .line 231
    .local v0, "XB360_IFACE_SUBCLASS":I
    const/4 v1, 0x1

    .line 232
    .local v1, "XB360_IFACE_PROTOCOL":I
    const/16 v2, 0x81

    .line 233
    .local v2, "XB360W_IFACE_PROTOCOL":I
    const/16 v3, 0x21

    new-array v3, v3, [I

    fill-array-data v3, :array_0

    .line 269
    .local v3, "SUPPORTED_VENDORS":[I
    invoke-virtual {p2}, Landroid/hardware/usb/UsbInterface;->getInterfaceClass()I

    move-result v4

    const/16 v5, 0xff

    const/4 v6, 0x0

    if-ne v4, v5, :cond_2

    .line 270
    invoke-virtual {p2}, Landroid/hardware/usb/UsbInterface;->getInterfaceSubclass()I

    move-result v4

    const/16 v5, 0x5d

    if-ne v4, v5, :cond_2

    .line 271
    invoke-virtual {p2}, Landroid/hardware/usb/UsbInterface;->getInterfaceProtocol()I

    move-result v4

    const/4 v5, 0x1

    if-eq v4, v5, :cond_0

    .line 272
    invoke-virtual {p2}, Landroid/hardware/usb/UsbInterface;->getInterfaceProtocol()I

    move-result v4

    const/16 v7, 0x81

    if-ne v4, v7, :cond_2

    .line 273
    :cond_0
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getVendorId()I

    move-result v4

    .line 274
    .local v4, "vendor_id":I
    array-length v7, v3

    move v8, v6

    :goto_0
    if-ge v8, v7, :cond_2

    aget v9, v3, v8

    .line 275
    .local v9, "supportedVid":I
    if-ne v4, v9, :cond_1

    .line 276
    return v5

    .line 274
    .end local v9    # "supportedVid":I
    :cond_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 280
    .end local v4    # "vendor_id":I
    :cond_2
    return v6

    nop

    :array_0
    .array-data 4
        0x79
        0x351
        0x44f
        0x45e
        0x46d
        0x56e
        0x6a3
        0x738
        0x7ff
        0xe6f
        0xf0d
        0x1038
        0x10f5
        0x11c9
        0x1209
        0x12ab
        0x1430
        0x146b
        0x1532
        0x15e4
        0x162e
        0x1689
        0x1949
        0x1bad
        0x20d6
        0x24c6
        0x2c22
        0x2dc8
        0x3537
        0x3651
        0x37d7
        0x3958
        0x9886
    .end array-data
.end method

.method private isXboxOneController(Landroid/hardware/usb/UsbDevice;Landroid/hardware/usb/UsbInterface;)Z
    .locals 8
    .param p1, "usbDevice"    # Landroid/hardware/usb/UsbDevice;
    .param p2, "usbInterface"    # Landroid/hardware/usb/UsbInterface;

    .line 284
    const/16 v0, 0x47

    .line 285
    .local v0, "XB1_IFACE_SUBCLASS":I
    const/16 v1, 0xd0

    .line 286
    .local v1, "XB1_IFACE_PROTOCOL":I
    const/16 v2, 0x16

    new-array v2, v2, [I

    fill-array-data v2, :array_0

    .line 311
    .local v2, "SUPPORTED_VENDORS":[I
    invoke-virtual {p2}, Landroid/hardware/usb/UsbInterface;->getId()I

    move-result v3

    const/4 v4, 0x0

    if-nez v3, :cond_1

    .line 312
    invoke-virtual {p2}, Landroid/hardware/usb/UsbInterface;->getInterfaceClass()I

    move-result v3

    const/16 v5, 0xff

    if-ne v3, v5, :cond_1

    .line 313
    invoke-virtual {p2}, Landroid/hardware/usb/UsbInterface;->getInterfaceSubclass()I

    move-result v3

    const/16 v5, 0x47

    if-ne v3, v5, :cond_1

    .line 314
    invoke-virtual {p2}, Landroid/hardware/usb/UsbInterface;->getInterfaceProtocol()I

    move-result v3

    const/16 v5, 0xd0

    if-ne v3, v5, :cond_1

    .line 315
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getVendorId()I

    move-result v3

    .line 316
    .local v3, "vendor_id":I
    array-length v5, v2

    move v6, v4

    :goto_0
    if-ge v6, v5, :cond_1

    aget v7, v2, v6

    .line 317
    .local v7, "supportedVid":I
    if-ne v3, v7, :cond_0

    .line 318
    const/4 v4, 0x1

    return v4

    .line 316
    .end local v7    # "supportedVid":I
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 322
    .end local v3    # "vendor_id":I
    :cond_1
    return v4

    :array_0
    .array-data 4
        0x351
        0x3f0
        0x44f
        0x45e
        0x738
        0xb05
        0xe6f
        0xf0d
        0x10f5
        0x1209
        0x1532
        0x20d6
        0x24c6
        0x294b
        0x2dc8
        0x2e24
        0x2e95
        0x3285
        0x3537
        0x3651
        0x366c
        0x3958
    .end array-data
.end method

.method public static release(Lorg/libsdl/app/HIDDeviceManager;)V
    .locals 1
    .param p0, "manager"    # Lorg/libsdl/app/HIDDeviceManager;

    .line 44
    sget-object v0, Lorg/libsdl/app/HIDDeviceManager;->sManager:Lorg/libsdl/app/HIDDeviceManager;

    if-ne p0, v0, :cond_0

    .line 45
    sget v0, Lorg/libsdl/app/HIDDeviceManager;->sManagerRefCount:I

    add-int/lit8 v0, v0, -0x1

    sput v0, Lorg/libsdl/app/HIDDeviceManager;->sManagerRefCount:I

    .line 46
    sget v0, Lorg/libsdl/app/HIDDeviceManager;->sManagerRefCount:I

    if-nez v0, :cond_0

    .line 47
    sget-object v0, Lorg/libsdl/app/HIDDeviceManager;->sManager:Lorg/libsdl/app/HIDDeviceManager;

    invoke-direct {v0}, Lorg/libsdl/app/HIDDeviceManager;->close()V

    .line 48
    const/4 v0, 0x0

    sput-object v0, Lorg/libsdl/app/HIDDeviceManager;->sManager:Lorg/libsdl/app/HIDDeviceManager;

    .line 51
    :cond_0
    return-void
.end method

.method private shutdownBluetooth()V
    .locals 2

    .line 448
    :try_start_0
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceManager;->mBluetoothBroadcast:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 451
    goto :goto_0

    .line 449
    :catch_0
    move-exception v0

    .line 452
    :goto_0
    return-void
.end method

.method private shutdownUSB()V
    .locals 2

    .line 213
    :try_start_0
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceManager;->mUsbBroadcast:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 216
    goto :goto_0

    .line 214
    :catch_0
    move-exception v0

    .line 217
    :goto_0
    return-void
.end method


# virtual methods
.method native HIDDeviceConnected(ILjava/lang/String;IILjava/lang/String;ILjava/lang/String;Ljava/lang/String;IIIIZI)V
.end method

.method native HIDDeviceDisconnected(I)V
.end method

.method native HIDDeviceInputReport(I[B)V
.end method

.method native HIDDeviceOpenPending(I)V
.end method

.method native HIDDeviceOpenResult(IZ)V
.end method

.method native HIDDeviceReportResponse(I[B)V
.end method

.method chromebookConnectionHandler()V
    .locals 8

    .line 458
    iget-boolean v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mIsChromebook:Z

    if-nez v0, :cond_0

    .line 459
    return-void

    .line 462
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 463
    .local v0, "disconnected":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/bluetooth/BluetoothDevice;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 465
    .local v1, "connected":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/bluetooth/BluetoothDevice;>;"
    iget-object v2, p0, Lorg/libsdl/app/HIDDeviceManager;->mBluetoothManager:Landroid/bluetooth/BluetoothManager;

    const/4 v3, 0x7

    invoke-virtual {v2, v3}, Landroid/bluetooth/BluetoothManager;->getConnectedDevices(I)Ljava/util/List;

    move-result-object v2

    .line 467
    .local v2, "currentConnected":Ljava/util/List;, "Ljava/util/List<Landroid/bluetooth/BluetoothDevice;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/bluetooth/BluetoothDevice;

    .line 468
    .local v4, "bluetoothDevice":Landroid/bluetooth/BluetoothDevice;
    iget-object v5, p0, Lorg/libsdl/app/HIDDeviceManager;->mLastBluetoothDevices:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 469
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 471
    .end local v4    # "bluetoothDevice":Landroid/bluetooth/BluetoothDevice;
    :cond_1
    goto :goto_0

    .line 472
    :cond_2
    iget-object v3, p0, Lorg/libsdl/app/HIDDeviceManager;->mLastBluetoothDevices:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/bluetooth/BluetoothDevice;

    .line 473
    .restart local v4    # "bluetoothDevice":Landroid/bluetooth/BluetoothDevice;
    invoke-interface {v2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 474
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 476
    .end local v4    # "bluetoothDevice":Landroid/bluetooth/BluetoothDevice;
    :cond_3
    goto :goto_1

    .line 478
    :cond_4
    iput-object v2, p0, Lorg/libsdl/app/HIDDeviceManager;->mLastBluetoothDevices:Ljava/util/List;

    .line 480
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/bluetooth/BluetoothDevice;

    .line 481
    .restart local v4    # "bluetoothDevice":Landroid/bluetooth/BluetoothDevice;
    invoke-virtual {p0, v4}, Lorg/libsdl/app/HIDDeviceManager;->disconnectBluetoothDevice(Landroid/bluetooth/BluetoothDevice;)V

    .line 482
    .end local v4    # "bluetoothDevice":Landroid/bluetooth/BluetoothDevice;
    goto :goto_2

    .line 483
    :cond_5
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/bluetooth/BluetoothDevice;

    .line 484
    .restart local v4    # "bluetoothDevice":Landroid/bluetooth/BluetoothDevice;
    invoke-virtual {p0, v4}, Lorg/libsdl/app/HIDDeviceManager;->connectBluetoothDevice(Landroid/bluetooth/BluetoothDevice;)Z

    .line 485
    .end local v4    # "bluetoothDevice":Landroid/bluetooth/BluetoothDevice;
    goto :goto_3

    .line 487
    :cond_6
    move-object v3, p0

    .line 488
    .local v3, "finalThis":Lorg/libsdl/app/HIDDeviceManager;
    iget-object v4, p0, Lorg/libsdl/app/HIDDeviceManager;->mHandler:Landroid/os/Handler;

    new-instance v5, Lorg/libsdl/app/HIDDeviceManager$3;

    invoke-direct {v5, p0, v3}, Lorg/libsdl/app/HIDDeviceManager$3;-><init>(Lorg/libsdl/app/HIDDeviceManager;Lorg/libsdl/app/HIDDeviceManager;)V

    const-wide/16 v6, 0x2710

    invoke-virtual {v4, v5, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 494
    return-void
.end method

.method closeDevice(I)V
    .locals 4
    .param p1, "deviceID"    # I

    .line 678
    const-string v0, "hidapi"

    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "closeDevice deviceID="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 680
    invoke-direct {p0, p1}, Lorg/libsdl/app/HIDDeviceManager;->getDevice(I)Lorg/libsdl/app/HIDDevice;

    move-result-object v1

    .line 681
    .local v1, "device":Lorg/libsdl/app/HIDDevice;
    if-nez v1, :cond_0

    .line 682
    invoke-virtual {p0, p1}, Lorg/libsdl/app/HIDDeviceManager;->HIDDeviceDisconnected(I)V

    .line 683
    return-void

    .line 686
    :cond_0
    invoke-interface {v1}, Lorg/libsdl/app/HIDDevice;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 689
    .end local v1    # "device":Lorg/libsdl/app/HIDDevice;
    goto :goto_0

    .line 687
    :catch_0
    move-exception v1

    .line 688
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Got exception: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 690
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method connectBluetoothDevice(Landroid/bluetooth/BluetoothDevice;)Z
    .locals 4
    .param p1, "bluetoothDevice"    # Landroid/bluetooth/BluetoothDevice;

    .line 497
    const-string v0, "hidapi"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "connectBluetoothDevice device="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 498
    monitor-enter p0

    .line 499
    :try_start_0
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mBluetoothDevices:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 500
    const-string v0, "hidapi"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Steam controller with address "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " already exists, attempting reconnect"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 502
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mBluetoothDevices:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/libsdl/app/HIDDeviceBLESteamController;

    .line 503
    .local v0, "device":Lorg/libsdl/app/HIDDeviceBLESteamController;
    invoke-virtual {v0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->reconnect()V

    .line 505
    monitor-exit p0

    const/4 v1, 0x0

    return v1

    .line 507
    .end local v0    # "device":Lorg/libsdl/app/HIDDeviceBLESteamController;
    :cond_0
    new-instance v0, Lorg/libsdl/app/HIDDeviceBLESteamController;

    invoke-direct {v0, p0, p1}, Lorg/libsdl/app/HIDDeviceBLESteamController;-><init>(Lorg/libsdl/app/HIDDeviceManager;Landroid/bluetooth/BluetoothDevice;)V

    .line 508
    .restart local v0    # "device":Lorg/libsdl/app/HIDDeviceBLESteamController;
    invoke-virtual {v0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getId()I

    move-result v1

    .line 509
    .local v1, "id":I
    iget-object v2, p0, Lorg/libsdl/app/HIDDeviceManager;->mBluetoothDevices:Ljava/util/HashMap;

    invoke-virtual {v2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 510
    iget-object v2, p0, Lorg/libsdl/app/HIDDeviceManager;->mDevicesById:Ljava/util/HashMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 513
    nop

    .end local v0    # "device":Lorg/libsdl/app/HIDDeviceBLESteamController;
    .end local v1    # "id":I
    monitor-exit p0

    .line 514
    const/4 v0, 0x1

    return v0

    .line 513
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method disconnectBluetoothDevice(Landroid/bluetooth/BluetoothDevice;)V
    .locals 4
    .param p1, "bluetoothDevice"    # Landroid/bluetooth/BluetoothDevice;

    .line 518
    monitor-enter p0

    .line 519
    :try_start_0
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mBluetoothDevices:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/libsdl/app/HIDDeviceBLESteamController;

    .line 520
    .local v0, "device":Lorg/libsdl/app/HIDDeviceBLESteamController;
    if-nez v0, :cond_0

    .line 521
    monitor-exit p0

    return-void

    .line 523
    :cond_0
    invoke-virtual {v0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->getId()I

    move-result v1

    .line 524
    .local v1, "id":I
    iget-object v2, p0, Lorg/libsdl/app/HIDDeviceManager;->mBluetoothDevices:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 525
    iget-object v2, p0, Lorg/libsdl/app/HIDDeviceManager;->mDevicesById:Ljava/util/HashMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 526
    invoke-virtual {v0}, Lorg/libsdl/app/HIDDeviceBLESteamController;->shutdown()V

    .line 527
    invoke-virtual {p0, v1}, Lorg/libsdl/app/HIDDeviceManager;->HIDDeviceDisconnected(I)V

    .line 528
    .end local v0    # "device":Lorg/libsdl/app/HIDDeviceBLESteamController;
    .end local v1    # "id":I
    monitor-exit p0

    .line 529
    return-void

    .line 528
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method getContext()Landroid/content/Context;
    .locals 1

    .line 125
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method getDeviceIDForIdentifier(Ljava/lang/String;)I
    .locals 4
    .param p1, "identifier"    # Ljava/lang/String;

    .line 129
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mSharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 131
    .local v0, "spedit":Landroid/content/SharedPreferences$Editor;
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceManager;->mSharedPreferences:Landroid/content/SharedPreferences;

    const/4 v2, 0x0

    invoke-interface {v1, p1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 132
    .local v1, "result":I
    if-nez v1, :cond_0

    .line 133
    iget v2, p0, Lorg/libsdl/app/HIDDeviceManager;->mNextDeviceId:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/libsdl/app/HIDDeviceManager;->mNextDeviceId:I

    move v1, v2

    .line 134
    const-string v2, "next_device_id"

    iget v3, p0, Lorg/libsdl/app/HIDDeviceManager;->mNextDeviceId:I

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 137
    :cond_0
    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 138
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 139
    return v1
.end method

.method getUSBManager()Landroid/hardware/usb/UsbManager;
    .locals 1

    .line 208
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mUsbManager:Landroid/hardware/usb/UsbManager;

    return-object v0
.end method

.method initialize(ZZ)Z
    .locals 2
    .param p1, "usb"    # Z
    .param p2, "bluetooth"    # Z

    .line 592
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "initialize("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "hidapi"

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 594
    if-eqz p1, :cond_0

    .line 595
    invoke-direct {p0}, Lorg/libsdl/app/HIDDeviceManager;->initializeUSB()V

    .line 597
    :cond_0
    if-eqz p2, :cond_1

    .line 598
    invoke-direct {p0}, Lorg/libsdl/app/HIDDeviceManager;->initializeBluetooth()V

    .line 600
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method isSteamController(Landroid/bluetooth/BluetoothDevice;)Z
    .locals 3
    .param p1, "bluetoothDevice"    # Landroid/bluetooth/BluetoothDevice;

    .line 533
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 534
    return v0

    .line 538
    :cond_0
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    .line 539
    return v0

    .line 543
    :cond_1
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getType()I

    move-result v1

    and-int/lit8 v1, v1, 0x2

    if-nez v1, :cond_2

    .line 544
    return v0

    .line 548
    :cond_2
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "SteamController"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Steam Ctrl"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    :cond_3
    const/4 v0, 0x1

    :cond_4
    return v0
.end method

.method openDevice(I)Z
    .locals 9
    .param p1, "deviceID"    # I

    .line 604
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "openDevice deviceID="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "hidapi"

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 605
    invoke-direct {p0, p1}, Lorg/libsdl/app/HIDDeviceManager;->getDevice(I)Lorg/libsdl/app/HIDDevice;

    move-result-object v0

    .line 606
    .local v0, "device":Lorg/libsdl/app/HIDDevice;
    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 607
    invoke-virtual {p0, p1}, Lorg/libsdl/app/HIDDeviceManager;->HIDDeviceDisconnected(I)V

    .line 608
    return v2

    .line 612
    :cond_0
    invoke-interface {v0}, Lorg/libsdl/app/HIDDevice;->getDevice()Landroid/hardware/usb/UsbDevice;

    move-result-object v3

    .line 613
    .local v3, "usbDevice":Landroid/hardware/usb/UsbDevice;
    if-eqz v3, :cond_2

    iget-object v4, p0, Lorg/libsdl/app/HIDDeviceManager;->mUsbManager:Landroid/hardware/usb/UsbManager;

    invoke-virtual {v4, v3}, Landroid/hardware/usb/UsbManager;->hasPermission(Landroid/hardware/usb/UsbDevice;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 614
    invoke-virtual {p0, p1}, Lorg/libsdl/app/HIDDeviceManager;->HIDDeviceOpenPending(I)V

    .line 616
    const/high16 v4, 0x2000000

    .line 618
    .local v4, "FLAG_MUTABLE":I
    :try_start_0
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x1f

    if-lt v5, v6, :cond_1

    .line 619
    const/high16 v5, 0x2000000

    .local v5, "flags":I
    goto :goto_0

    .line 621
    .end local v5    # "flags":I
    :cond_1
    const/4 v5, 0x0

    .line 624
    .restart local v5    # "flags":I
    :goto_0
    new-instance v6, Landroid/content/Intent;

    const-string v7, "org.libsdl.app.USB_PERMISSION"

    invoke-direct {v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 625
    .local v6, "intent":Landroid/content/Intent;
    iget-object v7, p0, Lorg/libsdl/app/HIDDeviceManager;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 626
    iget-object v7, p0, Lorg/libsdl/app/HIDDeviceManager;->mUsbManager:Landroid/hardware/usb/UsbManager;

    iget-object v8, p0, Lorg/libsdl/app/HIDDeviceManager;->mContext:Landroid/content/Context;

    invoke-static {v8, v2, v6, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v8

    invoke-virtual {v7, v3, v8}, Landroid/hardware/usb/UsbManager;->requestPermission(Landroid/hardware/usb/UsbDevice;Landroid/app/PendingIntent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 630
    .end local v4    # "FLAG_MUTABLE":I
    .end local v5    # "flags":I
    .end local v6    # "intent":Landroid/content/Intent;
    goto :goto_1

    .line 627
    :catch_0
    move-exception v4

    .line 628
    .local v4, "e":Ljava/lang/Exception;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Couldn\'t request permission for USB device "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 629
    invoke-virtual {p0, p1, v2}, Lorg/libsdl/app/HIDDeviceManager;->HIDDeviceOpenResult(IZ)V

    .line 631
    .end local v4    # "e":Ljava/lang/Exception;
    :goto_1
    return v2

    .line 635
    :cond_2
    :try_start_1
    invoke-interface {v0}, Lorg/libsdl/app/HIDDevice;->open()Z

    move-result v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    return v1

    .line 636
    :catch_1
    move-exception v4

    .line 637
    .restart local v4    # "e":Ljava/lang/Exception;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Got exception: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v4}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 639
    .end local v4    # "e":Ljava/lang/Exception;
    return v2
.end method

.method readReport(I[BZ)Z
    .locals 4
    .param p1, "deviceID"    # I
    .param p2, "report"    # [B
    .param p3, "feature"    # Z

    .line 663
    const/4 v0, 0x0

    :try_start_0
    invoke-direct {p0, p1}, Lorg/libsdl/app/HIDDeviceManager;->getDevice(I)Lorg/libsdl/app/HIDDevice;

    move-result-object v1

    .line 664
    .local v1, "device":Lorg/libsdl/app/HIDDevice;
    if-nez v1, :cond_0

    .line 665
    invoke-virtual {p0, p1}, Lorg/libsdl/app/HIDDeviceManager;->HIDDeviceDisconnected(I)V

    .line 666
    return v0

    .line 669
    :cond_0
    invoke-interface {v1, p2, p3}, Lorg/libsdl/app/HIDDevice;->readReport([BZ)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 670
    .end local v1    # "device":Lorg/libsdl/app/HIDDevice;
    :catch_0
    move-exception v1

    .line 671
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Got exception: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "hidapi"

    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 673
    .end local v1    # "e":Ljava/lang/Exception;
    return v0
.end method

.method public setFrozen(Z)V
    .locals 2
    .param p1, "frozen"    # Z

    .line 565
    monitor-enter p0

    .line 566
    :try_start_0
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceManager;->mDevicesById:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/libsdl/app/HIDDevice;

    .line 567
    .local v1, "device":Lorg/libsdl/app/HIDDevice;
    invoke-interface {v1, p1}, Lorg/libsdl/app/HIDDevice;->setFrozen(Z)V

    .line 568
    .end local v1    # "device":Lorg/libsdl/app/HIDDevice;
    goto :goto_0

    .line 569
    :cond_0
    monitor-exit p0

    .line 570
    return-void

    .line 569
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method writeReport(I[BZ)I
    .locals 4
    .param p1, "deviceID"    # I
    .param p2, "report"    # [B
    .param p3, "feature"    # Z

    .line 646
    const/4 v0, -0x1

    :try_start_0
    invoke-direct {p0, p1}, Lorg/libsdl/app/HIDDeviceManager;->getDevice(I)Lorg/libsdl/app/HIDDevice;

    move-result-object v1

    .line 647
    .local v1, "device":Lorg/libsdl/app/HIDDevice;
    if-nez v1, :cond_0

    .line 648
    invoke-virtual {p0, p1}, Lorg/libsdl/app/HIDDeviceManager;->HIDDeviceDisconnected(I)V

    .line 649
    return v0

    .line 652
    :cond_0
    invoke-interface {v1, p2, p3}, Lorg/libsdl/app/HIDDevice;->writeReport([BZ)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 653
    .end local v1    # "device":Lorg/libsdl/app/HIDDevice;
    :catch_0
    move-exception v1

    .line 654
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Got exception: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "hidapi"

    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 656
    .end local v1    # "e":Ljava/lang/Exception;
    return v0
.end method
