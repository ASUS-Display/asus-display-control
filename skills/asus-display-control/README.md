# asus-display-control

AI agent skill for ASUS Display Control — enables a compatible AI agent to control ASUS monitor settings through natural language using the `dwc.exe` CLI tool.

---

## What It Does

The `asus-display-control` skill instructs a compatible AI agent to use `dwc.exe` (ASUS Display Control CLI) to read and write ASUS monitor parameters.

Once the skill is loaded, you can ask the agent in natural language:

- 💬 "Set the brightness on monitor 1 to 70."
- 💬 "What is the current color temperature?"
- 💬 "List all connected monitors."
- 💬 "Reset monitor 2 to factory defaults."

The agent translates your request into the appropriate `dwc.exe` command, executes it, and reports the result.

---

## Prerequisites

- `dwc.exe` must be installed and accessible in the system `PATH` on the machine where the agent runs.  
  See the [CLI Quick Start](../../README.md#cli-quick-start) for installation instructions, or download [dwc.zip](../../cli/dwc.zip) directly.
- DDC/CI must be enabled in the monitor OSD menu.
- A compatible AI agent with shell command execution capability.

---

## How to Add the Skill

The skill is a self-contained Markdown file ([SKILL.md](SKILL.md)) with a YAML frontmatter header. To use it:

### Claude Code

Copy [SKILL.md](SKILL.md) into your project's `.claude/skills/` directory:

```sh
cp SKILL.md .claude/skills/asus-display-control.md
```

The skill will then be available as `asus-display-control` in Claude Code.

### OpenClaw

Place the skill file in your OpenClaw skills directory and restart the agent.

### Hermes Agent

Reference the skill file path in your Hermes configuration file.

### Any Custom Agent

Copy or reference [SKILL.md](SKILL.md) in your agent's skill or instruction directory. The agent must support:

- Custom Markdown skill files or instruction injection
- Shell command execution (`dwc.exe` runs as a local process)

---

## Skill Metadata

| Field | Value |
|---|---|
| Name | `asus-display-control` |
| Version | `1.0.0` |
| Language | English |
| File | [SKILL.md](SKILL.md) |
| Raw URL | [SKILL.md (raw)](https://github.com/ASUS-Display/asus-display-control/raw/main/skills/asus-display-control/SKILL.md) |

---

## Safety Notes

- **Reset commands** (`reset`, `reset-all`) are destructive — the skill instructs the agent to ask for confirmation before executing.
- **Raw VCP commands** (`setvcp`) are low-level. The skill directs the agent to prefer high-level properties when available.
- Supported properties may vary by monitor model. The skill always runs `dwc.exe help` and `dwc.exe getcaps` to discover what the connected monitor supports before acting.
