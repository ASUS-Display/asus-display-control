> 🌐 **언어**: [English](CLI_REFERENCE.md) · [繁體中文](CLI_REFERENCE.zh-TW.md) · [简体中文](CLI_REFERENCE.zh-CN.md) · [日本語](CLI_REFERENCE.ja.md) · **한국어** · [Español](CLI_REFERENCE.es.md)

# ASUS Display Control CLI 참조 문서

이 문서는 ASUS Display Control CLI의 명령어 구문을 설명합니다.

대상 버전: `0.1.0`

다운로드 및 설치 방법은 [README.md](../../README.md#-cli-빠른-시작)를 참조하십시오.

## 사용법

### Windows

```powershell
dwc.exe <command> [options]
```

### macOS

```bash
dwc <command> [options]
```

## 전역 옵션

| 옵션 | 설명 |
| --- | --- |
| `-h`, `--help` | 도움말 정보를 표시합니다. |
| `-v`, `--version` | CLI 버전을 표시합니다. |
| `-id`, `--id <id>` | ID로 특정 모니터를 지정합니다. |
| `<id>` | `--id <id>`의 축약형, 예: `dwc.exe info 1`. |
| `--all` | 모든 모니터에 적용합니다. 기본 대상입니다. |

모니터 선택 관련 참고 사항:

- 명령어는 기본적으로 감지된 모든 모니터를 대상으로 합니다.
- 특정 모니터 하나를 대상으로 하려면 `--id <id>`를 사용하십시오.
- `--all`과 `--id`를 함께 사용하지 마십시오.
- `--id`를 사용하기 전에 `dwc.exe list`를 실행하여 모니터 ID를 확인하십시오.

## 명령어

| 명령어 | 구문 | 설명 |
| --- | --- | --- |
| `help` | `dwc.exe help` | 도움말 정보를 표시합니다. |
| `list` | `dwc.exe list` | 감지된 모든 모니터와 ID를 나열합니다. |
| `info` | `dwc.exe info [options]` | 모델, 일련번호, 펌웨어 등 모니터 정보를 표시합니다. |
| `get` | `dwc.exe get <prop> [options]` | 속성의 현재 값을 가져옵니다. |
| `set` | `dwc.exe set <prop> <value> [options]` | 속성을 지정한 값으로 설정합니다. |
| `reset-all` | `dwc.exe reset-all [options]` | 모든 설정을 초기값으로 재설정합니다. |
| `reset-color` | `dwc.exe reset-color [options]` | 색상 설정을 초기값으로 재설정합니다. |
| `reset-mode` | `dwc.exe reset-mode [options]` | 현재 모드를 초기값으로 재설정합니다. |
| `getcaps` | `dwc.exe getcaps [options]` | 원시 VCP 기능 문자열을 가져옵니다. |
| `getvcp` | `dwc.exe getvcp <code> [options]` | 원시 VCP 코드의 값을 가져옵니다. |
| `setvcp` | `dwc.exe setvcp <code> <value> [options]` | 원시 VCP 코드의 값을 설정합니다. |

## 일반적인 예제

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

## 속성 참조

지원되는 속성은 ASUS 모니터 모델, 펌웨어, 입력 모드 및 연결 방식에 따라 다릅니다. 속성이 지원되지 않는 경우 `dwc.exe --help`, `dwc.exe getcaps` 또는 모델별 문서를 통해 지원 여부를 확인하십시오.

### 화질 및 색상

| 속성 | 값 |
| --- | --- |
| `Brightness` | 밝기 수준, `0-100`. |
| `BlueLightFilter` | 블루라이트 필터 수준, `0:OFF`, `1-Max`. |
| `Contrast` | 명암비 수준, `0-100`. |
| `ColorTemp` | `3:4000K`, `4:5000K`, `5:6500K`, `6:7500K`, `7:8200K`, `8:9300K`, `9:10000K`, `11:User`. |
| `Gamma` | 감마 곡선, `1.8`, `2.0`, `2.2`, `2.4`, `2.6`. |
| `Hue` | 색상(Hue), `0-100`. |
| `Saturation` | 채도, `0-100`. |
| `Sharpness` | 선명도, `0-100`. |
| `RedGain`, `GreenGain`, `BlueGain` | RGB 게인, `0-100`. |
| `RedOffset`, `GreenOffset`, `BlueOffset` | RGB 오프셋, `0-100`. |
| `Overdrive` | 응답 속도 개선 / Trace Free, `0:OFF`, `1-Max`. |
| `ShadowBoost` | 섀도우 부스트, `0:OFF`, `1-Max`. |
| `FrameRateBoost` | 듀얼 모드 프레임 레이트 부스트, `0:OFF`, `1:ON`. |
| `DynamicDimming` | 다이내믹 디밍, `0:OFF`, `1-Max`. |
| `ASCR` | ASUS 스마트 명암비, `0:OFF`, `1:ON`. |
| `Uniformity` | 균일도 보정, `0:OFF`, `1:ON`. |

### 디스플레이 모드

| 속성 | 값 |
| --- | --- |
| `Splendid` | ZenScreen 및 비즈니스 프리셋: `1:Theater`, `2:Scenery`, `3:sRGB`, `4:Standard`, `5:Game`, `6:Night View`, `7:Reading`, `8:Darkroom`. |
| `GameVisual` | ROG/TUF 게이밍 프리셋: `1:Cinema`, `2:Scenery`, `3:sRGB`, `4:User`, `5:Racing`, `6:RTS/RPG`, `7:FPS`, `8:MOBA`, `9:Night Vision`, `10:sRGB Calibration`. |
| `ProArtPreset` | ProArt 프리셋: `0:Native`, `1:sRGB`, `2:AdobeRGB`, `3:Rec.2020`, `4:DCI-P3`, `5:DICOM`, `6:Rec.709`. |
| `InputRange` | `0:Auto`, `1:Full`, `2:Limited 16-235`, `3:Limited 16-254`, `4:SDI Full`. |
| `DualDisplay` | ZenScreen 듀얼 디스플레이 모드: `1:Mirror`, `2:Extend`, `3:Split`, `4:Independent`. |
| `PxP` | PIP/PBP 모드: `0:OFF`, `1:PIP Top-Right`, `2:PIP Top-Left`, `3:PIP Bottom-Right`, `4:PIP Bottom-Left`, `5:PBP Left/Right Equal`, `6:PBP Left Large`, `7:PBP Right Large`, `8:Frame x4 (2x2)`, `9:Frame x3 (Left Large, Right Top, Right Bottom)`, `10:Frame x3 (Right Large, Left Top, Left Bottom)`. |
| `PIPSize` | PIP 크기, `0:OFF`, `1:Small`, `2:Medium`, `3:Large`. |

### 시스템 설정

| 속성 | 값 |
| --- | --- |
| `AudioVolume` | 스피커 볼륨, `0-100`. |
| `PowerSaving` | 전원 모드, `0:Standard/Performance`, `1:PowerSaving`. |
| `UsageTime` | 총 사용 시간(시간 단위), 읽기 전용. |
| `PowerIndicator` | 전원 LED 표시등, `0:OFF`, `1:ON`. |
| `PowerKeyLock` | 전원 키 잠금, `0:OFF`, `1:ON`. |
| `KeyLock` | 키 잠금, `0:OFF`, `1:ON`. |
| `SoundMute` | 음소거, `0:OFF`, `1:ON`. |
| `InputDetection` | 입력 자동 감지, `0:OFF`, `1:ON`. |
| `InputSource` | 비디오 입력: `1:VGA`, `15:DP-1`, `16:DP-2`, `17:HDMI-1`, `18:HDMI-2`, `19:HDMI-3`, `21:TB-1`, `22:TB-2`, `26:USBC-1`, `27:USBC-2`, `30:SDI-1`, `31:SDI-2`. |
| `OSDTransparency` | OSD 투명도, `0-Max`. |
| `OSDTimeout` | OSD 시간 초과(초), `0-Max`. |
| `OSDLanguage` | `1:ChineseTraditional`, `2:English`, `3:French`, `4:German`, `5:Italian`, `6:Japanese`, `7:Korean`, `8:Portuguese`, `9:Russian`, `10:Spanish`, `12:Turkish`, `13:ChineseSimplified`, `17:Croatian`, `18:Czech`, `20:Dutch`, `26:Hungarian`, `30:Polish`, `31:Romanian`, `35:Thai`, `36:Ukrainian`, `37:Vietnamese`, `38:Persian`, `39:Indonesian`. |
| `EZOSD` | 간편 OSD 메뉴 제어: `0:Close Menu`, `1:Show Menu`, `2:Up`, `3:Down`, `4:Right`, `5:Left`, `6:Enter`, `7:Back`. |

### GamePlus 및 QuickFit

| 속성 | 값 |
| --- | --- |
| `FPS` | FPS 카운터, `0:OFF`, `1:Numerical`, `2:Bar Graph`. |
| `Timer` | 타이머 오버레이, `0:OFF`, `1:30s`, `2:40s`, `3:50s`, `4:60s`, `5:90s`. |
| `Crosshair` | 조준선 오버레이: `0:OFF`, `7:Blue dot`, `8:Green dot`, `9:Blue target`, `10:Green target`, `11:Blue crosshair`, `12:Green crosshair`. |
| `DisplayAlignment` | 디스플레이 정렬, `0:OFF`, `1:ON`. |

### Aura 라이팅

| 속성 | 값 |
| --- | --- |
| `AuraColor` | Aura 색상: `0:OFF`, `1:Red`, `2:Green`, `3:Blue`, `4:Cyan`, `5:Magenta`, `6:Yellow`. |
| `AuraMode` | Aura 모드: `0:OFF`, `1:Aura Sync (Armoury Crate)`, `2:Aura RGB - Rainbow`, `3:Aura RGB - Color Cycle`, `4:Aura RGB - Static`, `5:Aura RGB - Breathing`, `6:Aura RGB - Strobing`. |

### ProArt 자체 캘리브레이션

| 속성 | 값 |
| --- | --- |
| `SelfCalStart` | 자체 캘리브레이션 실행 방식: `0:OFF`, `1:Start with warm up`, `2:Start without warm up`. |
| `SelfCalTarget` | 자체 캘리브레이션 대상 모드: `0:sRGB`, `1:Adobe RGB`, `2:Rec.2020`, `3:DCI-P3`, `4:DICOM`, `5:Rec.709`, `6:HDR_PQ`, `7:HDR_HLG`. |
| `SelfCalRoutine` | 자체 캘리브레이션 반복 모드: `0:Off`, `1:Single`, `2:Daily`, `3:Every 7 days`, `4:Every 14 days`, `5:Every 28 days`. |
| `SelfCalSystemDate` | 자체 캘리브레이션 시스템 날짜(비트 단위): `[4:0]:Day`, `[8:5]:Month`, `[15:9]:Years since 2000`. |
| `SelfCalSystemClock` | 자체 캘리브레이션 시스템 시각(비트 단위): `[5:0]:Minute`, `[10:6]:Hour`. |
| `SelfCalApptDate` | 자체 캘리브레이션 예약 날짜(비트 단위): `[4:0]:Day`, `[8:5]:Month`, `[15:9]:Years since 2000`. |
| `SelfCalApptClock` | 자체 캘리브레이션 예약 시각(비트 단위): `[5:0]:Minute`, `[10:6]:Hour`. |
| `SelfCalFWVersion` | 자체 캘리브레이션 MCU 펌웨어 버전, 읽기 전용. |

### OLED 기능

| 속성 | 값 |
| --- | --- |
| `OledAntiFlicker` | OLED 안티 플리커 수준, `0:OFF`, `1:ON`. |
| `OledScreenMove` | OLED 화면 이동, `0-Max`. |
| `OledWarningTimer` | OLED 픽셀 클리닝 알림 시간(시간 단위), `0-Max`. |
| `OledPixelClean` | OLED 픽셀 클리닝, `0:Stop`, `1:Start`. |
| `OledDisplaySaver` | OLED 디스플레이 세이버, `0:OFF`, `1:ON`. |
| `OledScreenDimming` | OLED 스크린 세이버 화면 디밍, `0:OFF`, `1:ON`. |
| `OledUniformBrightness` | OLED 균일 밝기, `0:OFF`, `1:ON`. |
| `OledOuterDimming` | OLED 스크린 세이버 외곽 디밍, `0:OFF`, `1:ON`. |
| `OledGlobalDimming` | OLED 스크린 세이버 전체 디밍, `0:OFF`, `1:ON`. |
| `OledLogoDetection` | OLED 자동 로고 밝기의 로고 감지, `0:OFF`, `1:ON`. |
| `OledTaskbarDetection` | OLED 자동 로고 밝기의 작업 표시줄 감지, `0:OFF`, `1:ON`. |
| `OledBoundaryDetection` | OLED 자동 로고 밝기의 경계 감지, `0:OFF`, `1:ON`. |
