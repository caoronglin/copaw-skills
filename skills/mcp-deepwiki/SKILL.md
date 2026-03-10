---
name: MCP DeepWiki
description: 维基百科深度查询工具，获取结构化的百科知识。支持多语言维基百科查询、页面解析、结构化数据提取等功能。
triggers:
  - "维基百科"
  - "wikipedia"
  - "百科"
  - "知识查询"
  - "词条"
mcp:
  command: "uvx"
  args: ["deepwiki-mcp-server"]
---

# DeepWiki 维基百科 MCP 技能

## 功能说明

DeepWiki MCP Server 提供维基百科的深度查询能力：

- 📚 **词条查询**：搜索维基百科词条
- 🌍 **多语言支持**：支持中英文等多种语言
- 📄 **内容提取**：获取词条摘要、正文、分类
- 🔗 **链接解析**：提取词条中的相关链接
- 📊 **结构化数据**：提取信息框等结构化信息

## 工具列表

### 1. search_wiki - 搜索词条

**功能**：在维基百科搜索相关词条

**参数说明**：

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| query | string | ✅ | 搜索关键词 |
| language | string | ❌ | 语言代码（zh/en），默认zh |
| limit | integer | ❌ | 返回数量，默认10 |

**使用示例**：
```json
{
  "query": "人工智能",
  "language": "zh",
  "limit": 5
}
```

### 2. get_article - 获取词条内容

**功能**：获取词条的完整内容

**参数**：
- `title`: 词条标题
- `language`: 语言代码
- `sections`: 是否获取分段内容

**返回信息**：
- 标题、摘要
- 正文内容
- 分类标签
- 外部链接

### 3. get_summary - 获取摘要

**功能**：获取词条的简短摘要

**参数**：
- `title`: 词条标题
- `language`: 语言代码
- `sentences`: 摘要句子数

### 4. get_infobox - 获取信息框

**功能**：提取词条的信息框数据

**参数**：
- `title`: 词条标题

**返回**：结构化的信息框数据

## 配置方式

### Claude Desktop 配置
```json
{
  "mcpServers": {
    "deepwiki": {
      "command": "uvx",
      "args": ["deepwiki-mcp-server"]
    }
  }
}
```

## 使用场景

### 1. 快速知识查询
```
用户：什么是量子计算？
助手：[调用 get_summary 获取摘要]
```

### 2. 详细内容研究
```
用户：给我详细介绍一下CRISPR技术
助手：[调用 get_article 获取完整内容]
```

### 3. 结构化数据提取
```
用户：获取这个人物的基本信息
助手：[调用 get_infobox 提取信息框]
```

### 4. 多语言查询
```
用户：用英文查一下深度学习
助手：[设置 language=en 查询]
```

## 触发时机
- 用户询问百科知识
- 需要快速了解某个概念
- 查询人物、事件、地点等信息
- 需要权威的背景资料

## 最佳实践

### 1. 使用合适的语言
```python
# 中文查询
get_article(title="人工智能", language="zh")

# 英文查询
get_article(title="Artificial Intelligence", language="en")
```

### 2. 控制返回内容量
```python
# 只需要概要
get_summary(title="机器学习", sentences=3)

# 需要详细内容
get_article(title="机器学习", sections=True)
```

### 3. 处理重定向
```python
# 维基百科可能有重定向
# 搜索时使用 search_wiki 先找到正确标题
results = search_wiki("AI")
# 然后用返回的标题获取内容
article = get_article(results[0]["title"])
```

## 注意事项

⚠️ **重要提示**：
1. 内容来源于维基百科，使用时需注明来源
2. 词条内容可能随时更新
3. 部分词条可能不存在或有争议
4. 遵守维基百科的使用条款

## 与其他工具配合

### 知识检索流程
```
deepwiki（百科知识）→ arxiv（论文）→ 总结分析
```

### 多源验证
```
deepwiki → metaso（深度搜索）→ 交叉验证
```

## 官方资源

- **维基百科**: https://www.wikipedia.org
- **API文档**: MediaWiki API
- **许可证**: 维基百科内容遵循 CC BY-SA 3.0

## 常见问题

### Q: 词条不存在怎么办？
**A**: 使用 search_wiki 搜索相关词条，或尝试其他语言

### Q: 内容太长怎么办？
**A**: 使用 get_summary 只获取摘要，或分段获取

### Q: 如何获取特定章节？
**A**: 使用 sections=True 参数，然后解析章节内容

---
*更新时间: 2026-03-08*
*版本: 1.0*