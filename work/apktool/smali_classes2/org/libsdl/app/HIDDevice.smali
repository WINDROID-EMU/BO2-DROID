.class interface abstract Lorg/libsdl/app/HIDDevice;
.super Ljava/lang/Object;
.source "HIDDevice.java"


# virtual methods
.method public abstract close()V
.end method

.method public abstract getDevice()Landroid/hardware/usb/UsbDevice;
.end method

.method public abstract getId()I
.end method

.method public abstract getManufacturerName()Ljava/lang/String;
.end method

.method public abstract getProductId()I
.end method

.method public abstract getProductName()Ljava/lang/String;
.end method

.method public abstract getSerialNumber()Ljava/lang/String;
.end method

.method public abstract getVendorId()I
.end method

.method public abstract getVersion()I
.end method

.method public abstract open()Z
.end method

.method public abstract readReport([BZ)Z
.end method

.method public abstract setFrozen(Z)V
.end method

.method public abstract shutdown()V
.end method

.method public abstract writeReport([BZ)I
.end method
