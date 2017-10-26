#!/bin/bash

# Redis 版本
REDIS_VERSION="redis-4.0.2"
# 下载地址
DOWNLOAD_URL="http://download.redis.io/releases/${REDIS_VERSION}.tar.gz"
# 下载目录
DOWNLOAD_DIRECTORY="/tmp"
# 工作目录
WORKING_DIRECTORY="${DOWNLOAD_DIRECTORY}/${REDIS_VERSION}"

yum install -y wget gcc make

cd $DOWNLOAD_DIRECTORY

wget $DOWNLOAD_URL

tar xzf "${DOWNLOAD_DIRECTORY}/${REDIS_VERSION}.tar.gz"

cd $WORKING_DIRECTORY

make

make install PREFIX="/usr/local/redis/${REDIS_VERSION}"

ln -s "/usr/local/redis/${REDIS_VERSION}" /usr/local/redis/default
