#!/bin/bash
cp "$1" /tmp/que/play
volume=`cat /tmp/que/volume`
killall vlc
echo Play : 「"$1"」
#sleep 1
video_length=`mediainfo "${1}" | grep Duration | head -n 1 | cut -d ':' -f 2 | sed -e 's/mn/m/' | sed -e 's/[0-9]*ms//'`
#parole -F "$1" &
#parole -F /tmp/que/play &
#vlc file:///tmp/que/play --fullscreen --one-instance -I rc –rc-host localhost:80 &
vlc file:///tmp/que/play --video-x=1600 --video-y=400 --width=300 --height=300 --fullscreen --no-video-title-show --qt-embedded-open --play-and-exit &
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
    volume=`cat /tmp/que/volume`
    amixer -D pulse sset Master ${volume}%
    #amixer -D pulse sset "LibVLC 2.2.2" -q  ${volume}%
    #vlc --one-instance --sout-raop-volume=${volume}
    sleep 1
  else
    echo "Brk"
    break
  fi
done
kill -9 $pid
