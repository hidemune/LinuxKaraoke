# LinuxKaraoke(動画再生ソフト)

■RaspberryPi 3B,4 対応版


■セットアップ手順

（１回め）
sudo ./jyunbi.sh

（２回め以降）
sudo ./JspInstall.sh


■all.csv 作成方法
以下のように、「TAB」区切りで、
ファイル名、アーティスト名、アルバム名、タイトル名 の順に、文字列を並べる。
参考）
LinuxKaraoke/all.csv
例）
/home/pi/Videos/宇宙の大きさを体感できる動画（Mitaka 版.mp4	宇宙の大きさを体感できる動画（Mitaka 版.mp4	Test	Test


■起動方法

sudo ./loop.sh


■Webアプリ
LinuxKaraoke/getIP.sh にて、確認可能。

例）
http://<IP_Adress>:8080



そのうちこんな感じにする予定

■RasPiで、環境ビデオ流しっぱプロジェクト

- RasPiをアクセスポイント親機として起動 （未）
- RasPiからプロジェクターにビデオを流し続けるシステム作成 （済）
- スマホで操作する仕組みを作成 （済）
    - Webシステムで （済）
    - カラオケみたいに （済）
    - 待受動画はリスト化してラウンドロビンで再生 （済）
    - 見たい動画はキューに入れる （済）
    - キューにリストが入ったら待受動画を強制終了してキューを優先再生 （済）
    - キューの優先度変更も可能に （対応なし:入力順のみ）
