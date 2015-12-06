#!/bin/bash
path=$PWD
#echo $path
base="$path"
photo=$(find $base -regex ".*jpg"  -type f | while read x; do echo "`expr $RANDOM % 1000`:$x"; done | sort -n | sed 's/[0-9]*://' | head -1)

session=`echo $DESKTOP_SESSION`
path="file://"$photo

# for openbox.
if [[ $session == *"openbox"* ]]; then
    feh --bg-fill $photo

# for Ubuntu and Gnome.
elif [[ $session == *"ubuntu"* ]]; then
    gsettings set org.gnome.desktop.background picture-uri "$path"
fi
