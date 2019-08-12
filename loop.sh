#!/bin/bash

unclutter -idle 0.5 -root -visible &

mkdir /var/lib/tomcat8/webapps/ROOT
rm /var/lib/tomcat8/webapps/ROOT/stop
rm -f /var/lib/tomcat8/webapps/ROOT/que*

sudo ./jyunbi.sh
mode=0 #SYOKITI_or_QUE:0

while true :
do
  # to RANDOM
  if [ $mode -le 1 ] ; then
    mode=1 #RANDOM:1
    ./random.sh
    while [[ $(pgrep omxplayer) ]] ; do 
        sleep 1
    done
  fi

  while true :
  do
    #echo test
    sleep 1
    # STOP !
    if [ -f /var/lib/tomcat8/webapps/ROOT/stop ] ; then
      #trap 'wait $PID' EXIT
      while [[ $(pgrep omxplayer) ]] ; do 
          sleep 1
      done
      exit 0
    fi
    # Yoyaku !
    lslst=(`ls /var/lib/tomcat8/webapps/ROOT/que* 2>/dev/null`)
    if [ ${#lslst[*]} -gt 0 ] ; then
      # QUE
      mode=2
      while [[ $(pgrep omxplayer) ]] ; do 
          sleep 1
      done
      qfiles=(`ls /var/lib/tomcat8/webapps/ROOT/que* -1 2>/dev/null`)
      ./omx_player.sh "`cat ${qfiles[0]}`"
      echo Kettei : 「"`cat ${qfiles[0]}`"」 
      rm -f ${qfiles[0]}
    else
      mode=1
      break
    fi
  done
done
