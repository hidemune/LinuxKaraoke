#!/bin/bash
rm -f /var/lib/tomcat8/webapps/ROOT/start

str=`ifconfig | grep "inet 192"`
ip=$(echo "$str" | awk '{print $2}')

if [ "${ip}" == "" ]; then
  echo WiFi設定を、必要に応じて行ってください。
  echo WiFi設定画面を閉じてから、Enter キーで、先に進みます。
  sudo wicd-client &
  read a
fi

str2=`ifconfig | grep "inet 192"`
ip2=$(echo "$str2" | awk '{print $2}' | sed -n 1P)

url="http://${ip2}:8080"
echo 以下のアドレスに、LAN経由で繋いでください。なお、アドレスはクリップボードへコピーされます。
echo Webブラウザが表示されたら、リンクをどれか選択してください。しばらく待つと、アドレスがペーストされます。
echo
echo ${url}

qrencode -t ansi "${url}"

while [ 1 ]; do
  if [ -f /var/lib/tomcat8/webapps/ROOT/start ]; then
    xte 'keydown Alt_L' 
    xte 'key Space'
    xte 'keyup Alt_L'
    xte 'key N'

    sudo /home/pi/git/LinuxKaraoke/startNightly.sh
    exit 0
  fi
  sleep 1
done
