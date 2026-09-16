$taskUtf8 = [System.Text.UTF8Encoding]::new($false)
function SvgText([int]$X,[int]$Y,[string]$Value,[string]$Anchor='middle') {
    '  <text x="'+$X+'" y="'+$Y+'" text-anchor="'+$Anchor+'">'+[System.Security.SecurityElement]::Escape($Value)+'</text>'
}
function SvgBox([int]$X,[int]$Y,[int]$Width,[int]$Height,[string]$First,[string]$Second='') {
    '  <rect class="box" x="'+$X+'" y="'+$Y+'" width="'+$Width+'" height="'+$Height+'" rx="4"/>'
    $taskCenterX = $X + [int]($Width/2)
    if ($Second) { SvgText $taskCenterX ($Y+28) $First; SvgText $taskCenterX ($Y+54) $Second }
    else { SvgText $taskCenterX ($Y+28) $First }
}
function SvgArrow([string]$Data) { '  <path class="arrow" d="'+$Data+'"/>' }
function New-BookSvg([string]$Name,[int]$Height,[string]$Title,[string]$Description,[string[]]$Body) {
    $taskTitle = [System.Security.SecurityElement]::Escape($Title)
    $taskDesc = [System.Security.SecurityElement]::Escape($Description)
    $taskBody = [string]::Join("`n",$Body)
    $taskSvg = @"
<svg xmlns="http://www.w3.org/2000/svg" width="720" height="$Height" viewBox="0 0 720 $Height" role="img" aria-labelledby="title desc" style="max-width:100%;height:auto">
  <title id="title">$taskTitle</title>
  <desc id="desc">$taskDesc</desc>
  <defs><marker id="arrow" markerWidth="10" markerHeight="8" refX="9" refY="4" orient="auto" markerUnits="userSpaceOnUse"><path d="M 0 0 L 9 4 L 0 8" fill="#222"/></marker></defs>
  <style>text{font-family:'Noto Sans CJK SC','Microsoft YaHei','PingFang SC',sans-serif;font-size:18px;fill:#222}.box{fill:#fff;stroke:#222;stroke-width:2}.line{fill:none;stroke:#222;stroke-width:2}.arrow{fill:none;stroke:#222;stroke-width:2;marker-end:url(#arrow)}.guide{fill:none;stroke:#555;stroke-width:2;stroke-dasharray:6 5}</style>
  <rect width="720" height="$Height" fill="#fff"/>
$taskBody
</svg>
"@
    $taskRoot = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
    $taskOutput = Join-Path $taskRoot ('manuscript/assets/ch01/'+$Name+'.svg')
    [System.IO.File]::WriteAllText($taskOutput,$taskSvg+"`n",$taskUtf8)
}

# Only the eight diagrams added in the second illustration pass are generated here.
# Run from any directory: pwsh -File tools/ch01-illustrations.ps1
New-BookSvg '02-admission-cutoff' 310 '点击、资格检查与提交跨过截止时刻' '示例以服务端资格检查时刻为准。请求甲截止后到达，检查时已过期；请求乙截止前检查通过，截止后提交成功，随后沿用保存的资格。保存失败不能返回受理成功。横向不按比例。' @(
    SvgText 390 34 '截止瞬间'
    '  <path class="guide" d="M 390 48 V 230"/>'
    SvgText 28 112 '请求甲' 'start'
    SvgText 210 75 '客户端点击'
    SvgText 485 75 '服务端到达'
    SvgArrow 'M 150 105 H 535'
    '  <circle cx="210" cy="105" r="5" fill="#222"/><circle cx="485" cy="105" r="5" fill="#222"/>'
    SvgBox 550 83 140 42 '拒绝受理'
    SvgText 28 207 '请求乙' 'start'
    SvgText 265 171 '资格检查通过'
    SvgText 485 171 '数据库提交'
    SvgArrow 'M 150 200 H 535'
    '  <circle cx="265" cy="200" r="5" fill="#222"/><circle cx="485" cy="200" r="5" fill="#222"/>'
    SvgBox 550 178 140 42 '继续完成'
    SvgText 28 268 '甲：截止后检查 → 拒绝；乙：截止前检查、提交成功 → 继续' 'start'
    SvgText 28 295 '虚线对齐截止边界；横向不按比例' 'start'
)
New-BookSvg '03-future-commitment' 315 '时区规则更新影响两种不同的日程承诺' '固定当地九点以本地输入为准，规则更新后重算执行时间点，当地九点保持，UTC可能改变。固定瞬间以确认的时间点为准，不随规则更新重算瞬间，UTC保持，当地显示可能改变。只是假设规则更新，不预测任何地区政策变化。' @(
    SvgText 28 34 '时区规则更新后，哪一个值应保持？' 'start'
    SvgBox 25 70 200 72 '固定当地九点' '本地输入为准'
    SvgBox 260 70 200 72 '按新规则重算' '执行时间点'
    SvgBox 495 70 200 72 '当地仍是九点' 'UTC 可能改变'
    SvgArrow 'M 225 106 H 254'
    SvgArrow 'M 460 106 H 489'
    SvgBox 25 190 200 72 '固定瞬间' '确认时间点为准'
    SvgBox 260 190 200 72 '保持已确认的' '执行时间点'
    SvgBox 495 190 200 72 'UTC 保持不变' '当地显示可能变'
    SvgArrow 'M 225 226 H 254'
    SvgArrow 'M 460 226 H 489'
    SvgText 28 300 '这是两种业务承诺，不能在规则更新时临时互换。' 'start'
)
New-BookSvg '04-dst-transitions' 350 '纽约夏令时缺口与重复时刻' '纽约二〇二五年三月九日，当地钟表从一点五十九分五十九秒跳到三点，两点半不存在。十一月二日，第一次一点半带负四小时偏移，对应UTC五点半；第二次一点半带负五小时偏移，对应UTC六点半。UTC上的两个瞬间相差一小时。横向不按比例。' @(
    SvgText 28 30 '纽约 2025-03-09：春季跳时' 'start'
    SvgBox 25 52 280 72 '01:59:59（−05:00）' '跳时前'
    SvgBox 415 52 280 72 '03:00:00（−04:00）' '跳时后'
    SvgText 360 76 '跳过'
    SvgArrow 'M 305 88 H 409'
    SvgText 360 157 '02:30 不存在，没有对应瞬间'
    SvgText 28 204 '纽约 2025-11-02：秋季回拨' 'start'
    SvgBox 25 222 280 72 '第一次 01:30（−04:00）' '05:30Z'
    SvgBox 415 222 280 72 '第二次 01:30（−05:00）' '06:30Z'
    SvgText 360 244 '1 小时'
    SvgArrow 'M 305 258 H 409'
    SvgText 28 337 '当地钟表可以跳过或重复；横向不按比例' 'start'
)
New-BookSvg '06-storage-roundtrip' 345 '应用、驱动、数据库与协议共同决定时间往返' '一条示例往返测试链：应用时间对象经驱动参数绑定写入数据库，再经驱动读取、接口序列化和重新解析得到对象。各环节分别可能影响类型、会话时区、格式和精度。最终比较原对象和结果的时间语义，不只看数据库客户端显示。' @(
    SvgText 28 32 '从应用对象出发，检查完整往返' 'start'
    SvgBox 25 60 200 72 '应用时间对象' '语义类型与精度'
    SvgBox 260 60 200 72 '驱动参数绑定' '类型映射'
    SvgBox 495 60 200 72 '数据库存储' '列类型与会话时区'
    SvgArrow 'M 225 96 H 254'
    SvgArrow 'M 460 96 H 489'
    SvgArrow 'M 595 132 V 209'
    SvgText 620 178 '读取' 'start'
    SvgBox 495 215 200 72 '驱动读取对象' '类型与精度'
    SvgBox 260 215 200 72 '接口序列化' '格式与偏移量'
    SvgBox 25 215 200 72 '重新解析结果' '与原对象比较'
    SvgArrow 'M 495 251 H 466'
    SvgArrow 'M 260 251 H 231'
    SvgText 28 330 '比较时间点与约定精度，不只比较显示文本。' 'start'
)
New-BookSvg '07-shared-wait-budget' 290 '多个步骤共享同一个三秒等待预算' '在同一进程的单调时钟上开始三秒预算。数据库消耗一秒，远端调用最多只可继续等待剩余两秒，而不是再获得三秒。图中右段是允许等待的剩余预算，不表示远端实际执行耗时。示例忽略其他开销。' @(
    SvgText 28 30 '同一进程、同一单调时钟：总预算 3 秒' 'start'
    SvgText 90 64 '0 秒'
    SvgText 280 64 '1 秒'
    SvgText 660 64 '3 秒'
    SvgArrow 'M 90 78 H 695'
    '  <path class="line" d="M 90 70 V 86 M 280 70 V 86 M 660 70 V 86"/>'
    SvgBox 90 98 190 72 '数据库已用' '1 秒'
    SvgBox 280 98 380 72 '远端最多继续等待' '剩余 2 秒'
    '  <path class="guide" d="M 660 176 V 204"/>'
    SvgText 660 224 '共同截止'
    SvgText 28 250 '剩余为 0：不再启动下一步；不保证远端停止执行。' 'start'
    SvgText 28 277 '横向按本例秒数绘制；右段表示预算，忽略其他开销。' 'start'
)
New-BookSvg '09-late-event-cutoff' 335 '业务日期不变，晚到数据改变报表输入集合' '按上海时间的支付发生日归属。支付在三月三十一日二十三点五十八分发生，四月一日零点十分回调入库。第一次收集截点零点零五分尚未看见该支付，第二次截点零点二十分能够看见。两次业务日期都为三月三十一日，但输入集合可以不同。横向不按比例。' @(
    SvgText 28 30 '同一业务日，两个数据收集截点' 'start'
    SvgText 100 66 '支付发生'
    SvgText 100 92 '03-31 23:58'
    SvgText 270 66 '第一次截点'
    SvgText 270 92 '04-01 00:05'
    SvgText 440 66 '回调入库'
    SvgText 440 92 '04-01 00:10'
    SvgText 610 66 '第二次截点'
    SvgText 610 92 '04-01 00:20'
    SvgArrow 'M 50 118 H 695'
    '  <circle cx="100" cy="118" r="5" fill="#222"/><circle cx="270" cy="118" r="5" fill="#222"/><circle cx="440" cy="118" r="5" fill="#222"/><circle cx="610" cy="118" r="5" fill="#222"/>'
    SvgArrow 'M 270 129 V 168'
    SvgArrow 'M 610 129 V 168'
    SvgBox 160 174 220 72 '第一次输入集合' '尚无这笔支付'
    SvgBox 490 174 220 72 '补算输入集合' '已包含这笔支付'
    SvgText 28 282 '两次均归属 3 月 31 日；数据晚到，输入集合可变。' 'start'
    SvgText 28 319 '时刻均为上海时间；横向不按比例' 'start'
)
New-BookSvg '10-expiry-and-cleanup' 285 '权限截止与后台状态更新是不同的时刻' '上海时间四月一日零点会员到期，但后台批任务直到零点十分才更新状态。假设其他访问条件满足，新请求在零点起即被拒绝。批任务状态在此期间可能仍未更新，不能延长访问权限。横向不按比例。' @(
    SvgText 28 30 '上海时间 4 月 1 日：批任务晚跑 10 分钟' 'start'
    SvgText 320 67 '00:00 到期'
    SvgText 570 67 '00:10 更新状态'
    SvgArrow 'M 200 94 H 690'
    '  <path class="guide" d="M 320 103 V 240 M 570 103 V 240"/>'
    SvgText 28 166 '新请求授权' 'start'
    '  <rect class="box" x="200" y="140" width="120" height="40"/><rect class="box" x="320" y="140" width="350" height="40"/>'
    SvgText 260 166 '可访问'
    SvgText 495 166 '拒绝新访问'
    SvgText 28 226 '批任务状态' 'start'
    '  <rect class="box" x="200" y="200" width="370" height="40"/><rect class="box" x="570" y="200" width="100" height="40"/>'
    SvgText 385 226 '可能仍未更新'
    SvgText 620 226 '已更新'
    SvgText 28 273 '状态更新晚于权限截止，不自动延长有效期；横向不按比例' 'start'
)
New-BookSvg '11-course-time-relations' 438 '课程计划与实际事件分别派生时间边界' '已发布开课瞬间为二〇二七年七月十日UTC十三点。提醒为前二十四小时即七月九日十三点，报名截止为前两小时即七月十日十一点，北京展示为七月十日二十一点。录播截止独立从实际结束事件加七百二十小时计算，不能由计划结束替代。' @(
    SvgText 28 30 '发布计划：同一个已确认开课瞬间' 'start'
    SvgBox 220 55 280 72 '开课 starts_at' '2027-07-10 13:00Z'
    SvgArrow 'M 360 127 V 158 H 125 V 190'
    SvgArrow 'M 360 127 V 190'
    SvgArrow 'M 360 127 V 158 H 595 V 190'
    SvgBox 20 197 210 72 '提醒：开课前 24 小时' '07-09 13:00Z'
    SvgBox 255 197 210 72 '报名：开课前 2 小时' '07-10 11:00Z'
    SvgBox 490 197 210 72 '北京学员展示' '07-10 21:00 +08:00'
    SvgText 28 316 '已发生事实：以实际结束事件为起点' 'start'
    SvgBox 70 335 250 72 '实际结束事件' '服务端确认的结束时刻'
    SvgBox 425 335 250 72 '录播失效边界' '按实际结束计算'
    SvgText 372 353 '＋720 小时'
    SvgArrow 'M 320 374 H 419'
    SvgText 28 432 '计划结束不能替代实际结束；图中日期均在 2027 年。' 'start'
)
