#!/bin/sh

/sbin/sysctl hw.acpi.video.lcd0.brightness=$1
/usr/bin/backlight $1
echo $1 > /usr/local/etc/brightness
