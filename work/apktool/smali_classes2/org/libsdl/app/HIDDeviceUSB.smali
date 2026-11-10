.class Lorg/libsdl/app/HIDDeviceUSB;
.super Ljava/lang/Object;
.source "HIDDeviceUSB.java"

# interfaces
.implements Lorg/libsdl/app/HIDDevice;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/libsdl/app/HIDDeviceUSB$InputThread;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "hidapi"


# instance fields
.field protected mClaimed:Z

.field protected mConnection:Landroid/hardware/usb/UsbDeviceConnection;

.field protected mDevice:Landroid/hardware/usb/UsbDevice;

.field protected mDeviceId:I

.field protected mFrozen:Z

.field protected mInputEndpoint:Landroid/hardware/usb/UsbEndpoint;

.field protected mInputThread:Lorg/libsdl/app/HIDDeviceUSB$InputThread;

.field protected mInterface:I

.field protected mInterfaceIndex:I

.field protected mManager:Lorg/libsdl/app/HIDDeviceManager;

.field protected mOutputEndpoint:Landroid/hardware/usb/UsbEndpoint;

.field protected mRunning:Z


# direct methods
.method public constructor <init>(Lorg/libsdl/app/HIDDeviceManager;Landroid/hardware/usb/UsbDevice;I)V
    .locals 2
    .param p1, "manager"    # Lorg/libsdl/app/HIDDeviceManager;
    .param p2, "usbDevice"    # Landroid/hardware/usb/UsbDevice;
    .param p3, "interface_index"    # I

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lorg/libsdl/app/HIDDeviceUSB;->mManager:Lorg/libsdl/app/HIDDeviceManager;

    .line 28
    iput-object p2, p0, Lorg/libsdl/app/HIDDeviceUSB;->mDevice:Landroid/hardware/usb/UsbDevice;

    .line 29
    iput p3, p0, Lorg/libsdl/app/HIDDeviceUSB;->mInterfaceIndex:I

    .line 30
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceUSB;->mDevice:Landroid/hardware/usb/UsbDevice;

    iget v1, p0, Lorg/libsdl/app/HIDDeviceUSB;->mInterfaceIndex:I

    invoke-virtual {v0, v1}, Landroid/hardware/usb/UsbDevice;->getInterface(I)Landroid/hardware/usb/UsbInterface;

    move-result-object v0

    invoke-virtual {v0}, Landroid/hardware/usb/UsbInterface;->getId()I

    move-result v0

    iput v0, p0, Lorg/libsdl/app/HIDDeviceUSB;->mInterface:I

    .line 31
    invoke-virtual {p0}, Lorg/libsdl/app/HIDDeviceUSB;->getIdentifier()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/libsdl/app/HIDDeviceManager;->getDeviceIDForIdentifier(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/libsdl/app/HIDDeviceUSB;->mDeviceId:I

    .line 32
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/libsdl/app/HIDDeviceUSB;->mRunning:Z

    .line 33
    iput-boolean v0, p0, Lorg/libsdl/app/HIDDeviceUSB;->mClaimed:Z

    .line 34
    return-void
.end method


# virtual methods
.method public close()V
    .locals 4

    .line 270
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/libsdl/app/HIDDeviceUSB;->mRunning:Z

    .line 271
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceUSB;->mInputThread:Lorg/libsdl/app/HIDDeviceUSB$InputThread;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 272
    :goto_0
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceUSB;->mInputThread:Lorg/libsdl/app/HIDDeviceUSB$InputThread;

    invoke-virtual {v1}, Lorg/libsdl/app/HIDDeviceUSB$InputThread;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 273
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceUSB;->mInputThread:Lorg/libsdl/app/HIDDeviceUSB$InputThread;

    invoke-virtual {v1}, Lorg/libsdl/app/HIDDeviceUSB$InputThread;->interrupt()V

    .line 275
    :try_start_0
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceUSB;->mInputThread:Lorg/libsdl/app/HIDDeviceUSB$InputThread;

    invoke-virtual {v1}, Lorg/libsdl/app/HIDDeviceUSB$InputThread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 276
    :catch_0
    move-exception v1

    .line 278
    :goto_1
    goto :goto_0

    .line 280
    :cond_0
    iput-object v2, p0, Lorg/libsdl/app/HIDDeviceUSB;->mInputThread:Lorg/libsdl/app/HIDDeviceUSB$InputThread;

    .line 282
    :cond_1
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceUSB;->mConnection:Landroid/hardware/usb/UsbDeviceConnection;

    if-eqz v1, :cond_3

    .line 283
    iget-boolean v1, p0, Lorg/libsdl/app/HIDDeviceUSB;->mClaimed:Z

    if-eqz v1, :cond_2

    .line 284
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceUSB;->mDevice:Landroid/hardware/usb/UsbDevice;

    iget v3, p0, Lorg/libsdl/app/HIDDeviceUSB;->mInterfaceIndex:I

    invoke-virtual {v1, v3}, Landroid/hardware/usb/UsbDevice;->getInterface(I)Landroid/hardware/usb/UsbInterface;

    move-result-object v1

    .line 285
    .local v1, "iface":Landroid/hardware/usb/UsbInterface;
    iget-object v3, p0, Lorg/libsdl/app/HIDDeviceUSB;->mConnection:Landroid/hardware/usb/UsbDeviceConnection;

    invoke-virtual {v3, v1}, Landroid/hardware/usb/UsbDeviceConnection;->releaseInterface(Landroid/hardware/usb/UsbInterface;)Z

    .line 287
    .end local v1    # "iface":Landroid/hardware/usb/UsbInterface;
    :cond_2
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceUSB;->mConnection:Landroid/hardware/usb/UsbDeviceConnection;

    invoke-virtual {v1}, Landroid/hardware/usb/UsbDeviceConnection;->close()V

    .line 288
    iput-object v2, p0, Lorg/libsdl/app/HIDDeviceUSB;->mConnection:Landroid/hardware/usb/UsbDeviceConnection;

    .line 289
    iput-boolean v0, p0, Lorg/libsdl/app/HIDDeviceUSB;->mClaimed:Z

    .line 291
    :cond_3
    return-void
.end method

.method public getDevice()Landroid/hardware/usb/UsbDevice;
    .locals 1

    .line 97
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceUSB;->mDevice:Landroid/hardware/usb/UsbDevice;

    return-object v0
.end method

.method getDeviceName()Ljava/lang/String;
    .locals 3

    .line 101
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/libsdl/app/HIDDeviceUSB;->getManufacturerName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/libsdl/app/HIDDeviceUSB;->getProductName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "(0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/libsdl/app/HIDDeviceUSB;->getVendorId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "%x"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/libsdl/app/HIDDeviceUSB;->getProductId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getId()I
    .locals 1

    .line 42
    iget v0, p0, Lorg/libsdl/app/HIDDeviceUSB;->mDeviceId:I

    return v0
.end method

.method getIdentifier()Ljava/lang/String;
    .locals 5

    .line 37
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceUSB;->mDevice:Landroid/hardware/usb/UsbDevice;

    invoke-virtual {v1}, Landroid/hardware/usb/UsbDevice;->getDeviceName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/libsdl/app/HIDDeviceUSB;->mDevice:Landroid/hardware/usb/UsbDevice;

    invoke-virtual {v2}, Landroid/hardware/usb/UsbDevice;->getVendorId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-object v3, p0, Lorg/libsdl/app/HIDDeviceUSB;->mDevice:Landroid/hardware/usb/UsbDevice;

    invoke-virtual {v3}, Landroid/hardware/usb/UsbDevice;->getProductId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget v4, p0, Lorg/libsdl/app/HIDDeviceUSB;->mInterfaceIndex:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v1, v2, v3, v4}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "%s/%x/%x/%d"

    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getManufacturerName()Ljava/lang/String;
    .locals 3

    .line 78
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceUSB;->mDevice:Landroid/hardware/usb/UsbDevice;

    invoke-virtual {v0}, Landroid/hardware/usb/UsbDevice;->getManufacturerName()Ljava/lang/String;

    move-result-object v0

    .line 79
    .local v0, "result":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 80
    invoke-virtual {p0}, Lorg/libsdl/app/HIDDeviceUSB;->getVendorId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "%x"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 82
    :cond_0
    return-object v0
