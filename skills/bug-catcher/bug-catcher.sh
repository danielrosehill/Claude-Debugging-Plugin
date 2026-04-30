#!/bin/bash
# Claude Bug Catcher
# A quick launcher for diagnosing system bugs while they're fresh in the logs
# Designed for hotkey launch - get to Claude in seconds

# Quick preset descriptions
declare -A PRESETS
PRESETS["gpu"]="GPU/graphics freeze or glitch is happening RIGHT NOW"
PRESETS["freeze"]="System freeze/unresponsive - happening RIGHT NOW"
PRESETS["audio"]="Audio issue - crackling, dropout, or device not working"
PRESETS["network"]="Network connectivity issue - connection dropped or unstable"
PRESETS["crash"]="Application just crashed"
PRESETS["recurring"]="That recurring bug we discussed is happening again - check recent context and logs"
PRESETS["memory"]="System running slow, possible memory issue or OOM"
PRESETS["usb"]="USB device issue - not recognized or disconnected"

# Show quick-select menu
CHOICE=$(kdialog --title "Bug Catcher" \
    --menu "What's happening? (or select Custom)" \
    "gpu" "GPU/Graphics freeze" \
    "freeze" "System freeze" \
    "audio" "Audio issue" \
    "network" "Network issue" \
    "crash" "App crashed" \
    "memory" "Memory/slowdown" \
    "usb" "USB device issue" \
    "recurring" "That bug again!" \
    "custom" "Custom description..." \
    2>/dev/null)

# Check if user cancelled
if [ $? -ne 0 ]; then
    exit 0
fi

# Get bug description based on choice
if [ "$CHOICE" = "custom" ]; then
    BUG_DESCRIPTION=$(kdialog --title "Bug Catcher" \
        --inputbox "Describe the bug:" \
        "" 2>/dev/null)

    if [ $? -ne 0 ] || [ -z "$BUG_DESCRIPTION" ]; then
        exit 0
    fi
else
    BUG_DESCRIPTION="${PRESETS[$CHOICE]}"
fi

# Construct the prompt for Claude
PROMPT="I am currently experiencing a bug in my system. This is urgent - the issue is happening RIGHT NOW so the logs should be fresh.

Bug report: $BUG_DESCRIPTION

Please immediately:
1. Check journalctl logs from the last 5 minutes for relevant errors (journalctl --since '5 minutes ago')
2. Check dmesg for kernel-level issues if relevant
3. Identify the likely cause
4. Suggest and implement a fix

Move fast - the evidence is fresh in the logs."

# Launch Claude in a new terminal with the prompt
konsole -e bash -c "claude --dangerously-skip-permissions \"$PROMPT\"; exec bash" &

exit 0
