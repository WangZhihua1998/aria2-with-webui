#!/bin/sh
#if [ $2 -eq 1 ]; then
#	mv "$3" /data
#fi
#直接把下载内容放置在/data里避免移动时弄乱文件夹结构
echo [$(date)] $2, $3, $1 "<br>" >> /data/log.html
