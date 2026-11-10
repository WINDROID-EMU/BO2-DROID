package org.wiiucoop.bo2android;

/* Reconstruída a partir do smali: classe de lambda gerada pelo R8/D8
 * (work/apktool/smali_classes3/org/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda13.smali). Corresponde à expressão lambda original no código-fonte. */
public final class MenuActivity$$ExternalSyntheticLambda13 implements org.wiiucoop.bo2android.MenuActivity.UpdateJob {
    public final org.wiiucoop.bo2android.MenuActivity f$0;
    public final org.wiiucoop.bo2android.T6Updater f$1;
    public final org.wiiucoop.bo2android.T6Updater.Component f$2;

    public MenuActivity$$ExternalSyntheticLambda13(org.wiiucoop.bo2android.MenuActivity a0, org.wiiucoop.bo2android.T6Updater a1, org.wiiucoop.bo2android.T6Updater.Component a2) {
        this.f$0 = a0;
        this.f$1 = a1;
        this.f$2 = a2;
    }

    @Override
    public void run() throws java.io.IOException {
        this.f$0.m26lambda$offerSource$4$orgwiiucoopbo2androidMenuActivity(this.f$1, this.f$2);
        return;
    }
}
