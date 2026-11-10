package org.wiiucoop.bo2android;

/* Reconstruída a partir do smali: lambda `() -> activity.refreshNow()`
 * (classe gerada pelo R8/D8, descartada pelo jadx). */
public final class LogsActivity$$ExternalSyntheticLambda4 implements Runnable {
    public final LogsActivity f$0;

    public LogsActivity$$ExternalSyntheticLambda4(LogsActivity activity) {
        this.f$0 = activity;
    }

    @Override
    public void run() {
        this.f$0.refreshNow();
    }
}
