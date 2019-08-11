#!/bin/bash
cp "$1" /var/lib/tomcat8/webapps/ROOT/play
volume=`cat /var/lib/tomcat8/webapps/ROOT/volume`
while [[ $(pgrep omxplayer) ]] ; do  
    sleep 1
done
echo Play : 「"$1"」
#sleep 1
video_length=`ffmpeg -i "$1" 2>&1 | grep "Duration"| cut -d ' ' -f 4 | sed s/,// | sed 's@\..*@@g' | awk '{ split($1, A, ":"); split(A[3], B, "."); print 3600*A[1] + 60*A[2] + B[1] }'`
#parole -F "$1" &
#parole -F /var/lib/tomcat8/webapps/ROOT/play &
#omxplayer file:///var/lib/tomcat8/webapps/ROOT/play --fullscreen --one-instance -I rc –rc-host localhost:80 &
omxplayer file:///var/lib/tomcat8/webapps/ROOT/play # comment out &

exit 0

pid=$!
echo $video_length
IFS=' ms'
set -- $video_length
if [ -z "$2" ]
then
  sec=`echo "$1" + 1 | bc`
else
  sec=`echo "$1 * 60 + $2" | bc`
fi
echo $sec
IFS='
'
for i in `seq 1 $sec`
do
  if [ -x /proc/$pid ]
  then
    echo "Slp"
    volume=`cat /var/lib/tomcat8/webapps/ROOT/volume`
    amixer -D pulse sset Master ${volume}%
    #amixer -D pulse sset "Libomxplayer 2.2.2" -q  ${volume}%
    #omxplayer --one-instance --sout-raop-volume=${volume}
    sleep 1
  else
    echo "Brk"
    break
  fi
done
#kill -9 $pid
