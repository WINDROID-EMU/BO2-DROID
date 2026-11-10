package org.wiiucoop.bo2android;

/* Reconstruída a partir do smali: classe de lambda gerada pelo R8/D8
 * (work/apktool/smali_classes3/org/wiiucoop/bo2android/T6Logs$Buffer$$ExternalSyntheticLambda0.smali). Corresponde à expressão lambda original no código-fonte. */
public final class T6Logs$Buffer$$ExternalSyntheticLambda0 implements java.util.Comparator {


    public T6Logs$Buffer$$ExternalSyntheticLambda0() {

    }

    @Override
    public int compare(java.lang.Object p1, java.lang.Object p2) {
        return ((org.wiiucoop.bo2android.T6Logs.Line) p1).time.compareTo(((org.wiiucoop.bo2android.T6Logs.Line) p2).time);
    }
}
