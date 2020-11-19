#!/bin/bash

ACTION=$1
STATUS=$(nordvpn status | tail -n 1 | cut -d ' ' -f 6)

function status() {
  if [ "$STATUS" == "Disconnected" ]; then
    echo "OFF"
  else
    echo "ON"
  fi
}

function color() {
  if [ "$STATUS" == "Disconnected" ]; then
    echo "#ff0000"
  else
    echo "#00ff00"
  fi
}

function toggle() {
  if [ $STATUS == "Disconnected" ]; then
    nordvpn connect
    echo "Connected"
  else
    nordvpn disconnect
    echo "Disconnected"
  fi
}

case $ACTION in
  "status")
    status
    ;;

  "color")
    color
    ;;

  "toggle")
    toggle
    ;;
esac
