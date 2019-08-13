#!/bin/bash

echo WiFi設定を、必要に応じて行ってください。
sudo wicd-client &
read a

str=`ifconfig | grep -n1 eth0`
ip=$(echo "$str" | awk 'NR==2' | awk '{print $3}')

if [[ "${ip}" =~ ^127.* ]]; then
  str=`ifconfig | grep -n1 wlan0`
  ip=$(echo "$str" | awk 'NR==2' | awk '{print $3}')
fi

url=http://${ip}:8080
echo 以下のアドレスに、LAN経由で繋いでください。なお、アドレスはクリップボードへ保存されます。
echo
echo ${url}
echo ${url} | xsel --clipboard --input
chromium-browser https://www.google.com/search?q=QR+Code+Generator+Web&spell=1&sa=X&ved=0ahUKEwi-3dDbsv_jAhVyyosBHWaPAs0QBQgsKAA&biw=1057&bih=693
sleep 10
xte 'keydown Control_L' 
xte 'key V'
xte 'keyup Control_L' 

echo SendKeys Ctrl-V
read a
