# 《软件系统的隐藏复杂性》

副标题：从时间、状态、重试到并发与分布式系统

这是一本关于真实软件工程语义的书。它从一个字段、一次请求和一条状态变化出发，逐步进入并发、分布式、系统演进与可观测性，最终回答一个问题：

> 当我们在真实世界里构建软件时，应该警惕哪些“理所当然”的假设？

## 书稿入口

- [全书目录](SUMMARY.md)
- [引言](manuscript/00-introduction.md)
- [第 1 章：时间不是一个 `datetime`](manuscript/part-01-values/01-time.md)
- [时间章的可运行示例](examples/ch01-time/README.md)
- [原始骨架](骨架.md)
- [作者人格与行文声音](VOICE.md)
- [写作约定](WRITING.md)
- [全书图示与表格规范](ILLUSTRATIONS.md)

## 目录结构

```text
manuscript/
├── 00-introduction.md
├── part-01-values/
├── part-02-state/
├── part-03-repetition/
├── part-04-concurrency/
├── part-05-distribution/
├── part-06-evolution/
├── part-07-observability/
└── part-08-synthesis/
```

`骨架.md` 保留最初的构思；`SUMMARY.md` 是阅读顺序的唯一入口；`manuscript/` 保存可发布的正文。

## 在线阅读网站

网站使用 VitePress，部署到 Vercel。安装 Node.js 24 后，在项目根目录执行 `npm ci` 和 `npm run docs:dev` 即可本地阅读；`npm run docs:build` 生成正式网站。

章节与分部导航来自 `SUMMARY.md`，正文继续维护在 `manuscript/`。含有“本章任务”的提纲章节会显示写作状态，中文搜索、深浅色主题与图示放大均可直接使用。

第一章采用章首页加九个主题页面，正文位于 `manuscript/part-01-values/01-time/`。全书目录中缩进的主题链接同时驱动侧栏和上一节／下一节；章首页支持按顺序学习和按问题查阅，原有第一章锚点链接会跳转到对应新页面。

完整步骤见 [在线阅读与 Vercel 部署](DEPLOYMENT.md)。
