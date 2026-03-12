---
name: context7
description: Context7知识库服务，实时获取库文档和代码示例。用户需要查技术文档、代码示例、API参考时说"用context7"或"查文档"。
triggers:
  - "mcp-context7"
  - "mcp context7"
mcp:
  type: remote
  url: "https://mcp.context7.com/mcp"
  headers:
    CONTEXT7_API_KEY: "${CONTEXT7_API_KEY}"
---


# Context7 技能

实时文档检索服务，解决LLM训练数据过时问题。

## 核心能力

| 工具 | 功能 |
|------|------|
| resolve-library-id | 解析库名称获取ID |
| query-docs | 查询文档和代码示例 |

## 使用方式

```
用户：Next.js 14中间件怎么用？
→ 自动调用：resolve-library-id("next.js") → query-docs("中间件配置")
```

## 配置

```json
{
  "mcpServers": {
    "context7": {
      "url": "https://mcp.context7.com/mcp",
      "headers": {"CONTEXT7_API_KEY": "your_key"}
    }
  }
}
```

## 官方资源

- 官网：https://context7.com
- GitHub：https://github.com/upstash/context7

# Context7 MCP 技能

## 功能说明

Context7 MCP Server 是由 Upstash 开发的实时文档检索服务：

- 📚 **实时文档**：获取最新的库文档和代码示例
- 🎯 **版本特定**：支持指定版本的文档检索
- 🔍 **语义匹配**：自动识别相关库和文档
- 💡 **代码示例**：直接获取可运行的代码片段
- 🌐 **多语言支持**：支持主流编程语言和框架

## 核心问题解决

### ❌ 没有Context7时
- 代码示例基于过时的训练数据
- 幻觉出不存在的API
- 使用旧版本的最佳实践

### ✅ 使用Context7后
- 获取最新版本文档
- 准确的API调用方式
- 版本特定的代码示例

## 工具列表

### 1. resolve-library-id - 库ID解析

**功能**：将库名称解析为Context7兼容的库ID

**参数说明**：

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| query | string | ✅ | 用户的问题或任务（用于相关性排序） |
| libraryName | string | ✅ | 要搜索的库名称 |

**使用示例**：
```json
{
  "query": "如何设置Next.js中间件",
  "libraryName": "next.js"
}
```

**返回**：Context7库ID（如 `/vercel/next.js`）

### 2. query-docs - 文档查询

**功能**：使用库ID获取相关文档

**参数说明**：

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| libraryId | string | ✅ | Context7库ID（如 /mongodb/docs） |
| query | string | ✅ | 要获取相关文档的问题或任务 |

**使用示例**：
```json
{
  "libraryId": "/vercel/next.js",
  "query": "如何配置中间件进行JWT验证"
}
```

**返回**：
- 相关文档片段
- 代码示例
- API说明

## 配置方式

### 方式一：远程服务器（推荐）
```json
{
  "mcpServers": {
    "context7": {
      "url": "https://mcp.context7.com/mcp",
      "headers": {
        "CONTEXT7_API_KEY": "your_api_key"
      }
    }
  }
}
```

### 方式二：本地服务器
```json
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp", "--api-key", "your_api_key"]
    }
  }
}
```

### 方式三：Claude Code 安装
```bash
claude mcp add --scope user context7 -- npx -y @upstash/context7-mcp --api-key YOUR_API_KEY
```

## 使用场景

### 1. 获取最新库文档
```
用户：如何使用Next.js 14的App Router？
助手：[在提示中添加 "use context7"]
[Context7自动获取Next.js 14的最新文档]
```

### 2. 代码生成支持
```
用户：写一个使用Supabase认证的示例
助手：[提示中添加 "use library /supabase/supabase"]
[直接获取Supabase认证文档]
```

### 3. 版本迁移
```
用户：从Next.js 13迁移到14有哪些变化？
助手：[指定版本查询]
[获取版本迁移指南]
```

### 4. API参考查询
```
用户：MongoDB的聚合管道怎么用？
助手：[调用 resolve-library-id → query-docs]
[获取聚合管道文档]
```

## 使用方法

### 方法一：提示中声明
在提示中添加 `use context7`：
```
创建一个Next.js中间件，检查JWT有效性。use context7
```

### 方法二：指定库ID
如果已知库ID，直接指定：
```
使用Supabase实现基础认证。use library /supabase/supabase
```

### 方法三：指定版本
提及特定版本号：
```
如何设置Next.js 14中间件？use context7
```

## 自动触发规则

建议在MCP客户端中添加规则自动调用：

```
当我需要库/API文档、代码生成、配置步骤时，自动使用Context7 MCP，无需我明确要求。
```

**设置位置**：
- Cursor: `Settings > Rules`
- Claude Code: `CLAUDE.md`

## 触发时机
- 需要查询库文档
- 生成代码需要API参考
- 学习新技术栈
- 版本迁移和升级
- 最佳实践查询

## 最佳实践

### 1. 明确指定库
```python
# 好的做法
"使用React hooks实现状态管理。use library /facebook/react"

# 不够明确
"用React实现状态管理"  # 可能匹配到多个库
```

### 2. 结合版本信息
```python
# 指定版本
"Next.js 14的App Router配置。use context7"

# 自动匹配最新版
"Next.js的App Router配置。use context7"
```

### 3. 分步查询
```python
# 1. 先解析库ID
library_id = resolve_library_id("Tailwind CSS")

# 2. 再查询具体问题
docs = query_docs(library_id, "如何配置自定义颜色")
```

## 注意事项

⚠️ **重要提示**：
1. 获取API Key可获得更高速率限制
2. 文档由社区贡献，以官方文档为准
3. 库ID使用斜杠格式（如 /vercel/next.js）
4. 支持OAuth认证（远程连接）

## 支持的客户端

Context7支持30+ MCP客户端：
- ✅ Cursor
- ✅ Claude Code
- ✅ VS Code
- ✅ Opencode
- ✅ Cherry Studio
- ✅ Continue
- ...更多

## 官方资源

- **官网**: https://context7.com
- **GitHub**: https://github.com/upstash/context7
- **API文档**: https://context7.com/docs/api-guide
- **客户端列表**: https://context7.com/docs/resources/all-clients
- **许可证**: MIT License

## 常见问题

### Q: 免费使用有限制吗？
**A**: 免费使用有速率限制，建议获取API Key

### Q: 支持哪些库？
**A**: 支持主流编程语言和框架，可通过resolve-library-id搜索

### Q: 如何添加新库？
**A**: 访问 context7.com/docs/adding-libraries 提交

### Q: 文档多久更新？
**A**: 实时跟踪官方文档更新

## 与其他工具配合

### 开发工作流
```
context7（查文档）→ 编写代码 → 测试调试
```

### 学习新技术
```
context7 → deepwiki（背景知识）→ 实践
```

---
*更新时间: 2026-03-08*
*版本: 1.0*