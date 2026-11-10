# T6Requiem (BO2 Android) — projeto Android reconstruído a partir do APK

Reconstrução de engenharia reversa do APK `BO2.apk` (`com.t6requiem.bo2arm`,
v2.1.0-beta, versionCode 25, minSdk 26, targetSdk 35) em um projeto Gradle que
compila e gera um APK equivalente ao original em estrutura.

O app é um port de *Call of Duty: Black Ops II* para Android: uma camada Java
(activities + utilitários `T6*`), a camada Java do SDL3 e dez bibliotecas nativas
arm64-v8a (SDL3, DXVK, hooks de redirecionamento de arquivos/alocador, motor).

## Como compilar

```bash
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
./gradlew assembleDebug          # APK em app/build/outputs/apk/debug/
```

Requisitos: JDK 17, Android SDK com platform 35 e build-tools recentes. O projeto
está configurado em `app/build.gradle` (namespace `org.wiiucoop.bo2android`,
applicationId `com.t6requiem.bo2arm`, apenas ABI `arm64-v8a`).

## Estrutura

| Caminho | Conteúdo |
| --- | --- |
| `BO2.apk` | APK original, usado como referência de bytes e de smali |
| `work/apktool/` | Saída do apktool: `smali*/` (bytecode legível), `res/`, `AndroidManifest.xml` |
| `work/jadx/sources/` | Saída do jadx (Java descompilado, ponto de partida dos fontes) |

`work/apktool/` é mantido no repositório para servir de referência na comparação
com o bytecode, mas sem as árvores `assets/` e `lib/` (o apktool as copia
inteiras e elas já estão em `app/src/main/`). Para regerar tudo a partir do
`BO2.apk`:

```bash
apktool d -f -o work/apktool BO2.apk
jadx -d work/jadx/sources --no-res BO2.apk
```
| `app/src/main/java/` | 171 arquivos Java: 65 classes do app/SDL + 109 lambdas R8 reconstruídas + `R`/`BuildConfig` gerados pelo AGP |
| `app/src/main/res/` | Recursos decodificados (layouts, drawables, 5 idiomas de `values`) |
| `app/src/main/assets/` | `dxvk/legacy-1.9.2`, `dxvk/upstream-3.1.1`, `guest/*.elf` + manifesto sha256 |
| `app/src/main/jniLibs/arm64-v8a/` | As 10 `.so` extraídas do APK, sem modificação |
| `tools/` | Scripts de reparo usados na reconstrução (ver abaixo) |

## Pipeline de engenharia reversa

1. `apktool d` → smali, recursos e manifesto (fonte da verdade do bytecode).
2. `jadx` → Java descompilado, usado como base dos fontes.
3. `CFR`/dump de fallback do jadx → segunda opinião nos métodos que o jadx
   abandonou (`T6KennelPackage.install`, `copyHashing`).
4. Reparo dos artefatos de descompilação (abaixo), sempre conferindo no smali.
5. `app/build.gradle` + `AndroidManifest.xml` remontados a partir do
   `BuildConfig.class` original e do manifesto decodificado.

## O que estava quebrado e como foi corrigido

O jadx/D8 deixaram seis categorias de defeito. Todas foram corrigidas contra o
bytecode, não "no escuro":

1. **Classes de lambda ausentes (109).** O APK foi compilado com desugaring de
   lambdas: cada expressão virou uma classe `X$$ExternalSyntheticLambdaN`, que o
   jadx não gera. `tools/regen_lambdas.py` reconstrói cada classe (campo
   capturado + construtor + método da interface) traduzindo o smali. Nove
   classes cujo método alvo foi inlinado pelo R8 receberam o corpo do delegado
   embutido; duas (`LogsActivity$$ExternalSyntheticLambda4`,
   `T6TouchOverlay$$ExternalSyntheticLambda0`) foram escritas à mão por serem
   delegados de uma linha.
2. **Métodos pulados ou truncados pelo jadx.**
   `T6KennelPackage.install` (instalação do "kennel", com verificação de sha256
   por arquivo) e `T6KennelPackage.copyHashing` foram reescritos a partir do
   dump de bytecode.
