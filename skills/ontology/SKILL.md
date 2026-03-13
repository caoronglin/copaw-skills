---
name: ontology
description: Typed knowledge graph for structured agent memory and composable skills. Use when creating/querying entities (Person, Project, Task, Event, Document), linking related objects, enforcing constraints, planning multi-step actions as graph transformations, or when skills need to share state. Trigger on "remember", "what do I know about", "link X to Y", "show dependencies", entity CRUD, or cross-skill data access.
triggers:
  - "ontology"
  - "知识图谱"
  - "实体关系"
  - "remember"
  - "记住"
  - "what do I know about"
  - "link X to Y"
  - "show dependencies"
  - "实体CRUD"
  - "graph"
  - "图谱"
  - "结构化知识"
---

# Ontology - 知识图谱技能

类型化的词汇表 + 约束系统，用于将知识表示为可验证的图结构。

## 🎯 核心概念

一切都是具有**类型**、**属性**和与其他实体的**关系**的**实体**。每次变更都会在提交前根据类型约束进行验证。

```
实体: { id, type, properties, relations, created, updated }
关系: { from_id, relation_type, to_id, properties }
```

## 📋 何时使用

| 触发词 | 动作 |
|--------|------|
| "记住..." | 创建/更新实体 |
| "关于X我知道什么？" | 查询图谱 |
| "将X链接到Y" | 创建关系 |
| "显示项目Z的所有任务" | 图遍历 |
| "什么依赖于X？" | 依赖查询 |
| 规划多步工作 | 建模为图转换 |
| 技能需要共享状态 | 读取/写入本体对象 |

## 🚀 快速开始

### 基本使用
```bash
# 初始化本体存储
mkdir -p memory/ontology
touch memory/ontology/graph.jsonl

# 创建模式（可选但推荐）
python3 scripts/ontology.py schema-append --data '{
  "types": {
    "Task": { "required": ["title", "status"] },
    "Project": { "required": ["name"] },
    "Person": { "required": ["name"] }
  }
}'

# 开始使用
python3 scripts/ontology.py create --type Person --props '{"name":"Alice"}'
python3 scripts/ontology.py list --type Person
```

## 📖 使用示例

### 中文示例
```bash
# 1. 创建项目实体
python3 scripts/ontology.py create --type Project --props '{"name":"CoPaw技能优化", "status":"进行中"}'

# 2. 创建任务实体
python3 scripts/ontology.py create --type Task --props '{"title":"优化ontology技能", "status":"进行中", "priority":"高"}'

# 3. 创建关系：任务属于项目
python3 scripts/ontology.py relate --from <task_id> --relation belongs_to --to <project_id>

# 4. 查询所有任务
python3 scripts/ontology.py list --type Task

# 5. 查询项目依赖
python3 scripts/ontology.py query --type Project --where 'name="CoPaw技能优化"'
```

### 英文示例
```bash
# 1. Create a person
python3 scripts/ontology.py create --type Person --props '{"name":"Alice", "role":"developer"}'

# 2. Create a task
python3 scripts/ontology.py create --type Task --props '{"title":"Review code", "status":"pending"}'

# 3. Link task to person
python3 scripts/ontology.py relate --from <task_id> --relation assigned_to --to <person_id>

# 4. Find all pending tasks
python3 scripts/ontology.py list --type Task --where 'status="pending"'
```

## 🔧 核心功能

### 实体操作
```bash
# 创建实体
python3 scripts/ontology.py create --type <type> --props '{"key":"value"}'

# 读取实体
python3 scripts/ontology.py get --id <entity_id>

# 更新实体
python3 scripts/ontology.py update --id <entity_id> --props '{"new_key":"new_value"}'

# 删除实体
python3 scripts/ontology.py delete --id <entity_id>
```

### 关系操作
```bash
# 创建关系
python3 scripts/ontology.py relate --from <from_id> --relation <relation_type> --to <to_id>

# 删除关系
python3 scripts/ontology.py unrelate --from <from_id> --relation <relation_type> --to <to_id>
```

