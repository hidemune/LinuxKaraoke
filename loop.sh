#!/bin/bash

mkdir /tmp/que
rm /tmp/que/stop
#trap 'kill $(jobs -p)' EXIT
gksudo ./jyunbi.sh

while :
do
  mode=0
  ./random.sh &

#  for k in {0..32767}
  while :
  do
    #echo test
    sleep 1
    if [ -f /tmp/que/stop ] ; then
      #trap 'kill $PID' EXIT
      killall parole
      exit 0
    fi
    lslst=(`ls /tmp/que/que* 2>/dev/null`)
    if [ ${#lslst[*]} -gt 0 ] ; then
      mode=1
      killall random.sh
      killall parole
      qfiles=(`ls /tmp/que/que* -1 2>/dev/null`)
      killall parole
      ./vlc.sh "`cat ${qfiles[0]}`"
      echo Kettei : 「"`cat ${qfiles[0]}`"」 
      rm -f ${qfiles[0]}
    else
      if [ $mode -eq 1 ] ; then
        break
      fi
    fi
  done
done