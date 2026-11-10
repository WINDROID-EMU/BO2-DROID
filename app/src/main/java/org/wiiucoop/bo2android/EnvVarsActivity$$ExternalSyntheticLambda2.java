package org.wiiucoop.bo2android;

/* Reconstruída a partir do smali: classe de lambda gerada pelo R8/D8
 * (work/apktool/smali_classes3/org/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda2.smali). Corresponde à expressão lambda original no código-fonte. */
public final class EnvVarsActivity$$ExternalSyntheticLambda2 implements org.wiiucoop.bo2android.EnvVarsActivity.OnText {
    public final org.wiiucoop.bo2android.T6EnvVars.Var f$0;

    public EnvVarsActivity$$ExternalSyntheticLambda2(org.wiiucoop.bo2android.T6EnvVars.Var a0) {
        this.f$0 = a0;
    }

    @Override
    public void changed(java.lang.String p1) {
        this.f$0.value = p1;
        return;
    }
}
