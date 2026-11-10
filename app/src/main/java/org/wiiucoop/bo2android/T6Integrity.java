package org.wiiucoop.bo2android;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Locale;

/* loaded from: classes3.dex */
public final class T6Integrity {
    private T6Integrity() {
    }

    public static String sha256Hex(byte[] data) {
        try {
            byte[] d = MessageDigest.getInstance("SHA-256").digest(data);
            StringBuilder sb = new StringBuilder(64);
            for (byte b : d) {
                sb.append(String.format(Locale.ROOT, "%02x", Integer.valueOf(b & 255)));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new IllegalStateException(e);
        }
    }

    public static boolean matches(String expected, String[] actualSigners) {
        if (expected == null || expected.isEmpty()) {
            return true;
        }
        if (actualSigners == null) {
            return false;
        }
        for (String s : actualSigners) {
            if (expected.equalsIgnoreCase(s)) {
                return true;
            }
        }
        return false;
    }

    public static String[] installedSigners(Context context) {
        Signature[] sigs;
        try {
            PackageManager pm = context.getPackageManager();
            if (Build.VERSION.SDK_INT >= 28) {
                PackageInfo info = pm.getPackageInfo(context.getPackageName(), 134217728);
                if (info.signingInfo == null) {
                    return null;
                }
                sigs = info.signingInfo.hasMultipleSigners() ? info.signingInfo.getApkContentsSigners() : info.signingInfo.getSigningCertificateHistory();
            } else {
                sigs = pm.getPackageInfo(context.getPackageName(), 64).signatures;
            }
            if (sigs == null) {
                return null;
            }
            String[] out = new String[sigs.length];
            for (int i = 0; i < sigs.length; i++) {
                out[i] = sha256Hex(sigs[i].toByteArray());
            }
            return out;
        } catch (PackageManager.NameNotFoundException e) {
            return null;
        }
    }

    public static String problem(Context context) {
        String[] signers = installedSigners(context);
        if (matches(BuildConfig.T6_SIGNING_CERT_SHA256, signers)) {
            return null;
        }
        String found = (signers == null || signers.length == 0) ? "none" : signers[0].substring(0, 16) + "...";
        return "signed by " + found + ", expected " + BuildConfig.T6_SIGNING_CERT_SHA256.substring(0, 16) + "...";
    }
}
