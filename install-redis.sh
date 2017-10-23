#!/bin/bash

# 安装编译工具
yum install -y gcc make

cd /tmp

# 下载安装包
wget http://download.redis.io/releases/redis-4.0.2.tar.gz

# 解压
tar xzf redis-4.0.2.tar.gz

cd redis-4.0.2

# 编译安装
make
