# 全书目录

- [引言](manuscript/00-introduction.md)

## 第一部分：那些“看起来只是一个字段”的问题

- [分部导读](manuscript/part-01-values/_index.md)
- [第 1 章：时间不是一个 `datetime`](manuscript/part-01-values/01-time.md)
  - [日期如何变成截止边界](manuscript/part-01-values/01-time/01-02-boundaries.md)
  - [时间的语义模型](manuscript/part-01-values/01-time/03-time-model.md)
  - [持续时间与日历运算](manuscript/part-01-values/01-time/04-calendar.md)
  - [业务日与时间区间](manuscript/part-01-values/01-time/05-business-day.md)
  - [日程规则与当地时间解析](manuscript/part-01-values/01-time/06-schedules.md)
  - [时间的表示、存储与往返验证](manuscript/part-01-values/01-time/07-storage.md)
  - [时间边界与业务生命周期](manuscript/part-01-values/01-time/08-expiration.md)
  - [时间来源与耗时测量](manuscript/part-01-values/01-time/09-clocks.md)
  - [综合设计：跨时区课程](manuscript/part-01-values/01-time/10-course.md)
  - [设计练习与本章回顾](manuscript/part-01-values/01-time/11-review.md)
- [第 2 章：ID 不只是数据库主键](manuscript/part-01-values/02-identity.md)
- [第 3 章：金额、精度与舍入](manuscript/part-01-values/03-money.md)
- [第 4 章：字符串、编码与“长度”](manuscript/part-01-values/04-strings.md)
- [第 5 章：Null、空值与默认值](manuscript/part-01-values/05-null.md)

## 第二部分：数据的变化、归属与读取

- [分部导读](manuscript/part-02-state/_index.md)
- [第 6 章：状态与状态机](manuscript/part-02-state/06-state-machines.md)
- [第 7 章：修改与删除：数据变化意味着什么](manuscript/part-02-state/07-crud.md)
- [第 8 章：权限与归属：谁能操作这份数据](manuscript/part-02-state/08-authorization.md)
- [第 9 章：查询、分页与快照](manuscript/part-02-state/09-query-snapshots.md)

## 第三部分：失败、未知与重复执行

- [分部导读](manuscript/part-03-repetition/_index.md)
- [第 10 章：错误、拒绝与未知结果](manuscript/part-07-observability/26-errors.md)
- [第 11 章：超时与等待边界](manuscript/part-03-repetition/09-timeouts.md)
- [第 12 章：重试：恢复动作也有代价](manuscript/part-03-repetition/10-retries.md)
- [第 13 章：幂等与去重：重复请求的业务效果](manuscript/part-03-repetition/11-idempotency.md)

## 第四部分：并发时怎样守住业务约束

- [分部导读](manuscript/part-04-concurrency/_index.md)
- [第 14 章：竞态条件与业务不变量](manuscript/part-04-concurrency/13-race-conditions.md)
- [第 15 章：事务、原子性与隔离](manuscript/part-04-concurrency/16-transactions.md)
- [第 16 章：锁：保护什么，保护到哪里](manuscript/part-04-concurrency/14-locks.md)
- [第 17 章：乐观并发控制：拒绝过时的写入](manuscript/part-04-concurrency/15-optimistic-concurrency.md)

## 第五部分：跨越机器之后的业务保证

- [分部导读](manuscript/part-05-distribution/_index.md)
- [第 18 章：顺序、因果与时钟](manuscript/part-05-distribution/19-ordering.md)
- [第 19 章：一致性：读者能看到什么](manuscript/part-05-distribution/20-consistency.md)
- [第 20 章：缓存：副本的新鲜度与失效](manuscript/part-05-distribution/17-cache.md)
- [第 21 章：消息：交付、处理与确认](manuscript/part-05-distribution/18-messaging.md)
- [第 22 章：部分成功、补偿与对账](manuscript/part-05-distribution/22-recovery.md)

## 第六部分：系统演进与版本共存

- [分部导读](manuscript/part-06-evolution/_index.md)
- [第 23 章：API 兼容性](manuscript/part-06-evolution/22-api-compatibility.md)
- [第 24 章：数据结构演进](manuscript/part-06-evolution/23-schema-evolution.md)
- [第 25 章：配置、灰度与回退](manuscript/part-06-evolution/24-configuration-rollout.md)

## 第七部分：系统的承受能力与运行证据

- [分部导读](manuscript/part-07-observability/_index.md)
- [第 26 章：容量、排队与背压](manuscript/part-07-observability/26-capacity.md)
- [第 27 章：如何知道系统发生了什么](manuscript/part-07-observability/28-observability.md)

## 第八部分：把保证组合成完整业务

- [分部导读](manuscript/part-08-synthesis/_index.md)
- [第 28 章：综合实践：文件上传与资源生命周期](manuscript/part-06-evolution/25-files.md)
- [第 29 章：综合实践：一次购买如何完成](manuscript/part-08-synthesis/29-life-of-a-request.md)
- [结语：从假设到保证](manuscript/part-08-synthesis/30-fundamental-problems.md)
