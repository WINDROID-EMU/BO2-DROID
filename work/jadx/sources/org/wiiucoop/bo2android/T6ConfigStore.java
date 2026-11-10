package org.wiiucoop.bo2android;

import java.io.File;
import java.io.IOException;
import java.util.function.Consumer;

/* loaded from: classes3.dex */
final class T6ConfigStore {
    private final File file;

    T6ConfigStore(File file) {
        this.file = file;
    }

    File file() {
        return this.file;
    }

    T6Config load() {
        return T6Config.load(this.file);
    }

    T6Config update(Consumer<T6Config> change) throws IOException {
        T6Config current = T6Config.load(this.file);
        change.accept(current);
        current.save(this.file);
        return current;
    }
}
