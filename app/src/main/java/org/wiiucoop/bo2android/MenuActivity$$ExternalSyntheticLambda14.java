package org.wiiucoop.bo2android;

/* Reconstruída a partir do smali: classe de lambda gerada pelo R8/D8
 * (work/apktool/smali_classes3/org/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda14.smali). Corresponde à expressão lambda original no código-fonte. */
public final class MenuActivity$$ExternalSyntheticLambda14 implements android.content.DialogInterface.OnClickListener {
    public final org.wiiucoop.bo2android.MenuActivity f$0;
    public final org.wiiucoop.bo2android.T6Updater f$1;
    public final org.wiiucoop.bo2android.T6Updater.Component f$2;

    public MenuActivity$$ExternalSyntheticLambda14(org.wiiucoop.bo2android.MenuActivity a0, org.wiiucoop.bo2android.T6Updater a1, org.wiiucoop.bo2android.T6Updater.Component a2) {
        this.f$0 = a0;
        this.f$1 = a1;
        this.f$2 = a2;
    }

    @Override
    public void onClick(android.content.DialogInterface p1, int p2) {
        this.f$0.m27lambda$offerSource$5$orgwiiucoopbo2androidMenuActivity(this.f$1, this.f$2, p1, p2);
        return;
    }
}
