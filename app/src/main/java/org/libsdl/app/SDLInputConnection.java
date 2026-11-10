package org.libsdl.app;

import android.text.Editable;
import android.view.KeyEvent;
import android.view.View;
import android.view.inputmethod.BaseInputConnection;
import android.widget.EditText;

/* loaded from: classes2.dex */
class SDLInputConnection extends BaseInputConnection {
    protected String mCommittedText;
    protected EditText mEditText;

    public static native void nativeCommitText(String str, int i);

    public static native void nativeGenerateScancodeForUnichar(char c);

    SDLInputConnection(View targetView, boolean fullEditor) {
        super(targetView, fullEditor);
        this.mCommittedText = "";
        this.mEditText = new EditText(SDL.getContext());
    }

    @Override // android.view.inputmethod.BaseInputConnection
    public Editable getEditable() {
        return this.mEditText.getEditableText();
    }

    @Override // android.view.inputmethod.BaseInputConnection, android.view.inputmethod.InputConnection
    public boolean sendKeyEvent(KeyEvent event) {
        if (event.getKeyCode() == 66 && SDLActivity.onNativeSoftReturnKey()) {
            return true;
        }
        return super.sendKeyEvent(event);
    }

    @Override // android.view.inputmethod.BaseInputConnection, android.view.inputmethod.InputConnection
    public boolean commitText(CharSequence text, int newCursorPosition) {
        if (!super.commitText(text, newCursorPosition)) {
            return false;
        }
        updateText();
        return true;
    }

    @Override // android.view.inputmethod.BaseInputConnection, android.view.inputmethod.InputConnection
    public boolean setComposingText(CharSequence text, int newCursorPosition) {
        if (!super.setComposingText(text, newCursorPosition)) {
            return false;
        }
        updateText();
        return true;
    }

    @Override // android.view.inputmethod.BaseInputConnection, android.view.inputmethod.InputConnection
    public boolean deleteSurroundingText(int beforeLength, int afterLength) {
        if (beforeLength <= 0 || afterLength != 0) {
            if (!super.deleteSurroundingText(beforeLength, afterLength)) {
                return false;
            }
            updateText();
            return true;
        }
        while (true) {
            int beforeLength2 = beforeLength - 1;
            if (beforeLength <= 0) {
                return true;
            }
            nativeGenerateScancodeForUnichar('\b');
            beforeLength = beforeLength2;
        }
    }

    protected void updateText() {
        Editable content = getEditable();
        if (content == null) {
            return;
        }
        String text = content.toString();
        int compareLength = Math.min(text.length(), this.mCommittedText.length());
        int matchLength = 0;
        while (matchLength < compareLength) {
            int codePoint = this.mCommittedText.codePointAt(matchLength);
            if (codePoint != text.codePointAt(matchLength)) {
                break;
            } else {
                matchLength += Character.charCount(codePoint);
            }
        }
        int offset = matchLength;
        while (offset < this.mCommittedText.length()) {
            int codePoint2 = this.mCommittedText.codePointAt(offset);
            nativeGenerateScancodeForUnichar('\b');
            offset += Character.charCount(codePoint2);
        }
        if (matchLength < text.length()) {
            String pendingText = text.subSequence(matchLength, text.length()).toString();
            if (!SDLActivity.dispatchingKeyEvent()) {
                int offset2 = 0;
                while (offset2 < pendingText.length()) {
                    int codePoint3 = pendingText.codePointAt(offset2);
                    if (codePoint3 == 10 && SDLActivity.onNativeSoftReturnKey()) {
                        return;
                    }
                    if (codePoint3 > 0 && codePoint3 < 128) {
                        nativeGenerateScancodeForUnichar((char) codePoint3);
                    }
                    offset2 += Character.charCount(codePoint3);
                }
            }
            nativeCommitText(pendingText, 0);
        }
        this.mCommittedText = text;
    }
}
