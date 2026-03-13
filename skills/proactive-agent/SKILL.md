---
name: proactive-agent
version: 3.1.0
description: "Transform AI agents from task-followers into proactive partners that anticipate needs and continuously improve. Now with WAL Protocol, Working Buffer, Autonomous Crons, and battle-tested patterns. Part of the Hal Stack 🦞"
triggers:
  - "proactive"
  - "主动"
  - "anticipate"
  - "预测"
  - "autonomous"
  - "自治"
  - "WAL"
  - "working buffer"
  - "工作缓冲区"
  - "cron"
  - "定时任务"
  - "self-improving"
  - "自我改进"
  - "hal stack"
  - "hal栈"
author: halthelobster
---

# Proactive Agent 🦞 - 主动式AI代理

**Hal Labs出品** — Hal Stack的一部分

**一个主动、自我改进的AI代理架构。**

大多数代理只是等待。这一个**预测你的需求** — 并随着时间的推移变得越来越好。

## 🎯 核心理念

### 从被动到主动
| 传统代理 | Proactive Agent |
|----------|-----------------|
| 等待指令 | 预测需求 |
| 被动响应 | 主动建议 |
| 单次任务 | 持续改进 |
| 孤立运行 | 系统集成 |

### 版本亮点

#### v3.1.0 新功能
- **自主与提示式Cron** — 知道何时使用 `systemEvent` vs `isolated agentTurn`
- **验证实现，而非意图** — 检查机制，不仅仅是文本
- **工具迁移清单** — 废弃工具时，更新所有引用

#### v3.0.0 核心功能
- **WAL协议** — 预写日志记录，用于修正、决策和重要细节
- **工作缓冲区** — 在内存刷新和压缩之间的危险区域存活
- **压缩恢复** — 上下文被截断时的逐步恢复
- **统一搜索** — 在说"我不知道"之前搜索所有来源
- **安全加固** — 技能安装审查、代理网络警告、上下文泄漏预防
- **顽强资源利用** — 在请求帮助前尝试10种方法
- **自我改进护栏** — 使用ADL/VFM协议的安全进化

## 🚀 快速开始

### 基础设置
```bash
# 1. 创建工作目录
mkdir -p proactive-workspace
cd proactive-workspace

# 2. 初始化WAL日志
touch wal.log
echo "## WAL Protocol日志" > wal.log

# 3. 创建工作缓冲区
mkdir -p working-buffer
touch working-buffer/current-context.md

# 4. 设置定时任务
mkdir -p crons
touch crons/daily-check.sh
chmod +x crons/daily-check.sh
```

### 中文示例配置
```yaml
# proactive-config.yaml
name: "CoPaw主动代理"
version: "3.1.0"

# 核心组件
components:
  wal_protocol:
    enabled: true
    log_file: "wal.log"
    retention_days: 30
  
  working_buffer:
    enabled: true
    directory: "working-buffer"
    auto_cleanup: true
  
  autonomous_crons:
    enabled: true
    directory: "crons"
    schedule: "daily"
  
  self_improvement:
    enabled: true
    learning_dir: ".learnings"
    review_frequency: "weekly"

# 主动行为配置
proactive_behaviors:
  - name: "天气检查"
    trigger: "每天上午8点"
    action: "查询杨凌天气并推送到飞书"
  
  - name: "依赖检查"
    trigger: "每天中午12点"
    action: "检查技能依赖并自动修复"
  
  - name: "学习回顾"
    trigger: "每周一上午9点"
    action: "回顾学习记录并升级到文档"
```

## 📖 核心组件

### WAL协议（预写日志）
```bash
# 记录重要决策
echo "$(date -Iseconds) DECISION: 使用腾讯翻译API进行中英翻译" >> wal.log

# 记录错误修正
echo "$(date -Iseconds) CORRECTION: 修复了GitHub推送的认证问题" >> wal.log

# 查看日志
tail -f wal.log
```

