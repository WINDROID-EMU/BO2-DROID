package org.wiiucoop.bo2android;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.DocumentsContract;
import android.util.Log;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.wiiucoop.bo2android.T6PlayerName;

/* loaded from: classes3.dex */
final class T6SafStore implements T6PlayerName.Store {
    private static final String TAG = "t6android";
    private Uri cachedFile;
    private final String description;
    private boolean lookedUp;
    private final ContentResolver resolver;
    private final Uri tree;

    T6SafStore(Context context, Uri tree, String description) {
        this.resolver = context.getContentResolver();
        this.tree = tree;
        this.description = (description == null || description.isEmpty()) ? String.valueOf(tree) : description;
    }

    static T6SafStore forTree(Context context, String treeUri, String display) {
        Uri parsed = T6TreeAccess.parse(treeUri);
        if (parsed == null) {
            return null;
        }
        return new T6SafStore(context, parsed, display);
    }

    @Override // org.wiiucoop.bo2android.T6PlayerName.Store
    public boolean ready() {
        if (this.tree == null || !DocumentsContract.isTreeUri(this.tree)) {
            return false;
        }
        try {
            return directoryId() != null;
        } catch (SecurityException e) {
            Log.i(TAG, "playername: sem permissão para a pasta do jogo: " + e);
            return false;
        } catch (RuntimeException e2) {
            Log.i(TAG, "playername: a pasta do jogo não respondeu: " + e2);
            return false;
        }
    }

    @Override // org.wiiucoop.bo2android.T6PlayerName.Store
    public boolean exists() throws IOException {
        return document() != null;
    }

    @Override // org.wiiucoop.bo2android.T6PlayerName.Store
    public InputStream openRead() throws IOException {
        Uri document = document();
        if (document == null) {
            throw new FileNotFoundException(T6PlayerName.FILE_NAME);
        }
        InputStream in = this.resolver.openInputStream(document);
        if (in == null) {
            throw new IOException("o provedor não abriu playername.txt para leitura");
        }
        return in;
    }

    @Override // org.wiiucoop.bo2android.T6PlayerName.Store
    public OutputStream openWrite() throws IOException {
        Uri document = document();
        if (document == null) {
            document = create();
        }
        try {
            OutputStream out = this.resolver.openOutputStream(document, "wt");
            if (out != null) {
                return out;
            }
        } catch (IllegalArgumentException | SecurityException e) {
            Log.i(TAG, "playername: o provedor recusou \"wt\", tentando \"w\": " + e);
        }
        OutputStream out2 = this.resolver.openOutputStream(document, "w");
        if (out2 == null) {
            throw new IOException("o provedor não abriu playername.txt para escrita");
        }
        return out2;
    }

    @Override // org.wiiucoop.bo2android.T6PlayerName.Store
    public String describe() {
        return this.description;
    }

    private String directoryId() {
        try {
            return DocumentsContract.getTreeDocumentId(this.tree);
        } catch (IllegalArgumentException e) {
            return null;
        }
    }

    private Uri document() throws IOException {
        if (this.lookedUp) {
            return this.cachedFile;
        }
        String directory = directoryId();
        if (directory == null) {
            throw new IOException("a pasta do jogo não é um diretório utilizável");
        }
        Uri children = DocumentsContract.buildChildDocumentsUriUsingTree(this.tree, directory);
        try {
            Cursor cursor = this.resolver.query(children, new String[]{"_display_name", "document_id"}, null, null, null);
            try {
                if (cursor == null) {
                    throw new IOException("o provedor não listou a pasta do jogo");
                }
                while (cursor.moveToNext()) {
                    if (T6PlayerName.FILE_NAME.equals(cursor.getString(0))) {
                        this.cachedFile = DocumentsContract.buildDocumentUriUsingTree(this.tree, cursor.getString(1));
                        this.lookedUp = true;
                        return this.cachedFile;
                    }
                }
                this.lookedUp = true;
                this.cachedFile = null;
                return null;
            } finally {
                if (cursor != null) {
                    cursor.close();
                }
            }
        } catch (SecurityException e) {
            throw new IOException("sem permissão para ler a pasta do jogo: " + e);
        }
    }

    private Uri create() throws IOException {
        String directory = directoryId();
        if (directory == null) {
            throw new IOException("a pasta do jogo não é um diretório utilizável");
        }
        Uri parent = DocumentsContract.buildDocumentUriUsingTree(this.tree, directory);
        try {
            Uri created = DocumentsContract.createDocument(this.resolver, parent, "text/plain", T6PlayerName.FILE_NAME);
            if (created == null) {
                throw new IOException("o provedor não criou playername.txt");
            }
            Log.i(TAG, "playername: playername.txt criado em " + this.description);
            this.cachedFile = created;
            this.lookedUp = true;
            return created;
        } catch (SecurityException e) {
            throw new IOException("sem permissão para criar playername.txt na pasta do jogo: " + e);
        }
    }

    static void syncInto(Context context, String treeUri, String display, String name) {
        T6SafStore store;
        if (name == null || name.isEmpty() || (store = forTree(context, treeUri, display)) == null) {
            return;
        }
        T6PlayerName.Result result = T6PlayerName.save(store, name);
        Log.i(TAG, "playername: sincronização com a nova pasta -> " + result.message);
    }
}
