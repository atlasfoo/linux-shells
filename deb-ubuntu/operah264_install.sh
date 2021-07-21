#!/bin/bash

read -p "Input the h264 codec version you want to install (from github/iteufel ffmpeg-prebuilt repo): " version

echo "Installing ffmpeg $version"

cd ~

curl -L -O "https://github.com/iteufel/nwjs-ffmpeg-prebuilt/releases/download/$version/$version-linux-x64.zip"

unzip "$version-linux-x64"

sudo mv libffmpeg.so /usr/lib/x86_64-linux-gnu/libffmpeg_h264.so

sudo mv /usr/lib/x86_64-linux-gnu/opera/libffmpeg.so /usr/lib/x86_64-linux-gnu/opera/libffmpeg.so.orig

sudo ln -s /usr/lib/x86_64-linux-gnu/libffmpeg_h264.so /usr/lib/x86_64-linux-gnu/opera/libffmpeg.so

read -p "h264 codec $version successfully installed"
