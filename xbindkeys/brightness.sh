#!/bin/bash
# Source: http://function.fr/advanced-linux-configuration-for-lenovo-thinkpad-x240/

MAX_BRIGHTNESS=`cat /sys/class/backlight/intel_backlight/max_brightness`
CURR_BRIGHTNESS=`cat /sys/class/backlight/intel_backlight/brightness`
CURR_PERCENT=`echo 100*$CURR_BRIGHTNESS/$MAX_BRIGHTNESS | bc`

INC="/usr/bin/xbacklight -inc"  
DEC="/usr/bin/xbacklight -dec"

case "$1" in  
  "inc")
          # Change the constants below to adjust how it changes.
          STEP=`echo $CURR_PERCENT+1 | bc` # in percent.
          $INC $STEP
          ;;
  "dec")
          # Change the constants below to adjust how it changes.
          STEP=`echo $CURR_PERCENT/4+4 | bc` # in percent.
          $DEC $STEP
          ;;
esac
