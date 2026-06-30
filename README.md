# 🖥️ ASUS Display Control

![CLI](https://img.shields.io/badge/CLI-Windows-blue)
![License](https://img.shields.io/badge/license-Apache%202.0-green)

🌐 **Language**: **English** · [繁體中文](./README.zh-TW.md) · [简体中文](./README.zh-CN.md) · [日本語](./README.ja.md) · [한국어](./README.ko.md) · [Español](./README.es.md)

ASUS Display Control provides tools for querying and configuring ASUS monitor settings.
This repository currently includes a [CLI](#-cli-quick-start) (Command-Line Interface) tool for scripting and automation, and an AI [Agent Skill](#-ai-agent-skill) for natural-language monitor control.

For users who prefer a GUI (Graphical User Interface), [ASUS DisplayWidget Center](https://www.asus.com/content/monitor-software-osd-displaywidgetcenter/) is available from the official ASUS site.

## 📋 Overview

| Target users | Solution | What it enables |
|---|---|---|
| Enterprise IT managers | [CLI](#-cli-quick-start) + IT tools | Remote scripting, deployment, auditing, and standardized monitor configuration across corporate workstations. |
| Developers | [CLI](#-cli-quick-start) + Scripts | Monitor-control automation from Command Prompt, PowerShell, or scripts. |
| AI Agent users | [CLI](#-cli-quick-start) + [Agent Skill](#-ai-agent-skill) | Natural-language monitor control through an AI assistant. |

## 🏢 Enterprise IT Management

<img src="image/IMG_DWC_CLI_Enterprise.png" alt="Enterprise IT Management" width="700">

Use ASUS Display Control CLI for remote IT management and standardized monitor configuration across corporate workstations.

### Typical use cases

- Configure brightness, color presets, input source, power behavior, or OSD-related settings.
- Run startup scripts, scheduled tasks, or enterprise management workflows.
- Audit monitor settings and capabilities for inventory, compliance, or troubleshooting purposes.
- Standardize monitor configurations across new deployments, replacement devices, or entire departments.

### Enterprise Deployment

- For large-scale deployments, ASUS Display Control CLI can be distributed and executed through existing corporate endpoint-management infrastructure, such as Microsoft Intune, Microsoft Configuration Manager (SCCM), PowerShell Remoting, SSH, or similar enterprise management tools.
- Note that ASUS Display Control CLI provides local monitor control on individual workstations only.

## 🚀 CLI Quick Start

### CLI Download

| Platform | Download | Executable |
| --- | --- | --- |
| Windows | [dwc.zip](https://github.com/ASUS-Display/asus-display-control/raw/main/cli/windows/dwc.zip) | `dwc.exe` |
| macOS | Coming soon | `dwc` |

### CLI Installation

This allows you to run the CLI from any directory without specifying its full path.
The install scripts are included in the unzipped folder.

| Platform | Script | Updates |
| --- | --- | --- |
| Windows | `install.bat` | `PATH` in Windows Environment Variables |
| macOS | `install.sh` (coming soon) | `PATH` in shell profile |

**Note**: Do not move or delete the folder after installation — the CLI will stop working if the folder is moved or removed.

<img src="image/IMG_DWC_CLI_Install.png" alt="CLI Installation" width="700">

### CLI Commands

Open **Command Prompt** (Windows) or **Terminal** (macOS) and try:

| Windows | macOS | Description |
| --- | --- | --- |
| `dwc.exe help` | `dwc help` | Show available commands and syntax |
| `dwc.exe list` | `dwc list` | List all connected ASUS monitors |
| `dwc.exe info` | `dwc info` | Show detailed info for connected monitors |
| `dwc.exe get brightness` | `dwc get brightness` | Read current brightness value |
| `dwc.exe set brightness 60` | `dwc set brightness 60` | Set brightness to 60 |

For command syntax, supported properties, and examples, see [CLI_REFERENCE.md](CLI_REFERENCE.md).

<img src="image/IMG_DWC_CLI_Example.png" alt="CLI Example" width="700">

## 🤖 AI Agent Skill

Use the agent skill when you want an AI assistant to control a monitor for you instead of typing commands manually.

Example requests:

- 💬 "Lower the brightness on monitor 2."
- 💬 "Show me the current input source."
- 💬 "Set all monitors to brightness 50."
- 💬 "Check what settings this monitor supports."

The skill is available at [skills/asus-display-control/SKILL.md](skills/asus-display-control/SKILL.md). Copy or reference it from a compatible agent that supports local skill files or custom Markdown instructions and can run shell commands.

### Compatible Agents

- ✅ Any agent that supports custom Markdown skill files and shell command execution.

## ⚙️ Requirements

- Windows 10/11, macOS 12 or later.
- An ASUS monitor with DDC/CI support.
- DDC/CI enabled in the monitor OSD menu.
- A display connection that passes DDC/CI, such as DisplayPort or HDMI.

## 📚 Documentation

- [CLI Reference](CLI_REFERENCE.md)
- [AI Agent Skill](skills/asus-display-control/SKILL.md)
- [ASUS DisplayWidget Center](https://www.asus.com/content/monitor-software-osd-displaywidgetcenter/)

## 📄 License

Licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for details.
