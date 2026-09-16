<script setup lang="ts">
import { onMounted, onUnmounted, watch } from 'vue'
import { useRoute, useRouter, withBase } from 'vitepress'
import anchors from '../ch01-anchors.json'

const route = useRoute()
const router = useRouter()

function followLegacyAnchor() {
  if (!/\/part-01-values\/01-time(?:\.html)?\/?$/.test(window.location.pathname)) return
  const hash = window.location.hash.slice(1)
  const target = (anchors as Record<string, string>)[hash]
  if (target) void router.go(withBase(target))
}

onMounted(() => {
  followLegacyAnchor()
  window.addEventListener('hashchange', followLegacyAnchor)
})
watch(() => route.path, () => {
  if (typeof window !== 'undefined') followLegacyAnchor()
}, { flush: 'post' })
onUnmounted(() => window.removeEventListener('hashchange', followLegacyAnchor))
</script>

<template>
  <span hidden aria-hidden="true"></span>
</template>
