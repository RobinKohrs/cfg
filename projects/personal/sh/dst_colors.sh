#!/bin/bash

# Check for clipboard utility (xclip or pbcopy)
if command -v xclip &>/dev/null; then
    clipboard_cmd="xclip -selection clipboard"
elif command -v pbcopy &>/dev/null; then
    clipboard_cmd="pbcopy"
else
    echo "Clipboard utility not found. Please install xclip (Linux) or pbcopy (macOS)."
    exit 1
fi

# Define colors and their hex values
declare -A colors
colors=(
    ["dst_apo"]="#c1d9d9"
    ["dst_chripo"]="#d7e3e8"
    ["dst_wirtschaft"]="#d8dec1"
    ["dst_pano"]="#aed4ae"
    ["dst_etat"]="#ffcc66"
    ["dst_lifestyle"]="#ffffff"
    ["dst_karriere"]="#f8f8f8"
    ["dst_wissenschaft"]="#ffffff"
)

# Create a list of color names in the desired order (manually defined)
ordered_colors=("dst_apo" "dst_chripo" "dst_wirtschaft" "dst_pano" "dst_etat" "dst_lifestyle" "dst_karriere" "dst_wissenschaft")

# Create a menu for selection using fzf
selected_name=$(printf "%s\n" "${ordered_colors[@]}" | fzf --prompt="Select a color: " --height=10 --reverse)

# Check if a color was selected
if [[ -n "$selected_name" ]]; then
    selected_value=${colors[$selected_name]}
    echo "You selected: $selected_name (Color: $selected_value)"

    # Copy the color code to the clipboard
    echo -n "$selected_value" | $clipboard_cmd
    echo "The color code ($selected_value) has been copied to the clipboard."
else
    echo "No color selected."
fi
