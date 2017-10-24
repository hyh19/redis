# Redis Practice

https://redis.io/

https://redis.io/documentation

https://github.com/antirez/redis

https://github.com/antirez/redis-doc

https://github.com/CodisLabs/codis

https://github.com/sohutv/cachecloud

https://github.com/vipshop/redis-migrate-tool


## Installation

### [Source](https://redis.io/download)

Download, extract and compile Redis with:
```
$ wget http://download.redis.io/releases/redis-4.0.2.tar.gz
$ tar xzf redis-4.0.2.tar.gz
$ cd redis-4.0.2
$ make
```

The binaries that are now compiled are available in the src directory. Run Redis with:
```
$ src/redis-server
```

You can interact with Redis using the built-in client:
```
$ src/redis-cli
redis> set foo bar
OK
redis> get foo
"bar"
```

[install-redis-source-centos.sh](https://github.com/mrhuangyuhui/redis/blob/master/install-redis-source-centos.sh)
```bash
curl -L https://github.com/mrhuangyuhui/redis/raw/master/install-redis-source-centos.sh | sh
```


### YUM

```bash
## CentOS 6.9/7.4 ##
yum install -y epel-release
yum install -y redis
```

```
rpm -ql redis
```

### APT

```
## Ubuntu 14.04/16.04/17.04 ##
apt-get update
apt-get install -y redis-server
```

```
dpkg -L redis-server
```