.end method

.method public getProductId()I
    .locals 1

    .line 52
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceUSB;->mDevice:Landroid/hardware/usb/UsbDevice;

    invoke-virtual {v0}, Landroid/hardware/usb/UsbDevice;->getProductId()I

    move-result v0

    return v0
.end method

.method public getProductName()Ljava/lang/String;
    .locals 3

    .line 88
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceUSB;->mDevice:Landroid/hardware/usb/UsbDevice;

    invoke-virtual {v0}, Landroid/hardware/usb/UsbDevice;->getProductName()Ljava/lang/String;

    move-result-object v0

    .line 89
    .local v0, "result":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 90
    invoke-virtual {p0}, Lorg/libsdl/app/HIDDeviceUSB;->getProductId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "%x"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 92
    :cond_0
    return-object v0
.end method

.method public getSerialNumber()Ljava/lang/String;
    .locals 2

    .line 57
    const/4 v0, 0x0

    .line 59
    .local v0, "result":Ljava/lang/String;
    :try_start_0
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceUSB;->mDevice:Landroid/hardware/usb/UsbDevice;

    invoke-virtual {v1}, Landroid/hardware/usb/UsbDevice;->getSerialNumber()Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 63
    goto :goto_0

    .line 61
    :catch_0
    move-exception v1

    .line 64
    :goto_0
    if-nez v0, :cond_0

    .line 65
    const-string v0, ""

    .line 67
    :cond_0
    return-object v0
