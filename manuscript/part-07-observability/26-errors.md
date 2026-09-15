# 第 26 章：错误到底是什么

> 核心命题：错误分类不是为了命名整齐，而是为了决定责任、恢复方式和是否重试。

## 本章任务

区分用户错误、业务错误、系统错误、transient error 与 permanent error，并讨论 error code、exception、HTTP status 和重试判断。

## 开篇场景

待写：同样是 HTTP 500，为什么有的请求应该立刻重试，有的重试只会重复造成损害？

