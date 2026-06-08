# ASUS Display Control

![CLI](https://img.shields.io/badge/CLI-Windows-blue)
![License](https://img.shields.io/badge/license-Apache%202.0-green)

ASUS Display Control provides tools for querying and configuring ASUS monitor settings.
This repository currently includes a Windows CLI for scripting and automation, plus an AI agent skill for natural-language monitor control.

For users who prefer a graphical software, [ASUS DisplayWidget Center](https://www.asus.com/content/monitor-software-osd-displaywidgetcenter/) is available from the official ASUS site.

## Overview

| Target users | Solution | What it enables |
|---|---|---|
| General users | [DisplayWidget Center](https://www.asus.com/content/monitor-software-osd-displaywidgetcenter/) | GUI software for everyday monitor control on Windows and macOS |
| General users | [Agent skill](skills/asus-display-control/SKILL.md) | Natural-language monitor control through an AI assistant |
| Developers | [CLI tool](cli/win-x32/dwc/) | Monitor-control automation from Command Prompt, PowerShell, scripts, or Python |
| Enterprise IT managers | [CLI tool](cli/win-x32/dwc/) | Remote scripting, deployment, auditing, and standardized monitor configuration across corporate workstations. |

## What's Included

- [cli/win-x32/dwc/](cli/win-x32/dwc/) - Windows CLI package.
- [skills/asus-display-control/SKILL.md](skills/asus-display-control/SKILL.md) - AI agent skill definition.
- [CLI_REFERENCE.md](CLI_REFERENCE.md) - CLI command syntax and supported property reference.

## For General Users

Use the agent skill when you want an AI assistant to control a monitor for you instead of typing commands manually.

Example requests:

- 💬 "Lower the brightness on monitor 2."
- 💬 "Show me the current input source."
- 💬 "Set all monitors to brightness 50."
- 💬 "Check what settings this monitor supports."

The skill is available at [skills/asus-display-control/SKILL.md](skills/asus-display-control/SKILL.md). Copy or reference it from a compatible agent that supports local skill files or custom Markdown instructions and can run shell commands.

### Compatible Agents

- ✅ OpenClaw
- ✅ Hermes Agent
- ✅ Any agent that supports custom Markdown skill files and shell command execution.

If you prefer graphical interface software, download ASUS DisplayWidget Center from the official ASUS site:
[ASUS DisplayWidget Center](https://www.asus.com/content/monitor-software-osd-displaywidgetcenter/)

## For Enterprise IT Managers

Use CLI `(dwc.exe)` when you need repeatable, scriptable display control for managed Windows environments.

Typical use cases:

- Configure brightness, color presets, input source, power behavior, or OSD-related settings.
- Run startup scripts, scheduled tasks, or Group Policy scripts for office workflows.
- Audit current monitor state as part of asset or compliance checks.
- Standardize monitor settings before deployment or after device replacement.

For command syntax, supported properties, and examples, see [CLI_REFERENCE.md](CLI_REFERENCE.md).

## CLI Quick Start

To try the CLI directly without installing:

```powershell
cd cli\win-x32\dwc
.\dwc.exe --help
.\dwc.exe list
.\dwc.exe get Brightness
```

To install it into `PATH`, copy the full `cli\win-x32\dwc\` folder to a stable location and run `install.bat`. Open a new terminal after installation.

## Requirements

- Windows 10 or Windows 11 for the bundled CLI.
- An ASUS monitor that supports DDC/CI.
- DDC/CI enabled in the monitor OSD menu.
- A display connection that passes DDC/CI, such as DisplayPort or HDMI.

USB-C, docks, adapters, KVMs, and GPU drivers may affect DDC/CI support depending on the hardware environment.

## Documentation

- [CLI Reference](CLI_REFERENCE.md)
- [CLI Installation](cli/win-x32/dwc/README.md)
- [AI Agent Skill](skills/asus-display-control/SKILL.md)
- [ASUS DisplayWidget Center](https://www.asus.com/content/monitor-software-osd-displaywidgetcenter/)

## License

Licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for details.
