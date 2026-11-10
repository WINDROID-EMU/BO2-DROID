package org.libsdl.app;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.UiModeManager;
import android.content.ActivityNotFoundException;
import android.content.ClipData;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.LocaleList;
import android.os.Looper;
import android.os.Message;
import android.os.ParcelFileDescriptor;
import android.util.DisplayMetrics;
import android.util.Log;
import android.util.SparseArray;
import android.view.Display;
import android.view.InputDevice;
import android.view.KeyEvent;
import android.view.PointerIcon;
import android.view.Surface;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputMethodManager;
import android.webkit.MimeTypeMap;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;
import android.window.OnBackInvokedCallback;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Locale;
import org.wiiucoop.bo2android.T6GameData;
import org.wiiucoop.bo2android.T6TouchLayout;

/* loaded from: classes2.dex */
public class SDLActivity extends Activity implements View.OnSystemUiVisibilityChangeListener {
    protected static final int COMMAND_CHANGE_TITLE = 1;
    protected static final int COMMAND_CHANGE_WINDOW_STYLE = 2;
    protected static final int COMMAND_SET_KEEP_SCREEN_ON = 5;
    protected static final int COMMAND_TEXTEDIT_HIDE = 3;
    protected static final int COMMAND_USER = 32768;
    private static final int SDL_FILEDIALOG_OPENFILE = 0;
    private static final int SDL_FILEDIALOG_OPENFOLDER = 2;
    private static final int SDL_FILEDIALOG_SAVEFILE = 1;
    private static final int SDL_MAJOR_VERSION = 3;
    private static final int SDL_MICRO_VERSION = 0;
    private static final int SDL_MINOR_VERSION = 5;
    protected static final int SDL_ORIENTATION_LANDSCAPE = 1;
    protected static final int SDL_ORIENTATION_LANDSCAPE_FLIPPED = 2;
    protected static final int SDL_ORIENTATION_PORTRAIT = 3;
    protected static final int SDL_ORIENTATION_PORTRAIT_FLIPPED = 4;
    protected static final int SDL_ORIENTATION_UNKNOWN = 0;
    private static final int SDL_SYSTEM_CURSOR_ALIAS = 24;
    private static final int SDL_SYSTEM_CURSOR_ALL_SCROLL = 31;
    private static final int SDL_SYSTEM_CURSOR_CELL = 22;
    private static final int SDL_SYSTEM_CURSOR_COL_RESIZE = 29;
    private static final int SDL_SYSTEM_CURSOR_CONTEXT_MENU = 20;
    private static final int SDL_SYSTEM_CURSOR_COPY = 25;
    private static final int SDL_SYSTEM_CURSOR_CROSSHAIR = 3;
    private static final int SDL_SYSTEM_CURSOR_DEFAULT = 0;
    private static final int SDL_SYSTEM_CURSOR_EW_RESIZE = 7;
    private static final int SDL_SYSTEM_CURSOR_E_RESIZE = 15;
    private static final int SDL_SYSTEM_CURSOR_GRAB = 27;
    private static final int SDL_SYSTEM_CURSOR_GRABBING = 28;
    private static final int SDL_SYSTEM_CURSOR_HELP = 21;
    private static final int SDL_SYSTEM_CURSOR_MOVE = 9;
    private static final int SDL_SYSTEM_CURSOR_NESW_RESIZE = 6;
    private static final int SDL_SYSTEM_CURSOR_NE_RESIZE = 14;
    private static final int SDL_SYSTEM_CURSOR_NOT_ALLOWED = 10;
    private static final int SDL_SYSTEM_CURSOR_NO_DROP = 26;
    private static final int SDL_SYSTEM_CURSOR_NS_RESIZE = 8;
    private static final int SDL_SYSTEM_CURSOR_NWSE_RESIZE = 5;
    private static final int SDL_SYSTEM_CURSOR_NW_RESIZE = 12;
    private static final int SDL_SYSTEM_CURSOR_N_RESIZE = 13;
    private static final int SDL_SYSTEM_CURSOR_POINTER = 11;
    private static final int SDL_SYSTEM_CURSOR_PROGRESS = 4;
    private static final int SDL_SYSTEM_CURSOR_ROW_RESIZE = 30;
    private static final int SDL_SYSTEM_CURSOR_SE_RESIZE = 16;
    private static final int SDL_SYSTEM_CURSOR_SW_RESIZE = 18;
    private static final int SDL_SYSTEM_CURSOR_S_RESIZE = 17;
    private static final int SDL_SYSTEM_CURSOR_TEXT = 1;
    private static final int SDL_SYSTEM_CURSOR_VERTICAL_TEXT = 23;
    private static final int SDL_SYSTEM_CURSOR_WAIT = 2;
    private static final int SDL_SYSTEM_CURSOR_W_RESIZE = 19;
    private static final int SDL_SYSTEM_CURSOR_ZOOM_IN = 32;
    private static final int SDL_SYSTEM_CURSOR_ZOOM_OUT = 33;
    private static final String TAG = "SDL";
    static OnBackInvokedCallback backButtonCallback;
    protected static SDLClipboardHandler mClipboardHandler;
    protected static Locale mCurrentLocale;
    public static NativeState mCurrentNativeState;
    protected static int mCurrentRotation;
    protected static Hashtable<Integer, PointerIcon> mCursors;
    protected static boolean mFullscreenModeActive;
    protected static HIDDeviceManager mHIDDeviceManager;
    public static boolean mHasFocus;
    public static boolean mIsResumedCalled;
    protected static int mLastCursorID;
    protected static ViewGroup mLayout;
    protected static SDLGenericMotionListener_API14 mMotionListener;
    public static NativeState mNextNativeState;
    protected static Thread mSDLThread;
    protected static SDLActivity mSingleton;
    protected static SDLSurface mSurface;
    protected static SDLDummyEdit mTextEdit;
    Handler commandHandler = new SDLCommandHandler();
    protected final int[] messageboxSelection = new int[1];
    private final Runnable rehideSystemUi = new Runnable() { // from class: org.libsdl.app.SDLActivity.8
        @Override // java.lang.Runnable
        public void run() {
            if (Build.VERSION.SDK_INT >= SDLActivity.SDL_SYSTEM_CURSOR_ROW_RESIZE) {
                WindowInsetsController controller = SDLActivity.this.getWindow().getInsetsController();
                if (controller != null) {
                    controller.hide(WindowInsets.Type.systemBars());
                    return;
                }
                return;
            }
            SDLActivity.this.getWindow().getDecorView().setSystemUiVisibility(5894);
        }
    };
    public static final boolean mHasMultiWindow = true;
    public static boolean mBrokenLibraries = true;
    static final /* synthetic */ boolean $assertionsDisabled = false;
    protected static boolean mSDLMainFinished = $assertionsDisabled;
    protected static boolean mActivityCreated = $assertionsDisabled;
    private static SDLFileDialogState mFileDialogState = null;
    protected static boolean mDispatchingKeyEvent = $assertionsDisabled;
    static boolean mBackKeyTrapEnabled = $assertionsDisabled;

    public enum NativeState {
        INIT,
        RESUMED,
        PAUSED
    }

    public static native void nativeAddTouch(int i, String str);

    public static native boolean nativeAllowRecreateActivity();

    public static native int nativeCheckSDLThreadCounter();

    public static native void nativeCleanupMainThread();

    public static native void nativeFocusChanged(boolean z);

    public static native int nativeGetCompiledSubsystems();

    public static native String nativeGetHint(String str);

    public static native boolean nativeGetHintBoolean(String str, boolean z);

    public static native String nativeGetVersion();

