package org.wiiucoop.bo2android;

import org.wiiucoop.bo2android.T6GameData;

/* loaded from: classes3.dex */
public final class T6StartDecision {

    public enum Code {
        READY,
        NO_FOLDER,
        FOLDER_UNUSABLE,
        NO_MODE
    }

    public static final class Decision {
        public final boolean canLaunchHost;
        public final boolean canLoadEngine;
        public final Code code;
        public final String reason;

        Decision(Code code, boolean canLaunchHost, boolean canLoadEngine, String reason) {
            this.code = code;
            this.canLaunchHost = canLaunchHost;
            this.canLoadEngine = canLoadEngine;
            this.reason = reason;
        }
    }

    private T6StartDecision() {
    }

    public static Decision evaluate(T6Config config, T6GameData.Result data, boolean engineRuntimeAvailable, String engineRuntimeReason) {
        String runtimeReason;
        if (config == null || !config.hasFolder()) {
            return new Decision(Code.NO_FOLDER, false, false, "Nenhuma pasta do jogo foi selecionada.");
        }
        if (data == null || !data.allowsStart()) {
            return new Decision(Code.FOLDER_UNUSABLE, false, false, data == null ? "A pasta não foi validada." : data.detail);
        }
        if (!config.hasMode()) {
            return new Decision(Code.NO_MODE, false, false, "Escolha MULTIPLAYER ou ZOMBIES antes de iniciar.");
        }
        if (engineRuntimeReason == null || engineRuntimeReason.isEmpty()) {
            runtimeReason = "O runtime do motor não está disponível nesta compilação.";
        } else {
            runtimeReason = engineRuntimeReason;
        }
        return new Decision(Code.READY, true, engineRuntimeAvailable, runtimeReason);
    }

    public static String describeLaunch(Decision decision, T6Config config) {
        if (decision == null || !decision.canLaunchHost) {
            return decision == null ? "" : decision.reason;
        }
        String client = T6Config.modeLabel(config.mode);
        if (decision.canLoadEngine) {
            return "Cliente " + client + " pronto para iniciar.";
        }
        return "Cliente " + client + " selecionado e pasta validada. O host gráfico será iniciado (janela SDL3, superfície Vulkan e DXVK D3D11), mas o cliente não pode carregar ainda: " + decision.reason;
    }
}
