package org.libsdl.app;

import android.hardware.usb.UsbDevice;
import android.hardware.usb.UsbDeviceConnection;
import android.hardware.usb.UsbEndpoint;
import android.hardware.usb.UsbInterface;
import android.util.Log;
import java.util.Arrays;
import java.util.Locale;
import org.wiiucoop.bo2android.T6TouchLayout;

/* loaded from: classes2.dex */
class HIDDeviceUSB implements HIDDevice {
    private static final String TAG = "hidapi";
    protected UsbDeviceConnection mConnection;
    protected UsbDevice mDevice;
    protected int mDeviceId;
    protected boolean mFrozen;
    protected UsbEndpoint mInputEndpoint;
    protected InputThread mInputThread;
    protected int mInterface;
    protected int mInterfaceIndex;
    protected HIDDeviceManager mManager;
    protected UsbEndpoint mOutputEndpoint;
    protected boolean mRunning = false;
    protected boolean mClaimed = false;

    public HIDDeviceUSB(HIDDeviceManager manager, UsbDevice usbDevice, int interface_index) {
        this.mManager = manager;
        this.mDevice = usbDevice;
        this.mInterfaceIndex = interface_index;
        this.mInterface = this.mDevice.getInterface(this.mInterfaceIndex).getId();
        this.mDeviceId = manager.getDeviceIDForIdentifier(getIdentifier());
    }

    String getIdentifier() {
        return String.format(Locale.ENGLISH, "%s/%x/%x/%d", this.mDevice.getDeviceName(), Integer.valueOf(this.mDevice.getVendorId()), Integer.valueOf(this.mDevice.getProductId()), Integer.valueOf(this.mInterfaceIndex));
    }

    @Override // org.libsdl.app.HIDDevice
    public int getId() {
        return this.mDeviceId;
    }

    @Override // org.libsdl.app.HIDDevice
    public int getVendorId() {
        return this.mDevice.getVendorId();
    }

    @Override // org.libsdl.app.HIDDevice
    public int getProductId() {
        return this.mDevice.getProductId();
    }

    @Override // org.libsdl.app.HIDDevice
    public String getSerialNumber() {
        String result = null;
        try {
            result = this.mDevice.getSerialNumber();
        } catch (Exception e) {
        }
        if (result == null) {
            return "";
        }
        return result;
    }

    @Override // org.libsdl.app.HIDDevice
    public int getVersion() {
        return 0;
    }

    @Override // org.libsdl.app.HIDDevice
    public String getManufacturerName() {
        String result = this.mDevice.getManufacturerName();
        if (result == null) {
            return String.format("%x", Integer.valueOf(getVendorId()));
        }
        return result;
    }

    @Override // org.libsdl.app.HIDDevice
    public String getProductName() {
        String result = this.mDevice.getProductName();
        if (result == null) {
            return String.format("%x", Integer.valueOf(getProductId()));
        }
        return result;
    }

    @Override // org.libsdl.app.HIDDevice
    public UsbDevice getDevice() {
        return this.mDevice;
    }

    String getDeviceName() {
        return getManufacturerName() + " " + getProductName() + "(0x" + String.format("%x", Integer.valueOf(getVendorId())) + "/0x" + String.format("%x", Integer.valueOf(getProductId())) + ")";
    }

    @Override // org.libsdl.app.HIDDevice
    public boolean open() {
        this.mConnection = this.mManager.getUSBManager().openDevice(this.mDevice);
        if (this.mConnection == null) {
            Log.w(TAG, "Unable to open USB device " + getDeviceName());
            return false;
        }
        UsbInterface iface = this.mDevice.getInterface(this.mInterfaceIndex);
        if (!this.mConnection.claimInterface(iface, true)) {
            Log.w(TAG, "Failed to claim interfaces on USB device " + getDeviceName());
            close();
            return false;
        }
        this.mClaimed = true;
        for (int j = 0; j < iface.getEndpointCount(); j++) {
            UsbEndpoint endpt = iface.getEndpoint(j);
            switch (endpt.getDirection()) {
                case 0:
                    if (this.mOutputEndpoint == null) {
                        this.mOutputEndpoint = endpt;
                        break;
                    } else {
                        break;
                    }
                case T6TouchLayout.RIGHT_THUMB /* 128 */:
                    if (this.mInputEndpoint == null) {
                        this.mInputEndpoint = endpt;
                        break;
                    } else {
                        break;
                    }
            }
        }
        if (this.mInputEndpoint == null) {
            Log.w(TAG, "Missing required endpoint on USB device " + getDeviceName());
            this.mConnection.releaseInterface(iface);
            close();
            return false;
        }
        this.mRunning = true;
        this.mInputThread = new InputThread();
        this.mInputThread.start();
        return true;
    }

