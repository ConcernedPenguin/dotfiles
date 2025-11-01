#!/bin/bash

# Required environment variables for GUI apps
export DISPLAY=:0
#export XAUTHORITY=/home/concerned_penguin/.Xauthority
export PATH="/usr/local/bin:/usr/bin:/bin:$HOME/.local/bin"
#export PATH="$PATH:/home/concerned_penguin/.local/bin"  # Ensure wal and find are available

WALLPAPERS_DIR="/home/concerned_penguin/wallpaper"
RANDOM_WALL=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)
# Log for debugging
echo "Setting wallpaper: $RANDOM_WALL" >> /tmp/wal-debug.log
wal -i "$RANDOM_WALL" >> /tmp/wal-debug.log 2>&1
# Force wallpaper set explicitly using feh
#feh --bg-scale "$RANDOM_WALL" >> /tmp/wal-debug.log 2>&1

# === 2. Generate pywal colors and GTK theme ===
wal -i "$RANDOM_WALL" -e

#wait briefly so it sets wallpaper
#picom --config ~/.config/picom/picom.conf --xrender-sync-fence &
sleep 0.2
#reload qtile since sometimes script stars without qtile starting 
#if pgrep -x qtile > /dev/null; then
qtile cmd-obj -o cmd -f reload_config
#else
 #   echo "[wal-wall.sh] Qtile not running, skipping reload_config" >> /tmp/wal-debug.log
#fi
#reload thunar
#killall thunar > /dev/null 2>&1
#thunar & disown
#>> /tmp/wal-debug.log 2>&1
# Run pywal and log output
#wal -i "$RANDOM_WALL" >> /tmp/wal-debug.log 2>&1

