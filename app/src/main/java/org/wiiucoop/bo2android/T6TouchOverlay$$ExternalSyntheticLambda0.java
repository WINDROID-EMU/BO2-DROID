package org.wiiucoop.bo2android;

/* Reconstruída a partir do smali: lambda `() -> overlay.publish()`
 * (classe gerada pelo R8/D8, descartada pelo jadx). */
public final class T6TouchOverlay$$ExternalSyntheticLambda0 implements Runnable {
    public final T6TouchOverlay f$0;

    public T6TouchOverlay$$ExternalSyntheticLambda0(T6TouchOverlay overlay) {
        this.f$0 = overlay;
    }

    @Override
    public void run() {
        this.f$0.publish();
    }
}
