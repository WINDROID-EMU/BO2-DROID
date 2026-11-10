package org.wiiucoop.bo2android;

import android.content.Context;
import android.net.Uri;
import android.provider.DocumentsContract;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.wiiucoop.bo2android.T6GameData;

/* loaded from: classes3.dex */
final class T6FolderReader {
    static final String ZONE_ALL = "all";

    static final class Snapshot {
        final boolean permissionMissing;
        final String rawPath;
        final boolean rawReadable;
        final T6GameData.Result result;

        Snapshot(T6GameData.Result result, String rawPath, boolean rawReadable, boolean permissionMissing) {
            this.result = result;
            this.rawPath = rawPath;
            this.rawReadable = rawReadable;
            this.permissionMissing = permissionMissing;
        }
    }

    private T6FolderReader() {
    }

    static Snapshot none() {
        return new Snapshot(fail("Nenhuma pasta do jogo foi selecionada."), null, false, false);
    }

    static Snapshot inspect(Context context, T6Config config) {
        boolean readable;
        Map<String, String> zoneEntries;
        Map<String, String> allEntries;
        Map<String, String> zoneEntries2;
        if (config == null || !config.hasFolder()) {
            return none();
        }
        Uri treeUri = T6TreeAccess.parse(config.gameDirUri);
        if (treeUri == null) {
            String raw = config.gameDirPath;
            if (T6TreeAccess.isReadable(raw)) {
                return new Snapshot(evaluateFromRaw(raw, config.mode), raw, true, false);
            }
            return new Snapshot(fail("A pasta selecionada não está acessível."), raw, false, false);
        }
        if (!T6TreeAccess.hasPersistedReadPermission(context, treeUri)) {
            return new Snapshot(fail(context.getString(R.string.folder_permission_revoked)), null, false, true);
        }
        String rawPath = T6TreeAccess.rawPathFor(treeUri);
        boolean rawReadable = T6TreeAccess.isReadable(rawPath);
        List<String> rootNames = new ArrayList<>();
        List<String> zoneFastfiles = new ArrayList<>();
        if (rawReadable) {
            Map<String, String> rawEntries = T6TreeAccess.listRawDirectory(rawPath);
            readable = rawEntries != null;
            if (rawEntries != null) {
                rootNames.addAll(rawEntries.keySet());
                String zoneName = findEntryName(rawEntries, T6GameData.DIR_ZONE);
                if (zoneName != null && (zoneEntries2 = T6TreeAccess.listRawDirectory(rawPath + "/" + zoneName)) != null) {
                    zoneFastfiles.addAll(zoneEntries2.keySet());
                    addRawZoneAll(rawPath + "/" + zoneName, zoneEntries2, zoneFastfiles);
                }
            }
        } else {
            try {
                String rootDocumentId = DocumentsContract.getTreeDocumentId(treeUri);
                Map<String, String> entries = T6TreeAccess.listTreeDirectory(context, treeUri, rootDocumentId);
                readable = entries != null;
                if (entries != null) {
                    rootNames.addAll(entries.keySet());
                    String zoneDocumentId = T6TreeAccess.findDocumentId(entries, T6GameData.DIR_ZONE);
                    if (zoneDocumentId != null && (zoneEntries = T6TreeAccess.listTreeDirectory(context, treeUri, zoneDocumentId)) != null) {
                        zoneFastfiles.addAll(zoneEntries.keySet());
                        String allDocumentId = T6TreeAccess.findDocumentId(zoneEntries, ZONE_ALL);
                        if (allDocumentId != null && (allEntries = T6TreeAccess.listTreeDirectory(context, treeUri, allDocumentId)) != null) {
                            zoneFastfiles.addAll(allEntries.keySet());
                        }
                    }
                }
            } catch (RuntimeException e) {
                return new Snapshot(fail("A pasta selecionada não está acessível."), rawPath, false, false);
            }
        }
        String rootDocumentId2 = config.mode;
        T6GameData.Result result = T6GameData.evaluate(readable, rootNames, zoneFastfiles, rootDocumentId2);
        return new Snapshot(result, rawPath, rawReadable, false);
    }

    static String describe(Context context, Snapshot snapshot) {
        if (snapshot == null) {
            return "";
        }
        StringBuilder detail = new StringBuilder(snapshot.result.detail);
        if (!snapshot.rawReadable) {
            detail.append('\n');
            if (snapshot.rawPath == null || snapshot.rawPath.isEmpty()) {
                detail.append(context.getString(R.string.folder_no_raw_path));
            } else {
                detail.append("O caminho ").append(snapshot.rawPath).append(" não está legível para o aplicativo: o motor não consegue abrir os ").append("arquivos ainda. Use \"Conceder acesso a arquivos\".");
            }
        }
        return detail.toString();
    }

    private static T6GameData.Result evaluateFromRaw(String rawPath, String mode) {
        Map<String, String> zoneEntries;
        Map<String, String> entries = T6TreeAccess.listRawDirectory(rawPath);
        if (entries == null) {
            return fail("A pasta selecionada não está acessível.");
        }
        List<String> zoneFastfiles = new ArrayList<>();
        String zoneName = findEntryName(entries, T6GameData.DIR_ZONE);
        if (zoneName != null && (zoneEntries = T6TreeAccess.listRawDirectory(rawPath + "/" + zoneName)) != null) {
            zoneFastfiles.addAll(zoneEntries.keySet());
            addRawZoneAll(rawPath + "/" + zoneName, zoneEntries, zoneFastfiles);
        }
        return T6GameData.evaluate(true, new ArrayList(entries.keySet()), zoneFastfiles, mode);
    }

    private static void addRawZoneAll(String zonePath, Map<String, String> zoneEntries, List<String> out) {
        Map<String, String> allEntries;
        String allName = findEntryName(zoneEntries, ZONE_ALL);
        if (allName != null && (allEntries = T6TreeAccess.listRawDirectory(zonePath + "/" + allName)) != null) {
            out.addAll(allEntries.keySet());
        }
    }

    private static T6GameData.Result fail(String detail) {
        return new T6GameData.Result(T6GameData.Level.FAIL, detail, new ArrayList(), new ArrayList());
    }

    private static String findEntryName(Map<String, String> entries, String name) {
        for (String key : entries.keySet()) {
            if (key.equalsIgnoreCase(name)) {
                return key;
            }
        }
        return null;
    }
}
