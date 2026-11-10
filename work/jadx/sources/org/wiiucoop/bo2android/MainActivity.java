package org.wiiucoop.bo2android;

import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.Network;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.widget.RelativeLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import android.window.OnBackInvokedCallback;
import java.io.File;
import java.util.Locale;
import org.libsdl.app.SDLActivity;
import org.wiiucoop.bo2android.T6EngineCommand;
import org.wiiucoop.bo2android.T6SessionMenu;
import org.wiiucoop.bo2android.T6SessionState;
import org.wiiucoop.bo2android.T6TouchOverlay;

/* loaded from: classes3.dex */
public final class MainActivity extends SDLActivity implements View.OnClickListener {
    public static final String EXTRA_CONFIG_PATH = "org.wiiucoop.bo2android.CONFIG_PATH";
    public static final String EXTRA_MODE = "org.wiiucoop.bo2android.MODE";
    private static final long PANEL_ANIMATION_MS = 170;
    private static final long PROBE_INTERVAL_MS = 500;
    private static final String TAG = "t6android";
    private OnBackInvokedCallback backCallback;
    private TextView clientValue;
    private T6Config config;
    private boolean consoleKeyboard;
    private boolean consoleWasOpen;
    private TextView engineValue;
    private TextView folderValue;
    private TextView fpsBadge;
    private TextView fpsRequestedValue;
    private TextView fpsValue;
    private TextView hostStatus;
    private T6EngineCommand.Result lastFps;
    private boolean loggedTouchActive;
    private boolean loggedTouchSticks;
    private long loggedTouchSticksAt;
    private ConnectivityManager.NetworkCallback networkCallback;
    private View panelRoot;
    private View scrim;
    private View sheet;
    private TextView stateValue;
    private T6ConfigStore store;
    private T6TouchOverlay touchOverlay;
    private boolean touchShown;
    private final T6SessionMenu sessionMenu = new T6SessionMenu();
    private final Handler uiHandler = new Handler(Looper.getMainLooper());
    private final Runnable touchTick = new Runnable() { // from class: org.wiiucoop.bo2android.MainActivity.1
        @Override // java.lang.Runnable
        public void run() {
            MainActivity.this.updateTouchControls("tick");
            MainActivity.this.uiHandler.postDelayed(this, 250L);
        }
    };
    private final Runnable probe = new Runnable() { // from class: org.wiiucoop.bo2android.MainActivity.2
        @Override // java.lang.Runnable
        public void run() {
            MainActivity.this.refreshHostStatus();
            if (MainActivity.this.sessionMenu.isVisible()) {
                MainActivity.this.refreshPanel();
            }
            MainActivity.this.uiHandler.postDelayed(this, MainActivity.PROBE_INTERVAL_MS);
        }
    };
    private String hostStatusText = "";
    private T6SessionState.State hostStatusLoggedState = null;
    private String fpsRequested = "";
    private int loggedScrollY = Integer.MIN_VALUE;
    private String touchReason = "";
    private final T6TouchAuto touchAuto = new T6TouchAuto();
    private int loggedTouchButtons = -1;

