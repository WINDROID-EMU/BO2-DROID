package org.libsdl.app;

import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothGatt;
import android.bluetooth.BluetoothGattCallback;
import android.bluetooth.BluetoothGattCharacteristic;
import android.bluetooth.BluetoothGattDescriptor;
import android.bluetooth.BluetoothGattService;
import android.bluetooth.BluetoothManager;
import android.content.Context;
import android.hardware.usb.UsbDevice;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes2.dex */
class HIDDeviceBLESteamController extends BluetoothGattCallback implements HIDDevice {
    private static final int CHROMEBOOK_CONNECTION_CHECK_INTERVAL = 10000;
    private static final int D0G_BLE2_PID = 4358;
    private static final String TAG = "hidapi";
    private static final int TRANSPORT_AUTO = 0;
    private static final int TRANSPORT_BREDR = 1;
    private static final int TRANSPORT_LE = 2;
    private static final int TRITON_BLE_PID = 4867;
    private BluetoothDevice mDevice;
    private int mDeviceId;
    private boolean mHasEnabledNotifications;
    private boolean mHasSeenInputUpdate;
    private UUID mInputCharacteristic;
    private boolean mIsChromebook;
    private boolean mIsRegistered;
    private HIDDeviceManager mManager;
    static final UUID steamControllerService = UUID.fromString("100F6C32-1735-4313-B402-38567131E5F3");
    static final UUID inputCharacteristicD0G = UUID.fromString("100F6C33-1735-4313-B402-38567131E5F3");
    static final UUID inputCharacteristicTriton_0x45 = UUID.fromString("100F6C7A-1735-4313-B402-38567131E5F3");
    static final UUID inputCharacteristicTriton_0x47 = UUID.fromString("100F6C7C-1735-4313-B402-38567131E5F3");
    static final UUID reportCharacteristic = UUID.fromString("100F6C34-1735-4313-B402-38567131E5F3");
    private static final byte[] enterValveMode = {-64, -121, 3, 8, 7, 0};
    private boolean mIsConnected = false;
    private boolean mIsReconnecting = false;
    private boolean mFrozen = false;
    GattOperation mCurrentOperation = null;
    private int mProductId = -1;
    private int mReportId = 0;
    private HashMap<Integer, BluetoothGattCharacteristic> mOutputReportChars = new HashMap<>();
    private LinkedList<GattOperation> mOperations = new LinkedList<>();
    private Handler mHandler = new Handler(Looper.getMainLooper());
    private BluetoothGatt mGatt = connectGatt();

    static class GattOperation {
        int mDelayMs;
        BluetoothGatt mGatt;
        Operation mOp;
        boolean mResult;
        UUID mUuid;
        byte[] mValue;

        private enum Operation {
            CHR_READ,
            CHR_WRITE,
            ENABLE_NOTIFICATION
        }

        private GattOperation(BluetoothGatt gatt, Operation operation, UUID uuid) {
            this.mResult = true;
            this.mDelayMs = 0;
            this.mGatt = gatt;
            this.mOp = operation;
            this.mUuid = uuid;
        }

        private GattOperation(BluetoothGatt gatt, Operation operation, UUID uuid, int delayMs) {
            this.mResult = true;
            this.mDelayMs = 0;
            this.mGatt = gatt;
            this.mOp = operation;
            this.mUuid = uuid;
            this.mDelayMs = delayMs;
        }

        private GattOperation(BluetoothGatt gatt, Operation operation, UUID uuid, byte[] value) {
            this.mResult = true;
            this.mDelayMs = 0;
            this.mGatt = gatt;
            this.mOp = operation;
            this.mUuid = uuid;
            this.mValue = value;
        }

        private GattOperation(BluetoothGatt gatt, Operation operation, UUID uuid, byte[] value, int delayMs) {
            this.mResult = true;
            this.mDelayMs = 0;
            this.mGatt = gatt;
            this.mOp = operation;
            this.mUuid = uuid;
            this.mValue = value;
            this.mDelayMs = delayMs;
        }

