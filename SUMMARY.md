# 全书目录

- [引言](manuscript/00-introduction.md)

## 第一部分：那些“看起来只是一个字段”的问题

- [分部导读](manuscript/part-01-values/_index.md)
- [第 1 章：时间不是一个 `datetime`](manuscript/part-01-values/01-time.md)
  - [日期如何变成截止边界](manuscript/part-01-values/01-time/01-boundaries.md)
  - [时间的语义模型](manuscript/part-01-values/01-time/time-model.md)
  - [持续时间与日历运算](manuscript/part-01-values/01-time/04-calendar.md)
  - [业务日与时间区间](manuscript/part-01-values/01-time/05-business-day.md)
  - [日程规则与当地时间解析](manuscript/part-01-values/01-time/06-schedules.md)
  - [时间的表示、存储与往返验证](manuscript/part-01-values/01-time/02-storage.md)
  - [时间边界与业务生命周期](manuscript/part-01-values/01-time/03-expiration.md)
  - [时间来源与耗时测量](manuscript/part-01-values/01-time/07-clocks.md)
  - [综合设计：跨时区课程](manuscript/part-01-values/01-time/08-course.md)
  - [设计练习与本章回顾](manuscript/part-01-values/01-time/09-review.md)
- [第 2 章：ID 不只是数据库主键](manuscript/part-01-values/02-identity.md)
- [第 3 章：金额、精度与舍入](manuscript/part-01-values/03-money.md)
- [第 4 章：字符串、编码与“长度”](manuscript/part-01-values/04-strings.md)
- [第 5 章：Null、空值与默认值](manuscript/part-01-values/05-null.md)

## 第二部分：数据不是静态的

- [分部导读](manuscript/part-02-state/_index.md)
- [第 6 章：状态与状态机](manuscript/part-02-state/06-state-machines.md)
- [第 7 章：创建、更新与删除](manuscript/part-02-state/07-crud.md)
- [第 8 章：版本](manuscript/part-02-state/08-versions.md)

## 第三部分：事情可能不只发生一次

- [分部导读](manuscript/part-03-repetition/_index.md)
- [第 9 章：超时](manuscript/part-03-repetition/09-timeouts.md)
- [第 10 章：重试](manuscript/part-03-repetition/10-retries.md)
- [第 11 章：幂等](manuscript/part-03-repetition/11-idempotency.md)
- [第 12 章：去重](manuscript/part-03-repetition/12-deduplication.md)

## 第四部分：世界不只有一个线程

- [分部导读](manuscript/part-04-concurrency/_index.md)
- [第 13 章：竞态条件](manuscript/part-04-concurrency/13-race-conditions.md)
- [第 14 章：锁](manuscript/part-04-concurrency/14-locks.md)
- [第 15 章：乐观并发控制](manuscript/part-04-concurrency/15-optimistic-concurrency.md)
- [第 16 章：事务与原子性](manuscript/part-04-concurrency/16-transactions.md)

## 第五部分：世界不只有一台机器

- [分部导读](manuscript/part-05-distribution/_index.md)
- [第 17 章：缓存——为什么两份数据一定会不一致](manuscript/part-05-distribution/17-cache.md)
- [第 18 章：消息——延迟、重复、乱序与丢失](manuscript/part-05-distribution/18-messaging.md)
- [第 19 章：顺序](manuscript/part-05-distribution/19-ordering.md)
- [第 20 章：一致性](manuscript/part-05-distribution/20-consistency.md)
- [第 21 章：分布式系统中的时间](manuscript/part-05-distribution/21-distributed-time.md)

## 第六部分：系统永远处于变化中

- [分部导读](manuscript/part-06-evolution/_index.md)
- [第 22 章：API 兼容性](manuscript/part-06-evolution/22-api-compatibility.md)
- [第 23 章：数据结构演进](manuscript/part-06-evolution/23-schema-evolution.md)
- [第 24 章：配置与灰度](manuscript/part-06-evolution/24-configuration-rollout.md)
- [第 25 章：文件与大对象](manuscript/part-06-evolution/25-files.md)

## 第七部分：系统出问题以后，你怎么知道

- [分部导读](manuscript/part-07-observability/_index.md)
- [第 26 章：错误到底是什么](manuscript/part-07-observability/26-errors.md)
- [第 27 章：日志](manuscript/part-07-observability/27-logs.md)
- [第 28 章：Metrics、Trace 与可观测性](manuscript/part-07-observability/28-observability.md)

## 第八部分：把所有问题重新放到一起

- [分部导读](manuscript/part-08-synthesis/_index.md)
- [第 29 章：一个请求的一生](manuscript/part-08-synthesis/29-life-of-a-request.md)
- [第 30 章：软件工程的几个根本问题](manuscript/part-08-synthesis/30-fundamental-problems.md)
