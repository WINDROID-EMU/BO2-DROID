package org.wiiucoop.bo2android;

/* loaded from: classes3.dex */
final class T6TouchAuto {
    private int lastPads;
    private boolean touchTookOver;

    T6TouchAuto() {
    }

    boolean show(String mode, boolean gameplay, int pads) {
        if (pads > this.lastPads) {
            this.touchTookOver = false;
        }
        this.lastPads = Math.max(pads, 0);
        if (!gameplay || "off".equals(mode)) {
            return false;
        }
        if ("on".equals(mode)) {
            return true;
        }
        return pads <= 0 || this.touchTookOver;
    }

    boolean onScreenTouch(String mode, boolean gameplay, int pads) {
        if (!"auto".equals(mode) || !gameplay || pads <= 0 || this.touchTookOver) {
            return false;
        }
        this.touchTookOver = true;
        return true;
    }

    boolean onPadInput() {
        boolean was = this.touchTookOver;
        this.touchTookOver = false;
        return was;
    }

    boolean touchTookOver() {
        return this.touchTookOver;
    }
}
