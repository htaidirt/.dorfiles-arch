#!/bin/bash

COLOR_RED=#f11e54
COLOR_GREEN=#00b679

ACTION=$1
STATUS=$(nordvpn status | tail -n 1 | cut -d ' ' -f 6)

function out() {
  COLOR=$1
  TEXT=$2
  echo "%{F${COLOR}}${TEXT} %{F-}"
}

function status() {
  if [ "$STATUS" == "Disconnected" ]; then
    out $COLOR_RED "OFF"
  else
    out $COLOR_GREEN "ON"
  fi
}

function toggle() {
  if [ $STATUS == "Disconnected" ]; then
    out $COLOR_GREEN "Connecting..."
    nordvpn connect
  else
    out $COLOR_RED "Disconnecting..."
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
