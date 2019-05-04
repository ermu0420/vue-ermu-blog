---
title: Redis（七）：消息订阅与发布
---
## 消息订阅与发布

### 订阅方1
~~~ shell
127.0.0.1:6379> SUBSCRIBE channel1 chanle2 
Reading messages... (press Ctrl-C to quit)
1) "subscribe"
2) "channel1"
3) (integer) 1
1) "subscribe"
2) "chanle2"
3) (integer) 2
~~~
### 订阅方2
~~~ shell
127.0.0.1:6379> SUBSCRIBE channel1 
Reading messages... (press Ctrl-C to quit)
1) "subscribe"
2) "channel1"
3) (integer) 1
~~~
### 发布消息至管道1
~~~ shell
127.0.0.1:6379> PUBLISH channel1 "this is a msg"
(integer) 2
# 2表示2个订阅方已接受
~~~
### 订阅1 和订阅2收到消息
~~~ shell
1) "message"
2) "channel1"
3) "this is a msg"
~~~
