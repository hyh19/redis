#!/bin/bash

# Redis 版本
REDIS_VERSION="redis-4.0.2"
# 下载地址
DOWNLOAD_URL="http://download.redis.io/releases/${REDIS_VERSION}.tar.gz"
# 下载目录
DOWNLOAD_DIRECTORY="/tmp"
# 工作目录
WORKING_DIRECTORY="${DOWNLOAD_DIRECTORY}/${REDIS_VERSION}"
# 安装目录
INSTALL_DIRECTORY="/usr/local/redis/${REDIS_VERSION}"

yum install -y wget gcc make

cd $DOWNLOAD_DIRECTORY

wget $DOWNLOAD_URL

tar xzf "${DOWNLOAD_DIRECTORY}/${REDIS_VERSION}.tar.gz"

cd $WORKING_DIRECTORY

make

make install PREFIX=$INSTALL_DIRECTORY

cd $WORKING_DIRECTORY

# 配置并启动
sudo REDIS_PORT=6379 \
REDIS_CONFIG_FILE="${INSTALL_DIRECTORY}/etc/6379.conf" \
REDIS_LOG_FILE="${INSTALL_DIRECTORY}/log/6379.log" \
REDIS_DATA_DIR="${INSTALL_DIRECTORY}/data/6379" \
REDIS_EXECUTABLE="${INSTALL_DIRECTORY}/bin/redis-server" ./utils/install_server.sh

ln -s $INSTALL_DIRECTORY /usr/local/redis/default
