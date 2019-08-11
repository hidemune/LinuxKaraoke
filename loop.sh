#!/bin/bash

mkdir /var/lib/tomcat8/webapps/ROOT
rm /var/lib/tomcat8/webapps/ROOT/stop
#trap 'kill $(jobs -p)' EXIT
sudo ./jyunbi.sh

while :
do
  mode=0
  ./random.sh &

#  for k in {0..32767}
  while :
  do
    #echo test
    sleep 1
    if [ -f /var/lib/tomcat8/webapps/ROOT/stop ] ; then
      #trap 'kill $PID' EXIT
      while killall omxplayer; do 
          sleep 1
      done
      exit 0
    fi
    lslst=(`ls /var/lib/tomcat8/webapps/ROOT/que* 2>/dev/null`)
    if [ ${#lslst[*]} -gt 0 ] ; then
      mode=1
      killall random.sh
      while killall omxplayer; do 
          sleep 1
      done
      qfiles=(`ls /var/lib/tomcat8/webapps/ROOT/que* -1 2>/dev/null`)
      killall parole
      ./omxplayer.sh "`cat ${qfiles[0]}`"
      echo Kettei : 「"`cat ${qfiles[0]}`"」 
      rm -f ${qfiles[0]}
    else
      if [ $mode -eq 1 ] ; then
        break
      fi
    fi
  done
done