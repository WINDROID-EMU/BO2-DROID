package org.wiiucoop.bo2android;

/* Reconstruída a partir do smali: classe de lambda gerada pelo R8/D8
 * (work/apktool/smali_classes3/org/wiiucoop/bo2android/MainActivity$$ExternalSyntheticLambda0.smali). Corresponde à expressão lambda original no código-fonte. */
public final class MainActivity$$ExternalSyntheticLambda0 implements org.wiiucoop.bo2android.T6TouchOverlay.CameraSink {


    public MainActivity$$ExternalSyntheticLambda0() {

    }

    @Override
    public void onCamera(int p1, int p2, float p3, float p4) {
        T6Native.touch(p1, 65536 + p2, p3, p4);
        return;
    }
}