    public static native void nativeInitMainThread();

    public static native boolean nativeIsHIDAPIEnabled();

    public static native void nativeLowMemory();

    public static native void nativePause();

    public static native void nativePermissionResult(int i, boolean z);

    public static native void nativeQuit();

    public static native void nativeResume();

    public static native int nativeRunMain(String str, String str2, Object obj);

    public static native void nativeSendQuit();

    public static native void nativeSetNaturalOrientation(int i);

    public static native void nativeSetScreenResolution(int i, int i2, int i3, int i4, float f, float f2);

    public static native void nativeSetenv(String str, String str2);

    public static native void nativeSetupJNI();

    public static native void onNativeClipboardChanged();

    public static native void onNativeDarkModeChanged(boolean z);

    public static native void onNativeDropFile(String str);

    public static native void onNativeFileDialog(int i, String[] strArr, int i2);

    public static native void onNativeInsetsChanged(int i, int i2, int i3, int i4);

    public static native void onNativeKeyDown(int i);

    public static native void onNativeKeyUp(int i);

    public static native void onNativeKeyboardFocusLost();

    public static native void onNativeLocaleChanged();

    public static native void onNativeMouse(int i, int i2, float f, float f2, boolean z);

    public static native void onNativePen(int i, int i2, int i3, int i4, float f, float f2, float f3);

    public static native void onNativePinchEnd();

    public static native void onNativePinchStart(float f, float f2, float f3, float f4);

    public static native void onNativePinchUpdate(float f, float f2, float f3, float f4, float f5);

    public static native void onNativeResize();

    public static native void onNativeRotationChanged(int i);

    public static native void onNativeScreenKeyboardHidden();

    public static native void onNativeScreenKeyboardShown();

    public static native boolean onNativeSoftReturnKey();

    public static native void onNativeSurfaceChanged();

    public static native void onNativeSurfaceCreated();

    public static native void onNativeSurfaceDestroyed();

    public static native void onNativeTouch(int i, int i2, int i3, float f, float f2, float f3);

    public static SDLGenericMotionListener_API14 getMotionListener() {
        if (mMotionListener == null) {
            if (Build.VERSION.SDK_INT >= SDL_SYSTEM_CURSOR_COL_RESIZE) {
                mMotionListener = new SDLGenericMotionListener_API29();
            } else {
                mMotionListener = new SDLGenericMotionListener_API26();
            }
        }
        return mMotionListener;
    }

    protected void main() {
        String library = mSingleton.getMainSharedObject();
        String function = mSingleton.getMainFunction();
        String[] arguments = mSingleton.getArguments();
        Log.v(TAG, "Running main function " + function + " from library " + library);
        nativeRunMain(library, function, arguments);
        Log.v(TAG, "Finished main function");
    }

    protected String getMainSharedObject() {
        String library;
        String[] libraries = mSingleton.getLibraries();
        if (libraries.length > 0) {
            library = "lib" + libraries[libraries.length - 1] + ".so";
        } else {
            library = "libmain.so";
        }
        return getContext().getApplicationInfo().nativeLibraryDir + "/" + library;
    }

    protected String getMainFunction() {
        return "SDL_main";
    }

    protected String[] getLibraries() {
        return new String[]{"SDL3", T6GameData.DIR_MAIN};
    }

    public void loadLibraries() throws SecurityException, UnsatisfiedLinkError, NullPointerException {
        for (String lib : getLibraries()) {
            SDL.loadLibrary(lib, this);
        }
    }

    protected String[] getArguments() {
        return new String[0];
    }

    protected int getInitSubsystems() {
        return SDL.SDL_INIT_EVERYTHING;
    }

    public static void initialize() {
        mSingleton = null;
        mSurface = null;
        mTextEdit = null;
        mLayout = null;
        mClipboardHandler = null;
        mCursors = new Hashtable<>();
        mLastCursorID = 0;
        mSDLThread = null;
        mIsResumedCalled = $assertionsDisabled;
        mHasFocus = true;
        mNextNativeState = NativeState.INIT;
        mCurrentNativeState = NativeState.INIT;
    }

