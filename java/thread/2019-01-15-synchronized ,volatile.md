---
createDate: 2019-01-15
category: java
title: 多线程（一）：synchronized 和 volatile
status: push
---
## synchronized ：实现同步
### 锁机制
在编译成字节码时会在入口位置插入monitorenter,在退出时插入monitorexit字节码命令
### 内置锁     
每个java对象都可以用做一个实现同步的锁，这些锁称为内置锁。线程进入同步代码块或方法的时候会自动获得该锁，在退出同步代码块或方法时会释放该锁。获得内置锁的唯一途径就是进入这个锁的保护的同步代码块或方法。        
### 互斥锁            

内置锁是一个互斥锁，这就是意味着最多只有一个线程能够获得该锁，当线程A尝试去获得线程B持有的内置锁时，线程A必须等待或者阻塞，直到线程B释放这个锁，如果B线程不释放这个锁，那么A线程将永远等待下去。

- 修饰普通方法：锁住对象的实例，new 多个实例，每个实例再去调用锁住的方法，不会造成阻塞。
- 修饰静态方法：锁住整个类
- 修饰代码块：锁住一个对象 synchronized （lock） 锁住的是lock对象
 

 

## volatile:实现可见性
volatile 修饰变量，在修饰的变量发生变化时，会立即更新主存，让其他可见。

禁止指令重排序：指令重排序 ：cpu会将编写顺序打乱，具体需更深入了解 mark一下

所以volatile适合一写多读