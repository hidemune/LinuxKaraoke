#!/bin/bash

str=`ifconfig | grep "inet 192"`
ip=$(echo "$str" | awk '{print $2}')

echo 以下のアドレスに、LAN経由で繋いでください。
echo
echo http://${ip}:8080
read a
