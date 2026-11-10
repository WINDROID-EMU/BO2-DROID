package org.wiiucoop.bo2android;

/* loaded from: classes3.dex */
final class T6SourceState {
    private T6SourceState() {
    }

    static boolean useUpdate(int updateCode, boolean filesVerify, int embeddedCode) {
        return updateCode > 0 && filesVerify && updateCode > embeddedCode;
    }

    static int installedCode(int updateCode, boolean filesVerify, int embeddedCode) {
        return useUpdate(updateCode, filesVerify, embeddedCode) ? updateCode : embeddedCode;
    }

    static boolean offerRemote(int remoteCode, int remoteMinApkCode, int installedApkCode, int installedSourceCode) {
        return remoteCode > installedSourceCode && remoteMinApkCode <= installedApkCode;
    }
}
