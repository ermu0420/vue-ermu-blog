---
title: Redis（一）：安装，配置
---
## Linux安装，配置

### 下载Redis

  ~~~ shell
  [root@VM_0_17_centos redis]#  wget http://download.redis.io/releases/redis-4.0.6.tar.gz
  ~~~

### 解压
  ~~~ shell
  [root@VM_0_17_centos redis]# tar -zxvf redis-4.0.6.tar.gz 
  ~~~
### 编译
  ~~~ shell
  [root@VM_0_17_centos redis-4.0.6]# make MAlLOC=libc
  ~~~
### 启动
  ~~~ shell
  [root@VM_0_17_centos redis-4.0.6]# ./src/redis-server
  ~~~
### 注册为服务
  ~~~ shell
  # 将配置文件拷贝到/etc/redis下面
  [root@VM_0_17_centos redis-4.0.6]# mkdir /etc/redis
  
  [root@VM_0_17_centos redis-4.0.6]# cp redis.conf /etc/redis/6379.conf
  # 将util下面redis_init_script拷贝到/etc/init.d下
  [root@VM_0_17_centos utils]# cp redis_init_script /etc/init.d/redis
  # 启动测试
  [root@VM_0_17_centos ~]# service redis start
  ~~~
### 修改配置文件
  ~~~ shell
  [root@VM_0_17_centos ~]# vim /etc/redis/6379.conf
  
  # 守护启动
  daemonize yes 
  # 修改bind  bind 允许客户端IP的链接
  # 注释掉bind 127.0.0.1 不设置bind 则为不限制
  # 密码 requirepass 
  # 解除 requirepass foobared 设置成自己密码就行
  ~~~
### 重新启动Redis并连接
  ~~~ shell
  [root@VM_0_17_centos /]# service redis restart
  [root@VM_0_17_centos src]# ./redis-cli -h 127.0.0.1 -p 6379 -a password
  # -a 后面就是设置的密码
  ~~~