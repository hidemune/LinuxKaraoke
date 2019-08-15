#!/bin/bash

echo WiFi設定を、必要に応じて行ってください。
echo WiFi設定画面を閉じてから、Enter キーで、先に進みます。
sudo wicd-client &
read a

str=`ifconfig | grep "inet 192"`
ip=$(echo "$str" | awk '{print $2}')

url=http://${ip}:8080
echo 以下のアドレスに、LAN経由で繋いでください。なお、アドレスはクリップボードへコピーされます。
echo Webブラウザが表示されたら、リンクをどれか選択してください。しばらく待つと、アドレスがペーストされます。
echo
echo ${url}
echo ${url} | xsel --clipboard --input
chromium-browser https://www.google.com/search?q=QR+Code+Generator+Web&spell=1&sa=X&ved=0ahUKEwi-3dDbsv_jAhVyyosBHWaPAs0QBQgsKAA&biw=1057&bih=693
sleep 30
xte 'keydown Control_L' 
xte 'key V'
xte 'keyup Control_L' 

echo SendKeys Ctrl-V
read a
