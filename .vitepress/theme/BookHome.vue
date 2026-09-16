<script setup lang="ts">
import { useData, withBase } from 'vitepress'
const { theme } = useData()
</script>

<template>
  <div class="book-home">
    <section class="book-hero" aria-labelledby="book-title">
      <div class="book-intro">
        <p class="book-eyebrow">BEYOND CRUD <span>在线书稿</span></p>
        <h1 id="book-title">软件系统的<br><span>隐藏复杂性</span></h1>
        <p class="book-subtitle">从时间、状态、重试到并发与分布式系统</p>
        <p class="book-description">从一个字段、一次请求和一条状态变化出发，看看那些“理所当然”的假设，是怎样在真实系统里失效的。</p>
        <div class="book-actions">
          <a class="book-primary" :href="withBase(theme.book.introduction.link)">开始阅读 <span aria-hidden="true">→</span></a>
          <a class="book-secondary" :href="withBase('/contents')">浏览全书目录 <span aria-hidden="true">↗</span></a>
        </div>
        <p class="book-status">持续写作中 · 从引言和第一章开始</p>
      </div>
      <div class="book-cover" aria-hidden="true">
        <div class="cover-top">软件工程 / 语义与边界</div>
        <div class="cover-title">软件系统的<br>隐藏复杂性</div>
        <div class="cover-rule"></div>
        <div class="cover-topics"><span>时间 · 状态 · 重试</span><span>并发 · 分布式 · 演进</span></div>
        <div class="cover-footer">BEYOND<br>CRUD<span>一个字段之后，<br>还有整个世界。</span></div>
      </div>
    </section>

    <section class="book-path" aria-labelledby="reading-path-title">
      <div class="section-heading">
        <div><p class="book-eyebrow">READING PATH</p><h2 id="reading-path-title">把条件一个个加回来</h2></div>
        <p>先说清一个值，再看它如何变化。<br>沿着八个部分，逐步走进真实系统。</p>
      </div>
      <div class="part-list">
        <a v-for="(part, index) in theme.book.parts" :key="part.link" class="part-row" :href="withBase(part.link)">
          <span class="part-number">{{ String(index + 1).padStart(2, '0') }}</span>
          <div class="part-copy"><h3>{{ part.text.replace(/^第.+?部分：/, '') }}</h3><p>{{ part.items.map((item: { text: string }) => item.text.replace(/^第 \d+ 章：/, '')).join(' / ') }}</p></div>
          <span class="part-count">{{ part.items.filter((item: { text: string }) => /^第 \d+ 章：/.test(item.text)).length }} 章<span v-if="part.items.some((item: { text: string }) => item.text.startsWith('结语：'))"> + 结语</span></span>
          <span class="part-arrow" aria-hidden="true">→</span>
        </a>
      </div>
    </section>
    <footer class="book-home-footer"><span>《软件系统的隐藏复杂性》</span><span>在写代码之前，先把问题说清楚。</span></footer>
  </div>
</template>