### 工作缓冲区
```bash
# 保存当前上下文
echo "当前任务: 优化skills文档" > working-buffer/current-context.md
echo "进展: 已完成6个skills优化" >> working-buffer/current-context.md
echo "下一步: 优化剩余skills" >> working-buffer/current-context.md

# 自动备份
cp working-buffer/current-context.md working-buffer/backup-$(date +%Y%m%d).md
```

### 自主Cron任务
```bash
# 创建每日检查脚本
cat > crons/daily-check.sh << 'EOF'
#!/bin/bash
# 每日主动检查任务

echo "开始每日主动检查..."
date

# 1. 检查系统状态
echo "检查系统状态..."
df -h | grep -E "Filesystem|/mnt"

# 2. 检查技能依赖
echo "检查技能依赖..."
pip list | grep -E "tencentcloud|opencv|pymupdf"

# 3. 检查GitHub连接
echo "检查GitHub连接..."
curl -s https://api.github.com/rate_limit

echo "每日检查完成"
EOF
```

## 🔧 使用示例

### 主动天气推送
```bash
# 创建天气检查脚本
cat > crons/weather-check.sh << 'EOF'
#!/bin/bash
# 主动天气检查

LOCATION="杨凌"
WEATHER_API="https://devapi.qweather.com/v7/weather/now"

# 获取天气信息
response=$(curl -s "$WEATHER_API?location=101110908&key=$QWEATHER_KEY")

# 解析并发送到飞书
python3 -c "
import json
import os
data = $response
if data['code'] == '200':
    temp = data['now']['temp']
    text = data['now']['text']
    message = f'🌤️ {LOCATION}当前天气: {text}, 温度{temp}℃'
    # 发送到飞书
    os.system(f'echo \"{message}\" >> weather-alert.txt')
    print('天气检查完成')
else:
    print('天气检查失败')
"
EOF
```

### 技能依赖监控
```bash
# 创建依赖监控脚本
cat > crons/dependency-check.sh << 'EOF'
#!/bin/bash
# 主动技能依赖监控

echo "检查技能依赖状态..."

# 检查Python包
pip list --outdated | grep -E "tencentcloud|opencv|pymupdf" > outdated.txt

if [ -s outdated.txt ]; then
    echo "发现过时依赖:"
    cat outdated.txt
    
    # 主动更新
    pip install --upgrade $(cat outdated.txt | awk '{print $1}')
    echo "依赖已更新"
else
    echo "所有依赖都是最新的"
fi
EOF
```

## 🛠️ 架构模式

### 主动代理模式
```
┌─────────────────────────────────────┐
│          用户/系统                   │
│           │                         │
│           ▼                         │
┌─────────────────────────┐           │
│   主动行为检测器         │           │
│   (模式识别)            │           │
│           │                         │
│           ▼                         │
┌─────────────────────────┐           │
│   需求预测引擎           │           │
│   (基于历史数据)         │           │
│           │                         │
│           ▼                         │
┌─────────────────────────┐           │
│   动作规划器             │           │
│   (多步骤规划)           │           │
│           │                         │
│           ▼                         │
┌─────────────────────────┐           │
│   执行监控器             │           │
│   (实时监控)             │           │
│           │                         │
│           ▼                         │
└─────────────────────────┘           │
           │                         │
           ▼                         │
┌─────────────────────────────────────┐
│         WAL日志记录                  │
│     (决策、修正、学习)               │
└─────────────────────────────────────┘
```

### 工作缓冲区模式
```
正常操作 → 保存到工作缓冲区 → 定期压缩 → 长期存储
    ↑           ↓               ↓
    └─────恢复点─────┘           │
                                ↓
                        添加到学习系统
```

## 📁 文件结构

