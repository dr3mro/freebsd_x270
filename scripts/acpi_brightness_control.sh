#!/bin/sh
# /usr/local/bin/acpi_brightness_control.sh
set -x
CURRENT_LEVEL=$(sysctl -n hw.acpi.video.lcd0.brightness)
UP="$1"

if [ "$UP" == 1 ]; then
	for i in 1 2 4 6 9 12 16 20 25 30 36 43 51 60 70 80 90 100; do
		if [ "$CURRENT_LEVEL" -lt "$i" ]; then
			/usr/local/bin/set_brightness.sh $i
			exit
		fi
	done
fi

if [ "$UP" == 0 ]; then
	for i in 100 90 80 70 60 51 43 36 30 25 20 16 12 9 6 4 2 1; do
		if [ "$CURRENT_LEVEL" -gt "$i" ]; then
			/usr/local/bin/set_brightness.sh $i	
			exit
		fi
	done
fi
