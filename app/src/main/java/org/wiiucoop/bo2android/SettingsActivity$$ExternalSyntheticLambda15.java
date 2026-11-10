package org.wiiucoop.bo2android;

/* Reconstruída a partir do smali: classe de lambda gerada pelo R8/D8
 * (work/apktool/smali_classes3/org/wiiucoop/bo2android/SettingsActivity$$ExternalSyntheticLambda15.smali). Corresponde à expressão lambda original no código-fonte. */
public final class SettingsActivity$$ExternalSyntheticLambda15 implements android.content.DialogInterface.OnClickListener {
    public final org.wiiucoop.bo2android.SettingsActivity f$0;
    public final android.widget.EditText f$1;

    public SettingsActivity$$ExternalSyntheticLambda15(org.wiiucoop.bo2android.SettingsActivity a0, android.widget.EditText a1) {
        this.f$0 = a0;
        this.f$1 = a1;
    }

    @Override
    public void onClick(android.content.DialogInterface p1, int p2) {
        this.f$0.m49lambda$editPlayerName$8$orgwiiucoopbo2androidSettingsActivity(this.f$1, p1, p2);
        return;
    }
}
