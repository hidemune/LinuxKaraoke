#!/bin/bash
touch /var/lib/tomcat8/webapps/ROOT/stop
while killall omxplayer; do 
    sleep 1
done
#killall random.sh
#killall omxplayer.sh
#killall loop.sh
rm /var/lib/tomcat8/webapps/ROOT/que*