        public void run() {
            BluetoothGattDescriptor cccd;
            byte[] value;
            switch (this.mOp) {
                case CHR_READ:
                    if (!this.mGatt.readCharacteristic(getCharacteristic(this.mUuid))) {
                        Log.e(HIDDeviceBLESteamController.TAG, "Unable to read characteristic " + this.mUuid.toString());
                        this.mResult = false;
                        break;
                    } else {
                        this.mResult = true;
                        break;
                    }
                case CHR_WRITE:
                    BluetoothGattCharacteristic chr = getCharacteristic(this.mUuid);
                    chr.setValue(this.mValue);
                    if (!this.mGatt.writeCharacteristic(chr)) {
                        Log.e(HIDDeviceBLESteamController.TAG, "Unable to write characteristic " + this.mUuid.toString());
                        this.mResult = false;
                        break;
                    } else {
                        this.mResult = true;
                        break;
                    }
                case ENABLE_NOTIFICATION:
                    BluetoothGattCharacteristic chr2 = getCharacteristic(this.mUuid);
                    if (chr2 != null && (cccd = chr2.getDescriptor(UUID.fromString("00002902-0000-1000-8000-00805f9b34fb"))) != null) {
                        int properties = chr2.getProperties();
                        if ((properties & 16) == 16) {
                            value = BluetoothGattDescriptor.ENABLE_NOTIFICATION_VALUE;
                        } else if ((properties & 32) == 32) {
                            value = BluetoothGattDescriptor.ENABLE_INDICATION_VALUE;
                        } else {
                            Log.e(HIDDeviceBLESteamController.TAG, "Unable to start notifications on input characteristic");
                            this.mResult = false;
                            break;
                        }
                        this.mGatt.setCharacteristicNotification(chr2, true);
                        cccd.setValue(value);
                        if (!this.mGatt.writeDescriptor(cccd)) {
                            Log.e(HIDDeviceBLESteamController.TAG, "Unable to write descriptor " + this.mUuid.toString());
                            this.mResult = false;
                            break;
                        } else {
                            this.mResult = true;
                            break;
                        }
                    }
                    break;
            }
        }

        public boolean finish() {
            return this.mResult;
        }

        public int getDelayMs() {
            return this.mDelayMs;
        }

        private BluetoothGattCharacteristic getCharacteristic(UUID uuid) {
            BluetoothGattService valveService = this.mGatt.getService(HIDDeviceBLESteamController.steamControllerService);
            if (valveService == null) {
                return null;
            }
            return valveService.getCharacteristic(uuid);
        }

        public static GattOperation readCharacteristic(BluetoothGatt gatt, UUID uuid) {
            return new GattOperation(gatt, Operation.CHR_READ, uuid);
        }

        public static GattOperation writeCharacteristic(BluetoothGatt gatt, UUID uuid, byte[] value) {
            return new GattOperation(gatt, Operation.CHR_WRITE, uuid, value);
        }

        public static GattOperation enableNotification(BluetoothGatt gatt, UUID uuid) {
            return new GattOperation(gatt, Operation.ENABLE_NOTIFICATION, uuid);
        }

        public static GattOperation enableNotification(BluetoothGatt gatt, UUID uuid, int delayMs) {
            return new GattOperation(gatt, Operation.ENABLE_NOTIFICATION, uuid, delayMs);
        }
    }

    HIDDeviceBLESteamController(HIDDeviceManager manager, BluetoothDevice device) {
        this.mIsRegistered = false;
        this.mIsChromebook = false;
        this.mHasEnabledNotifications = false;
        this.mHasSeenInputUpdate = false;
        this.mManager = manager;
        this.mDevice = device;
        this.mDeviceId = this.mManager.getDeviceIDForIdentifier(getIdentifier());
        this.mIsRegistered = false;
        this.mIsChromebook = SDLActivity.isChromebook();
        this.mHasEnabledNotifications = false;
        this.mHasSeenInputUpdate = false;
    }

    String getIdentifier() {
        return String.format("SteamController.%s", this.mDevice.getAddress());
    }

    BluetoothGatt getGatt() {
        return this.mGatt;
    }

    private BluetoothGatt connectGatt(boolean managed) {
        try {
            return this.mDevice.connectGatt(this.mManager.getContext(), managed, this, 2);
        } catch (Exception e) {
            return this.mDevice.connectGatt(this.mManager.getContext(), managed, this);
        }
    }

