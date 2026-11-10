package org.wiiucoop.bo2android;

/* Reconstruída a partir do smali: classe de lambda gerada pelo R8/D8
 * (work/apktool/smali_classes3/org/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda1.smali). Corresponde à expressão lambda original no código-fonte. */
public final class MenuActivity$$ExternalSyntheticLambda1 implements org.wiiucoop.bo2android.T6Updater.Progress {
    public final org.wiiucoop.bo2android.MenuActivity f$0;

    public MenuActivity$$ExternalSyntheticLambda1(org.wiiucoop.bo2android.MenuActivity a0) {
        this.f$0 = a0;
    }

    @Override
    public void onProgress(java.lang.String p1, long p2, long p4) {
        this.f$0.showProgress(p1, p2, p4);
        return;
    }
}
