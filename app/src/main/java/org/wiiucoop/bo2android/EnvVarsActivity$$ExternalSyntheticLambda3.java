package org.wiiucoop.bo2android;

/* Reconstruída a partir do smali: classe de lambda gerada pelo R8/D8
 * (work/apktool/smali_classes3/org/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda3.smali). Corresponde à expressão lambda original no código-fonte. */
public final class EnvVarsActivity$$ExternalSyntheticLambda3 implements android.widget.CompoundButton.OnCheckedChangeListener {
    public final org.wiiucoop.bo2android.EnvVarsActivity f$0;
    public final org.wiiucoop.bo2android.T6EnvVars.Var f$1;

    public EnvVarsActivity$$ExternalSyntheticLambda3(org.wiiucoop.bo2android.EnvVarsActivity a0, org.wiiucoop.bo2android.T6EnvVars.Var a1) {
        this.f$0 = a0;
        this.f$1 = a1;
    }

    @Override
    public void onCheckedChanged(android.widget.CompoundButton p1, boolean p2) {
        this.f$0.m2lambda$rebuildRows$5$orgwiiucoopbo2androidEnvVarsActivity(this.f$1, p1, p2);
        return;
    }
}
