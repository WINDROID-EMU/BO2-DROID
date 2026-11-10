package org.wiiucoop.bo2android;

/* Reconstruída a partir do smali: classe de lambda gerada pelo R8/D8
 * (work/apktool/smali_classes3/org/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda2.smali). Corresponde à expressão lambda original no código-fonte. */
public final class SettingsActivity$$ExternalSyntheticLambda2 implements android.content.DialogInterface.OnClickListener {
    public final org.wiiucoop.bo2android.SettingsActivity f$0;
    public final org.wiiucoop.bo2android.T6DxvkStore f$1;
    public final java.lang.String f$2;

    public SettingsActivity$$ExternalSyntheticLambda2(org.wiiucoop.bo2android.SettingsActivity a0, org.wiiucoop.bo2android.T6DxvkStore a1, java.lang.String a2) {
        this.f$0 = a0;
        this.f$1 = a1;
        this.f$2 = a2;
    }

    @Override
    public void onClick(android.content.DialogInterface p1, int p2) {
        this.f$0.m42lambda$chooseDxvk$10$orgwiiucoopbo2androidSettingsActivity(this.f$1, this.f$2, p1, p2);
        return;
    }
}
