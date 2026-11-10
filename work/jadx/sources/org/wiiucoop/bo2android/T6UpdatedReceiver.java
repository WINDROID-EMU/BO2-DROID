package org.wiiucoop.bo2android;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import java.io.File;

/* loaded from: classes3.dex */
public final class T6UpdatedReceiver extends BroadcastReceiver {
    static final String MARKER = "update_reopen.marker";

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        if ("android.intent.action.MY_PACKAGE_REPLACED".equals(intent.getAction())) {
            File marker = new File(context.getCacheDir(), MARKER);
            if (marker.exists()) {
                boolean recent = System.currentTimeMillis() - marker.lastModified() < 900000;
                marker.delete();
                if (recent) {
                    try {
                        context.startActivity(new Intent(context, (Class<?>) MenuActivity.class).addFlags(335544320));
                        Log.i("t6android", "update: launcher atualizado para 2.1.0-beta; reaberto");
                    } catch (RuntimeException e) {
                        Log.w("t6android", "update: não foi possível reabrir: " + e);
                    }
                }
            }
        }
    }
}
