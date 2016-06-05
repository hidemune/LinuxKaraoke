#!/bin/bash
/home/user/tool/karaoke/JspInstall.sh
mkdir /tmp/que
touch /tmp/que/rireki
chmod 777 -R /tmp/que
chmod 777 /tmp/que/rireki
chown user:tomcat7 -R /tmp/que
ls -la /tmp/

