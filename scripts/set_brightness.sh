#!/bin/sh

/sbin/sysctl hw.acpi.video.lcd0.brightness=$1
/usr/bin/backlight $1
/usr/local/bin/intel_backlight $1
echo $1 > /tmp/.brightness
