#!/bin/bash
touch /tmp/que/stop
killall vlc
killall random.sh
killall vlc.sh
killall loop.sh
rm /tmp/que/que*
