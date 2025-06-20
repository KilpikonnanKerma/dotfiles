#!/bin/bash

action=$(echo -e "Kill\nLock\nLogout\nReboot\nShutdown" | dmenu -c -l 5 -fn 'Monospace-12' ) || exit 0

case "$action" in
	Kill) ps -u $USER -o pid,comm | dmenu -i -c -l 10 -p Kill: | awk '$(print $1)' | xargs -r kill ;;
	Lock) i3lock ;;
	Logout) i3-msg exit ;;
	Reboot) systemctl reboot ;;
	Shutdown) systemctl poweroff ;;
esac
