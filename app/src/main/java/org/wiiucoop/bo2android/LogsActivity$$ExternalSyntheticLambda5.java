package org.wiiucoop.bo2android;

/* Reconstruída a partir do smali: classe de lambda gerada pelo R8/D8
 * (work/apktool/smali_classes3/org/wiiucoop/bo2android/LogsActivity$$ExternalSyntheticLambda5.smali). Corresponde à expressão lambda original no código-fonte. */
public final class LogsActivity$$ExternalSyntheticLambda5 implements java.lang.Runnable {
    public final org.wiiucoop.bo2android.LogsActivity f$0;
    public final java.lang.String f$1;
    public final java.lang.String f$2;

    public LogsActivity$$ExternalSyntheticLambda5(org.wiiucoop.bo2android.LogsActivity a0, java.lang.String a1, java.lang.String a2) {
        this.f$0 = a0;
        this.f$1 = a1;
        this.f$2 = a2;
    }

    @Override
    public void run() {
        this.f$0.m10lambda$onActivityResult$3$orgwiiucoopbo2androidLogsActivity(this.f$1, this.f$2);
        return;
    }
}
