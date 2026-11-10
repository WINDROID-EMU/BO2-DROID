package org.wiiucoop.bo2android;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

/* loaded from: classes3.dex */
public final class T6GameData {
    public static final String DIR_ZONE = "zone";
    public static final String DIR_MAIN = "main";
    public static final String DIR_PLAYERS = "players";
    public static final String DIR_MODS = "mods";
    private static final String[] ROOT_MARKERS = {DIR_ZONE, DIR_MAIN, DIR_PLAYERS, DIR_MODS, "t6mp.exe", "t6zm.exe"};

    public enum Level {
        OK,
        WARN,
        FAIL
    }

    public static final class Result {
        public final String detail;
        public final List<String> found;
        public final Level level;
        public final List<String> missing;

        Result(Level level, String detail, List<String> found, List<String> missing) {
            this.level = level;
            this.detail = detail;
            this.found = found;
            this.missing = missing;
        }

        public boolean allowsStart() {
            return this.level != Level.FAIL;
        }
    }

    private T6GameData() {
    }

    public static String fastfilePrefixFor(String mode) {
        if (T6Config.MODE_ZM.equals(mode)) {
            return "zm_";
        }
        if (T6Config.MODE_MP.equals(mode)) {
            return "mp_";
        }
        return "";
    }

    public static List<String> rootMarkers() {
        List<String> markers = new ArrayList<>();
        for (String marker : ROOT_MARKERS) {
            markers.add(marker);
        }
        return markers;
    }

    public static Result evaluate(boolean readable, Collection<String> rootNames, Collection<String> zoneFastfiles, String mode) {
        List<String> found = new ArrayList<>();
        List<String> missing = new ArrayList<>();
        if (!readable) {
            missing.add("acesso de leitura à pasta");
            return new Result(Level.FAIL, "Não foi possível ler a pasta escolhida. Conceda o acesso novamente.", found, missing);
        }
        List<String> names = lowerCase(rootNames);
        for (String marker : ROOT_MARKERS) {
            if (names.contains(marker.toLowerCase(Locale.ROOT))) {
                found.add(marker);
            }
        }
        if (found.isEmpty()) {
            missing.add("zone/");
            missing.add("main/");
            missing.add("players/");
            return new Result(Level.FAIL, "A pasta não parece conter dados do Black Ops II: não encontrei zone/, main/, players/, mods/ nem os executáveis t6mp.exe/t6zm.exe.", found, missing);
        }
        if (!names.contains(DIR_ZONE)) {
            missing.add("zone/ (fastfiles)");
            return new Result(Level.WARN, "Reconheci dados do BO2 (" + String.join(", ", found) + "), mas não há a pasta zone/ com os fastfiles do cliente selecionado.", found, missing);
        }
        String prefix = fastfilePrefixFor(mode);
        List<String> fastfiles = new ArrayList<>();
        for (String name : lowerCase(zoneFastfiles)) {
            if (name.endsWith(".ff")) {
                fastfiles.add(name);
            }
        }
        if (fastfiles.isEmpty()) {
            missing.add("zone/*.ff");
            return new Result(Level.WARN, "A pasta zone/ existe mas não vi nenhum fastfile (.ff). O cliente pode falhar ao carregar o nível.", found, missing);
        }
        if (prefix.isEmpty()) {
            return new Result(Level.WARN, "Dados reconhecidos e " + fastfiles.size() + " fastfiles visíveis, mas nenhum modo foi escolhido para conferi-los.", found, missing);
        }
        int matching = 0;
        Iterator<String> it = fastfiles.iterator();
        while (it.hasNext()) {
            if (it.next().startsWith(prefix)) {
                matching++;
            }
        }
        if (matching == 0) {
            missing.add("zone/" + prefix + "*.ff");
            return new Result(Level.WARN, "Encontrei " + fastfiles.size() + " fastfiles, mas nenhum com o prefixo " + prefix + " do cliente " + T6Config.modeLabel(mode) + " selecionado.", found, missing);
        }
        return new Result(Level.OK, "Dados do BO2 encontrados: " + String.join(", ", found) + " e " + matching + " fastfiles " + prefix + "*.ff do cliente " + T6Config.modeLabel(mode) + ".", found, missing);
    }

    public static String describeRequirement(String mode) {
        String prefix = fastfilePrefixFor(mode);
        return prefix.isEmpty() ? "escolha MULTIPLAYER ou ZOMBIES" : "zone/" + prefix + "*.ff";
    }

    private static List<String> lowerCase(Collection<String> names) {
        List<String> lowered = new ArrayList<>();
        if (names == null) {
            return lowered;
        }
        for (String name : names) {
            if (name != null) {
                lowered.add(name.toLowerCase(Locale.ROOT));
            }
        }
        return lowered;
    }
}
