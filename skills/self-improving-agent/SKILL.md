---
name: self-improving-agent
description: "Captures learnings, errors, and corrections to enable continuous improvement. Use when: (1) A command or operation fails unexpectedly, (2) User corrects Claude ('No, that's wrong...', 'Actually...'), (3) User requests a capability that doesn't exist, (4) An external API or tool fails, (5) Claude realizes its knowledge is outdated or incorrect, (6) A better approach is discovered for a recurring task. Also review learnings before major tasks."
triggers:
  - "self-improving"
  - "自我改进"
  - "learning"
  - "学习"
  - "error"
  - "错误"
  - "mistake"
  - "错误"
  - "correction"
  - "修正"
  - "improvement"
  - "改进"
  - "capture learning"
  - "记录学习"
  - "continuous improvement"
  - "持续改进"
---

# Self-Improving Agent - 自我改进技能

捕捉学习、错误和修正，实现持续改进的技能。

## 🎯 何时使用

### 触发场景
1. **命令或操作意外失败** - 记录失败原因和解决方案
2. **用户纠正Claude** ("不，那是错的...", "实际上...") - 记录正确信息
3. **用户请求不存在的功能** - 记录功能需求
4. **外部API或工具失败** - 记录故障和解决方法
5. **Claude意识到知识过时或不正确** - 更新知识库
6. **发现重复任务的更好方法** - 记录优化方法

### 使用时机
- 在主要任务前**回顾学习记录**
- 当遇到重复错误时**检查历史解决方案**
- 当需要优化工作流程时**参考最佳实践**

## 📋 学习日志类别

| 类别 | 文件 | 描述 | 升级路径 |
|------|------|------|----------|
| 错误 | `.learnings/ERRORS.md` | 操作失败、命令错误 | → `AGENTS.md` (工作流) |
| 学习 | `.learnings/LEARNINGS.md` | 事实、模式、技巧 | → `CLAUDE.md` (知识) |
| 功能请求 | `.learnings/FEATURE_REQUESTS.md` | 缺失功能、增强请求 | → `TOOLS.md` (工具) |
| 工作流改进 | `.learnings/WORKFLOW.md` | 流程优化、自动化 | → `AGENTS.md` (OpenClaw工作区) |
| 工具技巧 | `.learnings/TOOL_TIPS.md` | 工具使用技巧、陷阱 | → `TOOLS.md` (OpenClaw工作区) |
| 行为模式 | `.learnings/BEHAVIOR.md` | 交互模式、最佳实践 | → `SOUL.md` (OpenClaw工作区) |

## 🚀 快速开始

### 基础设置
```bash
# 创建学习目录
mkdir -p .learnings

# 创建核心文件
touch .learnings/ERRORS.md .learnings/LEARNINGS.md .learnings/FEATURE_REQUESTS.md
```

### OpenClaw 设置 (推荐)
```bash
# 复制钩子
cp -r hooks/openclaw ~/.openclaw/hooks/self-improvement

# 启用钩子
openclaw hooks enable self-improvement
```

## 📖 使用示例

### 中文示例
```bash
# 1. 记录错误
echo "## [ERR-20260312-001] pip安装失败" >> .learnings/ERRORS.md
echo "**时间**: 2026-03-12T14:30:00Z" >> .learnings/ERRORS.md
echo "**优先级**: 高" >> .learnings/ERRORS.md
echo "**状态**: 已解决" >> .learnings/ERRORS.md
echo "**领域**: 配置" >> .learnings/ERRORS.md
echo "" >> .learnings/ERRORS.md
echo "### 问题" >> .learnings/ERRORS.md
echo "安装tencentcloud-sdk-python时网络超时" >> .learnings/ERRORS.md
echo "" >> .learnings/ERRORS.md
echo "### 解决方案" >> .learnings/ERRORS.md
echo "使用国内镜像源: pip install -i https://pypi.tuna.tsinghua.edu.cn/simple tencentcloud-sdk-python" >> .learnings/ERRORS.md

# 2. 记录学习
echo "## [LRN-20260312-001] 腾讯云配置" >> .learnings/LEARNINGS.md
echo "**时间**: 2026-03-12T15:00:00Z" >> .learnings/LEARNINGS.md
echo "**优先级**: 中" >> .learnings/LEARNINGS.md
echo "**状态**: 已验证" >> .learnings/LEARNINGS.md
echo "**领域**: API" >> .learnings/LEARNINGS.md
echo "" >> .learnings/LEARNINGS.md
echo "### 总结" >> .learnings/LEARNINGS.md
echo "腾讯云API密钥优先存储在.env文件，不在代码中明文存储" >> .learnings/LEARNINGS.md
```

### 英文示例
```bash
# 1. Log an error
cat >> .learnings/ERRORS.md << 'EOF'
## [ERR-20260312-002] GitHub push failed

**Logged**: 2026-03-12T16:00:00Z
**Priority**: high
**Status**: resolved
**Area**: git

### Problem
Failed to push to GitHub: "fatal: could not read Username"

### Solution
Use HTTPS with token: git push https://username:token@github.com/user/repo.git
EOF

# 2. Log a learning
cat >> .learnings/LEARNINGS.md << 'EOF'
## [LRN-20260312-002] PDF processing

**Logged**: 2026-03-12T17:00:00Z
**Priority**: medium
**Status**: verified
**Area**: tools

### Summary
Use PyMuPDF for PDF text extraction, OpenCV for QR code detection

### Details
- PyMuPDF is fast for text extraction
- OpenCV with QR code detector works well for images
- Combine both for comprehensive PDF processing
EOF
```

