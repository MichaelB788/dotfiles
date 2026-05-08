#!/bin/bash

declare -A actions=(
  ["Lock"]="swaylock"
  ["Logout"]="swaymsg exit"
  ["Suspend"]="loginctl suspend"
  ["Hibernate"]="loginctl hibernate"
  ["Reboot"]="loginctl reboot"
  ["Shutdown"]="loginctl poweroff"
)

order=("Lock" "Logout" "Suspend" "Hibernate" "Reboot" "Shutdown")

choice=$(printf '%s\n' "${order[@]}" | wofi --dmenu \
  --prompt "  Power" \
  --insensitive \
  --no-actions \
  --cache-file /dev/null)

[[ -z "$choice" ]] && exit 0

normalized=$(echo "$choice" | awk '{print toupper(substr($0,1,1)) tolower(substr($0,2))}')

case "$normalized" in
Reboot | Shutdown | Hibernate)
  confirm=$(printf 'Yes\nNo' | wofi --dmenu \
    --prompt "  Confirm $normalized?" \
    --insensitive \
    --cache-file /dev/null)
  [[ "${confirm,,}" != "yes" ]] && exit 0
  ;;
esac

cmd="${actions[$normalized]}"
if [[ -n "$cmd" ]]; then
  eval "$cmd"
else
  notify-send "Power Menu" "Unknown option: $normalized" --urgency=critical
fi
