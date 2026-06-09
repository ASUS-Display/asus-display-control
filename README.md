# ASUS Display Control

![CLI](https://img.shields.io/badge/CLI-Windows-blue)
![License](https://img.shields.io/badge/license-Apache%202.0-green)

ASUS Display Control provides tools for querying and configuring ASUS monitor settings.
This repository currently includes a **Command-Line Interface (CLI)** tool for scripting and automation, and an **AI Agent skill** for natural-language monitor control.

For users who prefer a graphical software, [ASUS DisplayWidget Center](https://www.asus.com/content/monitor-software-osd-displaywidgetcenter/) is available from the official ASUS site.

## Overview

| Target users | Solution | What it enables |
|---|---|---|
| Enterprise IT managers | [CLI](cli/win-x32/dwc/) + IT tools | Remote scripting, deployment, auditing, and standardized monitor configuration across corporate workstations. |
| Developers | [CLI](cli/win-x32/dwc/) + Scripts | Monitor-control automation from Command Prompt, PowerShell, or scripts. |
| General users | [CLI](cli/win-x32/dwc/) + [Agent skill](skills/asus-display-control/SKILL.md) | Natural-language monitor control through an AI assistant. |

## Enterprise IT Management

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

## CLI Quick Start

To try the CLI directly without installing:

- Copy the full `cli\win-x32\dwc\` folder to your Windows PC
- Open **Command Prompt** and navigate to the copied folder
- Try the following commands

| Command | Description |
|---|---|
| `dwc.exe help` | Show available commands and syntax |
| `dwc.exe list` | List all connected ASUS monitors |
| `dwc.exe info` | Show detailed info for connected monitors |
| `dwc.exe get brightness` | Read current brightness value |
| `dwc.exe set brightness 60` | Set brightness to 60 |

For command syntax, supported properties, and examples, see [CLI_REFERENCE.md](CLI_REFERENCE.md).

<img src="image/IMG_DWC_CLI_Example.png" alt="CLI Example" width="700">

### CLI Installation

This allows you to run `dwc.exe` from any directory in Windows Command Prompt or PowerShell without specifying its full path.

Run `install.bat` in dwc folder, it will update `PATH` in your Windows `Environment Variables`.

**Note**: Do not move or delete the folder after installation — the `dwc.exe` will stop working if the folder is moved or removed.

<img src="image/IMG_DWC_CLI_Install.png" alt="CLI Installation" width="700">

## AI Agent Skill

Use the agent skill when you want an AI assistant to control a monitor for you instead of typing commands manually.

Example requests:

- 💬 "Lower the brightness on monitor 2."
- 💬 "Show me the current input source."
- 💬 "Set all monitors to brightness 50."
- 💬 "Check what settings this monitor supports."

The skill is available at [skills/asus-display-control/SKILL.md](skills/asus-display-control/SKILL.md). Copy or reference it from a compatible agent that supports local skill files or custom Markdown instructions and can run shell commands.

### Compatible Agents

- ✅ Any agent that supports custom Markdown skill files and shell command execution.

## Requirements

- Windows 10 or Windows 11.
- An ASUS monitor with DDC/CI support.
- DDC/CI enabled in the monitor OSD menu.
- A display connection that passes DDC/CI, such as DisplayPort or HDMI.

## Documentation

- [CLI Reference](CLI_REFERENCE.md)
- [CLI Installation](cli/win-x32/dwc/README.md)
- [AI Agent Skill](skills/asus-display-control/SKILL.md)
- [ASUS DisplayWidget Center](https://www.asus.com/content/monitor-software-osd-displaywidgetcenter/)

## License

Licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for details.