    protected SDLSurface createSDLSurface(Context context) {
        return new SDLSurface(context);
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        Intent intent;
        String filename;
        Log.v(TAG, "Manufacturer: " + Build.MANUFACTURER);
        Log.v(TAG, "Device: " + Build.DEVICE);
        Log.v(TAG, "Model: " + Build.MODEL);
        Log.v(TAG, "onCreate()");
        super.onCreate(savedInstanceState);
        if (Build.VERSION.SDK_INT >= SDL_SYSTEM_CURSOR_ROW_RESIZE) {
            getWindow().setDecorFitsSystemWindows($assertionsDisabled);
        }
        if (mSDLMainFinished || mActivityCreated) {
            boolean allow_recreate = nativeAllowRecreateActivity();
            if (mSDLMainFinished) {
                Log.v(TAG, "SDL main() finished");
            }
            if (allow_recreate) {
                Log.v(TAG, "activity re-created");
            } else {
                Log.v(TAG, "activity finished");
                System.exit(0);
                return;
            }
        }
        mActivityCreated = true;
        try {
            Thread.currentThread().setName("SDLActivity");
        } catch (Exception e) {
            Log.v(TAG, "modify thread properties failed " + e.toString());
        }
        String errorMsgBrokenLib = "";
        try {
            loadLibraries();
            mBrokenLibraries = $assertionsDisabled;
        } catch (Exception e2) {
            System.err.println(e2.getMessage());
            mBrokenLibraries = true;
            errorMsgBrokenLib = e2.getMessage();
        } catch (UnsatisfiedLinkError e3) {
            System.err.println(e3.getMessage());
            mBrokenLibraries = true;
            errorMsgBrokenLib = e3.getMessage();
        }
        if (!mBrokenLibraries) {
            String expected_version = String.valueOf(3) + "." + String.valueOf(5) + "." + String.valueOf(0);
            String version = nativeGetVersion();
            if (!version.equals(expected_version)) {
                mBrokenLibraries = true;
                errorMsgBrokenLib = "SDL C/Java version mismatch (expected " + expected_version + ", got " + version + ")";
            }
        }
        if (mBrokenLibraries) {
            mSingleton = this;
            AlertDialog.Builder dlgAlert = new AlertDialog.Builder(this);
            dlgAlert.setMessage("An error occurred while trying to start the application. Please try again and/or reinstall." + System.getProperty("line.separator") + System.getProperty("line.separator") + "Error: " + errorMsgBrokenLib);
            dlgAlert.setTitle("SDL Error");
            dlgAlert.setPositiveButton("Exit", new DialogInterface.OnClickListener() { // from class: org.libsdl.app.SDLActivity.1
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int id) {
                    SDLActivity.mSingleton.finish();
                }
            });
            dlgAlert.setCancelable($assertionsDisabled);
            dlgAlert.create().show();
            return;
        }
        int run_count = nativeCheckSDLThreadCounter();
        if (run_count != 0) {
            boolean allow_recreate2 = nativeAllowRecreateActivity();
            if (allow_recreate2) {
                Log.v(TAG, "activity re-created // run_count: " + run_count);
            } else {
                Log.v(TAG, "activity finished // run_count: " + run_count);
                System.exit(0);
                return;
            }
        }
        SDL.setupJNI(getInitSubsystems());
        SDL.initialize();
        mSingleton = this;
        SDL.setContext(this);
        if (SDL.isControllerManagerReady()) {
            SDLControllerManager.initializeDeviceListener();
        }
        if (SDL.isSubsystemCompiled(32)) {
            mClipboardHandler = new SDLClipboardHandler();
        }
        if (nativeIsHIDAPIEnabled()) {
            mHIDDeviceManager = HIDDeviceManager.acquire(this);
        }
        if (SDL.isSubsystemInitialized(32)) {
            mSurface = createSDLSurface(this);
            mLayout = new RelativeLayout(this);
            mLayout.addView(mSurface);
            nativeSetNaturalOrientation(getNaturalOrientation());
            mCurrentRotation = getCurrentRotation();
            onNativeRotationChanged(mCurrentRotation);
        }
        try {
            mCurrentLocale = getContext().getResources().getConfiguration().getLocales().get(0);
        } catch (Exception e4) {
        }
        switch (getContext().getResources().getConfiguration().uiMode & 48) {
            case 16:
                onNativeDarkModeChanged($assertionsDisabled);
                break;
            case 32:
                onNativeDarkModeChanged(true);
                break;
        }
        if (mLayout != null) {
            setContentView(mLayout);
            setWindowStyle($assertionsDisabled);
        }
        getWindow().getDecorView().setOnSystemUiVisibilityChangeListener(this);
        if (SDL.isSubsystemInitialized(32) && (intent = getIntent()) != null && intent.getData() != null && (filename = intent.getData().getPath()) != null) {
            Log.v(TAG, "Got filename: " + filename);
            onNativeDropFile(filename);
        }
    }

    protected void pauseNativeThread() {
        mNextNativeState = NativeState.PAUSED;
        mIsResumedCalled = $assertionsDisabled;
        if (mBrokenLibraries) {
            return;
        }
        handleNativeState();
    }

    protected void resumeNativeThread() {
        mNextNativeState = NativeState.RESUMED;
        mIsResumedCalled = true;
        if (mBrokenLibraries) {
            return;
        }
        handleNativeState();
    }

    @Override // android.app.Activity
    protected void onPause() {
        Log.v(TAG, "onPause()");
        super.onPause();
        if (mHIDDeviceManager != null) {
            mHIDDeviceManager.setFrozen(true);
        }
        if (!mHasMultiWindow) {
            pauseNativeThread();
        }
    }

    @Override // android.app.Activity
    protected void onResume() {
        Log.v(TAG, "onResume()");
        super.onResume();
        if (mHIDDeviceManager != null) {
            mHIDDeviceManager.setFrozen($assertionsDisabled);
        }
        if (!mHasMultiWindow) {
            resumeNativeThread();
        }
    }

    @Override // android.app.Activity
    protected void onStop() {
        Log.v(TAG, "onStop()");
        super.onStop();
        if (mHasMultiWindow) {
            pauseNativeThread();
        }
    }

    @Override // android.app.Activity
    protected void onStart() {
        Log.v(TAG, "onStart()");
        super.onStart();
        if (mHasMultiWindow) {
            resumeNativeThread();
        }
    }

    public static int getNaturalOrientation() {
        Activity activity = getContext();
        if (activity == null) {
            return 0;
        }
        Configuration config = activity.getResources().getConfiguration();
        Display display = activity.getWindowManager().getDefaultDisplay();
        int rotation = display.getRotation();
        if (((rotation == 0 || rotation == 2) && config.orientation == 2) || ((rotation == 1 || rotation == 3) && config.orientation == 1)) {
            return 1;
        }
        return 3;
    }

    public static int getCurrentRotation() {
        Activity activity = getContext();
        if (activity == null) {
            return 0;
        }
        Display display = activity.getWindowManager().getDefaultDisplay();
        switch (display.getRotation()) {
        }
        return 0;
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onWindowFocusChanged(boolean hasFocus) {
        super.onWindowFocusChanged(hasFocus);
        Log.v(TAG, "onWindowFocusChanged(): " + hasFocus);
        if ((hasFocus || !nativeGetHintBoolean("SDL_JOYSTICK_ALLOW_BACKGROUND_EVENTS", $assertionsDisabled)) && mHIDDeviceManager != null) {
            mHIDDeviceManager.setFrozen(!hasFocus);
        }
        if (mBrokenLibraries) {
            return;
        }
        mHasFocus = hasFocus;
        if (hasFocus) {
            mNextNativeState = NativeState.RESUMED;
            getMotionListener().reclaimRelativeMouseModeIfNeeded();
            handleNativeState();
            nativeFocusChanged(true);
            return;
        }
        nativeFocusChanged($assertionsDisabled);
        if (!mHasMultiWindow) {
            mNextNativeState = NativeState.PAUSED;
            handleNativeState();
        }
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks2
    public void onTrimMemory(int level) {
        Log.v(TAG, "onTrimMemory()");
        super.onTrimMemory(level);
        if (mBrokenLibraries) {
            return;
        }
        nativeLowMemory();
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        Log.v(TAG, "onConfigurationChanged()");
        super.onConfigurationChanged(newConfig);
        if (mBrokenLibraries) {
        }
        if (mCurrentLocale == null || !mCurrentLocale.equals(newConfig.locale)) {
            mCurrentLocale = newConfig.locale;
            onNativeLocaleChanged();
        }
        switch (newConfig.uiMode & 48) {
            case 16:
                onNativeDarkModeChanged($assertionsDisabled);
                break;
            case 32:
                onNativeDarkModeChanged(true);
                break;
        }
    }

    @Override // android.app.Activity
    protected void onDestroy() throws InterruptedException {
        Log.v(TAG, "onDestroy()");
        if (mHIDDeviceManager != null) {
            HIDDeviceManager.release(mHIDDeviceManager);
            mHIDDeviceManager = null;
        }
        SDLAudioManager.release(this);
        if (mBrokenLibraries) {
            super.onDestroy();
            return;
        }
        if (mSDLThread != null) {
            nativeSendQuit();
            try {
                mSDLThread.join(1000L);
            } catch (Exception e) {
                Log.v(TAG, "Problem stopping SDLThread: " + e);
            }
        }
        nativeQuit();
        super.onDestroy();
    }

    @Override // android.app.Activity
    public void onBackPressed() {
        boolean trapBack = nativeGetHintBoolean("SDL_ANDROID_TRAP_BACK_BUTTON", $assertionsDisabled);
        if (!trapBack && !isFinishing()) {
            super.onBackPressed();
        }
    }

    public static void setBackButtonTrapEnabled(boolean enabled) {
        if (Build.VERSION.SDK_INT < SDL_SYSTEM_CURSOR_ZOOM_OUT || enabled == mBackKeyTrapEnabled) {
            return;
        }
        if (backButtonCallback == null) {
            backButtonCallback = new OnBackInvokedCallback() { // from class: org.libsdl.app.SDLActivity.2
                Handler mBackKeyHandler;

                @Override // android.window.OnBackInvokedCallback
                public void onBackInvoked() {
                    if (this.mBackKeyHandler == null) {
                        this.mBackKeyHandler = new Handler(Looper.getMainLooper());
                    }
                    SDLActivity.onNativeKeyDown(4);
                    this.mBackKeyHandler.postDelayed(new Runnable() { // from class: org.libsdl.app.SDLActivity.2.1
                        @Override // java.lang.Runnable
                        public void run() {
                            SDLActivity.onNativeKeyUp(4);
                        }
                    }, 500L);
                }
            };
        }
        if (enabled) {
            mSingleton.getOnBackInvokedDispatcher().registerOnBackInvokedCallback(0, backButtonCallback);
        } else {
            mSingleton.getOnBackInvokedDispatcher().unregisterOnBackInvokedCallback(backButtonCallback);
        }
        mBackKeyTrapEnabled = enabled;
    }

    @Override // android.app.Activity
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        String[] filelist;
        super.onActivityResult(requestCode, resultCode, data);
        if (mFileDialogState != null && mFileDialogState.requestCode == requestCode) {
            if (data != null && resultCode == -1) {
                Uri singleFileUri = data.getData();
                if (singleFileUri == null) {
                    ClipData clipData = data.getClipData();
                    if (clipData == null) {
                        throw new AssertionError();
                    }
                    filelist = new String[clipData.getItemCount()];
                    for (int i = 0; i < filelist.length; i++) {
                        String uri = clipData.getItemAt(i).getUri().toString();
                        filelist[i] = uri;
                    }
                } else {
                    if (mFileDialogState.type == 2 && mFileDialogState.persistable) {
                        mSingleton.getContentResolver().takePersistableUriPermission(singleFileUri, 3);
                    }
                    filelist = new String[]{singleFileUri.toString()};
                }
            } else {
                filelist = new String[0];
            }
            onNativeFileDialog(requestCode, filelist, -1);
            mFileDialogState = null;
        }
    }

    public static void manualBackButton() {
        mSingleton.pressBackButton();
    }

    public void pressBackButton() {
        runOnUiThread(new Runnable() { // from class: org.libsdl.app.SDLActivity.3
            @Override // java.lang.Runnable
            public void run() {
                if (!SDLActivity.this.isFinishing()) {
                    SDLActivity.this.superOnBackPressed();
                }
            }
        });
    }

    public void superOnBackPressed() {
        super.onBackPressed();
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean dispatchKeyEvent(KeyEvent event) {
        int keyCode;
        if (mBrokenLibraries || (keyCode = event.getKeyCode()) == 25 || keyCode == SDL_SYSTEM_CURSOR_ALIAS || keyCode == SDL_SYSTEM_CURSOR_GRAB || keyCode == 168 || keyCode == 169) {
            return $assertionsDisabled;
        }
        mDispatchingKeyEvent = true;
        boolean result = super.dispatchKeyEvent(event);
        mDispatchingKeyEvent = $assertionsDisabled;
        return result;
    }

    public static boolean dispatchingKeyEvent() {
        return mDispatchingKeyEvent;
    }

    public static void handleNativeState() {
        boolean readyToRun;
        if (mNextNativeState == mCurrentNativeState) {
            return;
        }
        if (mNextNativeState == NativeState.INIT) {
            mCurrentNativeState = mNextNativeState;
            return;
        }
        if (mNextNativeState == NativeState.PAUSED) {
            if (mSDLThread != null) {
                nativePause();
            }
            if (mSurface != null) {
                mSurface.handlePause();
            }
            mCurrentNativeState = mNextNativeState;
            return;
        }
        if (mNextNativeState == NativeState.RESUMED) {
            if (mSurface == null) {
                readyToRun = mIsResumedCalled;
            } else {
                readyToRun = (mSurface.mIsSurfaceReady && (mHasFocus || mHasMultiWindow) && mIsResumedCalled) ? true : $assertionsDisabled;
            }
            if (readyToRun) {
                if (mSDLThread == null) {
                    mSDLThread = new Thread(new SDLMain(), "SDLThread");
                    if (mSurface != null) {
                        mSurface.enableSensor(1, true);
                    }
                    mSDLThread.start();
                } else {
                    nativeResume();
                }
                if (mSurface != null) {
                    mSurface.handleResume();
                }
                mCurrentNativeState = mNextNativeState;
            }
        }
    }

    protected boolean onUnhandledMessage(int command, Object param) {
        return $assertionsDisabled;
    }

    protected static class SDLCommandHandler extends Handler {
        protected SDLCommandHandler() {
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            Window window;
            Context context = SDLActivity.getContext();
            if (context == null) {
                Log.e(SDLActivity.TAG, "error handling message, getContext() returned null");
            }
            switch (msg.arg1) {
                case 1:
                    if (context instanceof Activity) {
                        ((Activity) context).setTitle((String) msg.obj);
                        break;
                    } else {
                        Log.e(SDLActivity.TAG, "error handling message, getContext() returned no Activity");
                        break;
                    }
                case 2:
                    if (context instanceof Activity) {
                        Window window2 = ((Activity) context).getWindow();
                        if (window2 != null) {
                            if ((msg.obj instanceof Integer) && ((Integer) msg.obj).intValue() != 0) {
                                if (Build.VERSION.SDK_INT >= SDLActivity.SDL_SYSTEM_CURSOR_ROW_RESIZE) {
                                    WindowInsetsController controller = window2.getInsetsController();
                                    if (controller != null) {
                                        controller.hide(WindowInsets.Type.systemBars());
                                        controller.setSystemBarsBehavior(2);
                                    }
                                } else {
                                    window2.getDecorView().setSystemUiVisibility(5894);
                                    window2.addFlags(1024);
                                    window2.clearFlags(2048);
                                }
                                SDLActivity.mFullscreenModeActive = true;
                            } else {
                                if (Build.VERSION.SDK_INT >= SDLActivity.SDL_SYSTEM_CURSOR_ROW_RESIZE) {
                                    WindowInsetsController controller2 = window2.getInsetsController();
                                    if (controller2 != null) {
                                        controller2.setSystemBarsBehavior(1);
                                        controller2.show(WindowInsets.Type.systemBars());
                                    }
                                } else {
                                    window2.getDecorView().setSystemUiVisibility(T6TouchLayout.LEFT_SHOULDER);
                                    window2.addFlags(2048);
                                    window2.clearFlags(1024);
                                }
                                SDLActivity.mFullscreenModeActive = SDLActivity.$assertionsDisabled;
                            }
                            if (Build.VERSION.SDK_INT >= SDLActivity.SDL_SYSTEM_CURSOR_ROW_RESIZE) {
                                window2.getAttributes().layoutInDisplayCutoutMode = 3;
                                break;
                            }
                        }
                    } else {
                        Log.e(SDLActivity.TAG, "error handling message, getContext() returned no Activity");
                        break;
                    }
                    break;
                case 3:
                    if (SDLActivity.mTextEdit != null) {
                        SDLActivity.mTextEdit.setLayoutParams(new RelativeLayout.LayoutParams(0, 0));
                        InputMethodManager imm = (InputMethodManager) context.getSystemService("input_method");
                        imm.hideSoftInputFromWindow(SDLActivity.mTextEdit.getWindowToken(), 0);
                        SDLActivity.onNativeScreenKeyboardHidden();
                        SDLActivity.mSurface.requestFocus();
                        break;
                    }
                    break;
                case 4:
                default:
                    if ((context instanceof SDLActivity) && !((SDLActivity) context).onUnhandledMessage(msg.arg1, msg.obj)) {
                        Log.e(SDLActivity.TAG, "error handling message, command is " + msg.arg1);
                        break;
                    }
                    break;
                case T6TouchLayout.AdsFire.MAX_QUEUED /* 5 */:
                    if ((context instanceof Activity) && (window = ((Activity) context).getWindow()) != null) {
                        if ((msg.obj instanceof Integer) && ((Integer) msg.obj).intValue() != 0) {
                            window.addFlags(T6TouchLayout.RIGHT_THUMB);
                            break;
                        } else {
                            window.clearFlags(T6TouchLayout.RIGHT_THUMB);
                            break;
                        }
                    }
                    break;
            }
        }
    }

    protected boolean sendCommand(int command, Object data) {
        Message msg = this.commandHandler.obtainMessage();
        msg.arg1 = command;
        msg.obj = data;
        boolean result = this.commandHandler.sendMessage(msg);
        if (command == 2) {
            boolean bShouldWait = $assertionsDisabled;
            if (data instanceof Integer) {
                Display display = ((WindowManager) getSystemService("window")).getDefaultDisplay();
                DisplayMetrics realMetrics = new DisplayMetrics();
                display.getRealMetrics(realMetrics);
                SDLSurface sDLSurface = mSurface;
                boolean z = $assertionsDisabled;
                boolean bFullscreenLayout = sDLSurface != null && realMetrics.widthPixels == mSurface.getWidth() && realMetrics.heightPixels == mSurface.getHeight();
                if (((Integer) data).intValue() == 1) {
                    if (!bFullscreenLayout) {
                        z = true;
                    }
                    bShouldWait = z;
                } else {
                    bShouldWait = bFullscreenLayout;
                }
            }
            if (bShouldWait && getContext() != null) {
                synchronized (getContext()) {
                    try {
                        getContext().wait(500L);
                    } catch (InterruptedException ie) {
                        ie.printStackTrace();
                    }
                }
            }
        }
        return result;
    }

    public static boolean setActivityTitle(String title) {
        return mSingleton.sendCommand(1, title);
    }

    public static void setWindowStyle(boolean z) {
        mSingleton.sendCommand(2, Integer.valueOf(z ? 1 : 0));
    }

    public static void setOrientation(int w, int h, boolean resizable, String hint) {
        if (mSingleton != null) {
            mSingleton.setOrientationBis(w, h, resizable, hint);
        }
    }

    public void setOrientationBis(int w, int h, boolean resizable, String hint) {
        int req;
        int orientation_landscape = -1;
        int orientation_portrait = -1;
        if (w <= 1 || h <= 1) {
            return;
        }
        if (hint.contains("LandscapeRight") && hint.contains("LandscapeLeft")) {
            orientation_landscape = SDL_SYSTEM_CURSOR_POINTER;
        } else if (hint.contains("LandscapeLeft")) {
            orientation_landscape = 0;
        } else if (hint.contains("LandscapeRight")) {
            orientation_landscape = 8;
        }
        boolean contains_Portrait = hint.contains("Portrait ") || hint.endsWith("Portrait");
        if (contains_Portrait && hint.contains("PortraitUpsideDown")) {
            orientation_portrait = SDL_SYSTEM_CURSOR_NW_RESIZE;
        } else if (contains_Portrait) {
            orientation_portrait = 1;
        } else if (hint.contains("PortraitUpsideDown")) {
            orientation_portrait = 9;
        }
        boolean is_landscape_allowed = orientation_landscape != -1;
        boolean is_portrait_allowed = orientation_portrait != -1;
        if (!is_portrait_allowed && !is_landscape_allowed) {
            if (resizable) {
                req = SDL_SYSTEM_CURSOR_N_RESIZE;
            } else {
                req = w > h ? SDL_SYSTEM_CURSOR_NESW_RESIZE : SDL_SYSTEM_CURSOR_EW_RESIZE;
            }
        } else if (resizable) {
            if (is_portrait_allowed && is_landscape_allowed) {
                req = SDL_SYSTEM_CURSOR_N_RESIZE;
            } else {
                req = is_landscape_allowed ? orientation_landscape : orientation_portrait;
            }
        } else if (is_portrait_allowed && is_landscape_allowed) {
            req = w > h ? orientation_landscape : orientation_portrait;
        } else {
            req = is_landscape_allowed ? orientation_landscape : orientation_portrait;
        }
        Log.v(TAG, "setOrientation() requestedOrientation=" + req + " width=" + w + " height=" + h + " resizable=" + resizable + " hint=" + hint);
        mSingleton.setRequestedOrientation(req);
    }

    public static void minimizeWindow() {
        if (mSingleton == null) {
            return;
        }
        Intent startMain = new Intent("android.intent.action.MAIN");
        startMain.addCategory("android.intent.category.HOME");
        startMain.setFlags(268435456);
        mSingleton.startActivity(startMain);
    }

    public static boolean shouldMinimizeOnFocusLoss() {
        return $assertionsDisabled;
    }

    public static boolean supportsRelativeMouse() {
        if (Build.VERSION.SDK_INT < SDL_SYSTEM_CURSOR_GRAB && isDeXMode()) {
            return $assertionsDisabled;
        }
        return getMotionListener().supportsRelativeMouse();
    }

    public static boolean setRelativeMouseEnabled(boolean enabled) {
        if (enabled && !supportsRelativeMouse()) {
            return $assertionsDisabled;
        }
        return getMotionListener().setRelativeMouseEnabled(enabled);
    }

    public static boolean sendMessage(int command, int param) {
        if (mSingleton == null) {
            return $assertionsDisabled;
        }
        return mSingleton.sendCommand(command, Integer.valueOf(param));
    }

    public static Activity getContext() {
        return SDL.getContext();
    }

    public static boolean isAndroidTV() {
        UiModeManager uiModeManager = (UiModeManager) getContext().getSystemService("uimode");
        if (uiModeManager.getCurrentModeType() == 4) {
            return true;
        }
        if (Build.MANUFACTURER.equals("MINIX") && Build.MODEL.equals("NEO-U1")) {
            return true;
        }
        if (Build.MANUFACTURER.equals("Amlogic")) {
            if (Build.MODEL.startsWith("TV") || Build.MODEL.equals("X96-W") || Build.MODEL.equals("A95X-R1")) {
                return true;
            }
            return $assertionsDisabled;
        }
        return $assertionsDisabled;
    }

    public static boolean isVRHeadset() {
        if ((Build.MANUFACTURER.equals("Oculus") && Build.MODEL.startsWith("Quest")) || Build.MANUFACTURER.equals("Pico")) {
            return true;
        }
        return $assertionsDisabled;
    }

    static String getDeviceFormFactor() {
        if (isAndroidTV()) {
            return "tv";
        }
        if (isVRHeadset()) {
            return "headset";
        }
        if (isTablet()) {
            return "tablet";
        }
        return "phone";
    }

    public static double getDiagonal() {
        DisplayMetrics metrics = new DisplayMetrics();
        Activity activity = getContext();
        if (activity == null) {
            return 0.0d;
        }
        activity.getWindowManager().getDefaultDisplay().getMetrics(metrics);
        double dWidthInches = metrics.widthPixels / metrics.xdpi;
        double dHeightInches = metrics.heightPixels / metrics.ydpi;
        return Math.sqrt((dWidthInches * dWidthInches) + (dHeightInches * dHeightInches));
    }

    public static boolean isTablet() {
        if (getDiagonal() >= 7.0d) {
            return true;
        }
        return $assertionsDisabled;
    }

    public static boolean isChromebook() {
        if (getContext() != null && (getContext().getPackageManager().hasSystemFeature("org.chromium.arc") || getContext().getPackageManager().hasSystemFeature("org.chromium.arc.device_management"))) {
            return true;
        }
        boolean isChromebookEmulator = (Build.MODEL == null || !Build.MODEL.startsWith("sdk_gpc_")) ? $assertionsDisabled : true;
        return isChromebookEmulator;
    }

    public static boolean isDeXMode() {
        try {
            Configuration config = getContext().getResources().getConfiguration();
            Class<?> configClass = config.getClass();
            if (configClass.getField("SEM_DESKTOP_MODE_ENABLED").getInt(configClass) == configClass.getField("semDesktopModeEnabled").getInt(config)) {
                return true;
            }
            return $assertionsDisabled;
        } catch (Exception e) {
            return $assertionsDisabled;
        }
    }

    public static boolean getManifestEnvironmentVariables() throws PackageManager.NameNotFoundException {
        try {
            if (getContext() == null) {
                return $assertionsDisabled;
            }
            ApplicationInfo applicationInfo = getContext().getPackageManager().getApplicationInfo(getContext().getPackageName(), T6TouchLayout.RIGHT_THUMB);
            Bundle bundle = applicationInfo.metaData;
            if (bundle == null) {
                return $assertionsDisabled;
            }
            int trimLength = "SDL_ENV.".length();
            for (String key : bundle.keySet()) {
                if (key.startsWith("SDL_ENV.")) {
                    String name = key.substring(trimLength);
                    String value = bundle.get(key).toString();
                    nativeSetenv(name, value);
                }
            }
            return true;
        } catch (Exception e) {
            Log.v(TAG, "exception " + e.toString());
            return $assertionsDisabled;
        }
    }

    public static View getContentView() {
        return mLayout;
    }

    static class ShowTextInputTask implements Runnable {
        static final int HEIGHT_PADDING = 15;
        public int h;
        public int input_type;
        public int w;
        public int x;
        public int y;

        public ShowTextInputTask(int input_type, int x, int y, int w, int h) {
            this.input_type = input_type;
            this.x = x;
            this.y = y;
            this.w = w;
            this.h = h;
            if (this.w <= 0) {
                this.w = 1;
            }
            if (this.h + 15 <= 0) {
                this.h = -14;
            }
        }

        @Override // java.lang.Runnable
        public void run() {
            if (SDLActivity.mLayout == null) {
                return;
            }
            RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(this.w, this.h + 15);
            params.leftMargin = this.x;
            params.topMargin = this.y;
            if (SDLActivity.mTextEdit == null) {
                SDLActivity.mTextEdit = new SDLDummyEdit(SDLActivity.getContext());
                SDLActivity.mLayout.addView(SDLActivity.mTextEdit, params);
            } else {
                SDLActivity.mTextEdit.setLayoutParams(params);
            }
            SDLActivity.mTextEdit.setInputType(this.input_type);
            SDLActivity.mTextEdit.setVisibility(0);
            SDLActivity.mTextEdit.requestFocus();
            InputMethodManager imm = (InputMethodManager) SDLActivity.getContext().getSystemService("input_method");
            imm.showSoftInput(SDLActivity.mTextEdit, 0);
            if (imm.isAcceptingText()) {
                SDLActivity.onNativeScreenKeyboardShown();
            }
        }
    }

    public static boolean showTextInput(int input_type, int x, int y, int w, int h) {
        if (mLayout == null) {
            return $assertionsDisabled;
        }
        return mSingleton.commandHandler.post(new ShowTextInputTask(input_type, x, y, w, h));
    }

    public static boolean isTextInputEvent(KeyEvent event) {
        if (event.isCtrlPressed()) {
            return $assertionsDisabled;
        }
        if (event.isPrintingKey() || event.getKeyCode() == 62) {
            return true;
        }
        return $assertionsDisabled;
    }

    public static boolean handleKeyEvent(View v, int keyCode, KeyEvent event, InputConnection ic) {
        int deviceId = event.getDeviceId();
        int source = event.getSource();
        InputDevice device = InputDevice.getDevice(deviceId);
        if ((event.getFlags() & 1024) != 0) {
            return true;
        }
        if (source == 0 && device != null) {
            source = device.getSources();
        }
        if (SDL.isControllerManagerReady() && SDLControllerManager.isDeviceSDLJoystick(device)) {
            if (event.getAction() == 0) {
                if (SDLControllerManager.onNativePadDown(deviceId, keyCode, event.getScanCode())) {
                    return true;
                }
            } else if (event.getAction() == 1 && SDLControllerManager.onNativePadUp(deviceId, keyCode, event.getScanCode())) {
                return true;
            }
        }
        if ((source & 8194) == 8194 && !isVRHeadset() && (keyCode == 4 || keyCode == 125)) {
            switch (event.getAction()) {
            }
            return true;
        }
        if (event.getAction() == 0) {
            onNativeKeyDown(keyCode);
            if (isTextInputEvent(event)) {
                if (ic != null) {
                    ic.commitText(String.valueOf((char) event.getUnicodeChar()), 1);
                } else {
                    SDLInputConnection.nativeCommitText(String.valueOf((char) event.getUnicodeChar()), 1);
                }
            }
            return true;
        }
        if (event.getAction() == 1) {
            onNativeKeyUp(keyCode);
            return true;
        }
        return $assertionsDisabled;
    }

    public static Surface getNativeSurface() {
        if (mSurface == null) {
            return null;
        }
        return mSurface.getNativeSurface();
    }

    public static void initTouch() {
        int[] ids = InputDevice.getDeviceIds();
        for (int id : ids) {
            InputDevice device = InputDevice.getDevice(id);
            if (device != null && ((device.getSources() & 4098) == 4098 || device.isVirtual())) {
                nativeAddTouch(device.getId(), device.getName());
            }
        }
    }

    public int messageboxShowMessageBox(int flags, String title, String message, int[] buttonFlags, int[] buttonIds, String[] buttonTexts, int[] colors) {
        this.messageboxSelection[0] = -1;
        if (buttonFlags.length != buttonIds.length && buttonIds.length != buttonTexts.length) {
            return -1;
        }
        final Bundle args = new Bundle();
        args.putInt("flags", flags);
        args.putString("title", title);
        args.putString("message", message);
        args.putIntArray("buttonFlags", buttonFlags);
        args.putIntArray("buttonIds", buttonIds);
        args.putStringArray("buttonTexts", buttonTexts);
        args.putIntArray("colors", colors);
        runOnUiThread(new Runnable() { // from class: org.libsdl.app.SDLActivity.4
            @Override // java.lang.Runnable
            public void run() {
                SDLActivity.this.messageboxCreateAndShow(args);
            }
        });
        synchronized (this.messageboxSelection) {
            try {
                this.messageboxSelection.wait();
            } catch (InterruptedException ex) {
                ex.printStackTrace();
                return -1;
            }
        }
        return this.messageboxSelection[0];
    }

    protected void messageboxCreateAndShow(Bundle args) {
        int backgroundColor;
        int textColor;
        int buttonBackgroundColor;
        int i;
        SparseArray<Button> mapping;
        int buttonSelectedColor;
        int[] colors = args.getIntArray("colors");
        if (colors != null) {
            int i2 = (-1) + 1;
            backgroundColor = colors[i2];
            int i3 = i2 + 1;
            textColor = colors[i3];
            int i4 = i3 + 1;
            int i5 = colors[i4];
            int i6 = i4 + 1;
            buttonBackgroundColor = colors[i6];
            i = colors[i6 + 1];
        } else {
            backgroundColor = 0;
            textColor = 0;
            buttonBackgroundColor = 0;
            i = 0;
        }
        final AlertDialog alertDialogCreate = new AlertDialog.Builder(this).create();
        alertDialogCreate.setTitle(args.getString("title"));
        alertDialogCreate.setCancelable($assertionsDisabled);
        alertDialogCreate.setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: org.libsdl.app.SDLActivity.5
            @Override // android.content.DialogInterface.OnDismissListener
            public void onDismiss(DialogInterface unused) {
                synchronized (SDLActivity.this.messageboxSelection) {
                    SDLActivity.this.messageboxSelection.notify();
                }
            }
        });
        TextView message = new TextView(this);
        message.setGravity(SDL_SYSTEM_CURSOR_S_RESIZE);
        message.setText(args.getString("message"));
        if (textColor != 0) {
            message.setTextColor(textColor);
        }
        int[] buttonFlags = args.getIntArray("buttonFlags");
        int[] buttonIds = args.getIntArray("buttonIds");
        String[] buttonTexts = args.getStringArray("buttonTexts");
        SparseArray<Button> mapping2 = new SparseArray<>();
        LinearLayout buttons = new LinearLayout(this);
        buttons.setOrientation(0);
        buttons.setGravity(SDL_SYSTEM_CURSOR_S_RESIZE);
        int i7 = 0;
        while (i7 < buttonTexts.length) {
            Button button = new Button(this);
            final int id = buttonIds[i7];
            int[] colors2 = colors;
            button.setOnClickListener(new View.OnClickListener() { // from class: org.libsdl.app.SDLActivity.6
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    SDLActivity.this.messageboxSelection[0] = id;
                    alertDialogCreate.dismiss();
                }
            });
            if (buttonFlags[i7] != 0) {
                if ((buttonFlags[i7] & 1) != 0) {
                    mapping = mapping2;
                    mapping.put(66, button);
                } else {
                    mapping = mapping2;
                }
                if ((buttonFlags[i7] & 2) != 0) {
                    mapping.put(111, button);
                }
            } else {
                mapping = mapping2;
            }
            button.setText(buttonTexts[i7]);
            if (textColor != 0) {
                button.setTextColor(textColor);
            }
            if (buttonBackgroundColor == 0) {
                buttonSelectedColor = i;
            } else {
                Drawable drawable = button.getBackground();
                if (drawable == null) {
                    button.setBackgroundColor(buttonBackgroundColor);
                    buttonSelectedColor = i;
                } else {
                    buttonSelectedColor = i;
                    drawable.setColorFilter(buttonBackgroundColor, PorterDuff.Mode.MULTIPLY);
                }
            }
            buttons.addView(button);
            i7++;
            i = buttonSelectedColor;
            colors = colors2;
            mapping2 = mapping;
        }
        final SparseArray<Button> mapping3 = mapping2;
        LinearLayout content = new LinearLayout(this);
        content.setOrientation(1);
        content.addView(message);
        content.addView(buttons);
        if (backgroundColor != 0) {
            content.setBackgroundColor(backgroundColor);
        }
        alertDialogCreate.setView(content);
        alertDialogCreate.setOnKeyListener(new DialogInterface.OnKeyListener() { // from class: org.libsdl.app.SDLActivity.7
            @Override // android.content.DialogInterface.OnKeyListener
            public boolean onKey(DialogInterface d, int keyCode, KeyEvent event) {
                Button button2 = (Button) mapping3.get(keyCode);
                if (button2 != null) {
                    if (event.getAction() == 1) {
                        button2.performClick();
                    }
                    return true;
                }
                return SDLActivity.$assertionsDisabled;
            }
        });
        alertDialogCreate.show();
    }

    @Override // android.view.View.OnSystemUiVisibilityChangeListener
    public void onSystemUiVisibilityChange(int visibility) {
        Handler handler;
        if (mFullscreenModeActive) {
            if (((visibility & 4) == 0 || (visibility & 2) == 0) && (handler = getWindow().getDecorView().getHandler()) != null) {
                handler.removeCallbacks(this.rehideSystemUi);
                handler.postDelayed(this.rehideSystemUi, 2000L);
            }
        }
    }

    public static boolean clipboardHasText() {
        return mClipboardHandler.clipboardHasText();
    }

    public static String clipboardGetText() {
        return mClipboardHandler.clipboardGetText();
    }

    public static void clipboardSetText(String string) {
        mClipboardHandler.clipboardSetText(string);
    }

    public static int createCustomCursor(int[] colors, int width, int height, int hotSpotX, int hotSpotY) {
        Bitmap bitmap = Bitmap.createBitmap(colors, width, height, Bitmap.Config.ARGB_8888);
        mLastCursorID++;
        try {
            mCursors.put(Integer.valueOf(mLastCursorID), PointerIcon.create(bitmap, hotSpotX, hotSpotY));
            return mLastCursorID;
        } catch (Exception e) {
            return 0;
        }
    }

    public static void destroyCustomCursor(int cursorID) {
        try {
            mCursors.remove(Integer.valueOf(cursorID));
        } catch (Exception e) {
        }
    }

    public static boolean setCustomCursor(int cursorID) {
        try {
            mSurface.setPointerIcon(mCursors.get(Integer.valueOf(cursorID)));
            return true;
        } catch (Exception e) {
            return $assertionsDisabled;
        }
    }

    public static boolean setSystemCursor(int cursorID) {
        int cursor_type = 0;
        switch (cursorID) {
            case 0:
                cursor_type = 1000;
                break;
            case 1:
                cursor_type = 1008;
                break;
            case 2:
                cursor_type = 1004;
                break;
            case 3:
                cursor_type = 1007;
                break;
            case 4:
                cursor_type = 1004;
                break;
            case T6TouchLayout.AdsFire.MAX_QUEUED /* 5 */:
                cursor_type = 1017;
                break;
            case SDL_SYSTEM_CURSOR_NESW_RESIZE /* 6 */:
                cursor_type = 1016;
                break;
            case SDL_SYSTEM_CURSOR_EW_RESIZE /* 7 */:
                cursor_type = 1014;
                break;
            case 8:
                cursor_type = 1015;
                break;
            case 9:
                cursor_type = 1020;
                break;
            case SDL_SYSTEM_CURSOR_NOT_ALLOWED /* 10 */:
                cursor_type = 1012;
                break;
            case SDL_SYSTEM_CURSOR_POINTER /* 11 */:
                cursor_type = 1002;
                break;
            case SDL_SYSTEM_CURSOR_NW_RESIZE /* 12 */:
                cursor_type = 1017;
                break;
            case SDL_SYSTEM_CURSOR_N_RESIZE /* 13 */:
                cursor_type = 1015;
                break;
            case SDL_SYSTEM_CURSOR_NE_RESIZE /* 14 */:
                cursor_type = 1016;
                break;
            case 15:
                cursor_type = 1014;
                break;
            case 16:
                cursor_type = 1017;
                break;
            case SDL_SYSTEM_CURSOR_S_RESIZE /* 17 */:
                cursor_type = 1015;
                break;
            case SDL_SYSTEM_CURSOR_SW_RESIZE /* 18 */:
                cursor_type = 1016;
                break;
            case SDL_SYSTEM_CURSOR_W_RESIZE /* 19 */:
                cursor_type = 1014;
                break;
            case SDL_SYSTEM_CURSOR_CONTEXT_MENU /* 20 */:
                cursor_type = 1001;
                break;
            case SDL_SYSTEM_CURSOR_HELP /* 21 */:
                cursor_type = 1003;
                break;
            case SDL_SYSTEM_CURSOR_CELL /* 22 */:
                cursor_type = 1006;
                break;
            case SDL_SYSTEM_CURSOR_VERTICAL_TEXT /* 23 */:
                cursor_type = 1009;
                break;
            case SDL_SYSTEM_CURSOR_ALIAS /* 24 */:
                cursor_type = 1010;
                break;
            case 25:
                cursor_type = 1011;
                break;
            case SDL_SYSTEM_CURSOR_NO_DROP /* 26 */:
                cursor_type = 1012;
                break;
            case SDL_SYSTEM_CURSOR_GRAB /* 27 */:
                cursor_type = 1020;
                break;
            case SDL_SYSTEM_CURSOR_GRABBING /* 28 */:
                cursor_type = 1021;
                break;
            case SDL_SYSTEM_CURSOR_COL_RESIZE /* 29 */:
                cursor_type = 1014;
                break;
            case SDL_SYSTEM_CURSOR_ROW_RESIZE /* 30 */:
                cursor_type = 1015;
                break;
            case SDL_SYSTEM_CURSOR_ALL_SCROLL /* 31 */:
                cursor_type = 1013;
                break;
            case 32:
                cursor_type = 1018;
                break;
            case SDL_SYSTEM_CURSOR_ZOOM_OUT /* 33 */:
                cursor_type = 1019;
                break;
        }
        try {
            mSurface.setPointerIcon(PointerIcon.getSystemIcon(getContext(), cursor_type));
            return true;
        } catch (Exception e) {
            return $assertionsDisabled;
        }
    }

    public static void requestPermission(String permission, int requestCode) {
        Activity activity = getContext();
        if (activity.checkSelfPermission(permission) != 0) {
            activity.requestPermissions(new String[]{permission}, requestCode);
        } else {
            nativePermissionResult(requestCode, true);
        }
    }

    @Override // android.app.Activity
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        int length = grantResults.length;
        boolean z = $assertionsDisabled;
        if (length > 0 && grantResults[0] == 0) {
            z = true;
        }
        boolean result = z;
        nativePermissionResult(requestCode, result);
    }

    public static boolean openURL(String url) {
        try {
            Intent i = new Intent("android.intent.action.VIEW");
            i.setData(Uri.parse(url));
            i.addFlags(1208483840);
            mSingleton.startActivity(i);
            return true;
        } catch (Exception e) {
            return $assertionsDisabled;
        }
    }

    public static boolean showToast(String message, int duration, int gravity, int xOffset, int yOffset) {
        if (mSingleton == null) {
            return $assertionsDisabled;
        }
        try {
            mSingleton.runOnUiThread(new Runnable(message, duration, gravity, xOffset, yOffset) { // from class: org.libsdl.app.SDLActivity.1OneShotTask
                private final int mDuration;
                private final int mGravity;
                private final String mMessage;
                private final int mXOffset;
                private final int mYOffset;

                {
                    this.mMessage = message;
                    this.mDuration = duration;
                    this.mGravity = gravity;
                    this.mXOffset = xOffset;
                    this.mYOffset = yOffset;
                }

                @Override // java.lang.Runnable
                public void run() {
                    try {
                        Toast toast = Toast.makeText(SDLActivity.mSingleton, this.mMessage, this.mDuration);
                        if (this.mGravity >= 0) {
                            toast.setGravity(this.mGravity, this.mXOffset, this.mYOffset);
                        }
                        toast.show();
                    } catch (Exception ex) {
                        Log.e(SDLActivity.TAG, ex.getMessage());
                    }
                }
            });
            return true;
        } catch (Exception e) {
            return $assertionsDisabled;
        }
    }

    public static int openFileDescriptor(String uri, String mode) throws Exception {
        if (mSingleton == null) {
            return -1;
        }
        try {
            ParcelFileDescriptor pfd = mSingleton.getContentResolver().openFileDescriptor(Uri.parse(uri), mode);
            if (pfd != null) {
                return pfd.detachFd();
            }
            return -1;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public static boolean showFileDialog(String[] filters, boolean allowMultiple, int type, String initialPath, int requestCode) {
        boolean allowMultiple2;
        String action;
        if (mSingleton == null) {
            return $assertionsDisabled;
        }
        ArrayList<String> mimes = new ArrayList<>();
        MimeTypeMap mimeTypeMap = MimeTypeMap.getSingleton();
        int i = 1;
        if (filters != null && type != 2) {
            int length = filters.length;
            int i2 = 0;
            while (i2 < length) {
                String pattern = filters[i2];
                String[] extensions = pattern.split(";");
                if (extensions.length == i && extensions[0].equals("*")) {
                    mimes.add("*/*");
                } else {
                    for (String ext : extensions) {
                        String mime = mimeTypeMap.getMimeTypeFromExtension(ext);
                        if (mime != null) {
                            mimes.add(mime);
                        }
                    }
                }
                i2++;
                i = 1;
            }
        }
        Uri initialPathUri = null;
        if (initialPath != null && !initialPath.isEmpty()) {
            try {
                initialPathUri = Uri.parse(initialPath);
            } catch (Exception e) {
                Log.e(TAG, "Failed to parse initial path URI, ignoring initial path", e);
            }
        }
        boolean persistable = nativeGetHintBoolean("SDL_ANDROID_ALLOW_PERSISTENT_FOLDER_ACCESS", $assertionsDisabled);
        switch (type) {
            case 0:
                allowMultiple2 = allowMultiple;
                action = "android.intent.action.OPEN_DOCUMENT";
                break;
            case 1:
                allowMultiple2 = $assertionsDisabled;
                action = "android.intent.action.CREATE_DOCUMENT";
                break;
            case 2:
                allowMultiple2 = allowMultiple;
                action = "android.intent.action.OPEN_DOCUMENT_TREE";
                break;
            default:
                Log.e(TAG, "Unsupported file dialog type: " + type);
                return $assertionsDisabled;
        }
        Intent intent = new Intent(action);
        if (type != 2) {
            intent.addCategory("android.intent.category.OPENABLE");
            intent.putExtra("android.intent.extra.ALLOW_MULTIPLE", allowMultiple2);
            switch (mimes.size()) {
                case 0:
                    intent.setType("*/*");
                    break;
                case 1:
                    intent.setType(mimes.get(0));
                    break;
                default:
                    intent.setType("*/*");
                    intent.putExtra("android.intent.extra.MIME_TYPES", (String[]) mimes.toArray(new String[0]));
                    break;
            }
        } else {
            int intent_flags = 3;
            if (persistable) {
                intent_flags = 3 | 192;
            }
            intent.addFlags(intent_flags);
        }
        if (initialPathUri != null) {
            intent.putExtra("android.provider.extra.INITIAL_URI", initialPathUri);
        }
        if (type == 1 && initialPath != null && !initialPath.isEmpty() && !initialPath.endsWith("/") && !initialPath.endsWith("\\")) {
            String title = initialPath;
            int lastSeparator = Math.max(title.lastIndexOf(47), title.lastIndexOf(92));
            if (lastSeparator >= 0) {
                title = title.substring(lastSeparator + 1);
            }
            if (!title.isEmpty()) {
                intent.putExtra("android.intent.extra.TITLE", title);
            }
        }
        try {
            mSingleton.startActivityForResult(intent, requestCode);
            mFileDialogState = new SDLFileDialogState();
            mFileDialogState.requestCode = requestCode;
            mFileDialogState.type = type;
            mFileDialogState.persistable = persistable;
            return true;
        } catch (ActivityNotFoundException e2) {
            Log.e(TAG, "Unable to open dialog.", e2);
            return $assertionsDisabled;
        }
    }

    static class SDLFileDialogState {
        boolean persistable;
        int requestCode;
        int type;

        SDLFileDialogState() {
        }
    }

    public static String getPreferredLocales() {
        String result = "";
        LocaleList locales = LocaleList.getAdjustedDefault();
        for (int i = 0; i < locales.size(); i++) {
            if (i != 0) {
                result = result + ",";
            }
            result = result + formatLocale(locales.get(i));
        }
        return result;
    }

    public static String formatLocale(Locale locale) {
        String lang;
        if (locale.getLanguage() == "in") {
            lang = "id";
        } else if (locale.getLanguage() == "") {
            lang = "und";
        } else {
            lang = locale.getLanguage();
        }
        if (locale.getCountry() == "") {
            String result = lang;
            return result;
        }
        String result2 = lang + "_" + locale.getCountry();
        return result2;
    }
}
