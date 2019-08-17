#!/bin/bash
#cp "$1" /run
volume=$2

echo Play : 「"$1"」vol: ${volume}
echo ${volume} > /var/lib/tomcat8/webapps/ROOT/volume
amixer set Master ${volume}%
omxplayer -o alsa "$1" &
