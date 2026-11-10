package org.wiiucoop.bo2android;

/* Reconstruída a partir do smali: classe de lambda gerada pelo R8/D8
 * (work/apktool/smali_classes3/org/wiiucoop/bo2android/MenuActivity$$ExternalSyntheticLambda20.smali). Corresponde à expressão lambda original no código-fonte. */
public final class MenuActivity$$ExternalSyntheticLambda20 implements java.util.function.Consumer {
    public final java.lang.String f$0;

    public MenuActivity$$ExternalSyntheticLambda20(java.lang.String a0) {
        this.f$0 = a0;
    }

    @Override
    public void accept(java.lang.Object p1) {
        ((org.wiiucoop.bo2android.T6Config) p1).mode = this.f$0;
        return;
    }
}
