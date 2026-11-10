package org.wiiucoop.bo2android;

/* Reconstruída a partir do smali: classe de lambda gerada pelo R8/D8
 * (work/apktool/smali_classes3/org/wiiucoop/bo2android/LogsActivity$$ExternalSyntheticLambda0.smali). Corresponde à expressão lambda original no código-fonte. */
public final class LogsActivity$$ExternalSyntheticLambda0 implements java.lang.Runnable {
    public final org.wiiucoop.bo2android.LogsActivity f$0;
    public final android.net.Uri f$1;
    public final java.lang.String f$2;

    public LogsActivity$$ExternalSyntheticLambda0(org.wiiucoop.bo2android.LogsActivity a0, android.net.Uri a1, java.lang.String a2) {
        this.f$0 = a0;
        this.f$1 = a1;
        this.f$2 = a2;
    }

    @Override
    public void run() {
        this.f$0.m11lambda$onActivityResult$4$orgwiiucoopbo2androidLogsActivity(this.f$1, this.f$2);
        return;
    }
}
