#!/bin/sh
sudo apt update && sudo apt install jq curl sed
VERSION_NUMBER=$(curl -v 'https://pan.baidu.com/disk/cmsdata?clienttype=0&app_id=250528&web=1&t=1719218069431&adCode=1&do=client' | jq '.linux | .url_1' | sed -ne 's/[^0-9]*\(\([0-9]\.\)\{0,4\}[0-9][^.]\).*/\1/p')
echo $VERSION_NUMBER > root/version
docker build -t anzupop/baidunetdisk:$VERSION_NUMBER .
docker image tag anzupop/baidunetdisk:$VERSION_NUMBER anzupop/baidunetdisk:latest
