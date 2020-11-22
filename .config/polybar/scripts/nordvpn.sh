#!/bin/bash

COLOR_RED=#ff0000
COLOR_GREEN=#00ff00

ACTION=$1
STATUS=$(nordvpn status | tail -n 1 | cut -d ' ' -f 6)

function status() {
  if [ "$STATUS" == "Disconnected" ]; then
    echo "%{F${COLOR_RED}}OFF %{F-}"
  else
    echo "%{F${COLOR_GREEN}}ON %{F-}"
  fi
}

function toggle() {
  if [ $STATUS == "Disconnected" ]; then
    nordvpn connect
  else
    nordvpn disconnect
  fi
}

case $ACTION in
  "status")
    status
    ;;

  "toggle")
    toggle
    ;;
esac
