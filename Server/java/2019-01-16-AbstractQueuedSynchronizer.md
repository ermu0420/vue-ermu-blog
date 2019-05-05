---
createDate: 2019-01-16
category: java
title: 多线程（二）：AbstractQueuedSynchronizer
status: push
sidebar: auto
---
AbstractQueuedSynchronizer(AQS) -- 为实现依赖于先进先出 (FIFO) 

为等待队列的阻塞锁和相关同步器（信号量，事件）提供一个框架

此类设计目标就是依靠单个原子int值（state）来表示状态。

需要子类重写 

tryAcquire 尝试获取锁
tryRelease 尝试释放
tryAcquireShared
tryReleaseShared
此类有默认的独占和共享模式，可以实现其一，也可以都实现