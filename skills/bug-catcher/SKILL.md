---
name: bug-catcher
description: Install or invoke the Bug Catcher — a one-keystroke KDE Plasma utility that captures a system bug while it's still fresh in the logs and immediately launches Claude to diagnose and fix it. Use when the user wants quick on-the-spot Linux/system bug capture (GPU freezes, audio dropouts, crashes, OOM, USB issues, network blips, recurring bugs), or asks to install a hotkey for capturing system issues.
allowed-tools: Bash(cp *), Bash(chmod *), Bash(mkdir *), Bash(update-desktop-database *), Bash(sed *), Read, Edit
disable-model-invocation: true
---

# Bug Catcher

A one-keystroke KDE Plasma utility that captures system faults while they're fresh in the logs and immediately launches Claude to diagnose and propose fixes. The skill installs two files — a Bash script and an XDG desktop entry — and guides the user through binding them to a custom hotkey.

## When to use

- User asks to "set up bug catcher" or "install bug hotkey"
- User wants a quick on-the-spot capture for GPU freezes, audio dropouts, crashes, OOM, USB issues, or network blips
- User says "set up quick bug capture" or "I want a hotkey to report system bugs"

## Inputs to gather

- **Desktop environment** — confirm whether KDE Plasma (default) or GNOME/other (triggers adaptation)
- **Preferred hotkey binding** — suggest Super+B if not specified
- **Permission level** — confirm user understands the script uses `--dangerously-skip-permissions` so Claude can act on diagnosis fast

## Procedure

### 1. Determine Desktop Environment and Adaptation

Ask the user which desktop they're running. If KDE Plasma, proceed with kdialog/konsole. If GNOME or other, flag that the script will be adapted to use zenity/gnome-terminal, then proceed.

### 2. Locate and Prepare Source Files

Inside the skill directory (`skills/bug-catcher/`), find `bug-catcher.sh` and `claude-bug-catcher.desktop`. These files are created by the orchestrator.

### 3. Create Installation Target Directories

Create `~/.local/bin/` if missing:
```
mkdir -p ~/.local/bin
```

### 4. Adapt Script for Non-KDE Environments

If the user is on GNOME, edit `bug-catcher.sh`:
- Replace `kdialog` with `zenity` throughout
- Replace `konsole` with `gnome-terminal`

Copy the (possibly adapted) script to `~/.local/bin/bug-catcher` and make it executable:
```
cp bug-catcher.sh ~/.local/bin/bug-catcher
chmod +x ~/.local/bin/bug-catcher
```

### 5. Rewrite Desktop Entry

Edit `claude-bug-catcher.desktop` to replace its `Exec=` line. The original points to the source repo; rewrite it to:
```
Exec=/home/<user>/.local/bin/bug-catcher
```

(Alternatively, if the script location differs, use the actual path.)

Copy the rewritten desktop entry:
```
mkdir -p ~/.local/share/applications/
cp claude-bug-catcher.desktop ~/.local/share/applications/
```

### 6. Update Desktop Database

Run:
```
update-desktop-database ~/.local/share/applications/
```

### 7. Guide Hotkey Binding

Instruct the user to:
1. Open **KDE System Settings** (or **GNOME Settings** if adapted).
2. Navigate to **Shortcuts** (or **Keyboard** on GNOME).
3. Under **Custom Shortcuts**, add a new entry pointing to `/home/<user>/.local/bin/bug-catcher`.
4. Bind it to the preferred hotkey (default: Super+B).
5. Save and close.

### 8. Confirm Installation

Ask the user to test the hotkey. When pressed, it should launch a kdialog (or zenity) menu listing common bug categories: GPU Freeze, Audio Dropout, Crash/OOM, USB Issue, Network Blip, Recurring Bug, Custom.

Selecting a category launches `claude --dangerously-skip-permissions` in a new konsole (or gnome-terminal) with a prompt asking Claude to grep `journalctl --since '5 minutes ago'` and `dmesg` for relevant faults and propose/implement fixes.

## Output / side effects

- `bug-catcher.sh` copied to `~/.local/bin/bug-catcher` (executable)
- `claude-bug-catcher.desktop` copied to `~/.local/share/applications/` with rewritten `Exec=` path
- Desktop database updated
- User hotkey bound to the script (manual step; no file changes here)
- When invoked, the hotkey presents a menu, then spawns a new terminal with Claude running in diagnostic mode

## Safety / constraints

- The script uses `--dangerously-skip-permissions`, allowing Claude to execute shell commands without confirmation during diagnosis. Flag this to the user once at the end of installation and confirm they are comfortable with it.
- Only KDE Plasma and GNOME are supported out of the box; other desktop environments require manual script adaptation.
- The script greps logs `--since '5 minutes ago'` — older issues may not appear. Advise the user to invoke the hotkey as soon as a bug is noticed.
- Destructive fixes (like force-restarting services or modifying system config) should be reviewed by the user before Claude attempts them; the script should always ask for confirmation before destructive acts.
