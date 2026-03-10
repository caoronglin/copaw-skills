---
name: MCP Fetch
description: 网页内容抓取工具，获取指定 URL 的页面内容。支持多种格式输出、robots.txt规则遵循、编码自动处理等功能。
triggers:
  - "打开网页"
  - "抓取内容"
  - "获取网页"
  - "访问链接"
  - "爬取"
  - "fetch"
  - "网页内容"
mcp:
  command: "uvx"
  args: ["mcp-server-fetch"]
---

# Fetch 网页抓取 MCP 技能

## 功能说明

Fetch MCP Server 是 Model Context Protocol 官方提供的网页抓取工具，能够：

- 🌐 **网页抓取**：获取指定 URL 的网页内容
- 📝 **多种格式**：支持提取页面文本、标题、链接等信息
- 🔧 **编码处理**：自动处理各种字符编码
- 🤖 **规则遵循**：支持 robots.txt 规则（可配置）
- ⚡ **反爬优化**：处理常见的反爬限制

## 工具列表

### 1. fetch - 网页抓取工具

**功能描述**：抓取指定 URL 的网页内容

**参数说明**：

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| url | string | ✅ | 要抓取的网页 URL |
| max_length | integer | ❌ | 最大字符数，默认 5000 |
| start_index | integer | ❌ | 起始字符索引，用于分页抓取 |
| raw | boolean | ❌ | 是否返回原始 HTML，默认 false（返回简化版） |

**返回格式**：
```json
{
  "url": "https://example.com",
  "title": "页面标题",
  "content": "页面内容...",
  "links": ["链接1", "链接2"]
}
```

## 安装配置

### 方式一：使用 uvx（推荐）
```json
{
  "mcpServers": {
    "fetch": {
      "command": "uvx",
      "args": ["mcp-server-fetch"]
    }
  }
}
```

### 方式二：使用 pip
```bash
pip install mcp-server-fetch
```

```json
{
  "mcpServers": {
    "fetch": {
      "command": "python",
      "args": ["-m", "mcp_server_fetch"]
    }
  }
}
```

### 方式三：使用 Docker
```json
{
  "mcpServers": {
    "fetch": {
      "command": "docker",
      "args": ["run", "--rm", "-i", "mcp/fetch"]
    }
  }
}
```

## 使用场景

### 1. 快速获取网页内容
```
用户：帮我打开这个网页 https://example.com/article
助手：[调用 fetch 工具获取内容]
```

### 2. 提取网页文本
```
用户：抓取这篇文章的内容
助手：[调用 fetch 工具，自动提取正文]
```

### 3. 分页抓取长内容
```
用户：这个网页内容太长，继续抓取后面的内容
助手：[使用 start_index 参数继续抓取]
```

### 4. 获取原始 HTML
```
用户：我需要这个网页的原始 HTML 代码
助手：[设置 raw=true 获取原始内容]
```

## 触发场景
- 用户需要访问某个网页链接
- 需要获取网页的文本内容
- 需要提取网页标题或链接
- 需要爬取网页信息

## 最佳实践

### 1. 处理长网页
对于内容很长的网页，使用 `max_length` 和 `start_index` 分批抓取：
```
第一次：max_length=5000, start_index=0
第二次：max_length=5000, start_index=5000
```

### 2. robots.txt 规则
- 默认情况下，工具会遵循网站的 robots.txt 规则
- 对于用户主动请求（非模型发起），可以忽略 robots.txt

### 3. 编码问题
- 工具会自动检测和处理页面编码
- 如遇乱码，可尝试设置 `raw=true` 获取原始内容

### 4. 反爬策略
- 适度使用，避免频繁请求同一网站
- 尊重网站的 robots.txt 和使用条款

## 注意事项

⚠️ **重要提示**：
1. 遵守目标网站的使用条款和 robots.txt 规则
2. 避免过度抓取导致 IP 被封禁
3. 对于需要登录的页面，此工具无法直接访问
4. JavaScript 动态加载的内容可能无法获取

## 错误处理

常见错误及解决方案：

| 错误 | 原因 | 解决方案 |
|------|------|----------|
| 403 Forbidden | 访问被拒绝 | 检查 robots.txt，或使用浏览器工具 |
| 404 Not Found | 页面不存在 | 确认 URL 是否正确 |
| Timeout | 请求超时 | 检查网络连接，稍后重试 |
| Encoding Error | 编码问题 | 尝试 raw=true 参数 |

## 官方资源

- **GitHub**: https://github.com/modelcontextprotocol/servers/tree/main/src/fetch
- **文档**: MCP 官方文档
- **许可证**: MIT License

## 与其他工具配合

### 网页搜索组合
```
ali-web（搜索） → fetch（抓取） → 总结分析
```

### 深度内容提取
```
fetch（获取页面） → ali-web-ext（解析结构化内容）
```

---
*更新时间: 2026-03-08*
*版本: 1.0*