#!/bin/bash

str=`ifconfig | grep -n1 eth0`
ip=$(echo "$str" | awk 'NR==2' | awk '{print $3}')

#ip=$(echo "$str" | awk 'NR==2')
#echo $ip

echo 以下のアドレスに、LAN経由で繋いでください。
echo
echo http://${ip}:8080
read a

