package org.libsdl.app;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.os.Build;

/* compiled from: SDLActivity.java */
/* loaded from: classes2.dex */
class SDLClipboardHandler implements ClipboardManager.OnPrimaryClipChangedListener {
    protected ClipboardManager mClipMgr = (ClipboardManager) SDL.getContext().getSystemService("clipboard");

    SDLClipboardHandler() {
        this.mClipMgr.addPrimaryClipChangedListener(this);
    }

    public boolean clipboardHasText() {
        if (Build.VERSION.SDK_INT >= 28) {
            return this.mClipMgr.hasPrimaryClip();
        }
        return this.mClipMgr.hasText();
    }

    public String clipboardGetText() {
        ClipData.Item item;
        CharSequence text;
        ClipData clip = this.mClipMgr.getPrimaryClip();
        if (clip != null && (item = clip.getItemAt(0)) != null && (text = item.getText()) != null) {
            return text.toString();
        }
        return null;
    }

    public void clipboardSetText(String string) {
        this.mClipMgr.removePrimaryClipChangedListener(this);
        if (string.isEmpty()) {
            if (Build.VERSION.SDK_INT >= 28) {
                this.mClipMgr.clearPrimaryClip();
            } else {
                ClipData clip = ClipData.newPlainText(null, "");
                this.mClipMgr.setPrimaryClip(clip);
            }
        } else {
            ClipData clip2 = ClipData.newPlainText(null, string);
            this.mClipMgr.setPrimaryClip(clip2);
        }
        this.mClipMgr.addPrimaryClipChangedListener(this);
    }

    @Override // android.content.ClipboardManager.OnPrimaryClipChangedListener
    public void onPrimaryClipChanged() {
        SDLActivity.onNativeClipboardChanged();
    }
}
