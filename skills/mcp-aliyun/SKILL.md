---
name: MCP 阿里云
description: 阿里云DashScope集成技能，整合网页搜索和网页解析。中文搜索优化，一站式信息获取。
triggers:
  - "网页搜索"
  - "解析网页"
  - "搜索网页"
  - "中文搜索"
  - "抓取网页"
mcp:
  type: remote
  urls:
    search: "https://dashscope.aliyuncs.com/api/v1/mcps/WebSearch/mcp"
    parse: "https://dashscope.aliyuncs.com/api/v1/mcps/WebParser/sse"
---

# 阿里云DashScope技能（统一版）

整合阿里云网页搜索和网页解析，中文优化，一站式信息获取。

## 🎯 核心能力

| 功能 | 说明 |
|------|------|
| 网页搜索 | 实时搜索，中文优化 |
| 网页解析 | 提取正文，过滤广告 |
| 新闻搜索 | 最新资讯，时间过滤 |
| 结构化提取 | JSON/Markdown输出 |

---

## 🔍 网页搜索

### web_search - 搜索网页

**参数：**

| 参数 | 类型 | 必填 | 说明 |
|------|------|------|------|
| query | string | ✅ | 搜索关键词 |
| search_type | string | ❌ | general/news |
| max_results | int | ❌ | 结果数量，默认10 |
| time_range | string | ❌ | day/week/month/year |

**示例：**
```json
{
  "query": "2026年人工智能最新进展",
  "search_type": "news",
  "time_range": "week"
}
```

**返回：**
- 标题、摘要、URL、发布时间、来源

---

## 📄 网页解析

### parse_webpage - 解析网页

**参数：**

| 参数 | 类型 | 必填 | 说明 |
|------|------|------|------|
| url | string | ✅ | 网页URL |
| output_format | string | ❌ | markdown/json |
| extract_links | bool | ❌ | 提取链接，默认true |
| extract_images | bool | ❌ | 提取图片，默认false |

**示例：**
```json
{
  "url": "https://example.com/article",
  "output_format": "markdown"
}
```

**返回：**
- 网页标题、正文内容、链接列表、结构化数据

---

## 💡 使用场景

### 1. 搜索+解析组合
```python
# 先搜索
results = web_search("量子计算最新研究", search_type="news")
# 再解析
content = parse_webpage(results[0]["url"])
```

### 2. 实时新闻
```python
web_search("科技新闻", search_type="news", time_range="day")
```

### 3. 内容提取
```python
parse_webpage(url, output_format="json")
```

---

## 📊 时间范围过滤

| 参数 | 说明 | 适用场景 |
|------|------|---------|
| day | 最近24小时 | 突发新闻 |
| week | 最近一周 | 近期动态 |
| month | 最近一月 | 月度总结 |
| year | 最近一年 | 长期趋势 |

---

## 🔧 配置

### 获取API Key
1. 访问 https://dashscope.aliyun.com
2. 开通服务
3. 创建API Key

### MCP配置
```json
{
  "mcpServers": {
    "aliyun": {
      "url": "https://dashscope.aliyuncs.com/api/v1/mcps/WebSearch/mcp",
      "headers": {"Authorization": "Bearer YOUR_API_KEY"}
    }
  }
}
```

---

## ⚠️ 注意事项

- 中文搜索效果更佳
- 免费版有调用限制
- 遵守网站使用条款
- 动态内容可能需要puppeteer

---

## 📚 官方资源

- 官网：https://dashscope.aliyun.com
- 文档：https://help.aliyun.com/zh/model-studio/

---
*阿里云统一技能 v1.0 | 搜索·解析*