.end method

.method public getVendorId()I
    .locals 1

    .line 47
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceUSB;->mDevice:Landroid/hardware/usb/UsbDevice;

    invoke-virtual {v0}, Landroid/hardware/usb/UsbDevice;->getVendorId()I

    move-result v0

    return v0
.end method

.method public getVersion()I
    .locals 1

    .line 72
    const/4 v0, 0x0

    return v0
.end method

.method public open()Z
    .locals 7

    .line 106
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceUSB;->mManager:Lorg/libsdl/app/HIDDeviceManager;

    invoke-virtual {v0}, Lorg/libsdl/app/HIDDeviceManager;->getUSBManager()Landroid/hardware/usb/UsbManager;

    move-result-object v0

    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceUSB;->mDevice:Landroid/hardware/usb/UsbDevice;

    invoke-virtual {v0, v1}, Landroid/hardware/usb/UsbManager;->openDevice(Landroid/hardware/usb/UsbDevice;)Landroid/hardware/usb/UsbDeviceConnection;

    move-result-object v0

    iput-object v0, p0, Lorg/libsdl/app/HIDDeviceUSB;->mConnection:Landroid/hardware/usb/UsbDeviceConnection;

    .line 107
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceUSB;->mConnection:Landroid/hardware/usb/UsbDeviceConnection;

    const/4 v1, 0x0

    const-string v2, "hidapi"

    if-nez v0, :cond_0

    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to open USB device "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/libsdl/app/HIDDeviceUSB;->getDeviceName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    return v1

    .line 113
    :cond_0
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceUSB;->mDevice:Landroid/hardware/usb/UsbDevice;

    iget v3, p0, Lorg/libsdl/app/HIDDeviceUSB;->mInterfaceIndex:I

    invoke-virtual {v0, v3}, Landroid/hardware/usb/UsbDevice;->getInterface(I)Landroid/hardware/usb/UsbInterface;

    move-result-object v0

    .line 114
    .local v0, "iface":Landroid/hardware/usb/UsbInterface;
    iget-object v3, p0, Lorg/libsdl/app/HIDDeviceUSB;->mConnection:Landroid/hardware/usb/UsbDeviceConnection;

    const/4 v4, 0x1

    invoke-virtual {v3, v0, v4}, Landroid/hardware/usb/UsbDeviceConnection;->claimInterface(Landroid/hardware/usb/UsbInterface;Z)Z

    move-result v3

    if-nez v3, :cond_1

    .line 115
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to claim interfaces on USB device "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/libsdl/app/HIDDeviceUSB;->getDeviceName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    invoke-virtual {p0}, Lorg/libsdl/app/HIDDeviceUSB;->close()V

    .line 117
    return v1

    .line 119
    :cond_1
    iput-boolean v4, p0, Lorg/libsdl/app/HIDDeviceUSB;->mClaimed:Z

    .line 122
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_0
    invoke-virtual {v0}, Landroid/hardware/usb/UsbInterface;->getEndpointCount()I

    move-result v5

    if-ge v3, v5, :cond_3

    .line 123
    invoke-virtual {v0, v3}, Landroid/hardware/usb/UsbInterface;->getEndpoint(I)Landroid/hardware/usb/UsbEndpoint;

    move-result-object v5

    .line 124
    .local v5, "endpt":Landroid/hardware/usb/UsbEndpoint;
    invoke-virtual {v5}, Landroid/hardware/usb/UsbEndpoint;->getDirection()I

    move-result v6

    sparse-switch v6, :sswitch_data_0

    goto :goto_1

    .line 126
    :sswitch_0
    iget-object v6, p0, Lorg/libsdl/app/HIDDeviceUSB;->mInputEndpoint:Landroid/hardware/usb/UsbEndpoint;

    if-nez v6, :cond_2

    .line 127
    iput-object v5, p0, Lorg/libsdl/app/HIDDeviceUSB;->mInputEndpoint:Landroid/hardware/usb/UsbEndpoint;

    goto :goto_1

    .line 131
    :sswitch_1
    iget-object v6, p0, Lorg/libsdl/app/HIDDeviceUSB;->mOutputEndpoint:Landroid/hardware/usb/UsbEndpoint;

    if-nez v6, :cond_2

    .line 132
    iput-object v5, p0, Lorg/libsdl/app/HIDDeviceUSB;->mOutputEndpoint:Landroid/hardware/usb/UsbEndpoint;

    .line 122
    .end local v5    # "endpt":Landroid/hardware/usb/UsbEndpoint;
    :cond_2
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 141
    .end local v3    # "j":I
    :cond_3
    iget-object v3, p0, Lorg/libsdl/app/HIDDeviceUSB;->mInputEndpoint:Landroid/hardware/usb/UsbEndpoint;

    if-nez v3, :cond_4

    .line 142
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Missing required endpoint on USB device "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/libsdl/app/HIDDeviceUSB;->getDeviceName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    iget-object v2, p0, Lorg/libsdl/app/HIDDeviceUSB;->mConnection:Landroid/hardware/usb/UsbDeviceConnection;

    invoke-virtual {v2, v0}, Landroid/hardware/usb/UsbDeviceConnection;->releaseInterface(Landroid/hardware/usb/UsbInterface;)Z

    .line 144
    invoke-virtual {p0}, Lorg/libsdl/app/HIDDeviceUSB;->close()V

    .line 145
    return v1

    .line 149
    :cond_4
    iput-boolean v4, p0, Lorg/libsdl/app/HIDDeviceUSB;->mRunning:Z

    .line 150
    new-instance v1, Lorg/libsdl/app/HIDDeviceUSB$InputThread;

    invoke-direct {v1, p0}, Lorg/libsdl/app/HIDDeviceUSB$InputThread;-><init>(Lorg/libsdl/app/HIDDeviceUSB;)V

    iput-object v1, p0, Lorg/libsdl/app/HIDDeviceUSB;->mInputThread:Lorg/libsdl/app/HIDDeviceUSB$InputThread;

    .line 151
    iget-object v1, p0, Lorg/libsdl/app/HIDDeviceUSB;->mInputThread:Lorg/libsdl/app/HIDDeviceUSB$InputThread;

    invoke-virtual {v1}, Lorg/libsdl/app/HIDDeviceUSB$InputThread;->start()V

    .line 153
    return v4

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_1
        0x80 -> :sswitch_0
    .end sparse-switch
