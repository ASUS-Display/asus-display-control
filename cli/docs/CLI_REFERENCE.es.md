> 🌐 **Idioma**: [English](CLI_REFERENCE.md) · [繁體中文](CLI_REFERENCE.zh-TW.md) · [简体中文](CLI_REFERENCE.zh-CN.md) · [日本語](CLI_REFERENCE.ja.md) · [한국어](CLI_REFERENCE.ko.md) · **Español**

# Referencia de la CLI de ASUS Display Control

Este documento describe la sintaxis de comandos de la CLI de ASUS Display Control.

Versión cubierta: `0.1.0`

Para instrucciones de descarga e instalación, consulte [README.md](../../README.md#-cli-inicio-rápido).

## Uso

### Windows

```powershell
dwc.exe <command> [options]
```

### macOS

```bash
dwc <command> [options]
```

## Opciones globales

| Opción | Descripción |
| --- | --- |
| `-h`, `--help` | Muestra información de ayuda. |
| `-v`, `--version` | Muestra la versión de la CLI. |
| `-id`, `--id <id>` | Selecciona un monitor específico por ID. |
| `<id>` | Forma abreviada de `--id <id>`, por ejemplo `dwc.exe info 1`. |
| `--all` | Se aplica a todos los monitores. Este es el objetivo predeterminado. |

Notas sobre la selección de monitores:

- Los comandos se aplican a todos los monitores detectados de forma predeterminada.
- Use `--id <id>` para seleccionar un solo monitor.
- No combine `--all` y `--id`.
- Ejecute `dwc.exe list` para conocer los ID de los monitores antes de usar `--id`.

## Comandos

| Comando | Sintaxis | Descripción |
| --- | --- | --- |
| `help` | `dwc.exe help` | Muestra información de ayuda. |
| `list` | `dwc.exe list` | Enumera todos los monitores detectados con sus ID. |
| `info` | `dwc.exe info [options]` | Muestra información del monitor, como modelo, número de serie y firmware. |
| `get` | `dwc.exe get <prop> [options]` | Obtiene el valor actual de una propiedad. |
| `set` | `dwc.exe set <prop> <value> [options]` | Establece una propiedad al valor especificado. |
| `reset-all` | `dwc.exe reset-all [options]` | Restablece todos los ajustes a los valores de fábrica. |
| `reset-color` | `dwc.exe reset-color [options]` | Restablece los ajustes de color a los valores de fábrica. |
| `reset-mode` | `dwc.exe reset-mode [options]` | Restablece el modo actual a los valores de fábrica. |
| `getcaps` | `dwc.exe getcaps [options]` | Obtiene la cadena de capacidades VCP en bruto. |
| `getvcp` | `dwc.exe getvcp <code> [options]` | Obtiene el valor de un código VCP en bruto. |
| `setvcp` | `dwc.exe setvcp <code> <value> [options]` | Establece el valor de un código VCP en bruto. |

## Ejemplos comunes

```powershell
dwc.exe list
dwc.exe info
dwc.exe info --id 1

dwc.exe get Brightness
dwc.exe set Brightness 80
dwc.exe get Brightness --id 1
dwc.exe set Brightness 80 --id 1

dwc.exe set InputSource 17 --id 1
dwc.exe set Crosshair 11 --id 1
dwc.exe set FPS 1 --id 1

dwc.exe getcaps --id 1
dwc.exe getvcp 0x10 --id 1
dwc.exe setvcp 0x10 80 --id 1

dwc.exe reset-all --id 1
```

## Referencia de propiedades

Las propiedades compatibles varían según el modelo de monitor ASUS, el firmware, el modo de entrada y la ruta de conexión. Si una propiedad no es compatible, use `dwc.exe --help`, `dwc.exe getcaps` o la documentación específica del modelo para confirmar su disponibilidad.

### Imagen y color

| Propiedad | Valores |
| --- | --- |
| `Brightness` | Nivel de brillo, `0-100`. |
| `BlueLightFilter` | Nivel de filtro de luz azul, `0:OFF`, `1-Max`. |
| `Contrast` | Nivel de contraste, `0-100`. |
| `ColorTemp` | `3:4000K`, `4:5000K`, `5:6500K`, `6:7500K`, `7:8200K`, `8:9300K`, `9:10000K`, `11:User`. |
| `Gamma` | Curva gamma, `1.8`, `2.0`, `2.2`, `2.4`, `2.6`. |
| `Hue` | Tono de color, `0-100`. |
| `Saturation` | Saturación de color, `0-100`. |
| `Sharpness` | Nitidez, `0-100`. |
| `RedGain`, `GreenGain`, `BlueGain` | Ganancia RGB, `0-100`. |
| `RedOffset`, `GreenOffset`, `BlueOffset` | Desplazamiento RGB, `0-100`. |
| `Overdrive` | Mejora del tiempo de respuesta / Trace Free, `0:OFF`, `1-Max`. |
| `ShadowBoost` | Realce de sombras, `0:OFF`, `1-Max`. |
| `FrameRateBoost` | Impulso de tasa de fotogramas en modo dual, `0:OFF`, `1:ON`. |
| `DynamicDimming` | Atenuación dinámica, `0:OFF`, `1-Max`. |
| `ASCR` | Relación de contraste inteligente ASUS, `0:OFF`, `1:ON`. |
| `Uniformity` | Compensación de uniformidad, `0:OFF`, `1:ON`. |

### Modos de visualización

| Propiedad | Valores |
| --- | --- |
| `Splendid` | Preajuste ZenScreen y Business: `1:Theater`, `2:Scenery`, `3:sRGB`, `4:Standard`, `5:Game`, `6:Night View`, `7:Reading`, `8:Darkroom`. |
| `GameVisual` | Preajuste ROG/TUF Gaming: `1:Cinema`, `2:Scenery`, `3:sRGB`, `4:User`, `5:Racing`, `6:RTS/RPG`, `7:FPS`, `8:MOBA`, `9:Night Vision`, `10:sRGB Calibration`. |
| `ProArtPreset` | Preajuste ProArt: `0:Native`, `1:sRGB`, `2:AdobeRGB`, `3:Rec.2020`, `4:DCI-P3`, `5:DICOM`, `6:Rec.709`. |
| `InputRange` | `0:Auto`, `1:Full`, `2:Limited 16-235`, `3:Limited 16-254`, `4:SDI Full`. |
| `DualDisplay` | Modo de doble pantalla ZenScreen: `1:Mirror`, `2:Extend`, `3:Split`, `4:Independent`. |
| `PxP` | Modo PIP/PBP: `0:OFF`, `1:PIP Top-Right`, `2:PIP Top-Left`, `3:PIP Bottom-Right`, `4:PIP Bottom-Left`, `5:PBP Left/Right Equal`, `6:PBP Left Large`, `7:PBP Right Large`, `8:Frame x4 (2x2)`, `9:Frame x3 (Left Large, Right Top, Right Bottom)`, `10:Frame x3 (Right Large, Left Top, Left Bottom)`. |
| `PIPSize` | Tamaño de PIP, `0:OFF`, `1:Small`, `2:Medium`, `3:Large`. |

### Configuración del sistema

| Propiedad | Valores |
| --- | --- |
| `AudioVolume` | Volumen del altavoz, `0-100`. |
| `PowerSaving` | Modo de energía, `0:Standard/Performance`, `1:PowerSaving`. |
| `UsageTime` | Tiempo total de uso de la pantalla en horas, solo lectura. |
| `PowerIndicator` | Indicador LED de encendido, `0:OFF`, `1:ON`. |
| `PowerKeyLock` | Bloqueo del botón de encendido, `0:OFF`, `1:ON`. |
| `KeyLock` | Bloqueo de teclas, `0:OFF`, `1:ON`. |
| `SoundMute` | Silencio de sonido, `0:OFF`, `1:ON`. |
| `InputDetection` | Detección automática de entrada, `0:OFF`, `1:ON`. |
| `InputSource` | Entrada de vídeo: `1:VGA`, `15:DP-1`, `16:DP-2`, `17:HDMI-1`, `18:HDMI-2`, `19:HDMI-3`, `21:TB-1`, `22:TB-2`, `26:USBC-1`, `27:USBC-2`, `30:SDI-1`, `31:SDI-2`. |
| `OSDTransparency` | Transparencia del OSD, `0-Max`. |
| `OSDTimeout` | Tiempo de espera del OSD en segundos, `0-Max`. |
| `OSDLanguage` | `1:ChineseTraditional`, `2:English`, `3:French`, `4:German`, `5:Italian`, `6:Japanese`, `7:Korean`, `8:Portuguese`, `9:Russian`, `10:Spanish`, `12:Turkish`, `13:ChineseSimplified`, `17:Croatian`, `18:Czech`, `20:Dutch`, `26:Hungarian`, `30:Polish`, `31:Romanian`, `35:Thai`, `36:Ukrainian`, `37:Vietnamese`, `38:Persian`, `39:Indonesian`. |
| `EZOSD` | Control del menú OSD sencillo: `0:Close Menu`, `1:Show Menu`, `2:Up`, `3:Down`, `4:Right`, `5:Left`, `6:Enter`, `7:Back`. |

### GamePlus y QuickFit

| Propiedad | Valores |
| --- | --- |
| `FPS` | Contador de FPS, `0:OFF`, `1:Numerical`, `2:Bar Graph`. |
| `Timer` | Superposición de temporizador, `0:OFF`, `1:30s`, `2:40s`, `3:50s`, `4:60s`, `5:90s`. |
| `Crosshair` | Superposición de mira: `0:OFF`, `7:Blue dot`, `8:Green dot`, `9:Blue target`, `10:Green target`, `11:Blue crosshair`, `12:Green crosshair`. |
| `DisplayAlignment` | Alineación de pantalla, `0:OFF`, `1:ON`. |

### Iluminación Aura

| Propiedad | Valores |
| --- | --- |
| `AuraColor` | Color Aura: `0:OFF`, `1:Red`, `2:Green`, `3:Blue`, `4:Cyan`, `5:Magenta`, `6:Yellow`. |
| `AuraMode` | Modo Aura: `0:OFF`, `1:Aura Sync (Armoury Crate)`, `2:Aura RGB - Rainbow`, `3:Aura RGB - Color Cycle`, `4:Aura RGB - Static`, `5:Aura RGB - Breathing`, `6:Aura RGB - Strobing`. |

### Autocalibración ProArt

| Propiedad | Valores |
| --- | --- |
| `SelfCalStart` | Ejecución de la autocalibración: `0:OFF`, `1:Start with warm up`, `2:Start without warm up`. |
| `SelfCalTarget` | Modos objetivo de la autocalibración: `0:sRGB`, `1:Adobe RGB`, `2:Rec.2020`, `3:DCI-P3`, `4:DICOM`, `5:Rec.709`, `6:HDR_PQ`, `7:HDR_HLG`. |
| `SelfCalRoutine` | Modo de repetición de la autocalibración: `0:Off`, `1:Single`, `2:Daily`, `3:Every 7 days`, `4:Every 14 days`, `5:Every 28 days`. |
| `SelfCalSystemDate` | Fecha del sistema de autocalibración por bits: `[4:0]:Day`, `[8:5]:Month`, `[15:9]:Years since 2000`. |
| `SelfCalSystemClock` | Hora del sistema de autocalibración por bits: `[5:0]:Minute`, `[10:6]:Hour`. |
| `SelfCalApptDate` | Fecha de la cita de autocalibración por bits: `[4:0]:Day`, `[8:5]:Month`, `[15:9]:Years since 2000`. |
| `SelfCalApptClock` | Hora de la cita de autocalibración por bits: `[5:0]:Minute`, `[10:6]:Hour`. |
| `SelfCalFWVersion` | Versión de firmware del MCU de autocalibración, solo lectura. |

### Funciones OLED

| Propiedad | Valores |
| --- | --- |
| `OledAntiFlicker` | Nivel antiparpadeo OLED, `0:OFF`, `1:ON`. |
| `OledScreenMove` | Desplazamiento de pantalla OLED, `0-Max`. |
| `OledWarningTimer` | Recordatorio de limpieza de píxeles OLED en horas, `0-Max`. |
| `OledPixelClean` | Limpieza de píxeles OLED, `0:Stop`, `1:Start`. |
| `OledDisplaySaver` | Protector de pantalla OLED, `0:OFF`, `1:ON`. |
| `OledScreenDimming` | Atenuación de pantalla del protector de pantalla OLED, `0:OFF`, `1:ON`. |
| `OledUniformBrightness` | Brillo uniforme OLED, `0:OFF`, `1:ON`. |
| `OledOuterDimming` | Atenuación exterior del protector de pantalla OLED, `0:OFF`, `1:ON`. |
| `OledGlobalDimming` | Atenuación global del protector de pantalla OLED, `0:OFF`, `1:ON`. |
| `OledLogoDetection` | Detección de logotipo del brillo automático de logotipo OLED, `0:OFF`, `1:ON`. |
| `OledTaskbarDetection` | Detección de barra de tareas del brillo automático de logotipo OLED, `0:OFF`, `1:ON`. |
| `OledBoundaryDetection` | Detección de límites del brillo automático de logotipo OLED, `0:OFF`, `1:ON`. |
