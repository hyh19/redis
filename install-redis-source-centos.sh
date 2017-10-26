#!/bin/bash

# Redis 版本
REDIS_VERSION="redis-4.0.2"
# 下载地址
DOWNLOAD_URL="http://download.redis.io/releases/${REDIS_VERSION}.tar.gz"
# 下载目录
DOWNLOAD_DIRECTORY="/tmp"
# 源码包保存路径
TAR_PATH="${DOWNLOAD_DIRECTORY}/${REDIS_VERSION}.tar.gz"
# 源码包解压目录
SOURCE_DIRECTORY="${DOWNLOAD_DIRECTORY}/${REDIS_VERSION}"
# 安装目录
INSTALL_DIRECTORY="/usr/local/redis/${REDIS_VERSION}"
# 符号链接
SYMBOL_LINK="/usr/local/redis/default"

yum install -y wget gcc make

cd $DOWNLOAD_DIRECTORY

# 如果没有源码包，则重新下载。
if [ ! -e "${TAR_PATH}" ]
then
    wget -O $TAR_PATH $DOWNLOAD_URL
fi

# 删除旧源码目录
if [ -d "$SOURCE_DIRECTORY" ]
then
    rm -rf $SOURCE_DIRECTORY
fi

# 解压源码包
tar xzf $TAR_PATH

cd $SOURCE_DIRECTORY

# 删除旧安装目录
if [ -d "$INSTALL_DIRECTORY" ]
then
    rm -rf $INSTALL_DIRECTORY
fi

make

make install PREFIX=$INSTALL_DIRECTORY

# 删除旧符号链接
if [ -L "$SYMBOL_LINK" ]
then
    rm -f $SYMBOL_LINK
fi

# 创建符号链接
ln -s $INSTALL_DIRECTORY $SYMBOL_LINK

cd $SOURCE_DIRECTORY

# 配置并启动
PORT=6379
sudo REDIS_PORT=$PORT \
REDIS_CONFIG_FILE="${SYMBOL_LINK}/etc/${PORT}.conf" \
REDIS_LOG_FILE="${SYMBOL_LINK}/log/${PORT}.log" \
REDIS_DATA_DIR="${SYMBOL_LINK}/data/${PORT}" \
REDIS_EXECUTABLE="${SYMBOL_LINK}/bin/redis-server" ./utils/install_server.sh

echo "export PATH=${PATH}:${SYMBOL_LINK}/bin" > /etc/profile.d/redis.sh
echo "提示：不要忘记执行命令 source /etc/profile.d/redis.sh 让 PATH 变量的修改生效"