    @Override // android.app.Activity, android.view.ContextThemeWrapper, android.content.ContextWrapper
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(T6Ui.wrapLocale(base));
    }

    @Override // org.libsdl.app.SDLActivity
    public void setOrientationBis(int w, int h, boolean resizable, String hint) {
        setRequestedOrientation(6);
    }

    @Override // org.libsdl.app.SDLActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        Intent intent = getIntent();
        boolean launchedByMenu = (intent == null || intent.getStringExtra(EXTRA_CONFIG_PATH) == null) ? false : true;
        if (!launchedByMenu) {
            Log.i(TAG, "host: MainActivity started without the menu's arguments; returning to the menu");
            Intent menu = new Intent(this, (Class<?>) MenuActivity.class);
            menu.addFlags(603979776);
            startActivity(menu);
            finish();
            return;
        }
        T6Ui.applyTheme(this);
        super.onCreate(savedInstanceState);
        followDefaultNetwork();
        T6Ui.applyImmersive(this);
        letterboxSurface();
        loadConfiguration();
        prepareHostStatus();
        prepareTouchControls();
        prepareSessionPanel();
        registerBackCallback();
        setHostStatusVisible(true);
        refreshHostStatus();
        refreshPanel();
    }

    private void letterboxSurface() {
        if (mLayout == null || mSurface == null) {
            return;
        }
        mLayout.setBackgroundColor(-16777216);
        mLayout.addOnLayoutChangeListener(new View.OnLayoutChangeListener() { // from class: org.wiiucoop.bo2android.MainActivity$$ExternalSyntheticLambda9
            @Override // android.view.View.OnLayoutChangeListener
            public final void onLayoutChange(View view, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
                MainActivity.lambda$letterboxSurface$0(view, i, i2, i3, i4, i5, i6, i7, i8);
            }
        });
    }

    static /* synthetic */ void lambda$letterboxSurface$0(View v, int left, int top, int right, int bottom, int oldLeft, int oldTop, int oldRight, int oldBottom) {
        int w = right - left;
        int h = bottom - top;
        if (w <= 0 || h <= 0 || mSurface == null) {
            return;
        }
        if (w == oldRight - oldLeft && h == oldBottom - oldTop) {
            return;
        }
        Log.i(TAG, "display: game surface fills the window, " + mSurface.getWidth() + "x" + mSurface.getHeight() + " inside " + w + "x" + h + String.format(Locale.ROOT, " (aspect %.4f)", Float.valueOf(w / h)));
    }

    @Override // org.libsdl.app.SDLActivity, android.app.Activity, android.view.Window.Callback
    public void onWindowFocusChanged(boolean hasFocus) {
        super.onWindowFocusChanged(hasFocus);
        if (hasFocus) {
            T6Ui.applyImmersive(this);
        }
    }

    @Override // org.libsdl.app.SDLActivity, android.app.Activity
    protected void onResume() throws NumberFormatException {
        super.onResume();
        T6Ui.applyImmersive(this);
        ensurePanelAttached();
        loadConfiguration();
        refreshHostStatus();
        refreshPanel();
        if (this.touchOverlay != null) {
            this.touchOverlay.setLayout(T6Ui.loadTouchLayout(this, T6Ui.touchProfile(this)));
            applyTouchOptions();
        }
        updateTouchControls("resume");
        startProbe();
    }

    @Override // org.libsdl.app.SDLActivity, android.app.Activity
    protected void onPause() {
        stopProbe();
        if (this.touchOverlay != null) {
            this.touchOverlay.setPadActive(false);
        }
        this.touchShown = false;
        super.onPause();
    }

    private void prepareTouchControls() {
        if (mLayout == null) {
            return;
        }
        this.touchOverlay = new T6TouchOverlay(this);
        this.touchOverlay.setCameraSink(new T6TouchOverlay.CameraSink() { // from class: org.wiiucoop.bo2android.MainActivity$$ExternalSyntheticLambda0
            @Override // org.wiiucoop.bo2android.T6TouchOverlay.CameraSink
            public final void onCamera(int i, int i2, float f, float f2) {
                T6Native.touch(i, 65536 + i2, f, f2);
            }
        });
        this.touchOverlay.setConsoleListener(new T6TouchOverlay.ConsoleListener() { // from class: org.wiiucoop.bo2android.MainActivity$$ExternalSyntheticLambda2
            @Override // org.wiiucoop.bo2android.T6TouchOverlay.ConsoleListener
            public final void onConsole() {
                this.f$0.openConsole();
            }
        });
        this.touchOverlay.setCommandListener(new T6TouchOverlay.CommandListener() { // from class: org.wiiucoop.bo2android.MainActivity$$ExternalSyntheticLambda3
            @Override // org.wiiucoop.bo2android.T6TouchOverlay.CommandListener
            public final void onCommand(String str) {
                MainActivity.lambda$prepareTouchControls$2(str);
            }
        });
        this.touchOverlay.setKeyListener(new T6TouchOverlay.KeyListener() { // from class: org.wiiucoop.bo2android.MainActivity$$ExternalSyntheticLambda4
            @Override // org.wiiucoop.bo2android.T6TouchOverlay.KeyListener
            public final void onKey(int i, boolean z) {
                MainActivity.lambda$prepareTouchControls$3(i, z);
            }
        });
        this.touchOverlay.setPadSink(new T6TouchOverlay.PadSink() { // from class: org.wiiucoop.bo2android.MainActivity$$ExternalSyntheticLambda5
            @Override // org.wiiucoop.bo2android.T6TouchOverlay.PadSink
            public final void onPad(boolean z, int i, int i2, int i3, int i4, int i5, int i6, int i7) {
                this.f$0.m17xaf30189b(z, i, i2, i3, i4, i5, i6, i7);
            }
        });
        this.touchOverlay.setVisibility(8);
        this.touchOverlay.addOnLayoutChangeListener(new View.OnLayoutChangeListener() { // from class: org.wiiucoop.bo2android.MainActivity$$ExternalSyntheticLambda6
            @Override // android.view.View.OnLayoutChangeListener
            public final void onLayoutChange(View view, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
                this.f$0.m18x1082b53a(view, i, i2, i3, i4, i5, i6, i7, i8);
            }
        });
        RelativeLayout.LayoutParams p = new RelativeLayout.LayoutParams(-1, -1);
        p.addRule(13);
        mLayout.addView(this.touchOverlay, p);
    }

    static /* synthetic */ void lambda$prepareTouchControls$2(String command) {
        String answer = T6Native.submitDvar(command, "next");
        Log.i(TAG, "touch: " + command + " -> " + answer.replace('\n', ' '));
    }

    static /* synthetic */ void lambda$prepareTouchControls$3(int vk, boolean down) {
        boolean sent = T6Native.sendKeyState(vk, down);
        Log.i(TAG, "touch: key 0x" + Integer.toHexString(vk) + (down ? " down" : " up") + (sent ? "" : " NOT queued"));
    }

    /* renamed from: lambda$prepareTouchControls$4$org-wiiucoop-bo2android-MainActivity, reason: not valid java name */
    /* synthetic */ void m17xaf30189b(boolean active, int buttons, int lt, int rt, int lx, int ly, int rx, int ry) {
        T6Native.setTouchPad(active, buttons, lt, rt, lx, ly, rx, ry);
        logTouchPad(active, buttons, lt, rt, lx, ly, rx, ry);
    }

    /* renamed from: lambda$prepareTouchControls$5$org-wiiucoop-bo2android-MainActivity, reason: not valid java name */
    /* synthetic */ void m18x1082b53a(View v, int l, int t, int r, int b, int ol, int ot, int or, int ob) {
        int w = r - l;
        int h = b - t;
        if (w <= 0 || h <= 0) {
            return;
        }
        if (w != or - ol || h != ob - ot) {
            T6Ui.setString(this, T6Ui.KEY_TOUCH_SURFACE, w + "x" + h);
            Log.i(TAG, "touch: game surface " + w + "x" + h + " (recorded for the controls editor)");
        }
    }

    private void toggleTouchControls() {
        String next;
        String mode = T6Ui.getString(this, T6Ui.KEY_TOUCH_MODE, "auto");
        String str = "on";
        boolean enabled = "on".equals(mode) || ("auto".equals(mode) && (T6Native.connectedPads() == 0 || this.touchAuto.touchTookOver()));
        if (!enabled) {
            next = "on";
        } else {
            next = "off";
        }
        T6Ui.setString(this, T6Ui.KEY_TOUCH_MODE, next);
        StringBuilder sbAppend = new StringBuilder().append("session menu: virtual controls ");
        if (enabled) {
            str = "off";
        }
        Log.i(TAG, sbAppend.append(str).append(" (touch_mode ").append(mode).append(" -> ").append(next).append(")").toString());
        updateTouchControls("side menu");
    }

    private void refreshTouchBadge(String mode, int pads) {
        TextView badge;
        if (this.panelRoot == null || (badge = (TextView) this.panelRoot.findViewById(R.id.session_touch_badge)) == null) {
            return;
        }
        if (!"off".equals(mode)) {
            if (!"auto".equals(mode) || pads <= 0 || this.touchAuto.touchTookOver()) {
                badge.setText(R.string.session_touch_on);
                return;
            } else {
                badge.setText(R.string.session_touch_auto_pad);
                return;
            }
        }
        badge.setText(R.string.session_touch_off);
    }

    private void applyTouchOptions() throws NumberFormatException {
        int threshold;
        try {
            threshold = Integer.parseInt(T6Ui.getString(this, T6Ui.KEY_TOUCH_SPRINT_THRESHOLD, "85"));
        } catch (NumberFormatException e) {
            threshold = 85;
        }
        boolean aimDrag = T6Ui.getBool(this, T6Ui.KEY_TOUCH_AIM_DRAG, true);
        boolean stickSprint = T6Ui.getBool(this, T6Ui.KEY_TOUCH_STICK_SPRINT, true);
        boolean adsFire = T6Ui.getBool(this, T6Ui.KEY_TOUCH_ADS_FIRE, false);
        this.touchOverlay.setOptions(aimDrag, stickSprint, threshold / 100.0f, adsFire);
        Log.i(TAG, "touch options: aim drag " + aimDrag + ", stick sprint " + stickSprint + " at " + threshold + "%, ads+fire " + adsFire);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void openConsole() {
        boolean sent = T6Native.sendKey(192);
        Log.i(TAG, "touch: CMD -> console key " + (sent ? "sent" : "NOT queued"));
        if (sent && !this.consoleWasOpen) {
            T6Native.setTextInput(true);
            this.consoleKeyboard = true;
        }
    }

    private void logTouchPad(boolean active, int buttons, int lt, int rt, int lx, int ly, int rx, int ry) {
        int pressed = buttons | (lt > 0 ? 65536 : 0) | (rt > 0 ? T6TouchLayout.RIGHT_TRIGGER : 0);
        long now = SystemClock.uptimeMillis();
        boolean sticks = (lx == 0 && ly == 0 && rx == 0 && ry == 0) ? false : true;
        if (pressed != this.loggedTouchButtons || active != this.loggedTouchActive || sticks != this.loggedTouchSticks || (sticks && now - this.loggedTouchSticksAt >= PROBE_INTERVAL_MS)) {
            this.loggedTouchButtons = pressed;
            this.loggedTouchActive = active;
            this.loggedTouchSticks = sticks;
            if (sticks) {
                this.loggedTouchSticksAt = now;
            }
            Log.i(TAG, "touch pad: " + (active ? "active" : "inactive") + " buttons 0x" + Integer.toHexString(pressed) + " left " + lx + "," + ly + " right " + rx + "," + ry);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateTouchControls(String why) {
        if (this.touchOverlay == null) {
            return;
        }
        String mode = T6Ui.getString(this, T6Ui.KEY_TOUCH_MODE, "auto");
        int pads = T6Native.connectedPads();
        int client = T6Native.clientState();
        boolean gameplay = T6Native.inGameplay(client);
        boolean console = T6Native.consoleOpen(client);
        if (console != this.consoleWasOpen) {
            Log.i(TAG, "touch: engine console " + (console ? "opened" : "closed"));
            this.touchOverlay.releaseAll();
            if (!console && this.consoleKeyboard) {
                T6Native.setTextInput(false);
                this.consoleKeyboard = false;
            }
            this.consoleWasOpen = console;
        }
        boolean show = this.touchAuto.show(mode, gameplay, pads);
        boolean active = show && !this.sessionMenu.isVisible();
        String reason = "mode " + mode + ", " + (pads < 0 ? "gamepads unknown" : pads + " SDL gamepad(s)") + (this.touchAuto.touchTookOver() ? ", touch took over" : "") + ", " + (gameplay ? "gameplay" : "engine menu");
        if (show != this.touchShown || !reason.equals(this.touchReason)) {
            Log.i(TAG, "touch controls: " + (show ? "shown" : "hidden") + " (" + reason + ", " + why + ")");
            this.touchReason = reason;
        }
        this.touchShown = show;
        this.touchOverlay.setVisibility(show ? 0 : 8);
        this.touchOverlay.setPadActive(active);
        if (active && new File(getFilesDir(), "touch_selftest.request").delete()) {
            Log.i(TAG, "touch selftest: requested; running in gameplay");
            T6TouchSelfTest.run(mLayout, this.uiHandler, this.touchOverlay.getLayout());
        }
        refreshTouchBadge(mode, pads);
    }

    @Override // org.libsdl.app.SDLActivity, android.app.Activity
    protected void onDestroy() throws InterruptedException {
        stopProbe();
        if (this.networkCallback != null) {
            try {
                ((ConnectivityManager) getSystemService("connectivity")).unregisterNetworkCallback(this.networkCallback);
            } catch (RuntimeException e) {
            }
            this.networkCallback = null;
        }
        if (this.backCallback != null && Build.VERSION.SDK_INT >= 33) {
            getOnBackInvokedDispatcher().unregisterOnBackInvokedCallback(this.backCallback);
            this.backCallback = null;
        }
        super.onDestroy();
    }

    @Override // org.libsdl.app.SDLActivity
    protected String[] getLibraries() {
        return new String[]{"SDL3", "t6host"};
    }

    @Override // org.libsdl.app.SDLActivity
    protected String[] getArguments() {
        String configPath = null;
        String mode = null;
        if (getIntent() != null) {
            configPath = getIntent().getStringExtra(EXTRA_CONFIG_PATH);
            mode = getIntent().getStringExtra(EXTRA_MODE);
        }
        if (configPath == null || configPath.isEmpty()) {
            configPath = new File(getFilesDir(), T6Config.FILE_NAME).getAbsolutePath();
        }
        if (mode == null || !T6Config.isKnownMode(mode)) {
            mode = "";
        }
        return new String[]{"--config", configPath, "--mode", mode};
    }

    @Override // org.libsdl.app.SDLActivity, android.app.Activity, android.view.Window.Callback
    public boolean dispatchKeyEvent(KeyEvent event) {
        if (event.getAction() == 0 && isFromPad(event.getSource())) {
            onPadInput();
        }
        if (T6SessionMenu.isBackKey(event.getKeyCode()) && !T6SessionMenu.isPanelBack(event.getKeyCode(), event.getSource(), event.getFlags())) {
            if (event.getAction() == 1) {
                Log.i(TAG, "back key from a controller (source 0x" + Integer.toHexString(event.getSource()) + ", flags 0x" + Integer.toHexString(event.getFlags()) + "): not the panel");
            }
            if ((event.getFlags() & 1024) != 0) {
                return true;
            }
            return super.dispatchKeyEvent(event);
        }
        if (T6SessionMenu.isBackKey(event.getKeyCode())) {
            if (T6SessionMenu.isBackPress(event.getKeyCode(), event.getAction())) {
                handleBack();
            }
            return true;
        }
        return super.dispatchKeyEvent(event);
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean dispatchTouchEvent(MotionEvent event) {
        if (event.getActionMasked() == 0 && this.touchOverlay != null && !this.touchShown && !this.sessionMenu.isVisible()) {
            int client = T6Native.clientState();
            String mode = T6Ui.getString(this, T6Ui.KEY_TOUCH_MODE, "auto");
            if (this.touchAuto.onScreenTouch(mode, T6Native.inGameplay(client), T6Native.connectedPads())) {
                updateTouchControls("screen touch");
            }
        }
        return super.dispatchTouchEvent(event);
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean dispatchGenericMotionEvent(MotionEvent event) {
        if (isFromPad(event.getSource()) && event.getActionMasked() == 2) {
            int[] axes = {0, 1, 11, 14, 17, 18, 15, 16};
            int length = axes.length;
            int i = 0;
            while (true) {
                if (i >= length) {
                    break;
                }
                int axis = axes[i];
                if (Math.abs(event.getAxisValue(axis)) <= 0.5f) {
                    i++;
                } else {
                    onPadInput();
                    break;
                }
            }
        }
        return super.dispatchGenericMotionEvent(event);
    }

    private static boolean isFromPad(int source) {
        return (source & T6SessionMenu.SOURCE_GAMEPAD) == 1025 || (source & T6SessionMenu.SOURCE_JOYSTICK) == 16777232;
    }

    private void onPadInput() {
        if (this.touchAuto.onPadInput()) {
            updateTouchControls("gamepad input");
        }
    }

    @Override // org.libsdl.app.SDLActivity, android.app.Activity
    public void onBackPressed() {
        handleBack();
    }

    private void registerBackCallback() {
        if (Build.VERSION.SDK_INT < 33) {
            return;
        }
        this.backCallback = new OnBackInvokedCallback() { // from class: org.wiiucoop.bo2android.MainActivity.3
            @Override // android.window.OnBackInvokedCallback
            public void onBackInvoked() {
                MainActivity.this.handleBack();
            }
        };
        getOnBackInvokedDispatcher().registerOnBackInvokedCallback(0, this.backCallback);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleBack() {
        if (isFinishing()) {
        }
        switch (this.sessionMenu.onBack(isHostRunning())) {
            case CLOSE_PANEL:
                closePanel("voltar");
                break;
            case OPEN_PANEL:
                openPanel();
                break;
            default:
                leaveSession("voltar sem sessão ativa");
                break;
        }
    }

    private boolean isHostRunning() {
        T6SessionState state = T6SessionState.read();
        return !state.answered || state.isHostRunning();
    }

    private void prepareSessionPanel() {
        if (mLayout == null) {
            Log.i(TAG, "session menu: the host window does not exist yet; no panel to prepare");
            return;
        }
        try {
            LayoutInflater inflater = LayoutInflater.from(this);
            this.panelRoot = inflater.inflate(R.layout.view_session_panel, mLayout, false);
            this.sheet = this.panelRoot.findViewById(R.id.session_panel_sheet);
            this.scrim = this.panelRoot.findViewById(R.id.session_panel_scrim);
            this.fpsRequestedValue = null;
            this.fpsBadge = (TextView) this.panelRoot.findViewById(R.id.session_fps_badge);
            this.panelRoot.findViewById(R.id.row_session_exit).setOnClickListener(this);
            this.panelRoot.findViewById(R.id.row_session_fps).setOnClickListener(this);
            this.panelRoot.findViewById(R.id.row_session_controls).setOnClickListener(this);
            this.panelRoot.findViewById(R.id.row_session_keyboard).setOnClickListener(this);
            this.panelRoot.findViewById(R.id.row_session_console).setOnClickListener(this);
            this.panelRoot.findViewById(R.id.row_session_touch).setOnClickListener(this);
            this.panelRoot.findViewById(R.id.row_session_logs).setOnClickListener(this);
            this.scrim.setOnClickListener(this);
            if (this.sheet instanceof ScrollView) {
                ((ScrollView) this.sheet).setOnScrollChangeListener(new View.OnScrollChangeListener() { // from class: org.wiiucoop.bo2android.MainActivity$$ExternalSyntheticLambda10
                    @Override // android.view.View.OnScrollChangeListener
                    public final void onScrollChange(View view, int i, int i2, int i3, int i4) {
                        this.f$0.m16x32b247ec(view, i, i2, i3, i4);
                    }
                });
            }
            this.panelRoot.setVisibility(8);
            mLayout.addView(this.panelRoot);
        } catch (RuntimeException e) {
            this.panelRoot = null;
            Log.w(TAG, "session menu: the panel could not be inflated: " + e);
        }
    }

    /* renamed from: lambda$prepareSessionPanel$6$org-wiiucoop-bo2android-MainActivity, reason: not valid java name */
    /* synthetic */ void m16x32b247ec(View view, int scrollX, int scrollY, int oldScrollX, int oldScrollY) {
        onSheetScrolled(scrollY);
    }

    private void ensurePanelAttached() {
        if (mLayout == null) {
            return;
        }
        if (this.panelRoot == null) {
            prepareSessionPanel();
        } else if (this.panelRoot.getParent() == null) {
            mLayout.addView(this.panelRoot);
        }
    }

    private void openPanel() {
        ensurePanelAttached();
        if (this.touchOverlay != null) {
            this.touchOverlay.setPadActive(false);
        }
        if (this.panelRoot == null) {
            Log.i(TAG, "session menu: no panel is available; treating back as leaving");
            leaveSession("painel indisponível");
            return;
        }
        this.sessionMenu.open();
        Log.i(TAG, "session menu: opened by back");
        this.panelRoot.setVisibility(0);
        if (this.sheet instanceof ScrollView) {
            ((ScrollView) this.sheet).scrollTo(0, 0);
        }
        setHostStatusVisible(false);
        float width = sheetWidth();
        this.sheet.setTranslationX(-width);
        this.sheet.animate().translationX(0.0f).setDuration(PANEL_ANIMATION_MS).start();
        this.scrim.setAlpha(0.0f);
        this.scrim.animate().alpha(1.0f).setDuration(PANEL_ANIMATION_MS).start();
        refreshPanel();
        logPanelState("painel aberto");
        this.loggedScrollY = 0;
        this.uiHandler.postDelayed(new Runnable() { // from class: org.wiiucoop.bo2android.MainActivity$$ExternalSyntheticLambda7
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m15lambda$openPanel$7$orgwiiucoopbo2androidMainActivity();
            }
        }, 250L);
    }

    /* renamed from: lambda$openPanel$7$org-wiiucoop-bo2android-MainActivity, reason: not valid java name */
    /* synthetic */ void m15lambda$openPanel$7$orgwiiucoopbo2androidMainActivity() {
        logRowGeometry("painel aberto");
    }

    private void logRowGeometry(String reason) {
        if (this.panelRoot == null || this.panelRoot.getVisibility() != 0) {
            return;
        }
        int[] window = new int[2];
        this.panelRoot.getLocationOnScreen(window);
        int windowTop = window[1];
        int windowBottom = windowTop + this.panelRoot.getHeight();
        logRowBounds(R.id.row_session_exit, "row_session_exit", reason, windowTop, windowBottom);
        logRowBounds(R.id.row_session_fps, "row_session_fps", reason, windowTop, windowBottom);
        logRowBounds(R.id.row_session_controls, "row_session_controls", reason, windowTop, windowBottom);
        if (this.sheet instanceof ScrollView) {
            ScrollView scroll = (ScrollView) this.sheet;
            View content = scroll.getChildCount() > 0 ? scroll.getChildAt(0) : null;
            Log.i(TAG, "session menu: " + reason + " -> sheet scroll " + scroll.getScrollY() + " content " + (content != null ? content.getHeight() : 0) + " viewport " + scroll.getHeight());
        }
    }

    private void logRowBounds(int id, String name, String reason, int windowTop, int windowBottom) {
        View row = this.panelRoot.findViewById(id);
        if (row == null || row.getVisibility() != 0) {
            return;
        }
        int[] position = new int[2];
        row.getLocationOnScreen(position);
        int top = position[1];
        int bottom = row.getHeight() + top;
        Log.i(TAG, "session menu: " + reason + " -> " + name + " tap " + (position[0] + (row.getWidth() / 2)) + "," + ((row.getHeight() / 2) + top) + " bounds " + position[0] + "," + top + ".." + (position[0] + row.getWidth()) + "," + bottom + " inside " + (top >= windowTop && bottom <= windowBottom));
    }

    private void onSheetScrolled(int scrollY) {
        if (Math.abs(scrollY - this.loggedScrollY) < 16) {
            return;
        }
        this.loggedScrollY = scrollY;
        logRowGeometry("sheet at " + scrollY);
    }

    private void closePanel(String reason) {
        this.sessionMenu.close();
        updateTouchControls("panel closed");
        if (this.panelRoot == null || this.panelRoot.getVisibility() != 0) {
            if (this.panelRoot != null) {
                this.panelRoot.setVisibility(8);
            }
            setHostStatusVisible(true);
            refreshHostStatus();
            return;
        }
        Log.i(TAG, "session menu: closed by " + reason);
        setHostStatusVisible(true);
        refreshHostStatus();
        this.sheet.animate().translationX(-sheetWidth()).setDuration(PANEL_ANIMATION_MS).start();
        this.scrim.animate().alpha(0.0f).setDuration(PANEL_ANIMATION_MS).withEndAction(new Runnable() { // from class: org.wiiucoop.bo2android.MainActivity$$ExternalSyntheticLambda8
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m14lambda$closePanel$8$orgwiiucoopbo2androidMainActivity();
            }
        }).start();
    }

    /* renamed from: lambda$closePanel$8$org-wiiucoop-bo2android-MainActivity, reason: not valid java name */
    /* synthetic */ void m14lambda$closePanel$8$orgwiiucoopbo2androidMainActivity() {
        if (!this.sessionMenu.isVisible() && this.panelRoot != null) {
            this.panelRoot.setVisibility(8);
        }
    }

    private void followDefaultNetwork() {
        try {
            ConnectivityManager cm = (ConnectivityManager) getSystemService("connectivity");
            this.networkCallback = new ConnectivityManager.NetworkCallback() { // from class: org.wiiucoop.bo2android.MainActivity.4
                @Override // android.net.ConnectivityManager.NetworkCallback
                public void onAvailable(Network network) {
                    Log.i(MainActivity.TAG, "network: default network is now " + network);
                    T6Native.setNetwork(network.getNetworkHandle());
                }

                @Override // android.net.ConnectivityManager.NetworkCallback
                public void onLost(Network network) {
                    Log.i(MainActivity.TAG, "network: default network " + network + " lost");
                }
            };
            cm.registerDefaultNetworkCallback(this.networkCallback);
        } catch (RuntimeException e) {
            Log.w(TAG, "network: default network callback unavailable: " + e);
            this.networkCallback = null;
        }
    }

    private void leaveSession(String reason) {
        Log.i(TAG, "session menu: leaving the session (" + reason + ")");
        this.sessionMenu.close();
        stopProbe();
        if (this.panelRoot != null) {
            this.panelRoot.setVisibility(8);
        }
        finish();
    }

    private void prepareHostStatus() {
        if (!T6Ui.debugOverlayEnabled(this)) {
            Log.i(TAG, "host status: strip disabled (debug overlay off); state is logged only");
            return;
        }
        if (mLayout == null) {
            Log.i(TAG, "host status: the host window does not exist yet; no strip to prepare");
            return;
        }
        try {
            LayoutInflater inflater = LayoutInflater.from(this);
            this.hostStatus = (TextView) inflater.inflate(R.layout.view_host_status, mLayout, false);
            mLayout.addView(this.hostStatus);
            Log.i(TAG, "host status: strip added to the host window");
        } catch (RuntimeException e) {
            this.hostStatus = null;
            Log.w(TAG, "host status: the strip could not be inflated: " + e);
        }
    }

    private void setHostStatusVisible(boolean visible) {
        if (this.hostStatus == null) {
            return;
        }
        if (this.hostStatus.getParent() == null && mLayout != null) {
            mLayout.addView(this.hostStatus);
        }
        this.hostStatus.setVisibility(visible ? 0 : 8);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void refreshHostStatus() {
        if (this.hostStatus == null) {
            return;
        }
        T6SessionState state = T6SessionState.read();
        String text = T6SessionMenu.statusLine(state, this.sessionMenu.isVisible());
        if (!text.equals(this.hostStatusText)) {
            this.hostStatusText = text;
            this.hostStatus.setText(text);
            if (state.state != this.hostStatusLoggedState) {
                this.hostStatusLoggedState = state.state;
                Log.i(TAG, "host status strip -> " + text);
            }
        }
    }

    private float sheetWidth() {
        int width = this.sheet == null ? 0 : this.sheet.getWidth();
        return width > 0 ? width : getResources().getDisplayMetrics().density * 324.0f;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        int id = view.getId();
        if (id == R.id.row_session_exit) {
            leaveSession("item SAIR");
            return;
        }
        if (id == R.id.row_session_fps) {
            toggleDxvkHud();
            return;
        }
        if (id == R.id.row_session_controls) {
            startActivity(new Intent(this, (Class<?>) TouchControlsActivity.class));
            closePanel("item Editar Controles");
            return;
        }
        if (id == R.id.row_session_touch) {
            toggleTouchControls();
            return;
        }
        if (id == R.id.row_session_keyboard) {
            closePanel("item Teclado");
            T6Native.setTextInput(true);
            Toast.makeText(this, R.string.session_keyboard_opened, 0).show();
        } else if (id == R.id.row_session_console) {
            closePanel("item Console");
            openConsole();
        } else if (id == R.id.row_session_logs) {
            startActivity(new Intent(this, (Class<?>) LogsActivity.class));
            closePanel("item Logs");
        } else if (id == R.id.session_panel_scrim) {
            closePanel("toque fora do painel");
        }
    }

    private void toggleDxvkHud() {
        boolean enable = !T6Ui.getBool(this, T6Ui.KEY_SHOW_FPS, false);
        T6Ui.setBool(this, T6Ui.KEY_SHOW_FPS, enable);
        refreshPanel();
        Log.i(TAG, "session menu: DXVK HUD set " + (enable ? "on" : "off") + " (from the next start)");
        Toast.makeText(this, enable ? R.string.session_hud_on : R.string.session_hud_off, 0).show();
    }

    private void requestFpsOverlay() {
        boolean current;
        int i;
        boolean zIsEmpty = this.fpsRequested.isEmpty();
        String str = T6EngineCommand.VALUE_ON;
        if (zIsEmpty) {
            current = T6Ui.getBool(this, T6Ui.KEY_SHOW_FPS, false);
        } else {
            current = T6EngineCommand.VALUE_ON.equals(this.fpsRequested);
        }
        boolean enable = !current;
        this.lastFps = T6EngineCommand.setFpsOverlay(enable);
        if (this.lastFps.applied) {
            T6Ui.setBool(this, T6Ui.KEY_SHOW_FPS, enable);
        }
        if (!enable) {
            str = T6EngineCommand.VALUE_OFF;
        }
        this.fpsRequested = str;
        refreshPanel();
        logPanelState("item Exibir FPS");
        this.uiHandler.postDelayed(new Runnable() { // from class: org.wiiucoop.bo2android.MainActivity$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m19lambda$requestFpsOverlay$9$orgwiiucoopbo2androidMainActivity();
            }
        }, PANEL_ANIMATION_MS);
        Log.i(TAG, "session menu: cg_drawfps badge = " + ((Object) (this.fpsBadge == null ? "" : this.fpsBadge.getText())));
        String answer = T6EngineCommand.describe(this.lastFps, T6EngineCommand.DVAR_FPS_OVERLAY, this.fpsRequested);
        Log.i(TAG, "session menu: cg_drawfps request -> " + answer);
        if (this.lastFps.applied) {
            i = enable ? R.string.session_fps_on : R.string.session_fps_off;
        } else {
            i = R.string.session_fps_not_applied;
        }
        Toast.makeText(this, i, 0).show();
    }

    /* renamed from: lambda$requestFpsOverlay$9$org-wiiucoop-bo2android-MainActivity, reason: not valid java name */
    /* synthetic */ void m19lambda$requestFpsOverlay$9$orgwiiucoopbo2androidMainActivity() {
        logRowGeometry("item Exibir FPS");
    }

    private void logPanelState(String reason) {
        if (this.panelRoot == null) {
            return;
        }
        T6SessionMenu.Snapshot snapshot = T6SessionMenu.snapshot(this.config, T6SessionState.read(), this.lastFps, this.fpsRequested);
        Log.i(TAG, "session menu: " + reason + " -> " + snapshot.session);
        Log.i(TAG, "session menu: " + reason + " -> " + snapshot.engine);
        Log.i(TAG, "session menu: " + reason + " -> " + snapshot.client);
        Log.i(TAG, "session menu: " + reason + " -> " + snapshot.folder);
        Log.i(TAG, "session menu: " + reason + " -> " + snapshot.fps);
    }

    private void startProbe() {
        this.uiHandler.removeCallbacks(this.probe);
        this.uiHandler.postDelayed(this.probe, PROBE_INTERVAL_MS);
        this.uiHandler.removeCallbacks(this.touchTick);
        this.uiHandler.post(this.touchTick);
    }

    private void stopProbe() {
        this.uiHandler.removeCallbacks(this.probe);
        this.uiHandler.removeCallbacks(this.touchTick);
    }

    private void loadConfiguration() {
        if (this.store == null) {
            this.store = new T6ConfigStore(new File(getFilesDir(), T6Config.FILE_NAME));
        }
        this.config = this.store.load();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void refreshPanel() {
        if (this.panelRoot == null) {
            return;
        }
        T6SessionState state = T6SessionState.read();
        T6SessionMenu.Snapshot snapshot = T6SessionMenu.snapshot(this.config, state, this.lastFps, this.fpsRequested);
        setText(this.stateValue, snapshot.session);
        setText(this.engineValue, snapshot.engine);
        setText(this.clientValue, snapshot.client);
        setText(this.folderValue, snapshot.folder);
        setText(this.fpsValue, snapshot.fps);
        if (this.fpsRequestedValue != null) {
            this.fpsRequestedValue.setText(this.lastFps == null ? "" : "cg_drawfps " + this.fpsRequested);
        }
        if (this.fpsBadge != null) {
            this.fpsBadge.setText(T6Ui.getBool(this, T6Ui.KEY_SHOW_FPS, false) ? R.string.session_hud_badge_on : R.string.session_hud_badge_off);
        }
    }

    private void setText(TextView view, String text) {
        if (view != null) {
            view.setText(text);
        }
    }
}
