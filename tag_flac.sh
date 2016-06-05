#!/bin/bash

#flac
#metaflac --list "/home/user/ミュージック/FLAC/UNISON/UNISON SQUARE GARDEN - シュガーソングとビターステップ/01 - シュガーソングとビターステップ.flac"
#METADATA block #0
#  type: 0 (STREAMINFO)
#  is last: false
#  length: 34
#  minimum blocksize: 4096 samples
#  maximum blocksize: 4096 samples
#  minimum framesize: 14 bytes
#  maximum framesize: 14480 bytes
#  sample_rate: 44100 Hz
#  channels: 2
#  bits-per-sample: 16
#  total samples: 11201400
#  MD5 signature: 71d3e2934d4194763b975888d09a38c2
#METADATA block #1
#  type: 4 (VORBIS_COMMENT)
#  is last: false
#  length: 212
#  vendor string: reference libFLAC 1.3.0 20130526
#  comments: 5
#    comment[0]: ARTIST=UNISON SQUARE GARDEN
#    comment[1]: TITLE=シュガーソングとビターステップ
#    comment[2]: TRACKNUMBER=01
#    comment[3]: DATE=2015
#    comment[4]: ALBUM=シュガーソングとビターステップ
#METADATA block #2
#  type: 1 (PADDING)
#  is last: true
#  length: 8192

#取り出すもの
#ARTIST=UNISON SQUARE GARDEN
#TITLE=シュガーソングとビターステップ
#ALBUM=シュガーソングとビターステップ

#スペース区切りで取り出し、ARTIST=で始まる文字列を操作
#ファイル名、アーティスト、タイトル、アルバムでタブ区切りのCSVを作成する。

ARTIST=`metaflac --show-tag=ARTIST "$1"`
TITLE=`metaflac --show-tag=TITLE "$1"`
ALBUM=`metaflac --show-tag=ALBUM "$1"`
ARTIST=`echo $ARTIST | sed 's/^.*\=//'`
TITLE=`echo $TITLE | sed 's/^.*\=//'`
ALBUM=`echo $ALBUM | sed 's/^.*\=//'`
echo $1	$ARTIST	$TITLE	$ALBUM
