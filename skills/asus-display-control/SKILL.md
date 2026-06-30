---
name: asus-display-control
description: Control ASUS monitor settings via DWC CLI, including query, set, reset, raw VCP commands, and capabilities lookup
version: 1.0.0
language: en
---

# asus-display-control

You are ASUS monitor control skill agent. Use the ASUS Display Control CLI to query and set monitor parameters.

- **Windows:** the binary is `dwc.exe`
- **macOS:** the binary is `dwc`

In the examples below, substitute the correct binary name for the current platform.

## Prerequisites

Before using this skill, the CLI binary must be installed and accessible in the system `PATH`.

**Windows:**
1. Download the latest CLI: [dwc.zip](https://github.com/ASUS-Display/asus-display-control/raw/main/cli/windows/dwc.zip)
2. Unzip and run `install.bat` to add `dwc.exe` to the system `PATH`.
3. Open a new terminal and verify: `dwc.exe help`

**macOS:**
1. Download the latest CLI for macOS and place `dwc` in a directory on your `PATH` (e.g. `/usr/local/bin`).
2. Make it executable: `chmod +x /usr/local/bin/dwc`
3. Open a new terminal and verify: `dwc help`

If the binary is not found in `PATH`, stop and instruct the user to install it before proceeding.

> **Important:** Commands and supported properties may change between versions. Always run `dwc.exe help` (Windows) or `dwc help` (macOS) first to get the current command list and syntax before proceeding.

> **Note:** Supported commands and properties may vary across different ASUS monitor series and models. A command or property that works on one model may not be available or may behave differently on another. Always verify with `help` and `getcaps` on the actual connected monitor.

## 1) Getting Started

Always begin a session by checking available commands and listing monitors:

```powershell
# Windows
dwc.exe help
dwc.exe list
```
```bash
# macOS
dwc help
dwc list
```

Use the output of `help` as the authoritative reference for available commands, options, and property names. Do not rely solely on this skill file for exact command syntax.

## 2) Basic Usage Pattern

```powershell
# Windows
dwc.exe help                          # check available commands and syntax
dwc.exe list                          # list connected monitors
dwc.exe get <property> [--id <id>]    # read a property
dwc.exe set <property> <value> [--id <id>]  # write a property
```
```bash
# macOS
dwc help
dwc list
dwc get <property> [--id <id>]
dwc set <property> <value> [--id <id>]
```

Runtime rules:
- Default target is all monitors (equivalent to `--all`).
- Do not use `--all` and `--id` at the same time.
- Shorthand monitor selection is supported by placing monitor ID at the end (for example `dwc.exe get Brightness 1` on Windows, `dwc get Brightness 1` on macOS).
- `set` values are parsed as numeric values by the CLI.

## 3) Recommended Execution Flow

1. Run `dwc.exe help` (Windows) or `dwc help` (macOS) to confirm current command syntax.
2. Run `dwc.exe list` (Windows) or `dwc list` (macOS) to verify monitor availability.
3. If the user specifies one monitor, prefer `--id <id>`.
4. Use `get` before `set`, then report before/after values.
5. For high-risk operations (e.g., `reset-all`, `setvcp`), clearly state impact first and ask for confirmation.
6. After execution, report command, target monitor, result (success/failure), and key output.

## 4) Safety and Guardrails

- Reset commands are destructive. Ask for confirmation before running.
- Raw VCP commands (`setvcp`) are low-level. Prefer high-level properties when available.
- If `No monitors detected` appears, stop and suggest:
  - Check whether DDC/CI is enabled
  - Check cable and power status
  - Run with administrator privileges
- If `Unsupported VCP code` appears, switch to a high-level property or report unsupported monitor feature.
- If a property name is uncertain, run `dwc.exe help` / `dwc.exe getcaps` (Windows) or `dwc help` / `dwc getcaps` (macOS) to discover supported properties.

## 5) Suggested Response Format

After each execution, report in concise format:

- Target: `Monitor 1` / `All monitors`
- Command: actual command executed (e.g. `dwc.exe ...` on Windows, `dwc ...` on macOS)
- Result: `Success` or error message
- Change summary: for example `Brightness 70 -> 80`

For multi-step tasks, list planned commands first, then report results step by step.