    @Override // org.libsdl.app.HIDDevice
    public int writeReport(byte[] report, boolean feature) {
        int offset;
        int length;
        boolean skipped_report_id;
        if (this.mConnection == null) {
            Log.w(TAG, "writeReport() called with no device connection");
            return -1;
        }
        if (!this.mClaimed) {
            Log.w(TAG, "writeReport() called but some other process currently owns the USB device");
            return -1;
        }
        if (feature) {
            int length2 = report.length;
            byte report_number = report[0];
            if (report_number != 0) {
                offset = 0;
                length = length2;
                skipped_report_id = false;
            } else {
                int offset2 = 0 + 1;
                offset = offset2;
                length = length2 - 1;
                skipped_report_id = true;
            }
            int res = this.mConnection.controlTransfer(33, 9, report_number | 768, this.mInterface, report, offset, length, 1000);
            if (res < 0) {
                Log.w(TAG, "writeFeatureReport() returned " + res + " on device " + getDeviceName());
                return -1;
            }
            if (skipped_report_id) {
                return length + 1;
            }
            return length;
        }
        if (this.mOutputEndpoint != null) {
            int res2 = this.mConnection.bulkTransfer(this.mOutputEndpoint, report, report.length, 1000);
            if (res2 != report.length) {
                Log.w(TAG, "writeOutputReport() returned " + res2 + " on device " + getDeviceName());
            }
            return res2;
        }
        Log.e(TAG, "Tried to write an output report to an interface with no output endpoint!");
        return -1;
    }

    @Override // org.libsdl.app.HIDDevice
    public boolean readReport(byte[] report, boolean feature) {
        int offset;
        int length;
        boolean skipped_report_id;
        int length2;
        byte[] data;
        int length3 = report.length;
        byte report_number = report[0];
        if (this.mConnection == null) {
            Log.w(TAG, "readReport() called with no device connection");
            return false;
        }
        if (!this.mClaimed) {
            return !feature;
        }
        if (report_number != 0) {
            offset = 0;
            length = length3;
            skipped_report_id = false;
        } else {
            int offset2 = 0 + 1;
            offset = offset2;
            length = length3 - 1;
            skipped_report_id = true;
        }
        int res = this.mConnection.controlTransfer(161, 1, ((feature ? 3 : 1) << 8) | report_number, this.mInterface, report, offset, length, 1000);
        if (res < 0) {
            Log.w(TAG, "getFeatureReport() returned " + res + " on device " + getDeviceName());
            return false;
        }
        if (!skipped_report_id) {
            length2 = length;
        } else {
            res++;
            length2 = length + 1;
        }
        if (res == length2) {
            data = report;
        } else {
            data = Arrays.copyOfRange(report, 0, res);
        }
        this.mManager.HIDDeviceReportResponse(this.mDeviceId, data);
        return true;
    }

    @Override // org.libsdl.app.HIDDevice
    public void close() {
        this.mRunning = false;
        if (this.mInputThread != null) {
            while (this.mInputThread.isAlive()) {
                this.mInputThread.interrupt();
                try {
                    this.mInputThread.join();
                } catch (InterruptedException e) {
                }
            }
            this.mInputThread = null;
        }
        if (this.mConnection != null) {
            if (this.mClaimed) {
                UsbInterface iface = this.mDevice.getInterface(this.mInterfaceIndex);
                this.mConnection.releaseInterface(iface);
            }
            this.mConnection.close();
            this.mConnection = null;
            this.mClaimed = false;
        }
    }

    @Override // org.libsdl.app.HIDDevice
    public void shutdown() {
        close();
        this.mManager = null;
    }

    @Override // org.libsdl.app.HIDDevice
    public void setFrozen(boolean frozen) {
        this.mFrozen = frozen;
        if (this.mConnection != null && this.mClaimed == this.mFrozen) {
            UsbInterface iface = this.mDevice.getInterface(this.mInterfaceIndex);
            if (frozen) {
                this.mClaimed = true ^ this.mConnection.releaseInterface(iface);
                if (this.mClaimed) {
                    Log.e(TAG, "Tried to release claim on USB device, but failed!");
                    return;
                }
                return;
            }
            this.mClaimed = this.mConnection.claimInterface(iface, true);
            if (!this.mClaimed) {
                Log.e(TAG, "Tried to regain claim on USB device, but failed!");
            }
        }
    }

    protected class InputThread extends Thread {
        protected InputThread() {
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            byte[] data;
            int packetSize = HIDDeviceUSB.this.mInputEndpoint.getMaxPacketSize();
            byte[] packet = new byte[packetSize];
            while (HIDDeviceUSB.this.mRunning) {
                try {
                    int r = HIDDeviceUSB.this.mConnection.bulkTransfer(HIDDeviceUSB.this.mInputEndpoint, packet, packetSize, 1000);
                    if (r > 0) {
                        if (r == packetSize) {
                            data = packet;
                        } else {
                            data = Arrays.copyOfRange(packet, 0, r);
                        }
                        if (!HIDDeviceUSB.this.mFrozen) {
                            HIDDeviceUSB.this.mManager.HIDDeviceInputReport(HIDDeviceUSB.this.mDeviceId, data);
                        }
                    }
                } catch (Exception e) {
                    Log.v(HIDDeviceUSB.TAG, "Exception in UsbDeviceConnection bulktransfer: " + e);
                    return;
                }
            }
        }
    }
}
