#!/usr/bin/env bash

THEME_FILE="${HOME}/.config/polybar/themes/example.config"
THEME_NAME="example"

# Terminate any currently running instances
killall -q polybar

# Pause while killall completes
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

if type "xrandr" > /dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload $THEME_NAME -c $THEME_FILE &
  done
else
  polybar --reload $THEME_NAME -c $THEME_FILE &
fi

# Launch bar(s)
# polybar dummy -q &
# polybar top -q &
# polybar bottom -q  &

echo "polybars launched..."