.end method

.method public readReport([BZ)Z
    .locals 19
    .param p1, "report"    # [B
    .param p2, "feature"    # Z

    .line 214
    move-object/from16 v0, p0

    move-object/from16 v10, p1

    const/4 v11, -0x1

    .line 215
    .local v11, "res":I
    const/4 v1, 0x0

    .line 216
    .local v1, "offset":I
    array-length v2, v10

    .line 217
    .local v2, "length":I
    const/4 v3, 0x0

    .line 218
    .local v3, "skipped_report_id":Z
    const/4 v12, 0x0

    aget-byte v13, v10, v12

    .line 220
    .local v13, "report_number":B
    iget-object v4, v0, Lorg/libsdl/app/HIDDeviceUSB;->mConnection:Landroid/hardware/usb/UsbDeviceConnection;

    const-string v14, "hidapi"

    if-nez v4, :cond_0

    .line 221
    const-string v4, "readReport() called with no device connection"

    invoke-static {v14, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    return v12

    .line 224
    :cond_0
    iget-boolean v4, v0, Lorg/libsdl/app/HIDDeviceUSB;->mClaimed:Z

    const/4 v15, 0x1

    if-nez v4, :cond_2

    .line 225
    if-eqz p2, :cond_1

    .line 226
    return v12

    .line 228
    :cond_1
    return v15

    .line 231
    :cond_2
    if-nez v13, :cond_3

    .line 234
    add-int/lit8 v1, v1, 0x1

    .line 235
    add-int/lit8 v2, v2, -0x1

    .line 236
    const/4 v3, 0x1

    move/from16 v16, v1

    move/from16 v17, v2

    move/from16 v18, v3

    goto :goto_0

    .line 231
    :cond_3
    move/from16 v16, v1

    move/from16 v17, v2

    move/from16 v18, v3

    .line 239
    .end local v1    # "offset":I
    .end local v2    # "length":I
    .end local v3    # "skipped_report_id":Z
    .local v16, "offset":I
    .local v17, "length":I
    .local v18, "skipped_report_id":Z
    :goto_0
    iget-object v1, v0, Lorg/libsdl/app/HIDDeviceUSB;->mConnection:Landroid/hardware/usb/UsbDeviceConnection;

    .line 242
    if-eqz p2, :cond_4

    const/4 v2, 0x3

    goto :goto_1

    :cond_4
    move v2, v15

    :goto_1
    shl-int/lit8 v2, v2, 0x8

    or-int v4, v2, v13

    iget v5, v0, Lorg/libsdl/app/HIDDeviceUSB;->mInterface:I

    .line 239
    const/16 v2, 0xa1

    const/4 v3, 0x1

    const/16 v9, 0x3e8

    move-object/from16 v6, p1

    move/from16 v7, v16

    move/from16 v8, v17

    invoke-virtual/range {v1 .. v9}, Landroid/hardware/usb/UsbDeviceConnection;->controlTransfer(IIII[BIII)I

    move-result v1

    .line 247
    .end local v11    # "res":I
    .local v1, "res":I
    if-gez v1, :cond_5

    .line 248
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getFeatureReport() returned "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " on device "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceUSB;->getDeviceName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v14, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    return v12

    .line 252
    :cond_5
    if-eqz v18, :cond_6

    .line 253
    add-int/lit8 v1, v1, 0x1

    .line 254
    add-int/lit8 v17, v17, 0x1

    move/from16 v2, v17

    goto :goto_2

    .line 252
    :cond_6
    move/from16 v2, v17

    .line 258
    .end local v17    # "length":I
    .restart local v2    # "length":I
    :goto_2
    if-ne v1, v2, :cond_7

    .line 259
    move-object/from16 v3, p1

    .local v3, "data":[B
    goto :goto_3

    .line 261
    .end local v3    # "data":[B
    :cond_7
    invoke-static {v10, v12, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v3

    .line 263
    .restart local v3    # "data":[B
    :goto_3
    iget-object v4, v0, Lorg/libsdl/app/HIDDeviceUSB;->mManager:Lorg/libsdl/app/HIDDeviceManager;

    iget v5, v0, Lorg/libsdl/app/HIDDeviceUSB;->mDeviceId:I

    invoke-virtual {v4, v5, v3}, Lorg/libsdl/app/HIDDeviceManager;->HIDDeviceReportResponse(I[B)V

    .line 265
    return v15
.end method

.method public setFrozen(Z)V
    .locals 4
    .param p1, "frozen"    # Z

    .line 301
    iput-boolean p1, p0, Lorg/libsdl/app/HIDDeviceUSB;->mFrozen:Z

    .line 304
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceUSB;->mConnection:Landroid/hardware/usb/UsbDeviceConnection;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lorg/libsdl/app/HIDDeviceUSB;->mClaimed:Z

    iget-boolean v1, p0, Lorg/libsdl/app/HIDDeviceUSB;->mFrozen:Z

    if-ne v0, v1, :cond_1

    .line 305
    iget-object v0, p0, Lorg/libsdl/app/HIDDeviceUSB;->mDevice:Landroid/hardware/usb/UsbDevice;

    iget v1, p0, Lorg/libsdl/app/HIDDeviceUSB;->mInterfaceIndex:I

    invoke-virtual {v0, v1}, Landroid/hardware/usb/UsbDevice;->getInterface(I)Landroid/hardware/usb/UsbInterface;

    move-result-object v0

    .line 306
    .local v0, "iface":Landroid/hardware/usb/UsbInterface;
    const-string v1, "hidapi"

    const/4 v2, 0x1

    if-eqz p1, :cond_0

    .line 307
    iget-object v3, p0, Lorg/libsdl/app/HIDDeviceUSB;->mConnection:Landroid/hardware/usb/UsbDeviceConnection;

    invoke-virtual {v3, v0}, Landroid/hardware/usb/UsbDeviceConnection;->releaseInterface(Landroid/hardware/usb/UsbInterface;)Z

    move-result v3

    xor-int/2addr v2, v3

    iput-boolean v2, p0, Lorg/libsdl/app/HIDDeviceUSB;->mClaimed:Z

    .line 308
    iget-boolean v2, p0, Lorg/libsdl/app/HIDDeviceUSB;->mClaimed:Z

    if-eqz v2, :cond_1

    .line 309
    const-string v2, "Tried to release claim on USB device, but failed!"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 312
    :cond_0
    iget-object v3, p0, Lorg/libsdl/app/HIDDeviceUSB;->mConnection:Landroid/hardware/usb/UsbDeviceConnection;

    invoke-virtual {v3, v0, v2}, Landroid/hardware/usb/UsbDeviceConnection;->claimInterface(Landroid/hardware/usb/UsbInterface;Z)Z

    move-result v2

    iput-boolean v2, p0, Lorg/libsdl/app/HIDDeviceUSB;->mClaimed:Z

    .line 313
    iget-boolean v2, p0, Lorg/libsdl/app/HIDDeviceUSB;->mClaimed:Z

    if-nez v2, :cond_1

    .line 314
    const-string v2, "Tried to regain claim on USB device, but failed!"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 318
    .end local v0    # "iface":Landroid/hardware/usb/UsbInterface;
    :cond_1
    :goto_0
    return-void
.end method

.method public shutdown()V
    .locals 1

    .line 295
    invoke-virtual {p0}, Lorg/libsdl/app/HIDDeviceUSB;->close()V

    .line 296
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/libsdl/app/HIDDeviceUSB;->mManager:Lorg/libsdl/app/HIDDeviceManager;

    .line 297
    return-void
.end method

.method public writeReport([BZ)I
    .locals 19
    .param p1, "report"    # [B
    .param p2, "feature"    # Z

    .line 158
    move-object/from16 v0, p0

    move-object/from16 v10, p1

    iget-object v1, v0, Lorg/libsdl/app/HIDDeviceUSB;->mConnection:Landroid/hardware/usb/UsbDeviceConnection;

    const/4 v11, -0x1

    const-string v12, "hidapi"

    if-nez v1, :cond_0

    .line 159
    const-string v1, "writeReport() called with no device connection"

    invoke-static {v12, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    return v11

    .line 163
    :cond_0
    iget-boolean v1, v0, Lorg/libsdl/app/HIDDeviceUSB;->mClaimed:Z

    if-nez v1, :cond_1

    .line 164
    const-string v1, "writeReport() called but some other process currently owns the USB device"

    invoke-static {v12, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    return v11

    .line 168
    :cond_1
    const-string v13, " on device "

    if-eqz p2, :cond_5

    .line 169
    const/4 v14, -0x1

    .line 170
    .local v14, "res":I
    const/4 v1, 0x0

    .line 171
    .local v1, "offset":I
    array-length v2, v10

    .line 172
    .local v2, "length":I
    const/4 v3, 0x0

    .line 173
    .local v3, "skipped_report_id":Z
    const/4 v4, 0x0

    aget-byte v15, v10, v4

    .line 175
    .local v15, "report_number":B
    if-nez v15, :cond_2

    .line 176
    add-int/lit8 v1, v1, 0x1

    .line 177
    add-int/lit8 v2, v2, -0x1

    .line 178
    const/4 v3, 0x1

    move/from16 v16, v1

    move/from16 v17, v2

    move/from16 v18, v3

    goto :goto_0

    .line 175
    :cond_2
    move/from16 v16, v1

    move/from16 v17, v2

    move/from16 v18, v3

    .line 181
    .end local v1    # "offset":I
    .end local v2    # "length":I
    .end local v3    # "skipped_report_id":Z
    .local v16, "offset":I
    .local v17, "length":I
    .local v18, "skipped_report_id":Z
    :goto_0
    iget-object v1, v0, Lorg/libsdl/app/HIDDeviceUSB;->mConnection:Landroid/hardware/usb/UsbDeviceConnection;

    or-int/lit16 v4, v15, 0x300

    iget v5, v0, Lorg/libsdl/app/HIDDeviceUSB;->mInterface:I

    const/16 v9, 0x3e8

    const/16 v2, 0x21

    const/16 v3, 0x9

    move-object/from16 v6, p1

    move/from16 v7, v16

    move/from16 v8, v17

    invoke-virtual/range {v1 .. v9}, Landroid/hardware/usb/UsbDeviceConnection;->controlTransfer(IIII[BIII)I

    move-result v1

    .line 189
    .end local v14    # "res":I
    .local v1, "res":I
    if-gez v1, :cond_3

    .line 190
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "writeFeatureReport() returned "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceUSB;->getDeviceName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v12, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    return v11

    .line 194
    :cond_3
    if-eqz v18, :cond_4

    .line 195
    add-int/lit8 v17, v17, 0x1

    .line 197
    :cond_4
    return v17

    .line 199
    .end local v1    # "res":I
    .end local v15    # "report_number":B
    .end local v16    # "offset":I
    .end local v17    # "length":I
    .end local v18    # "skipped_report_id":Z
    :cond_5
    iget-object v1, v0, Lorg/libsdl/app/HIDDeviceUSB;->mOutputEndpoint:Landroid/hardware/usb/UsbEndpoint;

    if-nez v1, :cond_6

    .line 201
    const-string v1, "Tried to write an output report to an interface with no output endpoint!"

    invoke-static {v12, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 202
    return v11

    .line 204
    :cond_6
    iget-object v1, v0, Lorg/libsdl/app/HIDDeviceUSB;->mConnection:Landroid/hardware/usb/UsbDeviceConnection;

    iget-object v2, v0, Lorg/libsdl/app/HIDDeviceUSB;->mOutputEndpoint:Landroid/hardware/usb/UsbEndpoint;

    array-length v3, v10

    const/16 v4, 0x3e8

    invoke-virtual {v1, v2, v10, v3, v4}, Landroid/hardware/usb/UsbDeviceConnection;->bulkTransfer(Landroid/hardware/usb/UsbEndpoint;[BII)I

    move-result v1

    .line 205
    .restart local v1    # "res":I
    array-length v2, v10

    if-eq v1, v2, :cond_7

    .line 206
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "writeOutputReport() returned "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {p0 .. p0}, Lorg/libsdl/app/HIDDeviceUSB;->getDeviceName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v12, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 208
    :cond_7
    return v1
.end method