```
proactive-agent/
├── SKILL.md                    # 技能说明文档
├── _meta.json                  # 元数据
├── scripts/
│   ├── proactive_engine.py     # 主动引擎
│   ├── wal_protocol.py         # WAL协议实现
│   ├── working_buffer.py       # 工作缓冲区管理
│   └── cron_manager.py         # 定时任务管理
├── crons/
│   ├── daily-check.sh          # 每日检查
│   ├── weather-check.sh        # 天气检查
│   ├── dependency-check.sh     # 依赖检查
│   └── learning-review.sh      # 学习回顾
├── examples/
│   ├── basic-config.yaml       # 基础配置示例
│   ├── advanced-config.yaml    # 高级配置示例
│   └── integration-examples/   # 集成示例
└── references/
    ├── wal-protocol.md         # WAL协议详细说明
    ├── working-buffer.md       # 工作缓冲区指南
    ├── cron-patterns.md        # 定时任务模式
    └── security-guide.md       # 安全指南
```

## ⚠️ 故障排除

### 常见问题

1. **WAL日志不更新**
   ```bash
   # 检查权限
   ls -la wal.log
   
   # 检查磁盘空间
   df -h .
   
   # 手动测试写入
   echo "测试 $(date)" >> wal.log
   ```

2. **定时任务不执行**
   ```bash
   # 检查脚本权限
   chmod +x crons/*.sh
   
   # 手动测试执行
   ./crons/daily-check.sh
   
   # 检查系统cron
   crontab -l
   ```

3. **工作缓冲区清理失败**
   ```bash
   # 检查清理策略
   cat proactive-config.yaml | grep auto_cleanup
   
   # 手动清理
   find working-buffer -name "*.bak" -mtime +7 -delete
   ```

### 调试模式
```bash
# 启用详细日志
export PROACTIVE_DEBUG=1

# 运行主动引擎
python3 scripts/proactive_engine.py --debug

# 查看调试日志
tail -f proactive-debug.log
```

## 🔄 与其他技能集成

### 与self-improving-agent集成
```bash
# 主动代理的学习记录
python3 scripts/proactive_engine.py --learn-from .learnings/

# 将主动行为记录为学习
python3 scripts/proactive_engine.py --log-behavior "weather_check" --outcome "success"
```

### 与ontology技能集成
```bash
# 将主动代理状态存储到知识图谱
python3 scripts/proactive_engine.py --save-state-to ontology

# 从知识图谱加载主动行为模式
python3 scripts/proactive_engine.py --load-patterns-from ontology
```

### 与飞书技能集成
```bash
# 主动发送状态报告
python3 scripts/proactive_engine.py --report-to feishu --channel status-updates

# 从飞书消息触发主动行为
python3 scripts/proactive_engine.py --trigger-from feishu --keyword "检查"
```

## 📊 性能监控

### 主动行为统计
```bash
# 生成行为报告
python3 scripts/proactive_engine.py --generate-report --period month

# 分析预测准确率
python3 scripts/proactive_engine.py --analyze-accuracy --output accuracy-chart.png

# 监控资源使用
python3 scripts/proactive_engine.py --monitor-resources --alert-threshold 80
```

### 优化建议
```bash
# 获取优化建议
python3 scripts/proactive_engine.py --optimization-suggestions

# 应用优化
python3 scripts/proactive_engine.py --apply-optimizations --strategy "aggressive"
```

## 🎯 最佳实践

### 主动行为设计
1. **预测而非猜测** - 基于历史数据和模式
2. **适度主动** - 不要过度干扰用户
3. **透明可解释** - 让用户理解为什么这样做
4. **可配置可控制** - 允许用户调整主动程度

### 系统管理
1. **定期审查WAL日志** - 确保记录完整
2. **监控工作缓冲区** - 防止存储膨胀
3. **测试定时任务** - 确保可靠性
4. **备份关键状态** - 防止数据丢失

## 🔮 未来计划

### v4.0.0 计划功能
- 机器学习驱动的需求预测
- 多代理协作主动性
- 自适应主动程度调整
- 实时行为优化
- 跨平台主动集成

### 社区贡献
- 更多预定义主动行为
- 可视化监控面板
- 移动端通知集成
- 语音交互主动性

---

**✨ 让AI从助手变身为伙伴，主动预测、主动服务、主动成长！**