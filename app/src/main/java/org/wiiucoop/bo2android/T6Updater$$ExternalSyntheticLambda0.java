package org.wiiucoop.bo2android;

/* Reconstruída a partir do smali: classe de lambda gerada pelo R8/D8
 * (work/apktool/smali_classes3/org/wiiucoop/bo2android/T6Updater$$ExternalSyntheticLambda0.smali). Corresponde à expressão lambda original no código-fonte. */
public final class T6Updater$$ExternalSyntheticLambda0 implements java.io.FilenameFilter {
    public final java.io.File f$0;
    public final java.io.File f$1;

    public T6Updater$$ExternalSyntheticLambda0(java.io.File a0, java.io.File a1) {
        this.f$0 = a0;
        this.f$1 = a1;
    }

    @Override
    public boolean accept(java.io.File p1, java.lang.String p2) {
        return org.wiiucoop.bo2android.T6Updater.lambda$downloadTo$0(this.f$0, this.f$1, p1, p2);
    }
}
