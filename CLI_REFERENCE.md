# ASUS Display Control CLI Reference

This document describes the command syntax for the ASUS Display Control CLI.

Version covered: `0.1.0`

Run `dwc.exe --help` (Windows) or `dwc --help` (macOS) on the target machine before scripting or troubleshooting. The CLI help output is the authoritative source for the installed version, and supported properties can vary by monitor model.

## Installation

Download and unzip the CLI for your platform.

| Platform | Download | Executable |
| --- | --- | --- |
| Windows | [dwc.zip](https://github.com/ASUS-Display/asus-display-control/raw/main/cli/windows/dwc.zip) | `dwc.exe` |
| macOS | Coming soon | `dwc` |

The install scripts are included in the unzipped folder.

| Platform | Script | Updates |
| --- | --- | --- |
| Windows | `install.bat` | `PATH` in Windows Environment Variables |
| macOS | `install.sh` (coming soon) | `PATH` in shell profile |

**Note**: Do not move or delete the folder after installation — the CLI will stop working if the folder is moved or removed.

## Usage

### Windows

```powershell
dwc.exe <command> [options]
```

### macOS

```bash
dwc <command> [options]
```

## Global Options

| Option | Description |
|---|---|
| `-h`, `--help` | Show help information. |
| `-v`, `--version` | Show CLI version. |
| `-id`, `--id <id>` | Target a specific monitor by ID. |
| `<id>` | Shorthand for `--id <id>`, such as `dwc.exe info 1`. |
| `--all` | Apply to all monitors. This is the default target. |

Monitor selection notes:

- Commands target all detected monitors by default.
- Use `--id <id>` to target one monitor.
- Do not combine `--all` and `--id`.
- Run `dwc.exe list` to discover monitor IDs before using `--id`.

## Commands

| Command | Syntax | Description |
|---|---|---|
| `help` | `dwc.exe help` | Show help information. |
| `list` | `dwc.exe list` | List all detected monitors with IDs. |
| `info` | `dwc.exe info [options]` | Show monitor information, such as model, serial, and firmware. |
| `get` | `dwc.exe get <prop> [options]` | Get the current value of a property. |
| `set` | `dwc.exe set <prop> <value> [options]` | Set a property to the specified value. |
| `reset-all` | `dwc.exe reset-all [options]` | Reset all settings to factory defaults. |
| `reset-color` | `dwc.exe reset-color [options]` | Reset color settings to factory defaults. |
| `reset-mode` | `dwc.exe reset-mode [options]` | Reset the current mode to factory defaults. |
| `getcaps` | `dwc.exe getcaps [options]` | Get the raw VCP capabilities string. |
| `getvcp` | `dwc.exe getvcp <code> [options]` | Get the value of a raw VCP code. |
| `setvcp` | `dwc.exe setvcp <code> <value> [options]` | Set the value of a raw VCP code. |

## Common Examples

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

## Recommended Workflow

For interactive use:

1. Run `dwc.exe --help`.
2. Run `dwc.exe list`.
3. Run `dwc.exe info --id <id>` if you need to confirm a target monitor.
4. Run `dwc.exe get <prop> --id <id>` before changing a setting.
5. Run `dwc.exe set <prop> <value> --id <id>`.
6. Run `dwc.exe get <prop> --id <id>` again to confirm the change.

For automation:

- Log the output of `list`, `info`, `get`, and `set` commands.
- Prefer `--id <id>` when targeting a known display.
- Validate property support on the actual monitor before rolling a setting out broadly.
- Treat reset commands and raw VCP writes as high-risk operations.

## Property Reference

Supported properties vary by ASUS monitor model, firmware, input mode, and connection path. If a property is not supported, use `dwc.exe --help`, `dwc.exe getcaps`, or monitor-specific documentation to confirm availability.

### Image And Color

| Property | Values |
|---|---|
| `Brightness` | Brightness level, `0-100`. |
| `BlueLightFilter` | Blue light filter level, `0:OFF`, `1-Max`. |
| `Contrast` | Contrast level, `0-100`. |
| `ColorTemp` | `3:4000K`, `4:5000K`, `5:6500K`, `6:7500K`, `7:8200K`, `8:9300K`, `9:10000K`, `11:User`. |
| `Gamma` | Gamma curve, `1.8`, `2.0`, `2.2`, `2.4`, `2.6`. |
| `Hue` | Color hue, `0-100`. |
| `Saturation` | Color saturation, `0-100`. |
| `Sharpness` | Sharpness, `0-100`. |
| `RedGain`, `GreenGain`, `BlueGain` | RGB gain, `0-100`. |
| `RedOffset`, `GreenOffset`, `BlueOffset` | RGB offset, `0-100`. |
| `Overdrive` | Improve response time / Trace Free, `0:OFF`, `1-Max`. |
| `ShadowBoost` | Shadow boost, `0:OFF`, `1-Max`. |
| `FrameRateBoost` | Dual Mode Frame Rate Boost, `0:OFF`, `1:ON`. |
| `DynamicDimming` | Dynamic dimming, `0:OFF`, `1-Max`. |
| `ASCR` | ASUS Smart Contrast Ratio, `0:OFF`, `1:ON`. |
| `Uniformity` | Uniformity compensation, `0:OFF`, `1:ON`. |

### Display Modes

| Property | Values |
|---|---|
| `Splendid` | ZenScreen and Business preset: `1:Theater`, `2:Scenery`, `3:sRGB`, `4:Standard`, `5:Game`, `6:Night View`, `7:Reading`, `8:Darkroom`. |
| `GameVisual` | ROG/TUF Gaming preset: `1:Cinema`, `2:Scenery`, `3:sRGB`, `4:User`, `5:Racing`, `6:RTS/RPG`, `7:FPS`, `8:MOBA`, `9:Night Vision`, `10:sRGB Calibration`. |
| `ProArtPreset` | ProArt preset: `0:Native`, `1:sRGB`, `2:AdobeRGB`, `3:Rec.2020`, `4:DCI-P3`, `5:DICOM`, `6:Rec.709`. |
| `InputRange` | `0:Auto`, `1:Full`, `2:Limited 16-235`, `3:Limited 16-254`, `4:SDI Full`. |
| `DualDisplay` | ZenScreen Dual Display mode: `1:Mirror`, `2:Extend`, `3:Split`, `4:Independent`. |
| `PxP` | PIP/PBP mode: `0:OFF`, `1:PIP Top-Right`, `2:PIP Top-Left`, `3:PIP Bottom-Right`, `4:PIP Bottom-Left`, `5:PBP Left/Right Equal`, `6:PBP Left Large`, `7:PBP Right Large`, `8:Frame x4 (2x2)`, `9:Frame x3 (Left Large, Right Top, Right Bottom)`, `10:Frame x3 (Right Large, Left Top, Left Bottom)`. |
| `PIPSize` | PIP size, `0:OFF`, `1:Small`, `2:Medium`, `3:Large`. |

### System Setup

| Property | Values |
|---|---|
| `AudioVolume` | Speaker volume, `0-100`. |
| `PowerSaving` | Power mode, `0:Standard/Performance`, `1:PowerSaving`. |
| `UsageTime` | Total display usage time in hours, read-only. |
| `PowerIndicator` | Power LED indicator, `0:OFF`, `1:ON`. |
| `PowerKeyLock` | Power key lock, `0:OFF`, `1:ON`. |
| `KeyLock` | Key lock, `0:OFF`, `1:ON`. |
| `SoundMute` | Sound mute, `0:OFF`, `1:ON`. |
| `InputDetection` | Input auto detection, `0:OFF`, `1:ON`. |
| `InputSource` | Video input: `1:VGA`, `15:DP-1`, `16:DP-2`, `17:HDMI-1`, `18:HDMI-2`, `19:HDMI-3`, `21:TB-1`, `22:TB-2`, `26:USBC-1`, `27:USBC-2`, `30:SDI-1`, `31:SDI-2`. |
| `OSDTransparency` | OSD transparency, `0-Max`. |
| `OSDTimeout` | OSD timeout in seconds, `0-Max`. |
| `OSDLanguage` | `1:ChineseTraditional`, `2:English`, `3:French`, `4:German`, `5:Italian`, `6:Japanese`, `7:Korean`, `8:Portuguese`, `9:Russian`, `10:Spanish`, `12:Turkish`, `13:ChineseSimplified`, `17:Croatian`, `18:Czech`, `20:Dutch`, `26:Hungarian`, `30:Polish`, `31:Romanian`, `35:Thai`, `36:Ukrainian`, `37:Vietnamese`, `38:Persian`, `39:Indonesian`. |
| `EZOSD` | Easy OSD menu control: `0:Close Menu`, `1:Show Menu`, `2:Up`, `3:Down`, `4:Right`, `5:Left`, `6:Enter`, `7:Back`. |

### GamePlus And QuickFit

| Property | Values |
|---|---|
| `FPS` | FPS counter, `0:OFF`, `1:Numerical`, `2:Bar Graph`. |
| `Timer` | Timer overlay, `0:OFF`, `1:30s`, `2:40s`, `3:50s`, `4:60s`, `5:90s`. |
| `Crosshair` | Crosshair overlay: `0:OFF`, `7:Blue dot`, `8:Green dot`, `9:Blue target`, `10:Green target`, `11:Blue crosshair`, `12:Green crosshair`. |
| `DisplayAlignment` | Display alignment, `0:OFF`, `1:ON`. |

### Aura Lighting

| Property | Values |
|---|---|
| `AuraColor` | Aura color: `0:OFF`, `1:Red`, `2:Green`, `3:Blue`, `4:Cyan`, `5:Magenta`, `6:Yellow`. |
| `AuraMode` | Aura mode: `0:OFF`, `1:Aura Sync (Armoury Crate)`, `2:Aura RGB - Rainbow`, `3:Aura RGB - Color Cycle`, `4:Aura RGB - Static`, `5:Aura RGB - Breathing`, `6:Aura RGB - Strobing`. |

### ProArt Self-Calibration

| Property | Values |
|---|---|
| `SelfCalStart` | Self-calibration execution: `0:OFF`, `1:Start with warm up`, `2:Start without warm up`. |
| `SelfCalTarget` | Self-calibration target modes: `0:sRGB`, `1:Adobe RGB`, `2:Rec.2020`, `3:DCI-P3`, `4:DICOM`, `5:Rec.709`, `6:HDR_PQ`, `7:HDR_HLG`. |
| `SelfCalRoutine` | Self-calibration repeat mode: `0:Off`, `1:Single`, `2:Daily`, `3:Every 7 days`, `4:Every 14 days`, `5:Every 28 days`. |
| `SelfCalSystemDate` | Self-calibration system date by bits: `[4:0]:Day`, `[8:5]:Month`, `[15:9]:Years since 2000`. |
| `SelfCalSystemClock` | Self-calibration system clock by bits: `[5:0]:Minute`, `[10:6]:Hour`. |
| `SelfCalApptDate` | Self-calibration appointment date by bits: `[4:0]:Day`, `[8:5]:Month`, `[15:9]:Years since 2000`. |
| `SelfCalApptClock` | Self-calibration appointment clock by bits: `[5:0]:Minute`, `[10:6]:Hour`. |
| `SelfCalFWVersion` | Self-calibration MCU firmware version, read-only. |

### OLED Features

| Property | Values |
|---|---|
| `OledAntiFlicker` | OLED anti-flicker level, `0:OFF`, `1:ON`. |
| `OledScreenMove` | OLED screen move, `0-Max`. |
| `OledWarningTimer` | OLED pixel cleaning reminder in hours, `0-Max`. |
| `OledPixelClean` | OLED pixel cleaning, `0:Stop`, `1:Start`. |
| `OledDisplaySaver` | OLED display saver, `0:OFF`, `1:ON`. |
| `OledScreenDimming` | OLED screen saver screen dimming, `0:OFF`, `1:ON`. |
| `OledUniformBrightness` | OLED uniform brightness, `0:OFF`, `1:ON`. |
| `OledOuterDimming` | OLED screen saver outer dimming, `0:OFF`, `1:ON`. |
| `OledGlobalDimming` | OLED screen saver global dimming, `0:OFF`, `1:ON`. |
| `OledLogoDetection` | OLED auto logo brightness logo detection, `0:OFF`, `1:ON`. |
| `OledTaskbarDetection` | OLED auto logo brightness taskbar detection, `0:OFF`, `1:ON`. |
| `OledBoundaryDetection` | OLED auto logo brightness boundary detection, `0:OFF`, `1:ON`. |

## Safety Notes

- `reset-all`, `reset-color`, and `reset-mode` change monitor state and should require explicit approval in remote or agent-driven workflows.
- `setvcp` writes raw VCP values. Prefer high-level properties such as `Brightness` or `InputSource` when available.
- Some settings may be unavailable depending on the active input, display mode, model family, or firmware.
- For broad deployment, test on each monitor model before rolling out settings across a fleet.

## Troubleshooting

If no monitors are detected:

- Confirm the monitor is powered on and connected.
- Enable DDC/CI in the monitor OSD menu.
- Try a direct display connection instead of a dock, adapter, KVM, or converter.
- Open a new terminal after installing the CLI into `PATH`.
- Try running the terminal as administrator.

If a property fails:

- Run `dwc.exe --help` to confirm the property name and expected value.
- Run `dwc.exe getcaps --id <id>` to inspect raw monitor capabilities.
- Confirm that the setting is supported by the specific monitor model and current input mode.
