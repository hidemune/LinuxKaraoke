#!/bin/bash
./JspInstall.sh
mkdir /tmp/que
cp rireki /tmp/que/rireki
echo 70 > /tmp/que/volume
chmod 777 -R /tmp/que
chmod 777 /tmp/que/rireki
chown user:tomcat7 -R /tmp/que
chown user:tomcat8 -R /tmp/que
ls -la /tmp/

