---
name: cron
description: 通过 copaw 命令管理定时任务 - 创建、查询、暂停、恢复、删除任务
triggers:
  - "定时任务"
  - "cron"
  - "定时"
  - "schedule"
  - "定时提醒"
  - "定时执行"
metadata: { "copaw": { "emoji": "⏰" } }
---

# 定时任务管理技能

使用 `copaw cron` 命令管理定时任务，支持创建、查询、暂停、恢复、删除等操作。

## 🚀 核心功能

### 任务类型
- **text**：定时发送固定文本消息
- **agent**：定时向 AI 提问并发送回复

### 支持的频道
| 频道 | 说明 |
|------|------|
| `imessage` | iMessage |
| `discord` | Discord |
| `dingtalk` | 钉钉 |
| `qq` | QQ |
| `feishu` | 飞书 |
| `console` | 控制台 |

## 📋 常用命令速查

```bash
# 列出所有任务
copaw cron list

# 查看任务详情
copaw cron get <job_id>

# 查看任务状态
copaw cron state <job_id>

# 删除任务
copaw cron delete <job_id>

# 暂停任务
copaw cron pause <job_id>

# 恢复任务
copaw cron resume <job_id>

# 立即执行一次
copaw cron run <job_id>
```

## 🆕 创建任务

### 快速创建命令

```bash
# 创建文本消息任务
copaw cron create \
  --type text \
  --name "任务名称" \
  --cron "CRON表达式" \
  --channel 频道类型 \
  --target-user "用户标识" \
  --target-session "会话标识" \
  --text "消息内容"

# 创建 Agent 任务
copaw cron create \
  --type agent \
  --name "任务名称" \
  --cron "CRON表达式" \
  --channel 频道类型 \
  --target-user "用户标识" \
  --target-session "会话标识" \
  --text "提问内容"
```

### 必填参数说明

| 参数 | 说明 | 示例 |
|------|------|------|
| `--type` | 任务类型 | `text` 或 `agent` |
| `--name` | 任务名称 | `"每日提醒"` |
| `--cron` | Cron 表达式 | `"0 9 * * *"` |
| `--channel` | 目标频道 | `feishu` |
| `--target-user` | 用户标识 | 用户 ID |
| `--target-session` | 会话标识 | 会话 ID |
| `--text` | 消息/提问内容 | `"早上好！"` |

### 从 JSON 文件创建

适用于复杂配置：

```bash
copaw cron create -f job_spec.json
```

JSON 配置示例：
```json
{
  "type": "agent",
  "name": "每日待办提醒",
  "cron": "0 9 * * *",
  "channel": "feishu",
  "target_user": "ou_xxx",
  "target_session": "xxx",
  "text": "查看今天的待办事项"
}
```

## ⏰ Cron 表达式

### 格式说明
```
┌───────────── 分钟 (0-59)
│ ┌───────────── 小时 (0-23)
│ │ ┌───────────── 日期 (1-31)
│ │ │ ┌───────────── 月份 (1-12)
│ │ │ │ ┌───────────── 星期 (0-7, 0和7都是周日)
│ │ │ │ │
* * * * *
```

### 常用示例

| 表达式 | 说明 |
|--------|------|
| `0 9 * * *` | 每天 9:00 |
| `0 */2 * * *` | 每 2 小时 |
| `30 8 * * 1-5` | 工作日 8:30 |
| `0 0 * * 0` | 每周日零点 |
| `*/15 * * * *` | 每 15 分钟 |
| `0 12 * * 1` | 每周一 12:00 |
| `0 9 1 * *` | 每月 1 号 9:00 |
| `0 18 * * 5` | 每周五 18:00 |

## 💡 使用场景示例

### 1. 每日提醒
```bash
# 每天 9:00 发送早安消息
copaw cron create \
  --type text \
  --name "每日早安" \
  --cron "0 9 * * *" \
  --channel feishu \
  --target-user "ou_xxx" \
  --target-session "xxx" \
  --text "早上好！新的一天开始了 💪"
```

### 2. 定时检查待办
```bash
# 每 2 小时检查待办
copaw cron create \
  --type agent \
  --name "检查待办" \
  --cron "0 */2 * * *" \
  --channel feishu \
  --target-user "ou_xxx" \
  --target-session "xxx" \
  --text "我有什么待办事项？"
```

### 3. 每周总结
```bash
# 每周五 18:00 生成周总结
copaw cron create \
  --type agent \
  --name "周总结" \
  --cron "0 18 * * 5" \
  --channel feishu \
  --target-user "ou_xxx" \
  --target-session "xxx" \
  --text "帮我生成这周的工作总结"
```

### 4. 定时天气提醒
```bash
# 每天早上查询天气
copaw cron create \
  --type agent \
  --name "天气提醒" \
  --cron "0 7 * * *" \
  --channel feishu \
  --target-user "ou_xxx" \
  --target-session "xxx" \
  --text "今天杨凌的天气怎么样？"
```

## 🔧 任务管理

### 查看所有任务
```bash
copaw cron list
```
输出包含 job_id、名称、状态、下次执行时间等。

### 查看任务状态
```bash
copaw cron state <job_id>
```
显示任务是否正在运行、上次执行时间、下次执行时间等。

### 暂停/恢复任务
```bash
# 暂停
copaw cron pause <job_id>

# 恢复
copaw cron resume <job_id>
```

### 删除任务
```bash
copaw cron delete <job_id>
```

### 立即执行
```bash
# 不等待定时，立即执行一次
copaw cron run <job_id>
```

## ⚠️ 注意事项

1. **时区**：Cron 表达式使用系统时区
2. **权限**：确保有目标频道的发送权限
3. **频率**：避免设置过于频繁的任务（如每分钟）
4. **测试**：新任务建议先用 `copaw cron run` 测试
5. **监控**：定期检查任务状态，确保正常运行

## 🎯 触发场景

当用户需要：
- "每天提醒我..."
- "定时发送消息..."
- "每周检查..."
- "创建定时任务..."

## 🔄 与 Heartbeat 的选择

| 场景 | 使用 Cron | 使用 Heartbeat |
|------|-----------|----------------|
| 精确时间 | ✅ 支持 | ⚠️ 近似 |
| 频繁检查（多次/天）| ⚠️ 资源占用 | ✅ 合并更高效 |
| 需要对话上下文 | ❌ 无 | ✅ 有 |
| 一次性提醒 | ✅ 支持 | ❌ 不支持 |

**建议**：
- 精确时间、低频任务 → 用 Cron
- 多个检查可合并 → 用 Heartbeat

---
*Cron Skill | 定时任务管理专家*