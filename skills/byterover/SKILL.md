---
name: byterover
description: "You MUST use this for gathering contexts before any work. This is a Knowledge management for AI agents. Use `brv` to store and retrieve project patterns, decisions, and architectural rules in .brv/context-tree. Uses a configured LLM provider (default: ByteRover, no API key needed) for query and curate operations."
triggers:
  - "byterover"
  - "brv"
  - "知识管理"
  - "knowledge management"
  - "context tree"
  - "上下文树"
  - "项目模式"
  - "项目决策"
  - "架构规则"
  - "记忆管理"
---

# ByteRover Knowledge Management - 字节漫游者知识管理

使用 `brv` CLI 管理项目的长期记忆。

## 🎯 核心功能

### 知识管理
- **存储** - 存储项目模式、决策和架构规则
- **检索** - 检索相关上下文用于工作决策
- **整理** - 使用LLM整理和优化知识
- **同步** - 可选的云同步功能

### 工作流程
1. **思考前** - 运行 `brv query` 了解现有模式
2. **实施后** - 运行 `brv curate` 保存新模式/决策

## 🚀 快速开始

### 安装
```bash
# 全局安装
npm install -g byterover-cli

# 或者作为项目依赖
npm install byterover-cli --save-dev
```

### 初始化
```bash
# 在项目根目录初始化
brv init

# 检查状态
brv status
```

## 📖 使用示例

### 中文示例
```bash
# 1. 查询项目知识
brv query "CoPaw技能如何安装？"

# 2. 查询特定领域知识
brv query --category "skill" "如何优化技能文档？"

# 3. 保存新决策
echo "决策: 所有API密钥必须存储在.env文件中" > decision.md
brv curate decision.md --category "security"

# 4. 列出所有知识
brv list

# 5. 搜索特定内容
brv search "腾讯云"
```

### 英文示例
```bash
# 1. Query project knowledge
brv query "How to install CoPaw skills?"

# 2. Query with category
brv query --category "deployment" "Best practices for deployment"

# 3. Curate new pattern
echo "Pattern: Use semantic versioning for all releases" > pattern.md
brv curate pattern.md --category "versioning"

# 4. List all knowledge
brv list

# 5. Search for content
brv search "authentication"
```

## 🔧 核心命令

### 查询命令
```bash
# 基本查询
brv query "<question>"

# 带类别查询
brv query --category "<category>" "<question>"

# 带标签查询
brv query --tags "<tag1>,<tag2>" "<question>"

# 限制结果数量
brv query --limit 5 "<question>"
```

### 整理命令
```bash
# 整理文件
brv curate <file-path>

# 整理文件并指定类别
brv curate <file-path> --category "<category>"

# 整理文件并添加标签
brv curate <file-path> --tags "<tag1>,<tag2>"

# 整理文件并指定重要性
brv curate <file-path> --importance "high"
```

### 管理命令
```bash
# 列出所有知识
brv list

# 搜索知识
brv search "<keyword>"

# 查看知识详情
brv show <knowledge-id>

# 删除知识
brv delete <knowledge-id>

# 导出知识
brv export --format json

# 导入知识
brv import knowledge.json
```

### 同步命令（需要登录）
```bash
# 登录（需要云功能）
brv login

# 推送到云端
brv push

# 从云端拉取
brv pull

# 管理空间
brv space list
```

## 📁 文件结构

```
项目根目录/
├── .brv/
│   ├── config.json           # 配置文件
│   └── context-tree/         # 知识存储目录
│       ├── skills/           # 技能相关
│       ├── deployment/       # 部署相关
│       ├── security/         # 安全相关
│       ├── architecture/     # 架构相关
│       └── decisions/        # 决策记录
└── 项目文件...
```

### 知识文件格式
```markdown
# 知识标题

**分类**: skills
**标签**: installation, best-practices
**重要性**: high
**创建时间**: 2026-03-12
**最后更新**: 2026-03-12

## 内容

技能安装的最佳实践：
1. 使用skillhub进行安装
2. 检查依赖完整性
3. 验证安装结果
4. 测试核心功能

## 上下文

这个知识来自CoPaw技能优化项目...

## 相关链接

- [相关文档](https://example.com)
- [相关代码](path/to/code)
```

## 🛠️ 与CoPaw集成

### 在工作前使用
```bash
# 在执行任何工作前查询相关上下文
brv query "当前项目的技能优化策略是什么？"

# 基于查询结果制定工作计划
python3 -c "
import subprocess
result = subprocess.run(['brv', 'query', 'CoPaw技能安装方法'], capture_output=True, text=True)
print('查询结果:', result.stdout)
"
```

