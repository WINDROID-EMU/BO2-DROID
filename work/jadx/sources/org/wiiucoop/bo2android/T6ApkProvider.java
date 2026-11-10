package org.wiiucoop.bo2android;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import java.io.File;
import java.io.FileNotFoundException;

/* loaded from: classes3.dex */
public final class T6ApkProvider extends ContentProvider {
    static final String AUTHORITY_SUFFIX = ".updates";

    static Uri uri(Context context) {
        return Uri.parse("content://" + context.getPackageName() + AUTHORITY_SUFFIX + "/launcher.apk");
    }

    private File file() {
        return new File(new File(getContext().getCacheDir(), "updates"), "launcher.apk");
    }

    @Override // android.content.ContentProvider
    public boolean onCreate() {
        return true;
    }

    @Override // android.content.ContentProvider
    public ParcelFileDescriptor openFile(Uri uri, String mode) throws FileNotFoundException {
        if (!"launcher.apk".equals(uri.getLastPathSegment()) || !"r".equals(mode)) {
            throw new FileNotFoundException(uri.toString());
        }
        return ParcelFileDescriptor.open(file(), 268435456);
    }

    @Override // android.content.ContentProvider
    public String getType(Uri uri) {
        return "application/vnd.android.package-archive";
    }

    @Override // android.content.ContentProvider
    public Cursor query(Uri uri, String[] projection, String selection, String[] args, String sort) {
        MatrixCursor c = new MatrixCursor(new String[]{"_display_name", "_size"});
        c.addRow(new Object[]{"launcher.apk", Long.valueOf(file().length())});
        return c;
    }

    @Override // android.content.ContentProvider
    public Uri insert(Uri uri, ContentValues values) {
        return null;
    }

    @Override // android.content.ContentProvider
    public int delete(Uri uri, String selection, String[] args) {
        return 0;
    }

    @Override // android.content.ContentProvider
    public int update(Uri uri, ContentValues values, String selection, String[] args) {
        return 0;
    }
}
