# 全书目录

- [引言](manuscript/00-introduction.md)

## 第一部分：值的含义与表示

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
- [第 6 章：单位、坐标与本地化表示](manuscript/part-01-values/06-units-representation.md)
- [第 7 章：校验：合法输入不等于有效操作](manuscript/part-01-values/07-validation.md)

## 第二部分：代码组织与设计取舍

- [分部导读](manuscript/design/_index.md)
- [第 8 章：模块边界与依赖方向](manuscript/design/08-module-boundaries.md)
- [第 9 章：重复、复用与耦合](manuscript/design/09-reuse-coupling.md)
- [第 10 章：抽象与封装：应该隐藏什么](manuscript/design/10-abstraction.md)
- [第 11 章：扩展点：灵活性带来的责任](manuscript/design/11-extensibility.md)
- [第 12 章：第三方依赖与替换成本](manuscript/design/12-dependencies.md)
- [第 13 章：可变性、副作用与可推理性](manuscript/design/13-effects.md)
- [第 14 章：资源的所有权与生命周期](manuscript/design/14-resource-lifecycle.md)

## 第三部分：状态、交互与数据变化

- [分部导读](manuscript/part-02-state/_index.md)
- [第 15 章：状态与状态机](manuscript/part-02-state/06-state-machines.md)
- [第 16 章：界面状态、事实与用户反馈](manuscript/interaction/16-view-state.md)
- [第 17 章：编辑、保存与撤销](manuscript/interaction/17-editing.md)
- [第 18 章：修改与删除：数据变化意味着什么](manuscript/part-02-state/07-crud.md)
- [第 19 章：权限与归属：谁能操作这份数据](manuscript/part-02-state/08-authorization.md)
- [第 20 章：查询、分页与快照](manuscript/part-02-state/09-query-snapshots.md)

## 第四部分：异步、失败与重复执行

- [分部导读](manuscript/part-03-repetition/_index.md)
- [第 21 章：异步：任务何时开始，结果交给谁](manuscript/execution/21-async.md)
- [第 22 章：取消、过时结果与任务生命周期](manuscript/execution/22-cancellation.md)
- [第 23 章：错误、异常与未知结果](manuscript/part-07-observability/26-errors.md)
- [第 24 章：超时与等待边界](manuscript/part-03-repetition/09-timeouts.md)
- [第 25 章：重试：恢复动作也有代价](manuscript/part-03-repetition/10-retries.md)
- [第 26 章：幂等与去重：重复请求的业务效果](manuscript/part-03-repetition/11-idempotency.md)

## 第五部分：并发与共同约束

- [分部导读](manuscript/part-04-concurrency/_index.md)
- [第 27 章：竞态条件与业务不变量](manuscript/part-04-concurrency/13-race-conditions.md)
- [第 28 章：事务、原子性与隔离](manuscript/part-04-concurrency/16-transactions.md)
- [第 29 章：锁：保护什么，保护到哪里](manuscript/part-04-concurrency/14-locks.md)
- [第 30 章：乐观并发控制：拒绝过时的写入](manuscript/part-04-concurrency/15-optimistic-concurrency.md)

## 第六部分：副本、通信与跨边界协作

- [分部导读](manuscript/part-05-distribution/_index.md)
- [第 31 章：顺序、因果与时钟](manuscript/part-05-distribution/19-ordering.md)
- [第 32 章：一致性：读者能看到什么](manuscript/part-05-distribution/20-consistency.md)
- [第 33 章：缓存：副本的新鲜度与失效](manuscript/part-05-distribution/17-cache.md)
- [第 34 章：消息：交付、处理与确认](manuscript/part-05-distribution/18-messaging.md)
- [第 35 章：离线、同步与冲突](manuscript/replicas/35-offline-sync.md)
- [第 36 章：部分成功、补偿与对账](manuscript/part-05-distribution/22-recovery.md)

## 第七部分：兼容、演进与技术替换

- [分部导读](manuscript/part-06-evolution/_index.md)
- [第 37 章：兼容性：函数、组件与协议的承诺](manuscript/part-06-evolution/22-api-compatibility.md)
- [第 38 章：数据格式与存量数据的演进](manuscript/part-06-evolution/23-schema-evolution.md)
- [第 39 章：配置、灰度与回退](manuscript/part-06-evolution/24-configuration-rollout.md)
- [第 40 章：重构、替换与渐进迁移](manuscript/evolution/40-refactoring.md)

## 第八部分：性能与有限资源

- [分部导读](manuscript/performance/_index.md)
- [第 41 章：性能：测量、瓶颈与优化证据](manuscript/performance/41-measurement.md)
- [第 42 章：初始化、加载与预计算](manuscript/performance/42-initialization.md)
- [第 43 章：内存、数据布局与处理粒度](manuscript/performance/43-memory-locality.md)
- [第 44 章：容量、排队与背压](manuscript/part-07-observability/26-capacity.md)

## 第九部分：验证、故障与运行证据

- [分部导读](manuscript/part-07-observability/_index.md)
- [第 45 章：测试：怎样验证一项保证](manuscript/verification/45-testing.md)
- [第 46 章：故障、交错与恢复验证](manuscript/verification/46-failure-testing.md)
- [第 47 章：如何知道系统发生了什么](manuscript/part-07-observability/28-observability.md)

## 第十部分：把设计组合成完整应用

- [分部导读](manuscript/part-08-synthesis/_index.md)
- [第 48 章：综合实践：一个编辑器怎样可靠保存](manuscript/part-08-synthesis/48-editor.md)
- [第 49 章：综合实践：文件上传与资源生命周期](manuscript/part-06-evolution/25-files.md)
- [第 50 章：综合实践：一次购买如何完成](manuscript/part-08-synthesis/29-life-of-a-request.md)
- [结语：从假设到保证](manuscript/part-08-synthesis/30-fundamental-problems.md)
