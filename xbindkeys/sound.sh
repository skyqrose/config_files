#!/bin/bash
# Source: http://function.fr/advanced-linux-configuration-for-lenovo-thinkpad-x240/

# Configuration
STEP="5"    # Anything you like.
UNIT="%"   # dB, %, etc.

# Set volume
SETVOL="/usr/bin/amixer -qD pulse set Master"

case "$1" in
    "up")
          $SETVOL $STEP$UNIT+
          ;;
  "down")
          $SETVOL $STEP$UNIT-
          ;;
  "mute")
          $SETVOL toggle
          ;;
esac

# Get current volume and state
# VOLUME=$(amixer get Master | grep 'Mono:' | cut -d ' ' -f 6 | sed -e 's/[^0-9]//g')
# STATE=$(amixer get Master | grep 'Mono:' | grep -o "\[off\]")
