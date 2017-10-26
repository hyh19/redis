#!/bin/bash

# 安装工具软件
yum install -y wget gcc make

# 下载安装包
wget http://download.redis.io/releases/redis-4.0.2.tar.gz

# 解压
tar xzf redis-4.0.2.tar.gz

cd redis-4.0.2

# 编译
make

# 安装
make install PREFIX=/usr/local/redis/redis-4.0.2

# 创建符号链接
ln -s /usr/local/redis/redis-4.0.2 /usr/local/redis/default
