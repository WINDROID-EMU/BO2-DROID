package org.wiiucoop.bo2android;

/* Reconstruída a partir do smali: classe de lambda gerada pelo R8/D8
 * (work/apktool/smali_classes3/org/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda1.smali). Corresponde à expressão lambda original no código-fonte. */
public final class SettingsActivity$$ExternalSyntheticLambda1 implements android.content.DialogInterface.OnClickListener {
    public final org.wiiucoop.bo2android.SettingsActivity f$0;
    public final org.wiiucoop.bo2android.T6DxvkStore f$1;
    public final java.lang.String[] f$2;
    public final java.lang.String f$3;

    public SettingsActivity$$ExternalSyntheticLambda1(org.wiiucoop.bo2android.SettingsActivity a0, org.wiiucoop.bo2android.T6DxvkStore a1, java.lang.String[] a2, java.lang.String a3) {
        this.f$0 = a0;
        this.f$1 = a1;
        this.f$2 = a2;
        this.f$3 = a3;
    }

    @Override
    public void onClick(android.content.DialogInterface p1, int p2) {
        this.f$0.m43lambda$chooseDxvk$9$orgwiiucoopbo2androidSettingsActivity(this.f$1, this.f$2, this.f$3, p1, p2);
        return;
    }
}
