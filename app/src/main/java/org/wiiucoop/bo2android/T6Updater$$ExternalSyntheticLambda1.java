package org.wiiucoop.bo2android;

/* Reconstruída a partir do smali: classe de lambda gerada pelo R8/D8
 * (work/apktool/smali_classes3/org/wiiucoop/bo2android/T6Updater$$ExternalSyntheticLambda1.smali). Corresponde à expressão lambda original no código-fonte. */
public final class T6Updater$$ExternalSyntheticLambda1 implements org.wiiucoop.bo2android.T6Updater.Bytes {
    public final org.wiiucoop.bo2android.T6Updater.Progress f$0;
    public final long[] f$1;
    public final java.lang.String f$2;

    public T6Updater$$ExternalSyntheticLambda1(org.wiiucoop.bo2android.T6Updater.Progress a0, long[] a1, java.lang.String a2) {
        this.f$0 = a0;
        this.f$1 = a1;
        this.f$2 = a2;
    }

    @Override
    public void on(long p1, long p3) {
        org.wiiucoop.bo2android.T6Updater.lambda$downloadTo$1(this.f$0, this.f$1, this.f$2, p1, p3);
        return;
    }
}
