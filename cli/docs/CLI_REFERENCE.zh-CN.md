> 🌐 **语言**: [English](CLI_REFERENCE.md) · [繁體中文](CLI_REFERENCE.zh-TW.md) · **简体中文** · [日本語](CLI_REFERENCE.ja.md) · [한국어](CLI_REFERENCE.ko.md) · [Español](CLI_REFERENCE.es.md)

# ASUS Display Control CLI 参考手册

本文档说明 ASUS Display Control CLI 的命令语法。

适用版本：`0.1.0`

如需下载与安装说明，请参阅 [README.md](../../README.md#-cli-快速入门)。

## 使用方法

### Windows

```powershell
dwc.exe <command> [options]
```

### macOS

```bash
dwc <command> [options]
```

## 全局选项

| 选项 | 说明 |
| --- | --- |
| `-h`, `--help` | 显示帮助信息。 |
| `-v`, `--version` | 显示 CLI 版本。 |
| `-id`, `--id <id>` | 指定目标显示器的 ID。 |
| `<id>` | `--id <id>` 的简写形式，例如 `dwc.exe info 1`。 |
| `--all` | 应用于所有显示器。此为默认目标。 |

显示器选择说明：

- 命令默认会应用于所有检测到的显示器。
- 使用 `--id <id>` 可指定单个显示器为目标。
- 请勿同时使用 `--all` 与 `--id`。
- 使用 `--id` 前，请先运行 `dwc.exe list` 查询显示器 ID。

## 命令

| 命令 | 语法 | 说明 |
| --- | --- | --- |
| `help` | `dwc.exe help` | 显示帮助信息。 |
| `list` | `dwc.exe list` | 列出所有检测到的显示器及其 ID。 |
| `info` | `dwc.exe info [options]` | 显示显示器信息，例如型号、序列号与固件版本。 |
| `get` | `dwc.exe get <prop> [options]` | 获取属性的当前值。 |
| `set` | `dwc.exe set <prop> <value> [options]` | 将属性设置为指定值。 |
| `reset-all` | `dwc.exe reset-all [options]` | 将所有设置重置为出厂默认值。 |
| `reset-color` | `dwc.exe reset-color [options]` | 将颜色设置重置为出厂默认值。 |
| `reset-mode` | `dwc.exe reset-mode [options]` | 将当前模式重置为出厂默认值。 |
| `getcaps` | `dwc.exe getcaps [options]` | 获取原始 VCP 功能字符串。 |
| `getvcp` | `dwc.exe getvcp <code> [options]` | 获取原始 VCP 代码的值。 |
| `setvcp` | `dwc.exe setvcp <code> <value> [options]` | 设置原始 VCP 代码的值。 |

## 常见示例

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

## 属性参考

支持的属性会因 ASUS 显示器型号、固件、输入模式与连接方式而异。若属性不受支持，请使用 `dwc.exe --help`、`dwc.exe getcaps` 或型号专属文档以确认可用性。

### 图像与色彩

| 属性 | 数值 |
| --- | --- |
| `Brightness` | 亮度等级，`0-100`。 |
| `BlueLightFilter` | 蓝光过滤等级，`0:OFF`、`1-Max`。 |
| `Contrast` | 对比度等级，`0-100`。 |
| `ColorTemp` | `3:4000K`、`4:5000K`、`5:6500K`、`6:7500K`、`7:8200K`、`8:9300K`、`9:10000K`、`11:User`。 |
| `Gamma` | Gamma 曲线，`1.8`、`2.0`、`2.2`、`2.4`、`2.6`。 |
| `Hue` | 色相，`0-100`。 |
| `Saturation` | 饱和度，`0-100`。 |
| `Sharpness` | 锐度，`0-100`。 |
| `RedGain`、`GreenGain`、`BlueGain` | RGB 增益，`0-100`。 |
| `RedOffset`、`GreenOffset`、`BlueOffset` | RGB 偏移，`0-100`。 |
| `Overdrive` | 改善响应时间 / Trace Free，`0:OFF`、`1-Max`。 |
| `ShadowBoost` | 暗部增强，`0:OFF`、`1-Max`。 |
| `FrameRateBoost` | 双模式刷新率增强，`0:OFF`、`1:ON`。 |
| `DynamicDimming` | 动态调光，`0:OFF`、`1-Max`。 |
| `ASCR` | ASUS 智能对比比例，`0:OFF`、`1:ON`。 |
| `Uniformity` | 均匀度补偿，`0:OFF`、`1:ON`。 |

### 显示模式

| 属性 | 数值 |
| --- | --- |
| `Splendid` | ZenScreen 与商用机型预设模式：`1:Theater`、`2:Scenery`、`3:sRGB`、`4:Standard`、`5:Game`、`6:Night View`、`7:Reading`、`8:Darkroom`。 |
| `GameVisual` | ROG/TUF 电竞机型预设模式：`1:Cinema`、`2:Scenery`、`3:sRGB`、`4:User`、`5:Racing`、`6:RTS/RPG`、`7:FPS`、`8:MOBA`、`9:Night Vision`、`10:sRGB Calibration`。 |
| `ProArtPreset` | ProArt 预设模式：`0:Native`、`1:sRGB`、`2:AdobeRGB`、`3:Rec.2020`、`4:DCI-P3`、`5:DICOM`、`6:Rec.709`。 |
| `InputRange` | `0:Auto`、`1:Full`、`2:Limited 16-235`、`3:Limited 16-254`、`4:SDI Full`。 |
| `DualDisplay` | ZenScreen 双屏显示模式：`1:Mirror`、`2:Extend`、`3:Split`、`4:Independent`。 |
| `PxP` | PIP/PBP 模式：`0:OFF`、`1:PIP Top-Right`、`2:PIP Top-Left`、`3:PIP Bottom-Right`、`4:PIP Bottom-Left`、`5:PBP Left/Right Equal`、`6:PBP Left Large`、`7:PBP Right Large`、`8:Frame x4 (2x2)`、`9:Frame x3 (Left Large, Right Top, Right Bottom)`、`10:Frame x3 (Right Large, Left Top, Left Bottom)`。 |
| `PIPSize` | PIP 窗口大小，`0:OFF`、`1:Small`、`2:Medium`、`3:Large`。 |

### 系统设置

| 属性 | 数值 |
| --- | --- |
| `AudioVolume` | 扬声器音量，`0-100`。 |
| `PowerSaving` | 电源模式，`0:Standard/Performance`、`1:PowerSaving`。 |
| `UsageTime` | 显示器总使用时长（小时），只读。 |
| `PowerIndicator` | 电源指示灯，`0:OFF`、`1:ON`。 |
| `PowerKeyLock` | 电源键锁定，`0:OFF`、`1:ON`。 |
| `KeyLock` | 按键锁定，`0:OFF`、`1:ON`。 |
| `SoundMute` | 静音，`0:OFF`、`1:ON`。 |
| `InputDetection` | 输入源自动检测，`0:OFF`、`1:ON`。 |
| `InputSource` | 视频输入源：`1:VGA`、`15:DP-1`、`16:DP-2`、`17:HDMI-1`、`18:HDMI-2`、`19:HDMI-3`、`21:TB-1`、`22:TB-2`、`26:USBC-1`、`27:USBC-2`、`30:SDI-1`、`31:SDI-2`。 |
| `OSDTransparency` | OSD 透明度，`0-Max`。 |
| `OSDTimeout` | OSD 显示超时秒数，`0-Max`。 |
| `OSDLanguage` | `1:ChineseTraditional`、`2:English`、`3:French`、`4:German`、`5:Italian`、`6:Japanese`、`7:Korean`、`8:Portuguese`、`9:Russian`、`10:Spanish`、`12:Turkish`、`13:ChineseSimplified`、`17:Croatian`、`18:Czech`、`20:Dutch`、`26:Hungarian`、`30:Polish`、`31:Romanian`、`35:Thai`、`36:Ukrainian`、`37:Vietnamese`、`38:Persian`、`39:Indonesian`。 |
| `EZOSD` | Easy OSD 菜单控制：`0:Close Menu`、`1:Show Menu`、`2:Up`、`3:Down`、`4:Right`、`5:Left`、`6:Enter`、`7:Back`。 |

### GamePlus 与 QuickFit

| 属性 | 数值 |
| --- | --- |
| `FPS` | FPS 计数器，`0:OFF`、`1:Numerical`、`2:Bar Graph`。 |
| `Timer` | 计时器叠加层，`0:OFF`、`1:30s`、`2:40s`、`3:50s`、`4:60s`、`5:90s`。 |
| `Crosshair` | 准星叠加层：`0:OFF`、`7:Blue dot`、`8:Green dot`、`9:Blue target`、`10:Green target`、`11:Blue crosshair`、`12:Green crosshair`。 |
| `DisplayAlignment` | 显示对齐，`0:OFF`、`1:ON`。 |

### Aura 灯效

| 属性 | 数值 |
| --- | --- |
| `AuraColor` | Aura 颜色：`0:OFF`、`1:Red`、`2:Green`、`3:Blue`、`4:Cyan`、`5:Magenta`、`6:Yellow`。 |
| `AuraMode` | Aura 模式：`0:OFF`、`1:Aura Sync (Armoury Crate)`、`2:Aura RGB - Rainbow`、`3:Aura RGB - Color Cycle`、`4:Aura RGB - Static`、`5:Aura RGB - Breathing`、`6:Aura RGB - Strobing`。 |

### ProArt 自校色

| 属性 | 数值 |
| --- | --- |
| `SelfCalStart` | 自校色执行方式：`0:OFF`、`1:Start with warm up`、`2:Start without warm up`。 |
| `SelfCalTarget` | 自校色目标模式：`0:sRGB`、`1:Adobe RGB`、`2:Rec.2020`、`3:DCI-P3`、`4:DICOM`、`5:Rec.709`、`6:HDR_PQ`、`7:HDR_HLG`。 |
| `SelfCalRoutine` | 自校色重复模式：`0:Off`、`1:Single`、`2:Daily`、`3:Every 7 days`、`4:Every 14 days`、`5:Every 28 days`。 |
| `SelfCalSystemDate` | 自校色系统日期（按位）：`[4:0]:Day`、`[8:5]:Month`、`[15:9]:Years since 2000`。 |
| `SelfCalSystemClock` | 自校色系统时间（按位）：`[5:0]:Minute`、`[10:6]:Hour`。 |
| `SelfCalApptDate` | 自校色预约日期（按位）：`[4:0]:Day`、`[8:5]:Month`、`[15:9]:Years since 2000`。 |
| `SelfCalApptClock` | 自校色预约时间（按位）：`[5:0]:Minute`、`[10:6]:Hour`。 |
| `SelfCalFWVersion` | 自校色 MCU 固件版本，只读。 |

### OLED 功能

| 属性 | 数值 |
| --- | --- |
| `OledAntiFlicker` | OLED 防闪烁等级，`0:OFF`、`1:ON`。 |
| `OledScreenMove` | OLED 画面位移，`0-Max`。 |
| `OledWarningTimer` | OLED 像素清洁提醒时长（小时），`0-Max`。 |
| `OledPixelClean` | OLED 像素清洁，`0:Stop`、`1:Start`。 |
| `OledDisplaySaver` | OLED 屏幕保护，`0:OFF`、`1:ON`。 |
| `OledScreenDimming` | OLED 屏幕保护画面调暗，`0:OFF`、`1:ON`。 |
| `OledUniformBrightness` | OLED 均匀亮度，`0:OFF`、`1:ON`。 |
| `OledOuterDimming` | OLED 屏幕保护外围调暗，`0:OFF`、`1:ON`。 |
| `OledGlobalDimming` | OLED 屏幕保护全局调暗，`0:OFF`、`1:ON`。 |
| `OledLogoDetection` | OLED 自动标志亮度之标志检测，`0:OFF`、`1:ON`。 |
| `OledTaskbarDetection` | OLED 自动标志亮度之任务栏检测，`0:OFF`、`1:ON`。 |
| `OledBoundaryDetection` | OLED 自动标志亮度之边界检测，`0:OFF`、`1:ON`。 |
