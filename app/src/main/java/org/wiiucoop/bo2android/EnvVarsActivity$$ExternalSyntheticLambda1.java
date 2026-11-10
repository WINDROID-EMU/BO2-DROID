package org.wiiucoop.bo2android;

/* Reconstruída a partir do smali: classe de lambda gerada pelo R8/D8
 * (work/apktool/smali_classes3/org/wiiucoop/bo2android/EnvVarsActivity$$ExternalSyntheticLambda1.smali). Corresponde à expressão lambda original no código-fonte. */
public final class EnvVarsActivity$$ExternalSyntheticLambda1 implements android.widget.TextView.OnEditorActionListener {
    public final android.widget.EditText f$0;

    public EnvVarsActivity$$ExternalSyntheticLambda1(android.widget.EditText a0) {
        this.f$0 = a0;
    }

    @Override
    public boolean onEditorAction(android.widget.TextView p1, int p2, android.view.KeyEvent p3) {
        return org.wiiucoop.bo2android.EnvVarsActivity.lambda$rebuildRows$3(this.f$0, p1, p2, p3);
    }
}
