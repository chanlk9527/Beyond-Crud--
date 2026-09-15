import { mkdirSync, readFileSync, writeFileSync } from 'node:fs'
import { dirname, resolve } from 'node:path'
import { fileURLToPath } from 'node:url'

// Publish the original runnable example without keeping a second maintained copy.
const projectRoot = resolve(dirname(fileURLToPath(import.meta.url)), '..')
const source = resolve(projectRoot, 'examples/ch01-time/TimeExamples.java')
const destination = resolve(projectRoot, 'public/examples/ch01-time/TimeExamples.java')
let content
try {
  content = new TextDecoder('utf-8', { fatal: true }).decode(readFileSync(source))
} catch (cause) {
  throw new Error(`无法读取示例源代码：${source}。请确认 Node.js 能读取解密后的文件视图。`, { cause })
}
mkdirSync(dirname(destination), { recursive: true })
writeFileSync(destination, content, 'utf8')
