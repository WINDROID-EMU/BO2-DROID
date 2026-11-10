package org.wiiucoop.bo2android;

import org.wiiucoop.bo2android.T6Updater;

/* compiled from: D8$$SyntheticClass */
/* loaded from: classes3.dex */
public final /* synthetic */ class MenuActivity$$ExternalSyntheticLambda1 implements T6Updater.Progress {
    public final /* synthetic */ MenuActivity f$0;

    public /* synthetic */ MenuActivity$$ExternalSyntheticLambda1(MenuActivity menuActivity) {
        this.f$0 = menuActivity;
    }

    @Override // org.wiiucoop.bo2android.T6Updater.Progress
    public final void onProgress(String str, long j, long j2) {
        this.f$0.showProgress(str, j, j2);
    }
}
