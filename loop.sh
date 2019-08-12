#!/bin/bash

unclutter -idle 0.5 -root -visible &

mkdir /var/lib/tomcat8/webapps/ROOT
rm -f /var/lib/tomcat8/webapps/ROOT/stop
rm -f /var/lib/tomcat8/webapps/ROOT/cancel
rm -f /var/lib/tomcat8/webapps/ROOT/que*

sudo ./jyunbi.sh
mode=0 #SYOKITI_or_QUE:0

volume=70
amixer set Master 70%

while true :
do
  # to RANDOM
  if [ $mode -le 1 ] ; then
    mode=1 #RANDOM:1
    ./random.sh
  fi

  # Yoyaku !
  lslst=(`ls /var/lib/tomcat8/webapps/ROOT/que* 2>/dev/null`)
  if [ ${#lslst[*]} -gt 0 ] ; then
    # QUE
    mode=2
    qfiles=(`ls /var/lib/tomcat8/webapps/ROOT/que* -1 2>/dev/null`)
    ./omx_player.sh "`cat ${qfiles[0]}`"
    echo Kettei : 「"`cat ${qfiles[0]}`"」 
    rm -f ${qfiles[0]}
  else
    mode=1
    #break
  fi

  while [[ $(pgrep omxplayer) ]] ; do 
    # STOP !
    if [ -f /var/lib/tomcat8/webapps/ROOT/stop ] ; then
      #trap 'wait $PID' EXIT
      echo STOP !!!
      kill -9 `pgrep omxplayer`
      exit 0
    fi
    # CANCEL !
    if [ -f /var/lib/tomcat8/webapps/ROOT/cancel ] ; then
      rm /var/lib/tomcat8/webapps/ROOT/cancel
      #trap 'wait $PID' EXIT
      echo CANCEL !!
      kill -9 `pgrep omxplayer`
      break
    fi
    # Volume set
    if [ -f /var/lib/tomcat8/webapps/ROOT/volume ] ; then
      vol=`cat /var/lib/tomcat8/webapps/ROOT/volume`
      echo VOLUME : ${vol}
      amixer set Master ${vol}%
    fi
    # mode=1 かつ、キューにある場合、キャンセルボタンと同じにする
    if [ ${mode} -eq 1 ] ; then
      lslst=(`ls /var/lib/tomcat8/webapps/ROOT/que* 2>/dev/null`)
      if [ ${#lslst[*]} -gt 0 ] ; then
        echo que-CANCEL !!
        kill -9 `pgrep omxplayer`
        break
      fi
    fi
    sleep 1
  done
done
