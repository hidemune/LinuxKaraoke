#!/bin/bash
#cp "$1" /run
volume=`cat /var/lib/tomcat8/webapps/ROOT/volume`

echo Play : 「"$1"」
#sleep 1
#video_length=`ffmpeg -i "$1" 2>&1 | grep "Duration"| cut -d ' ' -f 4 | sed s/,// | sed 's@\..*@@g' | awk '{ split($1, A, ":"); split(A[3], B, "."); print 3600*A[1] + 60*A[2] + B[1] }'`
#parole -F "$1" &
#parole -F /var/lib/tomcat8/webapps/ROOT/play &
#omxplayer file:///var/lib/tomcat8/webapps/ROOT/play --fullscreen --one-instance -I rc –rc-host localhost:80 &
omxplayer -o alsa "$1" &
