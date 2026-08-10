> 🌐 **言語**: [English](CLI_REFERENCE.md) · [繁體中文](CLI_REFERENCE.zh-TW.md) · [简体中文](CLI_REFERENCE.zh-CN.md) · **日本語** · [한국어](CLI_REFERENCE.ko.md) · [Español](CLI_REFERENCE.es.md)

# ASUS Display Control CLI リファレンス

このドキュメントでは、ASUS Display Control CLI のコマンド構文について説明します。

対象バージョン: `0.1.0`

ダウンロードとインストール手順については、[README.md](../../README.md#-cli-クイックスタート) を参照してください。

## 使用方法

### Windows

```powershell
dwc.exe <command> [options]
```

### macOS

```bash
dwc <command> [options]
```

## グローバルオプション

| オプション | 説明 |
| --- | --- |
| `-h`, `--help` | ヘルプ情報を表示します。 |
| `-v`, `--version` | CLI バージョンを表示します。 |
| `-id`, `--id <id>` | 特定のモニターを ID で指定します。 |
| `<id>` | `--id <id>` の省略形。例: `dwc.exe info 1`。 |
| `--all` | すべてのモニターに適用します。これがデフォルトの対象です。 |

モニター選択に関する注意事項:

- コマンドはデフォルトで検出されたすべてのモニターを対象とします。
- 特定の 1 台を対象にするには `--id <id>` を使用します。
- `--all` と `--id` を同時に指定しないでください。
- `--id` を使用する前に `dwc.exe list` を実行してモニター ID を確認してください。

## コマンド

| コマンド | 構文 | 説明 |
| --- | --- | --- |
| `help` | `dwc.exe help` | ヘルプ情報を表示します。 |
| `list` | `dwc.exe list` | 検出されたすべてのモニターと ID を一覧表示します。 |
| `info` | `dwc.exe info [options]` | モデル、シリアル番号、ファームウェアなどのモニター情報を表示します。 |
| `get` | `dwc.exe get <prop> [options]` | プロパティの現在の値を取得します。 |
| `set` | `dwc.exe set <prop> <value> [options]` | プロパティを指定した値に設定します。 |
| `reset-all` | `dwc.exe reset-all [options]` | すべての設定を工場出荷時の状態にリセットします。 |
| `reset-color` | `dwc.exe reset-color [options]` | カラー設定を工場出荷時の状態にリセットします。 |
| `reset-mode` | `dwc.exe reset-mode [options]` | 現在のモードを工場出荷時の状態にリセットします。 |
| `getcaps` | `dwc.exe getcaps [options]` | 生の VCP 機能文字列を取得します。 |
| `getvcp` | `dwc.exe getvcp <code> [options]` | 生の VCP コードの値を取得します。 |
| `setvcp` | `dwc.exe setvcp <code> <value> [options]` | 生の VCP コードの値を設定します。 |

## 使用例

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

## プロパティリファレンス

サポートされるプロパティは、ASUS モニターのモデル、ファームウェア、入力モード、接続経路によって異なります。プロパティがサポートされていない場合は、`dwc.exe --help`、`dwc.exe getcaps`、またはモデル固有のドキュメントで対応状況を確認してください。

### 画像とカラー

| プロパティ | 値 |
| --- | --- |
| `Brightness` | 輝度レベル、`0-100`。 |
| `BlueLightFilter` | ブルーライトフィルターレベル、`0:OFF`、`1-Max`。 |
| `Contrast` | コントラストレベル、`0-100`。 |
| `ColorTemp` | `3:4000K`、`4:5000K`、`5:6500K`、`6:7500K`、`7:8200K`、`8:9300K`、`9:10000K`、`11:User`。 |
| `Gamma` | ガンマカーブ、`1.8`、`2.0`、`2.2`、`2.4`、`2.6`。 |
| `Hue` | 色相、`0-100`。 |
| `Saturation` | 彩度、`0-100`。 |
| `Sharpness` | シャープネス、`0-100`。 |
| `RedGain`、`GreenGain`、`BlueGain` | RGB ゲイン、`0-100`。 |
| `RedOffset`、`GreenOffset`、`BlueOffset` | RGB オフセット、`0-100`。 |
| `Overdrive` | 応答速度の改善 / Trace Free、`0:OFF`、`1-Max`。 |
| `ShadowBoost` | シャドウブースト、`0:OFF`、`1-Max`。 |
| `FrameRateBoost` | デュアルモードフレームレートブースト、`0:OFF`、`1:ON`。 |
| `DynamicDimming` | ダイナミックディミング、`0:OFF`、`1-Max`。 |
| `ASCR` | ASUS スマートコントラスト比、`0:OFF`、`1:ON`。 |
| `Uniformity` | ユニフォーミティ補正、`0:OFF`、`1:ON`。 |

### 表示モード

| プロパティ | 値 |
| --- | --- |
| `Splendid` | ZenScreen およびビジネス向けプリセット: `1:Theater`、`2:Scenery`、`3:sRGB`、`4:Standard`、`5:Game`、`6:Night View`、`7:Reading`、`8:Darkroom`。 |
| `GameVisual` | ROG/TUF ゲーミング向けプリセット: `1:Cinema`、`2:Scenery`、`3:sRGB`、`4:User`、`5:Racing`、`6:RTS/RPG`、`7:FPS`、`8:MOBA`、`9:Night Vision`、`10:sRGB Calibration`。 |
| `ProArtPreset` | ProArt プリセット: `0:Native`、`1:sRGB`、`2:AdobeRGB`、`3:Rec.2020`、`4:DCI-P3`、`5:DICOM`、`6:Rec.709`。 |
| `InputRange` | `0:Auto`、`1:Full`、`2:Limited 16-235`、`3:Limited 16-254`、`4:SDI Full`。 |
| `DualDisplay` | ZenScreen デュアルディスプレイモード: `1:Mirror`、`2:Extend`、`3:Split`、`4:Independent`。 |
| `PxP` | PIP/PBP モード: `0:OFF`、`1:PIP Top-Right`、`2:PIP Top-Left`、`3:PIP Bottom-Right`、`4:PIP Bottom-Left`、`5:PBP Left/Right Equal`、`6:PBP Left Large`、`7:PBP Right Large`、`8:Frame x4 (2x2)`、`9:Frame x3 (Left Large, Right Top, Right Bottom)`、`10:Frame x3 (Right Large, Left Top, Left Bottom)`。 |
| `PIPSize` | PIP サイズ、`0:OFF`、`1:Small`、`2:Medium`、`3:Large`。 |

### システム設定

| プロパティ | 値 |
| --- | --- |
| `AudioVolume` | スピーカー音量、`0-100`。 |
| `PowerSaving` | 電源モード、`0:Standard/Performance`、`1:PowerSaving`。 |
| `UsageTime` | 総使用時間（時間単位）、読み取り専用。 |
| `PowerIndicator` | 電源 LED インジケーター、`0:OFF`、`1:ON`。 |
| `PowerKeyLock` | 電源キーロック、`0:OFF`、`1:ON`。 |
| `KeyLock` | キーロック、`0:OFF`、`1:ON`。 |
| `SoundMute` | サウンドミュート、`0:OFF`、`1:ON`。 |
| `InputDetection` | 入力自動検出、`0:OFF`、`1:ON`。 |
| `InputSource` | 映像入力: `1:VGA`、`15:DP-1`、`16:DP-2`、`17:HDMI-1`、`18:HDMI-2`、`19:HDMI-3`、`21:TB-1`、`22:TB-2`、`26:USBC-1`、`27:USBC-2`、`30:SDI-1`、`31:SDI-2`。 |
| `OSDTransparency` | OSD 透明度、`0-Max`。 |
| `OSDTimeout` | OSD タイムアウト（秒）、`0-Max`。 |
| `OSDLanguage` | `1:ChineseTraditional`、`2:English`、`3:French`、`4:German`、`5:Italian`、`6:Japanese`、`7:Korean`、`8:Portuguese`、`9:Russian`、`10:Spanish`、`12:Turkish`、`13:ChineseSimplified`、`17:Croatian`、`18:Czech`、`20:Dutch`、`26:Hungarian`、`30:Polish`、`31:Romanian`、`35:Thai`、`36:Ukrainian`、`37:Vietnamese`、`38:Persian`、`39:Indonesian`。 |
| `EZOSD` | 簡易 OSD メニュー操作: `0:Close Menu`、`1:Show Menu`、`2:Up`、`3:Down`、`4:Right`、`5:Left`、`6:Enter`、`7:Back`。 |

### GamePlus と QuickFit

| プロパティ | 値 |
| --- | --- |
| `FPS` | FPS カウンター、`0:OFF`、`1:Numerical`、`2:Bar Graph`。 |
| `Timer` | タイマーオーバーレイ、`0:OFF`、`1:30s`、`2:40s`、`3:50s`、`4:60s`、`5:90s`。 |
| `Crosshair` | クロスヘアオーバーレイ: `0:OFF`、`7:Blue dot`、`8:Green dot`、`9:Blue target`、`10:Green target`、`11:Blue crosshair`、`12:Green crosshair`。 |
| `DisplayAlignment` | ディスプレイアライメント、`0:OFF`、`1:ON`。 |

### Aura ライティング

| プロパティ | 値 |
| --- | --- |
| `AuraColor` | Aura カラー: `0:OFF`、`1:Red`、`2:Green`、`3:Blue`、`4:Cyan`、`5:Magenta`、`6:Yellow`。 |
| `AuraMode` | Aura モード: `0:OFF`、`1:Aura Sync (Armoury Crate)`、`2:Aura RGB - Rainbow`、`3:Aura RGB - Color Cycle`、`4:Aura RGB - Static`、`5:Aura RGB - Breathing`、`6:Aura RGB - Strobing`。 |

### ProArt セルフキャリブレーション

| プロパティ | 値 |
| --- | --- |
| `SelfCalStart` | セルフキャリブレーション実行方法: `0:OFF`、`1:Start with warm up`、`2:Start without warm up`。 |
| `SelfCalTarget` | セルフキャリブレーション対象モード: `0:sRGB`、`1:Adobe RGB`、`2:Rec.2020`、`3:DCI-P3`、`4:DICOM`、`5:Rec.709`、`6:HDR_PQ`、`7:HDR_HLG`。 |
| `SelfCalRoutine` | セルフキャリブレーション繰り返しモード: `0:Off`、`1:Single`、`2:Daily`、`3:Every 7 days`、`4:Every 14 days`、`5:Every 28 days`。 |
| `SelfCalSystemDate` | セルフキャリブレーションシステム日付（ビット単位）: `[4:0]:Day`、`[8:5]:Month`、`[15:9]:Years since 2000`。 |
| `SelfCalSystemClock` | セルフキャリブレーションシステム時刻（ビット単位）: `[5:0]:Minute`、`[10:6]:Hour`。 |
| `SelfCalApptDate` | セルフキャリブレーション予約日付（ビット単位）: `[4:0]:Day`、`[8:5]:Month`、`[15:9]:Years since 2000`。 |
| `SelfCalApptClock` | セルフキャリブレーション予約時刻（ビット単位）: `[5:0]:Minute`、`[10:6]:Hour`。 |
| `SelfCalFWVersion` | セルフキャリブレーション MCU ファームウェアバージョン、読み取り専用。 |

### OLED 機能

| プロパティ | 値 |
| --- | --- |
| `OledAntiFlicker` | OLED アンチフリッカーレベル、`0:OFF`、`1:ON`。 |
| `OledScreenMove` | OLED 画面移動、`0-Max`。 |
| `OledWarningTimer` | OLED ピクセルクリーニングリマインダー（時間単位）、`0-Max`。 |
| `OledPixelClean` | OLED ピクセルクリーニング、`0:Stop`、`1:Start`。 |
| `OledDisplaySaver` | OLED ディスプレイセーバー、`0:OFF`、`1:ON`。 |
| `OledScreenDimming` | OLED スクリーンセーバーの画面減光、`0:OFF`、`1:ON`。 |
| `OledUniformBrightness` | OLED 均一輝度、`0:OFF`、`1:ON`。 |
| `OledOuterDimming` | OLED スクリーンセーバーの外周減光、`0:OFF`、`1:ON`。 |
| `OledGlobalDimming` | OLED スクリーンセーバーの全体減光、`0:OFF`、`1:ON`。 |
| `OledLogoDetection` | OLED 自動ロゴ輝度のロゴ検出、`0:OFF`、`1:ON`。 |
| `OledTaskbarDetection` | OLED 自動ロゴ輝度のタスクバー検出、`0:OFF`、`1:ON`。 |
| `OledBoundaryDetection` | OLED 自動ロゴ輝度の境界検出、`0:OFF`、`1:ON`。 |
