#!/usr/local/bin/bash

# check to see if script was run as root
if [[ $UID -ne 0 ]]; then
  printf "%s\n" "$(basename "$0") must be run as root using sudo"
  exit 1
fi

# Create the prompt
PS3="select an audio device: "
options=("speakers" "headphones" "usb" "current" "quit")
OLD_IFS=${IFS}; #ifs space seperator
IFS=$'\t\n' #change ifs seperator from spaces to new line

# select and case statement
select opt in "${options[@]}"; do
case $opt in
  speakers)
        sysctl hw.snd.default_unit=0
        break;;
  headphones)
        sysctl hw.snd.default_unit=1
        break;;
  usb)
        sysctl hw.snd.default_unit=2
        break;;
  current)
        cat /dev/sndstat
        break;;
  quit)
    echo "Quitting"
    IFS=${OLD_IFS}
    break;;
  *)    printf "%s\n" "Usage: $(basename "$0") [ speakers | headphones | usb | current | quit ]";;
esac
done