### 在工作后整理
```bash
# 完成技能优化后整理经验
cat > new_learning.md << 'EOF'
# 技能优化经验

**分类**: skills-optimization
**标签**: documentation, examples
**重要性**: medium

## 内容

技能优化关键点：
1. 每个技能必须有完整的SKILL.md
2. 必须包含triggers和description
3. 必须有中文使用示例
4. 必须有故障排除指南

## 来源

CoPaw技能v2.0.1优化项目
EOF

brv curate new_learning.md --category skills --tags optimization,docs
```

## 📊 知识分类

### 预定义分类
| 分类 | 描述 | 示例 |
|------|------|------|
| skills | 技能相关 | 安装、配置、使用 |
| deployment | 部署相关 | 环境、配置、发布 |
| security | 安全相关 | 认证、授权、密钥 |
| architecture | 架构相关 | 设计、模式、决策 |
| decisions | 决策记录 | 技术选型、方案选择 |
| troubleshooting | 故障排除 | 错误、解决方案 |
| best-practices | 最佳实践 | 标准、规范、指南 |

### 自定义分类
```bash
# 创建自定义分类
mkdir -p .brv/context-tree/custom-category

# 整理到自定义分类
brv curate file.md --category "custom-category"
```

## ⚠️ 故障排除

### 常见问题

1. **brv命令未找到**
   ```bash
   # 检查安装
   which brv
   
   # 重新安装
   npm install -g byterover-cli
   ```

2. **查询无结果**
   ```bash
   # 检查知识库是否为空
   brv list
   
   # 初始化或添加知识
   brv init
   echo "初始知识" > initial.md
   brv curate initial.md
   ```

3. **整理失败**
   ```bash
   # 检查文件格式
   cat file.md
   
   # 检查文件权限
   ls -la file.md
   
   # 尝试简化内容
   echo "简化内容" > simple.md
   brv curate simple.md
   ```

### 调试模式
```bash
# 启用详细输出
export BRV_DEBUG=1

# 运行命令
brv query "test" --verbose

# 查看日志
tail -f .brv/debug.log
```

## 🔄 与其他技能集成

### 与ontology技能集成
```bash
# 将byterover知识导出到ontology
brv export --format json > knowledge.json
python3 scripts/ontology.py import --file knowledge.json --type Knowledge

# 从ontology查询结果整理到byterover
python3 scripts/ontology.py query --type Decision --format json > decisions.json
brv import decisions.json
```

### 与self-improving-agent集成
```bash
# 将学习记录整理到byterover
cat .learnings/LEARNINGS.md | grep -A 10 "##" > learnings.md
brv curate learnings.md --category learnings --tags improvement

# 从byterover查询相关学习
brv query --category learnings "如何解决常见错误？"
```

### 与飞书技能集成
```bash
# 发送知识摘要到飞书
brv query "项目关键知识" --limit 3 > summary.md
python3 -c "
with open('summary.md', 'r') as f:
    content = f.read()
# 发送到飞书
print(f'发送知识摘要: {len(content)}字符')
"
```

## 📈 知识分析

### 统计报告
```bash
# 生成知识统计
brv stats

# 按分类统计
brv stats --by-category

# 按时间统计
brv stats --by-date

# 导出统计报告
brv stats --export report.json
```

### 知识质量检查
```bash
# 检查知识完整性
brv check --completeness

# 检查知识重复
brv check --duplicates

# 检查知识时效性
brv check --freshness
```

## 🎯 最佳实践

### 知识管理
1. **及时整理** - 完成工作后立即整理
2. **分类明确** - 使用标准分类和标签
3. **保持简洁** - 重点突出，避免冗长
4. **定期回顾** - 每周回顾和清理
5. **版本控制** - 重要知识应该有版本历史

### 查询优化
1. **具体问题** - 提出明确具体的问题
2. **使用分类** - 指定分类提高精度
3. **添加标签** - 使用标签缩小范围
4. **限制结果** - 避免信息过载
5. **评估结果** - 验证查询结果的准确性

## 🔮 未来计划

### v2.0.0 计划功能
- 机器学习知识推荐
- 自动知识整理
- 多项目知识共享
- 知识图谱可视化
- 实时协作编辑

### 短期改进
- 更好的中文支持
- 本地LLM集成
- 知识质量评分
- 批量操作优化
- 性能提升

---

**✨ 让知识为工作服务，让AI更加智能！**