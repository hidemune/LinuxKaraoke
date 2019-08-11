#!/bin/bash

mkdir /var/lib/tomcat8/webapps/ROOT
rm /var/lib/tomcat8/webapps/ROOT/stop

sudo ./jyunbi.sh
mode=0 #SYOKITI_or_QUE:0

while true :
do
  # to RANDOM
  if [ $mode -eq 0 ] ; then
    mode=1 #RANDOM:1
    ./random.sh &
  fi

#  for k in {0..32767}
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
      mode=0
      #killall random.sh
      while [[ $(pgrep omxplayer) ]] ; do 
          sleep 1
      done
      qfiles=(`ls /var/lib/tomcat8/webapps/ROOT/que* -1 2>/dev/null`)
      ./omx_player.sh "`cat ${qfiles[0]}`"
      echo Kettei : 「"`cat ${qfiles[0]}`"」 
      rm -f ${qfiles[0]}
    #else
      #if [ $mode -eq 1 ] ; then
        #break
      #fi
    fi
  done
done
