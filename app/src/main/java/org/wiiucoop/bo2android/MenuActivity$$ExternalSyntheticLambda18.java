package org.wiiucoop.bo2android;

/* Reconstruída a partir do smali: classe de lambda gerada pelo R8/D8
 * (work/apktool/smali_classes3/org/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda18.smali). Corresponde à expressão lambda original no código-fonte. */
public final class MenuActivity$$ExternalSyntheticLambda18 implements java.lang.Runnable {
    public final android.widget.TextView f$0;
    public final boolean f$1;

    public MenuActivity$$ExternalSyntheticLambda18(android.widget.TextView a0, boolean a1) {
        this.f$0 = a0;
        this.f$1 = a1;
    }

    @Override
    public void run() {
        this.f$0.setText(this.f$1 ? R.string.kennel_home_installed : R.string.kennel_home_missing);
        return;
    }
}
