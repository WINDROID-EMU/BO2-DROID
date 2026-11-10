package org.wiiucoop.bo2android;

import org.wiiucoop.bo2android.T6EngineCommand;

/* loaded from: classes3.dex */
public final class T6SessionMenu {
    public static final int ACTION_DOWN = 0;
    public static final int ACTION_UP = 1;
    public static final int FLAG_FALLBACK = 1024;
    public static final int KEY_CODE_BACK = 4;
    public static final int SOURCE_GAMEPAD = 1025;
    public static final int SOURCE_JOYSTICK = 16777232;
    private boolean visible;

    public enum BackAction {
        OPEN_PANEL,
        CLOSE_PANEL,
        LEAVE_SESSION
    }

    public static boolean isBackKey(int keyCode) {
        return keyCode == 4;
    }

    public static boolean isBackPress(int keyCode, int action) {
        return isBackKey(keyCode) && action == 1;
    }

    public static boolean isPanelBack(int keyCode, int source, int flags) {
        return isBackKey(keyCode) && (flags & 1024) == 0 && (source & SOURCE_GAMEPAD) != 1025 && (source & SOURCE_JOYSTICK) != 16777232;
    }

    public boolean isVisible() {
        return this.visible;
    }

    public void open() {
        this.visible = true;
    }

    public void close() {
        this.visible = false;
    }

    public BackAction onBack(boolean hostRunning) {
        if (this.visible) {
            this.visible = false;
            return BackAction.CLOSE_PANEL;
        }
        if (hostRunning) {
            this.visible = true;
            return BackAction.OPEN_PANEL;
        }
        return BackAction.LEAVE_SESSION;
    }

    public static final class Snapshot {
        public final String client;
        public final String engine;
        public final String folder;
        public final String fps;
        public final String session;

        Snapshot(String client, String folder, String session, String engine, String fps) {
            this.client = client;
            this.folder = folder;
            this.session = session;
            this.engine = engine;
            this.fps = fps;
        }
    }

    public static Snapshot snapshot(T6Config config, T6SessionState state, T6EngineCommand.Result lastFps, String fpsRequested) {
        String client;
        String folder;
        String sessionLine;
        String engineLine;
        String fpsLine;
        T6SessionState session = state == null ? T6SessionState.UNAVAILABLE : state;
        if (config == null || !config.hasMode()) {
            client = "Cliente: nenhum selecionado";
        } else {
            client = "Cliente: " + T6Config.modeLabel(config.mode) + " (" + config.mode + ")";
        }
        if (config == null || !config.hasFolder()) {
            folder = "Pasta do jogo: nenhuma selecionada";
        } else {
            String display = config.gameDirDisplay.isEmpty() ? config.gameDirUri : config.gameDirDisplay;
            folder = "Pasta do jogo: " + display;
        }
        if (!session.answered) {
            sessionLine = "Sessão: o host não respondeu sobre esta execução";
        } else {
            switch (session.state) {
                case RUNNING:
                    String sessionLine2 = "Sessão: host gráfico ativo, " + session.frames + " frames apresentados";
                    sessionLine = sessionLine2;
                    break;
                case IDLE:
                    sessionLine = "Sessão: o host ainda não começou a apresentar";
                    break;
                case FINISHED:
                    sessionLine = "Sessão: o host encerrou a apresentação";
                    break;
                default:
                    sessionLine = "Sessão: estado desconhecido";
                    break;
            }
        }
        if (session.engineAttached) {
            engineLine = "Motor do jogo: inicializado";
        } else {
            engineLine = "Motor do jogo: não inicializado — nenhum cliente MP/ZM foi carregado";
        }
        if (lastFps == null) {
            fpsLine = "cg_drawfps: não solicitado nesta sessão";
        } else {
            String value = (fpsRequested == null || fpsRequested.isEmpty()) ? T6EngineCommand.VALUE_OFF : fpsRequested;
            fpsLine = T6EngineCommand.describe(lastFps, T6EngineCommand.DVAR_FPS_OVERLAY, value);
        }
        return new Snapshot(client, folder, sessionLine, engineLine, fpsLine);
    }

    public static String statusLine(T6SessionState state, boolean panelOpen) {
        String str;
        String str2;
        T6SessionState session = state == null ? T6SessionState.UNAVAILABLE : state;
        StringBuilder line = new StringBuilder();
        if (!session.answered) {
            line.append("Host gráfico: o host nativo não respondeu");
        } else {
            switch (session.state) {
                case RUNNING:
                    line.append("Host gráfico ativo · ").append(session.frames).append(session.engineAttached ? " Present() do motor contados pelo host" : " frames apresentados");
                    break;
                case IDLE:
                    line.append("Host gráfico: ainda não começou a apresentar");
                    break;
                case FINISHED:
                    line.append("Host gráfico: encerrou a apresentação");
                    break;
                default:
                    line.append("Host gráfico: estado desconhecido");
                    break;
            }
        }
        if (session.engineAttached) {
            str = " · motor do jogo: em execução (o FPS na tela é o contador do próprio motor)";
        } else {
            str = " · motor do jogo: não inicializado (runtime ILP32 ausente)";
        }
        line.append(str);
        if (panelOpen) {
            str2 = " · Voltar fecha o menu";
        } else {
            str2 = " · Voltar abre o menu do T6-Recomp";
        }
        line.append(str2);
        return line.toString();
    }
}
