package org.wiiucoop.bo2android;

/* Reconstruída a partir do smali: classe de lambda gerada pelo R8/D8
 * (work/apktool/smali_classes3/org/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda10.smali). Corresponde à expressão lambda original no código-fonte. */
public final class SettingsActivity$$ExternalSyntheticLambda10 implements java.util.function.Consumer {
    public final android.net.Uri f$0;
    public final java.lang.String f$1;
    public final java.lang.String f$2;
    public final java.lang.String f$3;
    public final java.lang.String f$4;

    public SettingsActivity$$ExternalSyntheticLambda10(android.net.Uri a0, java.lang.String a1, java.lang.String a2, java.lang.String a3, java.lang.String a4) {
        this.f$0 = a0;
        this.f$1 = a1;
        this.f$2 = a2;
        this.f$3 = a3;
        this.f$4 = a4;
    }

    @Override
    public void accept(java.lang.Object p1) {
        org.wiiucoop.bo2android.SettingsActivity.lambda$applyFolder$12(this.f$0, this.f$1, this.f$2, this.f$3, this.f$4, ((org.wiiucoop.bo2android.T6Config) p1));
        return;
    }
}