## 🔧 核心功能

### 学习捕获
```bash
# 自动捕获错误（通过钩子）
# 当命令失败时自动记录

# 手动记录学习
./scripts/self_improvement.py log-learning --category "tool" --summary "使用skillhub安装技能更可靠" --details "相比手动安装，skillhub提供版本管理和依赖解析"
```

### 学习回顾
```bash
# 查看最近的学习记录
./scripts/self_improvement.py list --category errors --days 7

# 搜索相关学习
./scripts/self_improvement.py search --query "GitHub" --category all

# 统计学习数据
./scripts/self_improvement.py stats
```

### 学习升级
```bash
# 将学习升级到项目文档
./scripts/self_improvement.py promote --id LRN-20260312-001 --to CLAUDE.md

# 批量升级
./scripts/self_improvement.py promote-batch --category workflow --to AGENTS.md
```

## 🛠️ 工作流程

### 错误处理流程
```
1. 检测到错误
2. 自动记录到 ERRORS.md
3. 分析错误原因
4. 寻找解决方案
5. 验证解决方案
6. 升级到适当文档
```

### 学习流程
```
1. 发现新知识
2. 记录到 LEARNINGS.md
3. 验证知识准确性
4. 分类和组织
5. 定期回顾
6. 应用到实际任务
```

## 📁 文件结构

```
self-improving-agent/
├── SKILL.md                    # 技能说明文档
├── _meta.json                  # 元数据
├── scripts/
│   ├── self_improvement.py     # 主脚本
│   ├── error_capture.sh        # 错误捕获脚本
│   └── learning_review.py      # 学习回顾工具
├── hooks/
│   └── openclaw/               # OpenClaw钩子
├── templates/
│   ├── error_template.md       # 错误模板
│   ├── learning_template.md    # 学习模板
│   └── feature_request.md      # 功能请求模板
└── references/
    ├── openclaw-integration.md # OpenClaw集成指南
    ├── best_practices.md       # 最佳实践
    └── examples/               # 示例文件
```

## ⚠️ 故障排除

### 常见问题

1. **钩子未触发**
   ```bash
   # 检查钩子是否启用
   openclaw hooks list
   
   # 重新启用钩子
   openclaw hooks enable self-improvement
   ```

2. **学习文件不存在**
   ```bash
   # 创建必要的目录和文件
   mkdir -p .learnings
   touch .learnings/ERRORS.md .learnings/LEARNINGS.md
   ```

3. **脚本权限问题**
   ```bash
   # 添加执行权限
   chmod +x scripts/*.py scripts/*.sh
   ```

### 调试模式
```bash
# 启用详细日志
export SELF_IMPROVEMENT_DEBUG=1
./scripts/self_improvement.py log-learning --debug

# 查看日志
tail -f .learnings/debug.log
```

## 🔄 与其他技能集成

### 与GitHub技能集成
```bash
# 自动将学习推送到GitHub
./scripts/self_improvement.py sync-to-github --repo owner/repo

# 从GitHub Issues导入反馈
./scripts/self_improvement.py import-from-github --repo owner/repo --label feedback
```

### 与飞书技能集成
```bash
# 发送学习总结到飞书
./scripts/self_improvement.py send-report --to feishu --channel daily-learnings

# 从飞书消息中提取反馈
./scripts/self_improvement.py extract-from-feishu --message-id <id>
```

## 📊 学习分析

### 生成报告
```bash
# 每周学习报告
./scripts/self_improvement.py generate-report --period week --format html

# 错误趋势分析
./scripts/self_improvement.py analyze-errors --period month --output chart.png

# 学习效果评估
./scripts/self_improvement.py evaluate-impact --metric "error_reduction"
```

### 数据可视化
```bash
# 生成学习统计图表
./scripts/self_improvement.py visualize --type pie --data .learnings/stats.json

# 创建学习时间线
./scripts/self_improvement.py timeline --output timeline.html
```

## 🎯 最佳实践

### 记录技巧
1. **立即记录** - 不要推迟记录学习
2. **具体详细** - 提供足够的上下文
3. **可操作** - 确保解决方案可执行
4. **分类清晰** - 使用正确的类别和标签
5. **定期回顾** - 每周回顾并清理

### 管理技巧
1. **优先级排序** - 高优先级问题优先处理
2. **定期升级** - 将有价值的学习升级到文档
3. **去重合并** - 合并相似的学习记录
4. **过期清理** - 删除过时或不相关的内容

## 🔮 未来计划

### v2.0.0 计划功能
- 机器学习驱动的学习建议
- 自动知识图谱构建
- 实时协作学习
- 跨项目学习共享
- 智能学习推荐系统

### 短期改进
- 更好的错误模式识别
- 自动解决方案生成
- 集成更多工具和服务
- 改进的用户界面

---

**✨ 持续学习，持续改进，让AI助手越来越聪明！**