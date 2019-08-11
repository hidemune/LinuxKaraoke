#!/bin/bash
files='./all.csv'

IFS='
' images=(`cat $files`)

num_images=${#images[*]}
echo MAX : $num_images
preNum=-1

nextNum=$(($RANDOM % $num_images))

echo $nextNum
IFS='	' fileNm=(${images[$nextNum]})
echo RandomFileName _ "${fileNm[0]}"
while [[ $(pgrep omxplayer) ]] ; do 
  sleep 1
done
./omx_player.sh "${fileNm[0]}"