3. **Estruturas `try/finally` destruídas (vazamento de recursos).** O jadx deixa o
   `close()` como último comando do `try` e um `finally` vazio — o recurso vaza
   em qualquer caminho de erro. Havia 13 blocos `finally` vazios; todos foram
   refeitos com o `close()` no `finally` (ou try-with-resources, quando era esse
   o caso): `T6DxvkStore.importZip`/`select`/`read`,
   `T6DriverPackage.importZip`/`copyHashed`/`sha256`/`readAll`,
   `T6GuestImage.install`/`updateVerifies`/`installedUpdate`/`matches`,
   `T6Updater.sourceManifest`/`installSource`/`sha256`, `T6PlayerName.save`,
   `T6DriverStore.select`/`read`, `T6SafStore.document`, `T6KennelPackage.state`,
   `T6TreeAccess.listTreeDirectory` (cursor), `T6DeviceInfo.cpuInfoLine`,
   `SettingsActivity.applyFolder`, `LogsActivity` (exportação de logs),
   `GraphicsDriverActivity.importFromUri`/`displayName`.

   Um efeito colateral perigoso desse dano: em `T6Updater.installSource` o jadx
   colapsou duas variáveis distintas (`zip` do cache e o `manifest` gerado) no
   mesmo nome. Com o `finally` restaurado, isso apagaria o manifesto recém-
   gravado; as duas variáveis foram separadas, como no bytecode.
4. **`throws` inventados.** O jadx declara `throws IOException` em métodos que
   no bytecode não têm `dalvik/annotation/Throws`, o que quebra cadeias de
   chamada (callbacks `Runnable`, overrides do Android). As declarações falsas
   foram removidas e as verdadeiras preservadas — `MenuActivity.UpdateJob.run()`
   e `T6KennelPackage.parse` de fato lançam `IOException`, e os três lambdas de
   `UpdateJob` declaram isso.
5. **Locais `final` reatribuídos e variáveis não inicializadas.**
   `T6TouchSelfTest.schedule` e `T6GuestImage.installedUpdate` tinham o fluxo
   embaralhado; reescritos com a mesma ordem de operações do bytecode.
6. **Camada Java do SDL3.** `HIDDeviceBLESteamController`, `HIDDeviceManager` e
   `SDLGenericMotionListener_API14` vieram com classes internas e capturas
   `this.f$0` malformadas; corrigidos contra o smali (SDL 3.5.0).

Ajustes menores de empacotamento: `mipmap-anydpi` → `mipmap-anydpi-v26` (o
original declara o ícone adaptativo em `-v26`), `useLegacyPackaging` para as
`.so` serem extraídas em disco (os hooks abrem as bibliotecas por caminho), e os
campos de `BuildConfig` recuperados (`T6_UPDATE_URL`, `T6_UPDATE_CHANNEL`,
`T6_SOURCE_CODE`, `T6_ENGINE_DIAG`, `T6_SIGNING_CERT_SHA256`).

## Verificação

* `./gradlew compileDebugJavaWithJavac` → **BUILD SUCCESSFUL** (0 erros; só
  avisos de API depreciada).
* `./gradlew assembleDebug` → **BUILD SUCCESSFUL**, APK de 34,9 MB contra 34,9 MB
  do original.
* `aapt2 dump badging` do APK gerado é **idêntico** ao do original: pacote,
  versão, minSdk/targetSdk, permissões, label, ícone, activities e filtros.
* Conteúdo do APK idêntico em `lib/arm64-v8a` (10 `.so`), `assets/` (7 arquivos)
  e número de dex (3).
* Comparação de classes via `dexdump`: todas as 273 classes do APK original têm
  equivalente funcional no rebuild. As diferenças são só de nomenclatura —
  o rebuild gera classes anônimas `$N` (javac) onde o original tinha lambdas D8
  desugeradas, e vice-versa; `T6DriverPackage$1` do original é uma classe
  sintética vazia, sem membros.

## Limitações conhecidas

* **Assinatura.** `T6Integrity` compara o certificado instalado com
  `BuildConfig.T6_SIGNING_CERT_SHA256` (`2b4f103b…`). Um build de debug é
  assinado com outra chave e o app se recusa a rodar; para distribuir é preciso
  assinar com a chave original ou remover essa checagem.
* **Nada do código nativo foi alterado** — as `.so` são binários pré-compilados
  do APK; o motor, os hooks e o DXVK continuam opacos.
* O comportamento em execução não foi testado em aparelho: a verificação é
  estática (compilação, manifesto, conteúdo do APK e conjunto de classes).
* `tools/*.py` são auxiliares de reparo aplicados sobre a árvore; `regen_lambdas.py`
  pode ser executado novamente com segurança (regenera as 109 classes a partir do
  smali), mas `fix_javac.py` e `fix_finally.py` pressupõem o estado descompilado
  original e não devem ser reaplicados.
