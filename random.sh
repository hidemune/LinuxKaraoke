#!/bin/bash
files='./all.csv'

IFS='
' images=(`cat $files`)

num_images=${#images[*]}
echo MAX : $num_images
preNum=-1

# CSV_KyokuSuu=100
#for i in {0..100}
#do
  #for j in {0..100}
  #do
    nextNum=$(($RANDOM % $num_images))
    #if [ $preNum -ne $nextNum ] ; then
    #  break
    #fi
  #done
  echo $nextNum
  IFS='	' fileNm=(${images[$nextNum]})
  echo RandomFileName _ "${fileNm[0]}"
  while [[ $(pgrep omxplayer) ]] ; do 
      sleep 1
  done
  ./omx_player.sh "${fileNm[0]}"
  preNum=$nextNum
#done
