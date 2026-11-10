package org.wiiucoop.bo2android;

/* Reconstruída a partir do smali: classe de lambda gerada pelo R8/D8
 * (work/apktool/smali_classes3/org/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda19.smali). Corresponde à expressão lambda original no código-fonte. */
public final class MenuActivity$$ExternalSyntheticLambda19 implements java.lang.Runnable {
    public final org.wiiucoop.bo2android.MenuActivity f$0;
    public final org.wiiucoop.bo2android.T6Updater f$1;

    public MenuActivity$$ExternalSyntheticLambda19(org.wiiucoop.bo2android.MenuActivity a0, org.wiiucoop.bo2android.T6Updater a1) {
        this.f$0 = a0;
        this.f$1 = a1;
    }

    @Override
    public void run() {
        this.f$0.m21lambda$checkForUpdates$2$orgwiiucoopbo2androidMenuActivity(this.f$1);
        return;
    }
}
