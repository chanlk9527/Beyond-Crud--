# 第 1 章的可运行例子

代码：[TimeExamples.java](TimeExamples.java)

本示例使用 Java 标准库，无第三方依赖，已按 Java 21 验证。示例不是业务框架，只验证本章的确定性计算与边界约定。

## 运行

在项目根目录的 PowerShell 中执行；编译产物放在新建的临时目录，不进入书稿目录：

```powershell
$buildDir = Join-Path ([System.IO.Path]::GetTempPath()) ('BeyondCrud-Time-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $buildDir | Out-Null
javac -encoding UTF-8 -d $buildDir .\examples\ch01-time\TimeExamples.java
if ($LASTEXITCODE -ne 0) { throw '编译失败' }
java -cp $buildDir TimeExamples
if ($LASTEXITCODE -ne 0) { throw '断言失败' }
```

输出 `Checks passed: ...` 表示全部断言通过。大部分断言来自连续月份性质验证，而不是互不相关的测试场景数量。

## 覆盖范围

- 半开有效区间的起点、终点与相邻瞬间。
- 月末截断、锚点恢复、连续三十六期的月份与单调性。
- 夏令时缺口、重叠、偏移量不相容和预约消歧。
- 23/25 小时自然日、日历日与 24 小时的区别。
- 日报 UTC 边界、epoch 单位与时间点等价表示。
- 文本排序与时间点排序不同的例子。
- 显式业务时区不受进程默认时区影响。
- 严格日期解析及平年、闰年输入。

默认时区修改发生在这个独立示例进程内，并在结束前恢复。不要直接把这一做法放进共享全局时区的并行测试套件。

数据库、驱动、调度器、多机校时和网络副作用不在此示例的验证范围内。它们应在实际项目中另外做集成与运行环境测试。公司安全工具可能向编译器提供不同的文件视图；若编译器看到二进制而 `rg` 可读，不应直接判断源文件损坏。
