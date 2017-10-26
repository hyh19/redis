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
# 符号链接
SYMBOL_LINK="/usr/local/redis/default"

yum install -y wget gcc make

cd $DOWNLOAD_DIRECTORY

wget $DOWNLOAD_URL

tar xzf "${DOWNLOAD_DIRECTORY}/${REDIS_VERSION}.tar.gz"

cd $WORKING_DIRECTORY

make

make install PREFIX=$INSTALL_DIRECTORY

ln -s $INSTALL_DIRECTORY $SYMBOL_LINK

cd $WORKING_DIRECTORY

# 配置并启动
PORT=6379
sudo REDIS_PORT=$PORT \
REDIS_CONFIG_FILE="${SYMBOL_LINK}/etc/${PORT}.conf" \
REDIS_LOG_FILE="${SYMBOL_LINK}/log/${PORT}.log" \
REDIS_DATA_DIR="${SYMBOL_LINK}/data/${PORT}" \
REDIS_EXECUTABLE="${SYMBOL_LINK}/bin/redis-server" ./utils/install_server.sh

echo "export PATH=${PATH}:${SYMBOL_LINK}/bin" > /etc/profile.d/redis.sh
echo "提示：不要忘记执行命令 source /etc/profile.d/redis.sh 让 PATH 变量的修改生效"
