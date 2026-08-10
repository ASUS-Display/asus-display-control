> 🌐 **語言**: [English](CLI_REFERENCE.md) · **繁體中文** · [简体中文](CLI_REFERENCE.zh-CN.md) · [日本語](CLI_REFERENCE.ja.md) · [한국어](CLI_REFERENCE.ko.md) · [Español](CLI_REFERENCE.es.md)

# ASUS Display Control CLI 參考手冊

本文件說明 ASUS Display Control CLI 的指令語法。

適用版本：`0.1.0`

如需下載與安裝說明，請參閱 [README.md](../../README.md#-cli-快速開始)。

## 使用方式

### Windows

```powershell
dwc.exe <command> [options]
```

### macOS

```bash
dwc <command> [options]
```

## 全域選項

| 選項 | 說明 |
| --- | --- |
| `-h`, `--help` | 顯示說明資訊。 |
| `-v`, `--version` | 顯示 CLI 版本。 |
| `-id`, `--id <id>` | 指定目標螢幕的 ID。 |
| `<id>` | `--id <id>` 的簡寫形式，例如 `dwc.exe info 1`。 |
| `--all` | 套用至所有螢幕。此為預設目標。 |

螢幕選取注意事項：

- 指令預設會套用至所有偵測到的螢幕。
- 使用 `--id <id>` 可指定單一螢幕為目標。
- 請勿同時使用 `--all` 與 `--id`。
- 使用 `--id` 前，請先執行 `dwc.exe list` 以查詢螢幕 ID。

## 指令

| 指令 | 語法 | 說明 |
| --- | --- | --- |
| `help` | `dwc.exe help` | 顯示說明資訊。 |
| `list` | `dwc.exe list` | 列出所有偵測到的螢幕及其 ID。 |
| `info` | `dwc.exe info [options]` | 顯示螢幕資訊，例如型號、序號與韌體版本。 |
| `get` | `dwc.exe get <prop> [options]` | 取得屬性的目前值。 |
| `set` | `dwc.exe set <prop> <value> [options]` | 將屬性設定為指定值。 |
| `reset-all` | `dwc.exe reset-all [options]` | 將所有設定重設為出廠預設值。 |
| `reset-color` | `dwc.exe reset-color [options]` | 將色彩設定重設為出廠預設值。 |
| `reset-mode` | `dwc.exe reset-mode [options]` | 將目前模式重設為出廠預設值。 |
| `getcaps` | `dwc.exe getcaps [options]` | 取得原始 VCP 功能字串。 |
| `getvcp` | `dwc.exe getvcp <code> [options]` | 取得原始 VCP 代碼的值。 |
| `setvcp` | `dwc.exe setvcp <code> <value> [options]` | 設定原始 VCP 代碼的值。 |

## 常見範例

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

## 屬性參考

支援的屬性會因 ASUS 螢幕型號、韌體、輸入模式與連接方式而異。若屬性不受支援，請使用 `dwc.exe --help`、`dwc.exe getcaps` 或型號專屬文件以確認可用性。

### 影像與色彩

| 屬性 | 數值 |
| --- | --- |
| `Brightness` | 亮度等級，`0-100`。 |
| `BlueLightFilter` | 藍光過濾等級，`0:OFF`、`1-Max`。 |
| `Contrast` | 對比等級，`0-100`。 |
| `ColorTemp` | `3:4000K`、`4:5000K`、`5:6500K`、`6:7500K`、`7:8200K`、`8:9300K`、`9:10000K`、`11:User`。 |
| `Gamma` | Gamma 曲線，`1.8`、`2.0`、`2.2`、`2.4`、`2.6`。 |
| `Hue` | 色相，`0-100`。 |
| `Saturation` | 飽和度，`0-100`。 |
| `Sharpness` | 銳利度，`0-100`。 |
| `RedGain`、`GreenGain`、`BlueGain` | RGB 增益，`0-100`。 |
| `RedOffset`、`GreenOffset`、`BlueOffset` | RGB 偏移，`0-100`。 |
| `Overdrive` | 改善反應時間 / Trace Free，`0:OFF`、`1-Max`。 |
| `ShadowBoost` | 暗部增強，`0:OFF`、`1-Max`。 |
| `FrameRateBoost` | 雙模式更新率增強，`0:OFF`、`1:ON`。 |
| `DynamicDimming` | 動態調光，`0:OFF`、`1-Max`。 |
| `ASCR` | ASUS 智慧對比比例，`0:OFF`、`1:ON`。 |
| `Uniformity` | 均勻度補償，`0:OFF`、`1:ON`。 |

### 顯示模式

| 屬性 | 數值 |
| --- | --- |
| `Splendid` | ZenScreen 與商務機種預設模式：`1:Theater`、`2:Scenery`、`3:sRGB`、`4:Standard`、`5:Game`、`6:Night View`、`7:Reading`、`8:Darkroom`。 |
| `GameVisual` | ROG/TUF 電競機種預設模式：`1:Cinema`、`2:Scenery`、`3:sRGB`、`4:User`、`5:Racing`、`6:RTS/RPG`、`7:FPS`、`8:MOBA`、`9:Night Vision`、`10:sRGB Calibration`。 |
| `ProArtPreset` | ProArt 預設模式：`0:Native`、`1:sRGB`、`2:AdobeRGB`、`3:Rec.2020`、`4:DCI-P3`、`5:DICOM`、`6:Rec.709`。 |
| `InputRange` | `0:Auto`、`1:Full`、`2:Limited 16-235`、`3:Limited 16-254`、`4:SDI Full`。 |
| `DualDisplay` | ZenScreen 雙螢幕顯示模式：`1:Mirror`、`2:Extend`、`3:Split`、`4:Independent`。 |
| `PxP` | PIP/PBP 模式：`0:OFF`、`1:PIP Top-Right`、`2:PIP Top-Left`、`3:PIP Bottom-Right`、`4:PIP Bottom-Left`、`5:PBP Left/Right Equal`、`6:PBP Left Large`、`7:PBP Right Large`、`8:Frame x4 (2x2)`、`9:Frame x3 (Left Large, Right Top, Right Bottom)`、`10:Frame x3 (Right Large, Left Top, Left Bottom)`。 |
| `PIPSize` | PIP 視窗大小，`0:OFF`、`1:Small`、`2:Medium`、`3:Large`。 |

### 系統設定

| 屬性 | 數值 |
| --- | --- |
| `AudioVolume` | 喇叭音量，`0-100`。 |
| `PowerSaving` | 電源模式，`0:Standard/Performance`、`1:PowerSaving`。 |
| `UsageTime` | 螢幕總使用時數，唯讀。 |
| `PowerIndicator` | 電源指示燈，`0:OFF`、`1:ON`。 |
| `PowerKeyLock` | 電源鍵鎖定，`0:OFF`、`1:ON`。 |
| `KeyLock` | 按鍵鎖定，`0:OFF`、`1:ON`。 |
| `SoundMute` | 靜音，`0:OFF`、`1:ON`。 |
| `InputDetection` | 輸入源自動偵測，`0:OFF`、`1:ON`。 |
| `InputSource` | 影像輸入源：`1:VGA`、`15:DP-1`、`16:DP-2`、`17:HDMI-1`、`18:HDMI-2`、`19:HDMI-3`、`21:TB-1`、`22:TB-2`、`26:USBC-1`、`27:USBC-2`、`30:SDI-1`、`31:SDI-2`。 |
| `OSDTransparency` | OSD 透明度，`0-Max`。 |
| `OSDTimeout` | OSD 顯示逾時秒數，`0-Max`。 |
| `OSDLanguage` | `1:ChineseTraditional`、`2:English`、`3:French`、`4:German`、`5:Italian`、`6:Japanese`、`7:Korean`、`8:Portuguese`、`9:Russian`、`10:Spanish`、`12:Turkish`、`13:ChineseSimplified`、`17:Croatian`、`18:Czech`、`20:Dutch`、`26:Hungarian`、`30:Polish`、`31:Romanian`、`35:Thai`、`36:Ukrainian`、`37:Vietnamese`、`38:Persian`、`39:Indonesian`。 |
| `EZOSD` | Easy OSD 選單控制：`0:Close Menu`、`1:Show Menu`、`2:Up`、`3:Down`、`4:Right`、`5:Left`、`6:Enter`、`7:Back`。 |

### GamePlus 與 QuickFit

| 屬性 | 數值 |
| --- | --- |
| `FPS` | FPS 計數器，`0:OFF`、`1:Numerical`、`2:Bar Graph`。 |
| `Timer` | 計時器疊層，`0:OFF`、`1:30s`、`2:40s`、`3:50s`、`4:60s`、`5:90s`。 |
| `Crosshair` | 準心疊層：`0:OFF`、`7:Blue dot`、`8:Green dot`、`9:Blue target`、`10:Green target`、`11:Blue crosshair`、`12:Green crosshair`。 |
| `DisplayAlignment` | 螢幕對齊，`0:OFF`、`1:ON`。 |

### Aura 燈效

| 屬性 | 數值 |
| --- | --- |
| `AuraColor` | Aura 顏色：`0:OFF`、`1:Red`、`2:Green`、`3:Blue`、`4:Cyan`、`5:Magenta`、`6:Yellow`。 |
| `AuraMode` | Aura 模式：`0:OFF`、`1:Aura Sync (Armoury Crate)`、`2:Aura RGB - Rainbow`、`3:Aura RGB - Color Cycle`、`4:Aura RGB - Static`、`5:Aura RGB - Breathing`、`6:Aura RGB - Strobing`。 |

### ProArt 自我校色

| 屬性 | 數值 |
| --- | --- |
| `SelfCalStart` | 自我校色執行方式：`0:OFF`、`1:Start with warm up`、`2:Start without warm up`。 |
| `SelfCalTarget` | 自我校色目標模式：`0:sRGB`、`1:Adobe RGB`、`2:Rec.2020`、`3:DCI-P3`、`4:DICOM`、`5:Rec.709`、`6:HDR_PQ`、`7:HDR_HLG`。 |
| `SelfCalRoutine` | 自我校色重複模式：`0:Off`、`1:Single`、`2:Daily`、`3:Every 7 days`、`4:Every 14 days`、`5:Every 28 days`。 |
| `SelfCalSystemDate` | 自我校色系統日期（依位元）：`[4:0]:Day`、`[8:5]:Month`、`[15:9]:Years since 2000`。 |
| `SelfCalSystemClock` | 自我校色系統時間（依位元）：`[5:0]:Minute`、`[10:6]:Hour`。 |
| `SelfCalApptDate` | 自我校色預約日期（依位元）：`[4:0]:Day`、`[8:5]:Month`、`[15:9]:Years since 2000`。 |
| `SelfCalApptClock` | 自我校色預約時間（依位元）：`[5:0]:Minute`、`[10:6]:Hour`。 |
| `SelfCalFWVersion` | 自我校色 MCU 韌體版本，唯讀。 |

### OLED 功能

| 屬性 | 數值 |
| --- | --- |
| `OledAntiFlicker` | OLED 防閃爍等級，`0:OFF`、`1:ON`。 |
| `OledScreenMove` | OLED 畫面位移，`0-Max`。 |
| `OledWarningTimer` | OLED 像素清潔提醒時數，`0-Max`。 |
| `OledPixelClean` | OLED 像素清潔，`0:Stop`、`1:Start`。 |
| `OledDisplaySaver` | OLED 螢幕保護，`0:OFF`、`1:ON`。 |
| `OledScreenDimming` | OLED 螢幕保護畫面調暗，`0:OFF`、`1:ON`。 |
| `OledUniformBrightness` | OLED 均勻亮度，`0:OFF`、`1:ON`。 |
| `OledOuterDimming` | OLED 螢幕保護外圍調暗，`0:OFF`、`1:ON`。 |
| `OledGlobalDimming` | OLED 螢幕保護全域調暗，`0:OFF`、`1:ON`。 |
| `OledLogoDetection` | OLED 自動標誌亮度之標誌偵測，`0:OFF`、`1:ON`。 |
| `OledTaskbarDetection` | OLED 自動標誌亮度之工作列偵測，`0:OFF`、`1:ON`。 |
| `OledBoundaryDetection` | OLED 自動標誌亮度之邊界偵測，`0:OFF`、`1:ON`。 |