    private BluetoothGatt connectGatt() {
        return connectGatt(false);
    }

    protected int getConnectionState() {
        BluetoothManager btManager;
        Context context = this.mManager.getContext();
        if (context == null || (btManager = (BluetoothManager) context.getSystemService("bluetooth")) == null) {
            return 0;
        }
        return btManager.getConnectionState(this.mDevice, 7);
    }

    void reconnect() {
        if (getConnectionState() != 2) {
            this.mGatt.disconnect();
            this.mGatt = connectGatt();
        }
    }

    protected void checkConnectionForChromebookIssue() {
        if (!this.mIsChromebook) {
            return;
        }
        int connectionState = getConnectionState();
        switch (connectionState) {
            case 0:
                Log.v(TAG, "Chromebook: We have either been disconnected, or the Chromebook BtGatt.ContextMap bug has bitten us.  Attempting a disconnect/reconnect, but we may not be able to recover.");
                this.mIsReconnecting = true;
                this.mGatt.disconnect();
                this.mGatt = connectGatt(false);
                break;
            case 1:
                Log.v(TAG, "Chromebook: We're still trying to connect.  Waiting a bit longer.");
                break;
            case 2:
                if (!this.mIsConnected) {
                    Log.v(TAG, "Chromebook: We are in a very bad state; the controller shows as connected in the underlying Bluetooth layer, but we never received a callback.  Forcing a reconnect.");
                    this.mIsReconnecting = true;
                    this.mGatt.disconnect();
                    this.mGatt = connectGatt(false);
                    break;
                } else if (!isRegistered()) {
                    if (this.mGatt.getServices().size() > 0) {
                        Log.v(TAG, "Chromebook: We are connected to a controller, but never got our registration.  Trying to recover.");
                        probeService(this);
                        break;
                    } else {
                        Log.v(TAG, "Chromebook: We are connected to a controller, but never discovered services.  Trying to recover.");
                        this.mIsReconnecting = true;
                        this.mGatt.disconnect();
                        this.mGatt = connectGatt(false);
                        break;
                    }
                } else {
                    Log.v(TAG, "Chromebook: We are connected, and registered.  Everything's good!");
                    return;
                }
        }
        this.mHandler.postDelayed(new Runnable() { // from class: org.libsdl.app.HIDDeviceBLESteamController.1
            @Override // java.lang.Runnable
            public void run() {
                HIDDeviceBLESteamController.this.checkConnectionForChromebookIssue();
            }
        }, 10000L);
    }

    private boolean isRegistered() {
        return this.mIsRegistered;
    }

    private void setRegistered() {
        this.mIsRegistered = true;
    }

    private boolean probeService(HIDDeviceBLESteamController controller) {
        if (isRegistered()) {
            return true;
        }
        if (!this.mIsConnected) {
            return false;
        }
        Log.v(TAG, "probeService controller=" + controller);
        for (BluetoothGattService service : this.mGatt.getServices()) {
            if (service.getUuid().equals(steamControllerService)) {
                Log.v(TAG, "Found Valve steam controller service " + service.getUuid());
                for (BluetoothGattCharacteristic chr : service.getCharacteristics()) {
                    if (chr.getUuid().equals(inputCharacteristicTriton_0x45)) {
                        Log.v(TAG, "Found Triton input characteristic 0x45");
                        this.mProductId = TRITON_BLE_PID;
                        this.mReportId = 69;
                        this.mInputCharacteristic = chr.getUuid();
                    } else if (chr.getUuid().equals(inputCharacteristicTriton_0x47)) {
                        Log.v(TAG, "Found Triton input characteristic 0x47");
                        this.mProductId = TRITON_BLE_PID;
                        this.mReportId = 71;
                        this.mInputCharacteristic = chr.getUuid();
                    } else if (chr.getUuid().equals(inputCharacteristicD0G)) {
                        Log.v(TAG, "Found D0G input characteristic");
                        this.mProductId = D0G_BLE2_PID;
                        this.mReportId = 3;
                        this.mInputCharacteristic = chr.getUuid();
                    } else {
                        Pattern reportPattern = Pattern.compile("100F6C([0-9A-Z]{2})", 2);
                        Matcher matcher = reportPattern.matcher(chr.getUuid().toString());
                        if (matcher.find()) {
                            try {
                                int reportId = Integer.parseInt(matcher.group(1), 16) - 53;
                                if (reportId >= 128) {
                                    Log.v(TAG, "Found Triton output report 0x" + Integer.toString(reportId, 16));
                                    this.mOutputReportChars.put(Integer.valueOf(reportId), chr);
                                }
                            } catch (NumberFormatException nfe) {
                                Log.w(TAG, "Could not parse report characteristic " + chr.getUuid().toString() + ": " + nfe.toString());
                            }
                        }
                    }
                }
                for (BluetoothGattCharacteristic chr2 : service.getCharacteristics()) {
                    if (chr2.getUuid().equals(this.mInputCharacteristic)) {
                        BluetoothGattDescriptor cccd = chr2.getDescriptor(UUID.fromString("00002902-0000-1000-8000-00805f9b34fb"));
                        if (cccd != null) {
                            enableNotification(chr2.getUuid());
                        }
                    }
                }
                return true;
            }
        }
        if (this.mGatt.getServices().size() == 0 && this.mIsChromebook && !this.mIsReconnecting) {
            Log.e(TAG, "Chromebook: Discovered services were empty; this almost certainly means the BtGatt.ContextMap bug has bitten us.");
            this.mIsConnected = false;
            this.mIsReconnecting = true;
            this.mGatt.disconnect();
            this.mGatt = connectGatt(false);
        }
        return false;
    }

