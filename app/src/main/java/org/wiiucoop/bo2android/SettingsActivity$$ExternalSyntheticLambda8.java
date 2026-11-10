package org.wiiucoop.bo2android;

/* Reconstruída a partir do smali: classe de lambda gerada pelo R8/D8
 * (work/apktool/smali_classes3/org/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda8.smali). Corresponde à expressão lambda original no código-fonte. */
public final class SettingsActivity$$ExternalSyntheticLambda8 implements java.util.function.Consumer {
    public final java.lang.String f$0;
    public final java.lang.String f$1;
    public final java.lang.String f$2;

    public SettingsActivity$$ExternalSyntheticLambda8(java.lang.String a0, java.lang.String a1, java.lang.String a2) {
        this.f$0 = a0;
        this.f$1 = a1;
        this.f$2 = a2;
    }

    @Override
    public void accept(java.lang.Object p1) {
        org.wiiucoop.bo2android.SettingsActivity.lambda$revalidateStoredFolder$13(this.f$0, this.f$1, this.f$2, ((org.wiiucoop.bo2android.T6Config) p1));
        return;
    }
}
