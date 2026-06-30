> 🌐 **언어**: [English](./README.md) · [繁體中文](./README.zh-TW.md) · [简体中文](./README.zh-CN.md) · [日本語](./README.ja.md) · **한국어** · [Español](./README.es.md)

# 🖥️ ASUS Display Control

![CLI](https://img.shields.io/badge/CLI-Windows-blue)
![License](https://img.shields.io/badge/license-Apache%202.0-green)

ASUS Display Control은 ASUS 모니터 설정을 조회하고 구성하는 도구를 제공합니다.
이 저장소에는 스크립팅 및 자동화를 위한 [CLI](#-cli-빠른-시작) 도구와 자연어 모니터 제어를 위한 AI [Agent Skill](#-ai-agent-skill)이 포함되어 있습니다.

GUI(그래픽 사용자 인터페이스)를 선호하는 경우, ASUS 공식 사이트에서 [ASUS DisplayWidget Center](https://www.asus.com/content/monitor-software-osd-displaywidgetcenter/)를 다운로드할 수 있습니다.

## 📋 개요

| 대상 사용자 | 솔루션 | 기능 |
|---|---|---|
| 기업 IT 관리자 | [CLI](#-cli-빠른-시작) + IT 도구 | 기업 워크스테이션 전반의 원격 스크립팅, 배포, 감사 및 표준화된 모니터 구성. |
| 개발자 | [CLI](#-cli-빠른-시작) + 스크립트 | 명령 프롬프트, PowerShell 또는 스크립트를 통한 모니터 제어 자동화. |
| AI Agent 사용자 | [CLI](#-cli-빠른-시작) + [Agent Skill](#-ai-agent-skill) | AI 어시스턴트를 통한 자연어 모니터 제어. |

## 🏢 기업 IT 관리

<img src="image/IMG_DWC_CLI_Enterprise.png" alt="Enterprise IT Management" width="700">

ASUS Display Control CLI를 사용하여 원격 IT 관리와 기업 워크스테이션 전반의 표준화된 모니터 구성을 실현합니다.

### 주요 사용 사례

- 밝기, 색상 프리셋, 입력 소스, 전원 동작 또는 OSD 관련 설정을 구성합니다.
- 시작 스크립트, 예약된 작업 또는 기업 관리 워크플로를 실행합니다.
- 인벤토리 관리, 규정 준수 확인 또는 문제 해결을 위해 모니터 설정과 기능을 감사합니다.
- 신규 배포, 교체 장치 또는 전체 부서의 모니터 설정을 표준화합니다.

### 기업 배포

- 대규모 배포의 경우, ASUS Display Control CLI를 기존 기업 엔드포인트 관리 인프라(Microsoft Intune, Microsoft Configuration Manager(SCCM), PowerShell Remoting, SSH 등)를 통해 배포하고 실행할 수 있습니다.
- ASUS Display Control CLI는 개별 워크스테이션의 로컬 모니터 제어만 제공합니다.

## 🚀 CLI 빠른 시작

### CLI 다운로드

| 플랫폼 | 다운로드 | 실행 파일 |
| --- | --- | --- |
| Windows | [dwc.zip](https://github.com/ASUS-Display/asus-display-control/raw/main/cli/windows/dwc.zip) | `dwc.exe` |
| macOS | 출시 예정 | `dwc` |

### CLI 설치

설치 후에는 전체 경로를 지정하지 않고 모든 디렉터리에서 CLI를 실행할 수 있습니다.
설치 스크립트는 압축 해제된 폴더에 포함되어 있습니다.

| 플랫폼 | 스크립트 | 업데이트 항목 |
| --- | --- | --- |
| Windows | `install.bat` | Windows 환경 변수의 `PATH` |
| macOS | `install.sh` (출시 예정) | 셸 프로필의 `PATH` |

**참고**: 설치 후 폴더를 이동하거나 삭제하지 마십시오 — 폴더가 이동되거나 삭제되면 CLI가 작동하지 않습니다.

<img src="image/IMG_DWC_CLI_Install.png" alt="CLI Installation" width="700">

### CLI 명령어

**명령 프롬프트**(Windows) 또는 **터미널**(macOS)을 열고 시도해 보세요:

| Windows | macOS | 설명 |
| --- | --- | --- |
| `dwc.exe help` | `dwc help` | 사용 가능한 명령어 및 구문 표시 |
| `dwc.exe list` | `dwc list` | 연결된 ASUS 모니터 목록 표시 |
| `dwc.exe info` | `dwc info` | 연결된 모니터의 상세 정보 표시 |
| `dwc.exe get brightness` | `dwc get brightness` | 현재 밝기 값 읽기 |
| `dwc.exe set brightness 60` | `dwc set brightness 60` | 밝기를 60으로 설정 |

명령어 구문, 지원되는 속성 및 예제는 [CLI_REFERENCE.md](CLI_REFERENCE.md)를 참조하십시오.

<img src="image/IMG_DWC_CLI_Example.png" alt="CLI Example" width="700">

## 🤖 AI Agent Skill

명령어를 수동으로 입력하는 대신 AI 어시스턴트가 모니터를 제어하도록 하려면 Agent Skill을 사용하십시오.

요청 예시:

- 💬 "모니터 2의 밝기를 낮춰 주세요."
- 💬 "현재 입력 소스를 보여 주세요."
- 💬 "모든 모니터의 밝기를 50으로 설정해 주세요."
- 💬 "이 모니터가 지원하는 설정을 확인해 주세요."

Agent Skill은 [skills/asus-display-control/SKILL.md](skills/asus-display-control/SKILL.md)에서 확인할 수 있습니다. 로컬 스킬 파일 또는 사용자 지정 Markdown 지침을 지원하고 셸 명령을 실행할 수 있는 호환 Agent에 복사하거나 참조하십시오.

### 호환 Agent

- ✅ 사용자 지정 Markdown 스킬 파일과 셸 명령 실행을 지원하는 모든 Agent.

## ⚙️ 요구 사항

- Windows 10/11 또는 macOS 12 이상.
- DDC/CI를 지원하는 ASUS 모니터.
- 모니터 OSD 메뉴에서 DDC/CI 활성화.
- DisplayPort 또는 HDMI와 같이 DDC/CI를 지원하는 디스플레이 연결.

## 📚 문서

- [CLI 참조 문서](CLI_REFERENCE.md)
- [AI Agent Skill](skills/asus-display-control/SKILL.md)
- [ASUS DisplayWidget Center](https://www.asus.com/content/monitor-software-osd-displaywidgetcenter/)

## 📄 라이선스

Apache License 2.0에 따라 라이선스가 부여됩니다. 자세한 내용은 [LICENSE](LICENSE)를 참조하십시오.
