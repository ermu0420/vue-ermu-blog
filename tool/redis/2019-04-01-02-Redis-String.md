---
title: Redis（二）：数据结构之String
---
## String常用命令
### set/get
~~~ shell
127.0.0.1:6379> set name ermu
OK
127.0.0.1:6379> get name
"ermu"
127.0.0.1:6379> get notexitkey
(nil)
~~~
### mget 批量获取多个key的值
~~~ shell
127.0.0.1:6379> mget name notexitkey
1) "ermu"
2) (nil)
~~~
### incr && incrby 只对integer值 incr对key对应的值进行+1; incrby加指定值  
~~~ shell
127.0.0.1:6379> get age
"22"
127.0.0.1:6379> incr age
(integer) 23
127.0.0.1:6379> get age
"23"
127.0.0.1:6379> incrby age 20
(integer) 43
127.0.0.1:6379> incr name
(error) ERR value is not an integer or out of range
~~~
### decr && decrby
~~~ shell
127.0.0.1:6379> decr age 
(integer) 42
127.0.0.1:6379> decrby age 20
(integer) 22
~~~
### setnx 如果key已经存在则返回0
~~~ shell
127.0.0.1:6379> setnx height 170
(integer) 1
127.0.0.1:6379> setnx height 172
(integer) 0
127.0.0.1:6379> get height
"170"
~~~

### setex set expire 单位 秒 
~~~ shell
127.0.0.1:6379> setex exkey1 5 value1
OK
127.0.0.1:6379> get exkey1
"value1"
# 五秒后再次获取
127.0.0.1:6379> get exkey1
(nil)
~~~
###  getrange
~~~ shell
127.0.0.1:6379> set selfinfo "Hellow World !"
OK
127.0.0.1:6379> getrange selfinfo 0 -1
"Hellow World !"
# -1则表示后面所有
127.0.0.1:6379> getrange selfinfo 1 3
"ell"
~~~
### append
~~~ shell
127.0.0.1:6379> append selfinfo ermu
(integer) 18
127.0.0.1:6379> get selfinfo
"Hellow World !ermu"
~~~
