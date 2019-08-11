#!/bin/bash
files='./all.csv'

IFS='
' images=(`cat $files`)

num_images=${#images[*]}
echo MAX : $num_images
preNum=-1

for i in {0..100}
do
#  nextNum=`echo "(($RANDOM / 32768) * $num_images)" | bc -l`
  for j in {0..100}
  do
    nextNum=$(($RANDOM % $num_images))
    if [ $preNum -ne $nextNum ] ; then
      break
    fi
  done
  echo $nextNum
   IFS='	' fileNm=(${images[$nextNum]})
  echo RandomFileName : "${fileNm[0]}"
  ./omxplayer.sh "${fileNm[0]}"
  preNum=$nextNum
done