### 查询操作
```bash
# 列出所有指定类型的实体
python3 scripts/ontology.py list --type <type>

# 查询特定条件
python3 scripts/ontology.py query --type <type> --where 'condition'

# 遍历关系
python3 scripts/ontology.py traverse --from <entity_id> --relation <relation_type>
```

## 🛠️ 模式定义

### 定义实体类型
```yaml
types:
  Task:
    required: ["title", "status"]
    properties:
      title: { type: "string" }
      status: { type: "string", enum: ["todo", "in-progress", "done"] }
      priority: { type: "string", enum: ["low", "medium", "high"] }
    relations:
      belongs_to: { to: "Project", cardinality: "many-to-one" }
      assigned_to: { to: "Person", cardinality: "many-to-one" }
```

## 🔍 高级查询

### 复杂查询示例
```python
# 查询特定项目下所有未完成的高优先级任务
query = {
  "type": "Task",
  "where": "status != 'done' and priority = 'high'",
  "traverse": {
    "from": "<project_id>",
    "relation": "has_task"
  }
}
```

### 图遍历
```bash
# 查找所有依赖项
python3 scripts/ontology.py traverse --from <entity_id> --relation depends_on --depth 3

# 查找影响链
python3 scripts/ontology.py traverse --from <entity_id> --relation affects --direction outgoing
```

## 📁 文件结构

```
ontology/
├── SKILL.md          # 技能说明文档
├── _meta.json        # 元数据
├── scripts/
│   └── ontology.py   # 主脚本
└── references/
    ├── schema.md     # 完整类型定义
    └── queries.md    # 查询语言示例
```

## ⚠️ 故障排除

### 常见问题

1. **实体创建失败**
   ```bash
   # 检查模式约束
   python3 scripts/ontology.py validate --id <entity_id>
   ```

2. **关系验证失败**
   ```bash
   # 检查关系约束
   python3 scripts/ontology.py schema-show
   ```

3. **查询返回空结果**
   ```bash
   # 检查数据是否存在
   python3 scripts/ontology.py stats
   ```

### 错误处理

```bash
# 查看详细错误信息
python3 scripts/ontology.py debug --id <entity_id>

# 重置数据库（谨慎使用）
rm memory/ontology/graph.jsonl
touch memory/ontology/graph.jsonl
```

## 🔄 与其他技能集成

### 与GitHub技能集成
```bash
# 将GitHub Issue映射为Task实体
python3 scripts/ontology.py create --type Task --props '{
  "title": "GitHub Issue #123",
  "status": "open",
  "source": "github",
  "url": "https://github.com/owner/repo/issues/123"
}'
```

### 与飞书技能集成
```bash
# 将飞书待办映射为Task实体
python3 scripts/ontology.py create --type Task --props '{
  "title": "飞书待办：项目评审",
  "status": "pending",
  "source": "feishu",
  "due_date": "2024-12-31"
}'
```

## 📊 性能优化

### 索引优化
```bash
# 创建索引以提高查询性能
python3 scripts/ontology.py index-create --property "status"

# 查看索引状态
python3 scripts/ontology.py index-list
```

### 批量操作
```bash
# 批量创建实体
python3 scripts/ontology.py batch-create --file entities.json

# 批量更新关系
python3 scripts/ontology.py batch-relate --file relations.json
```

## 📚 参考文档

### 完整文档
- `references/schema.md` — 完整类型定义和约束模式
- `references/queries.md` — 查询语言和遍历示例

### API参考
```bash
# 查看所有可用命令
python3 scripts/ontology.py --help

# 查看特定命令帮助
python3 scripts/ontology.py create --help
```

## 🎯 最佳实践

1. **始终定义模式**：避免数据不一致
2. **使用约束**：确保数据质量
3. **定期备份**：防止数据丢失
4. **监控性能**：及时优化查询
5. **版本控制**：跟踪模式变更

## 🔮 未来计划

### v2.0.0 计划功能
- 实时同步功能
- 可视化界面
- 自动模式推导
- 机器学习集成
- 分布式存储支持

---

**✨ 让知识结构化，让智能更强大！**