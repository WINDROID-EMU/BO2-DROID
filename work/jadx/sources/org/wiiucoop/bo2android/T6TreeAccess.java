package org.wiiucoop.bo2android;

import android.content.ContentResolver;
import android.content.Context;
import android.content.UriPermission;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.provider.DocumentsContract;
import java.io.File;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/* loaded from: classes3.dex */
final class T6TreeAccess {
    private T6TreeAccess() {
    }

    static boolean takePersistableReadPermission(Context context, Uri treeUri, int resultFlags) {
        int takeFlags = resultFlags & 1;
        if (takeFlags == 0) {
            takeFlags = 1;
        }
        try {
            context.getContentResolver().takePersistableUriPermission(treeUri, takeFlags);
            return true;
        } catch (IllegalArgumentException | SecurityException e) {
            return false;
        }
    }

    static boolean hasPersistedReadPermission(Context context, Uri treeUri) {
        if (treeUri == null) {
            return false;
        }
        List<UriPermission> permissions = context.getContentResolver().getPersistedUriPermissions();
        for (UriPermission permission : permissions) {
            if (permission.isReadPermission() && permission.getUri().equals(treeUri)) {
                return true;
            }
        }
        return false;
    }

    static Uri parse(String uriText) {
        if (uriText == null || uriText.isEmpty()) {
            return null;
        }
        try {
            Uri uri = Uri.parse(uriText);
            if (DocumentsContract.isTreeUri(uri)) {
                return uri;
            }
            return null;
        } catch (RuntimeException e) {
            return null;
        }
    }

    static String rawPathFor(Uri treeUri) {
        String root;
        if (treeUri == null) {
            return null;
        }
        try {
            String documentId = DocumentsContract.getTreeDocumentId(treeUri);
            if (documentId == null || documentId.isEmpty()) {
                return null;
            }
            if (documentId.startsWith("raw:")) {
                String raw = documentId.substring("raw:".length());
                if (raw.startsWith("/")) {
                    return raw;
                }
                return null;
            }
            int separator = documentId.indexOf(58);
            if (separator <= 0) {
                return null;
            }
            String volume = documentId.substring(0, separator);
            String relative = documentId.substring(separator + 1);
            if ("primary".equals(volume)) {
                root = Environment.getExternalStorageDirectory().getAbsolutePath();
            } else if ("home".equals(volume)) {
                root = Environment.getExternalStorageDirectory().getAbsolutePath() + "/Documents";
            } else {
                if (!volume.matches("[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}")) {
                    return null;
                }
                root = "/storage/" + volume;
            }
            if (relative.isEmpty()) {
                return root;
            }
            return root + "/" + relative;
        } catch (RuntimeException e) {
            return null;
        }
    }

    static boolean isReadable(String path) {
        if (path == null || path.isEmpty()) {
            return false;
        }
        File directory = new File(path);
        return directory.isDirectory() && directory.canRead();
    }

    static boolean hasAllFilesAccess() {
        if (Build.VERSION.SDK_INT < 30) {
            return true;
        }
        try {
            return Environment.isExternalStorageManager();
        } catch (RuntimeException e) {
            return false;
        }
    }

    static Map<String, String> listRawDirectory(String path) {
        File directory = new File(path);
        String[] names = directory.list();
        if (names == null) {
            return null;
        }
        Map<String, String> entries = new LinkedHashMap<>();
        for (String name : names) {
            entries.put(name, name);
        }
        return entries;
    }

    static Map<String, String> listTreeDirectory(Context context, Uri treeUri, String parentDocumentId) {
        Map<String, String> entries = new LinkedHashMap<>();
        ContentResolver resolver = context.getContentResolver();
        try {
            Uri children = DocumentsContract.buildChildDocumentsUriUsingTree(treeUri, parentDocumentId);
            String[] columns = {"_display_name", "document_id"};
            try {
                Cursor cursor = resolver.query(children, columns, null, null, null);
                if (cursor != null) {
                    while (cursor.moveToNext()) {
                        try {
                            String name = cursor.getString(0);
                            String id = cursor.getString(1);
                            if (name != null && id != null) {
                                entries.put(name, id);
                            }
                        } finally {
                        }
                    }
                    if (cursor != null) {
                        cursor.close();
                    }
                    return entries;
                }
                if (cursor != null) {
                    cursor.close();
                }
                return null;
            } catch (RuntimeException e) {
                return null;
            }
        } catch (RuntimeException e2) {
            return null;
        }
    }

    static String findDocumentId(Map<String, String> entries, String name) {
        if (entries == null || name == null) {
            return null;
        }
        for (Map.Entry<String, String> entry : entries.entrySet()) {
            if (entry.getKey().equalsIgnoreCase(name)) {
                return entry.getValue();
            }
        }
        return null;
    }

    static String displayNameFor(Uri treeUri) {
        if (treeUri == null) {
            return "";
        }
        try {
            String documentId = DocumentsContract.getTreeDocumentId(treeUri);
            int separator = documentId.indexOf(58);
            String name = separator >= 0 ? documentId.substring(separator + 1) : documentId;
            if (!name.isEmpty()) {
                return name;
            }
        } catch (RuntimeException e) {
        }
        String last = treeUri.getLastPathSegment();
        return last == null ? treeUri.toString() : Uri.decode(last.replace(':', '/'));
    }

    static String lower(String text) {
        return text == null ? "" : text.toLowerCase(Locale.ROOT);
    }
}