    private void finishCurrentGattOperation() {
        GattOperation op = null;
        synchronized (this.mOperations) {
            if (this.mCurrentOperation != null) {
                op = this.mCurrentOperation;
                this.mCurrentOperation = null;
            }
        }
        if (op != null) {
            boolean result = op.finish();
            if (!result) {
                this.mOperations.addFirst(op);
            }
        }
        executeNextGattOperation();
    }

    private void executeNextGattOperation() {
        synchronized (this.mOperations) {
            if (this.mCurrentOperation != null) {
                return;
            }
            if (this.mOperations.isEmpty()) {
                return;
            }
            this.mCurrentOperation = this.mOperations.removeFirst();
            Runnable gattOperationRunnable = new Runnable() { // from class: org.libsdl.app.HIDDeviceBLESteamController.2
                @Override // java.lang.Runnable
                public void run() {
                    synchronized (HIDDeviceBLESteamController.this.mOperations) {
                        if (HIDDeviceBLESteamController.this.mCurrentOperation == null) {
                            Log.e(HIDDeviceBLESteamController.TAG, "Current operation null in executor?");
                        } else {
                            HIDDeviceBLESteamController.this.mCurrentOperation.run();
                        }
                    }
                }
            };
            if (this.mCurrentOperation.getDelayMs() == 0) {
                this.mHandler.post(gattOperationRunnable);
            } else {
                this.mHandler.postDelayed(gattOperationRunnable, this.mCurrentOperation.getDelayMs());
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void queueGattOperation(GattOperation op) {
        synchronized (this.mOperations) {
            this.mOperations.add(op);
        }
        executeNextGattOperation();
    }

    private void enableNotification(final UUID chrUuid) {
        GattOperation op = GattOperation.enableNotification(this.mGatt, chrUuid, 500);
        queueGattOperation(op);
        this.mHandler.postDelayed(new Runnable() { // from class: org.libsdl.app.HIDDeviceBLESteamController.3
            @Override // java.lang.Runnable
            public void run() {
                if (!HIDDeviceBLESteamController.this.mHasEnabledNotifications) {
                    if (!HIDDeviceBLESteamController.this.mHasSeenInputUpdate) {
                        GattOperation retry = GattOperation.enableNotification(HIDDeviceBLESteamController.this.mGatt, chrUuid, 500);
                        HIDDeviceBLESteamController.this.queueGattOperation(retry);
                    } else {
                        Log.w(HIDDeviceBLESteamController.TAG, "WriteDescriptor has never returned, but we've seen input reports. Moving on with controller initialization.");
                        HIDDeviceBLESteamController.this.mHasEnabledNotifications = true;
                        HIDDeviceBLESteamController.this.enableValveMode();
                    }
                }
            }
        }, 1000L);
    }

    void writeCharacteristic(UUID uuid, byte[] value) {
        GattOperation op = GattOperation.writeCharacteristic(this.mGatt, uuid, value);
        queueGattOperation(op);
    }

    void readCharacteristic(UUID uuid) {
        GattOperation op = GattOperation.readCharacteristic(this.mGatt, uuid);
        queueGattOperation(op);
    }

    @Override // android.bluetooth.BluetoothGattCallback
    public void onConnectionStateChange(BluetoothGatt g, int status, int newState) {
        this.mIsReconnecting = false;
        if (newState == 2) {
            this.mIsConnected = true;
            if (!isRegistered()) {
                this.mHandler.post(new Runnable() { // from class: org.libsdl.app.HIDDeviceBLESteamController.4
                    @Override // java.lang.Runnable
                    public void run() {
                        HIDDeviceBLESteamController.this.mGatt.discoverServices();
                    }
                });
                return;
            }
            return;
        }
        if (newState == 0) {
            this.mIsConnected = false;
        }
    }

    @Override // android.bluetooth.BluetoothGattCallback
    public void onServicesDiscovered(BluetoothGatt gatt, int status) {
        if (status == 0) {
            if (gatt.getServices().size() == 0) {
                Log.v(TAG, "onServicesDiscovered returned zero services; something has gone horribly wrong down in Android's Bluetooth stack.");
                this.mIsReconnecting = true;
                this.mIsConnected = false;
                gatt.disconnect();
                this.mGatt = connectGatt(false);
                return;
            }
            if (getProductId() == TRITON_BLE_PID) {
                this.mGatt.requestMtu(517);
            }
            probeService(this);
        }
    }

    @Override // android.bluetooth.BluetoothGattCallback
    public void onCharacteristicRead(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic, int status) {
        if (characteristic.getUuid().equals(reportCharacteristic) && !this.mFrozen) {
            this.mManager.HIDDeviceReportResponse(getId(), characteristic.getValue());
        }
        finishCurrentGattOperation();
    }

    @Override // android.bluetooth.BluetoothGattCallback
    public void onCharacteristicWrite(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic, int status) {
        if (characteristic.getUuid().equals(reportCharacteristic) && !isRegistered()) {
            Log.v(TAG, "Registering Steam Controller with ID: " + getId());
            this.mManager.HIDDeviceConnected(getId(), getIdentifier(), getVendorId(), getProductId(), getSerialNumber(), getVersion(), getManufacturerName(), getProductName(), 0, 0, 0, 0, true, this.mReportId);
            setRegistered();
        }
        finishCurrentGattOperation();
    }

    @Override // android.bluetooth.BluetoothGattCallback
    public void onCharacteristicChanged(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic) {
        if (characteristic.getUuid().equals(this.mInputCharacteristic) && !this.mFrozen) {
            this.mHasSeenInputUpdate = true;
            this.mManager.HIDDeviceInputReport(getId(), characteristic.getValue());
        }
    }

    @Override // android.bluetooth.BluetoothGattCallback
    public void onDescriptorRead(BluetoothGatt gatt, BluetoothGattDescriptor descriptor, int status) {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void enableValveMode() {
        BluetoothGattCharacteristic reportChr;
        BluetoothGattService valveService = this.mGatt.getService(steamControllerService);
        if (valveService != null && (reportChr = valveService.getCharacteristic(reportCharacteristic)) != null) {
            if (getProductId() == TRITON_BLE_PID) {
                Log.v(TAG, "Registering Triton Steam Controller with ID: " + getId());
                this.mManager.HIDDeviceConnected(getId(), getIdentifier(), getVendorId(), getProductId(), getSerialNumber(), getVersion(), getManufacturerName(), getProductName(), 0, 0, 0, 0, true, this.mReportId);
                setRegistered();
            } else {
                Log.v(TAG, "Writing report characteristic to enter valve mode");
                reportChr.setValue(enterValveMode);
                this.mGatt.writeCharacteristic(reportChr);
            }
        }
    }

    @Override // android.bluetooth.BluetoothGattCallback
    public void onDescriptorWrite(BluetoothGatt gatt, BluetoothGattDescriptor descriptor, int status) {
        BluetoothGattCharacteristic chr = descriptor.getCharacteristic();
        if (chr.getUuid().equals(this.mInputCharacteristic)) {
            this.mHasEnabledNotifications = true;
            enableValveMode();
        }
        finishCurrentGattOperation();
    }

    @Override // android.bluetooth.BluetoothGattCallback
    public void onReliableWriteCompleted(BluetoothGatt gatt, int status) {
    }

    @Override // android.bluetooth.BluetoothGattCallback
    public void onReadRemoteRssi(BluetoothGatt gatt, int rssi, int status) {
    }

    @Override // android.bluetooth.BluetoothGattCallback
    public void onMtuChanged(BluetoothGatt gatt, int mtu, int status) {
    }

    @Override // org.libsdl.app.HIDDevice
    public int getId() {
        return this.mDeviceId;
    }

    @Override // org.libsdl.app.HIDDevice
    public int getVendorId() {
        return 10462;
    }

    @Override // org.libsdl.app.HIDDevice
    public int getProductId() {
        if (this.mProductId > 0) {
            return this.mProductId;
        }
        if (this.mDevice.getName().startsWith("Steam Ctrl")) {
            this.mProductId = TRITON_BLE_PID;
        } else {
            this.mProductId = D0G_BLE2_PID;
        }
        return this.mProductId;
    }

    @Override // org.libsdl.app.HIDDevice
    public String getSerialNumber() {
        return "12345";
    }

    @Override // org.libsdl.app.HIDDevice
    public int getVersion() {
        return 0;
    }

    @Override // org.libsdl.app.HIDDevice
    public String getManufacturerName() {
        return "Valve Corporation";
    }

    @Override // org.libsdl.app.HIDDevice
    public String getProductName() {
        return "Steam Controller";
    }

    @Override // org.libsdl.app.HIDDevice
    public UsbDevice getDevice() {
        return null;
    }

    @Override // org.libsdl.app.HIDDevice
    public boolean open() {
        return true;
    }

    @Override // org.libsdl.app.HIDDevice
    public int writeReport(byte[] report, boolean feature) {
        if (!isRegistered()) {
            Log.e(TAG, "Attempted writeReport before Steam Controller is registered!");
            if (this.mIsConnected) {
                probeService(this);
            }
            return -1;
        }
        if (feature) {
            byte[] actual_report = Arrays.copyOfRange(report, 1, report.length - 1);
            writeCharacteristic(reportCharacteristic, actual_report);
            return report.length;
        }
        if (getProductId() == D0G_BLE2_PID) {
            writeCharacteristic(reportCharacteristic, report);
            return report.length;
        }
        if (report.length > 0) {
            int reportId = report[0] & 255;
            BluetoothGattCharacteristic targetedReportCharacteristic = this.mOutputReportChars.get(Integer.valueOf(reportId));
            if (targetedReportCharacteristic != null) {
                byte[] actual_report2 = Arrays.copyOfRange(report, 1, report.length - 1);
                writeCharacteristic(targetedReportCharacteristic.getUuid(), actual_report2);
                return report.length;
            }
            Log.w(TAG, "Got report write request for unknown report type 0x" + Integer.toString(reportId, 16));
        }
        return -1;
    }

    @Override // org.libsdl.app.HIDDevice
    public boolean readReport(byte[] report, boolean feature) {
        if (!isRegistered()) {
            Log.e(TAG, "Attempted readReport before Steam Controller is registered!");
            if (this.mIsConnected) {
                probeService(this);
            }
            return false;
        }
        if (!feature) {
            return false;
        }
        readCharacteristic(reportCharacteristic);
        return true;
    }

    @Override // org.libsdl.app.HIDDevice
    public void close() {
    }

    @Override // org.libsdl.app.HIDDevice
    public void setFrozen(boolean frozen) {
        this.mFrozen = frozen;
    }

    @Override // org.libsdl.app.HIDDevice
    public void shutdown() {
        close();
        BluetoothGatt g = this.mGatt;
        if (g != null) {
            g.disconnect();
            g.close();
            this.mGatt = null;
        }
        this.mManager = null;
        this.mIsRegistered = false;
        this.mIsConnected = false;
        this.mOperations.clear();
    }
}
