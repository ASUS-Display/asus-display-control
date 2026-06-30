> 🌐 **語言**: [English](./README.md) · **繁體中文** · [简体中文](./README.zh-CN.md) · [日本語](./README.ja.md) · [한국어](./README.ko.md) · [Español](./README.es.md)

# 🖥️ ASUS Display Control

![CLI](https://img.shields.io/badge/CLI-Windows-blue)
![License](https://img.shields.io/badge/license-Apache%202.0-green)

ASUS Display Control 提供查詢與設定 ASUS 螢幕的工具。
此儲存庫目前包含用於腳本與自動化的 [CLI](#-cli-快速開始) 工具，以及用於自然語言螢幕控制的 AI [Agent Skill](#-ai-agent-skill)。

如果您偏好使用圖形介面（GUI），可前往 ASUS 官方網站下載 [ASUS DisplayWidget Center](https://www.asus.com/content/monitor-software-osd-displaywidgetcenter/)。

## 📋 概覽

| 目標使用者 | 解決方案 | 功能說明 |
|---|---|---|
| 企業 IT 管理員 | [CLI](#-cli-快速開始) + IT 工具 | 遠端腳本、部署、稽核，以及跨企業工作站的標準化螢幕設定。 |
| 開發者 | [CLI](#-cli-快速開始) + 腳本 | 透過命令提示字元、PowerShell 或腳本進行螢幕控制自動化。 |
| AI Agent 使用者 | [CLI](#-cli-快速開始) + [Agent Skill](#-ai-agent-skill) | 透過 AI 助理以自然語言控制螢幕。 |

## 🏢 企業 IT 管理

<img src="image/IMG_DWC_CLI_Enterprise.png" alt="Enterprise IT Management" width="700">

使用 ASUS Display Control CLI 進行遠端 IT 管理，並跨企業工作站統一標準化螢幕設定。

### 典型使用情境

- 設定亮度、色彩預設、輸入來源、電源行為或 OSD 相關設定。
- 執行啟動腳本、排程任務或企業管理工作流程。
- 稽核螢幕設定與功能，用於庫存盤點、合規查核或故障排除。
- 在新部署、替換設備或整個部門間標準化螢幕設定。

### 企業部署

- 對於大規模部署，ASUS Display Control CLI 可透過現有的企業端點管理基礎設施進行發佈與執行，例如 Microsoft Intune、Microsoft Configuration Manager（SCCM）、PowerShell Remoting、SSH 或類似的企業管理工具。
- 請注意，ASUS Display Control CLI 僅提供個別工作站的本機螢幕控制。

## 🚀 CLI 快速開始

### CLI 下載

| 平台 | 下載 | 執行檔 |
| --- | --- | --- |
| Windows | [dwc.zip](https://github.com/ASUS-Display/asus-display-control/raw/main/cli/windows/dwc.zip) | `dwc.exe` |
| macOS | 即將推出 | `dwc` |

### CLI 安裝

安裝後即可在任何目錄執行 CLI，無需指定完整路徑。
安裝腳本已包含在解壓縮後的資料夾中。

| 平台 | 腳本 | 更新項目 |
| --- | --- | --- |
| Windows | `install.bat` | Windows 環境變數中的 `PATH` |
| macOS | `install.sh`（即將推出） | Shell 設定檔中的 `PATH` |

**注意**：安裝後請勿移動或刪除該資料夾——若資料夾被移動或刪除，CLI 將無法正常運作。

<img src="image/IMG_DWC_CLI_Install.png" alt="CLI Installation" width="700">

### CLI 指令

開啟**命令提示字元**（Windows）或**終端機**（macOS）並嘗試以下指令：

| Windows | macOS | 說明 |
| --- | --- | --- |
| `dwc.exe help` | `dwc help` | 顯示可用指令與語法 |
| `dwc.exe list` | `dwc list` | 列出所有已連接的 ASUS 螢幕 |
| `dwc.exe info` | `dwc info` | 顯示已連接螢幕的詳細資訊 |
| `dwc.exe get brightness` | `dwc get brightness` | 讀取目前亮度值 |
| `dwc.exe set brightness 60` | `dwc set brightness 60` | 將亮度設為 60 |

如需指令語法、支援的屬性及範例，請參閱 [CLI_REFERENCE.md](CLI_REFERENCE.md)。

<img src="image/IMG_DWC_CLI_Example.png" alt="CLI Example" width="700">

## 🤖 AI Agent Skill

當您想讓 AI 助理代為控制螢幕，而不必手動輸入指令時，請使用 Agent Skill。

範例請求：

- 💬「將螢幕 2 的亮度調低。」
- 💬「顯示目前的輸入來源。」
- 💬「將所有螢幕的亮度設為 50。」
- 💬「查看這台螢幕支援哪些設定。」

技能檔案位於 [skills/asus-display-control/SKILL.md](skills/asus-display-control/SKILL.md)。請將其複製或引用至支援本機技能檔案或自訂 Markdown 指令且可執行 Shell 指令的相容 Agent 中。

### 相容 Agent

- ✅ 任何支援自訂 Markdown 技能檔案與 Shell 指令執行的 Agent。

## ⚙️ 系統需求

- Windows 10/11，或 macOS 12 以上版本。
- 支援 DDC/CI 的 ASUS 螢幕。
- 在螢幕 OSD 選單中啟用 DDC/CI。
- 支援 DDC/CI 傳輸的顯示連接，例如 DisplayPort 或 HDMI。

## 📚 文件

- [CLI 參考手冊](CLI_REFERENCE.md)
- [AI Agent Skill](skills/asus-display-control/SKILL.md)
- [ASUS DisplayWidget Center](https://www.asus.com/content/monitor-software-osd-displaywidgetcenter/)

## 📄 授權

本專案採用 Apache License 2.0 授權。詳情請參閱 [LICENSE](LICENSE)。
