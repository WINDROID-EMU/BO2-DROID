package org.libsdl.app;

import android.app.Activity;
import android.content.Context;
import java.lang.reflect.Method;

/* loaded from: classes2.dex */
public class SDL {
    public static final int SDL_INIT_AUDIO = 16;
    public static final int SDL_INIT_CAMERA = 65536;
    private static final int SDL_INIT_CONTROLLER = 12800;
    public static final int SDL_INIT_GAMEPAD = 8192;
    public static final int SDL_INIT_HAPTIC = 4096;
    public static final int SDL_INIT_JOYSTICK = 512;
    public static final int SDL_INIT_SENSOR = 32768;
    public static final int SDL_INIT_VIDEO = 32;
    protected static Activity mContext;
    public static final int SDL_INIT_EVERYTHING = 111152;
    private static int mInitializedSubsystems = SDL_INIT_EVERYTHING;
    private static int mCompiledSubsystems = SDL_INIT_EVERYTHING;

    public static void setupJNI() {
        setupJNI(SDL_INIT_EVERYTHING);
    }

    public static void setupJNI(int subsystems) {
        SDLActivity.nativeSetupJNI();
        mCompiledSubsystems = SDLActivity.nativeGetCompiledSubsystems();
        mInitializedSubsystems = mCompiledSubsystems & subsystems;
        if (isSubsystemCompiled(16)) {
            SDLAudioManager.nativeSetupJNI();
        }
        if (isSubsystemCompiled(SDL_INIT_CONTROLLER)) {
            SDLControllerManager.nativeSetupJNI();
        }
    }

    public static void initialize() {
        initialize(mInitializedSubsystems);
    }

    public static void initialize(int subsystems) {
        setContext(null);
        SDLActivity.initialize();
        if (isSubsystemCompiled(16)) {
            SDLAudioManager.initialize();
        }
        if (isSubsystemCompiled(SDL_INIT_CONTROLLER)) {
            SDLControllerManager.initialize();
        }
    }

    static boolean isSubsystemInitialized(int subsystem) {
        return (mInitializedSubsystems & subsystem) != 0;
    }

    static boolean isSubsystemCompiled(int subsystem) {
        return (mCompiledSubsystems & subsystem) != 0;
    }

    static boolean isControllerManagerReady() {
        return isSubsystemInitialized(SDL_INIT_CONTROLLER);
    }

    public static void setContext(Activity context) {
        if (isSubsystemCompiled(16)) {
            SDLAudioManager.setContext(context);
        }
        mContext = context;
    }

    public static Activity getContext() {
        return mContext;
    }

    static void loadLibrary(String libraryName) throws SecurityException, UnsatisfiedLinkError, NullPointerException {
        loadLibrary(libraryName, mContext);
    }

    static void loadLibrary(String libraryName, Context context) throws SecurityException, UnsatisfiedLinkError, NullPointerException {
        if (libraryName == null) {
            throw new NullPointerException("No library name provided.");
        }
        try {
            Class<?> relinkClass = context.getClassLoader().loadClass("com.getkeepsafe.relinker.ReLinker");
            Class<?> relinkListenerClass = context.getClassLoader().loadClass("com.getkeepsafe.relinker.ReLinker$LoadListener");
            Class<?> contextClass = context.getClassLoader().loadClass("android.content.Context");
            Class<?> stringClass = context.getClassLoader().loadClass("java.lang.String");
            Method forceMethod = relinkClass.getDeclaredMethod("force", new Class[0]);
            Object relinkInstance = forceMethod.invoke(null, new Object[0]);
            Class<?> relinkInstanceClass = relinkInstance.getClass();
            Method loadMethod = relinkInstanceClass.getDeclaredMethod("loadLibrary", contextClass, stringClass, stringClass, relinkListenerClass);
            loadMethod.invoke(relinkInstance, context, libraryName, null, null);
        } catch (Throwable th) {
            try {
                System.loadLibrary(libraryName);
            } catch (SecurityException se) {
                throw se;
            } catch (UnsatisfiedLinkError ule) {
                throw ule;
            }
        }
    }
}
