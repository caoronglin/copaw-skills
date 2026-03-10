---
name: markdownify-mcp
description: 转 Markdown 工具。仅当用户明确要把网页、PDF、图片、音频、YouTube、DOCX、XLSX、PPTX 等内容转换为 Markdown 时使用。优先采用本机可运行的 stdio 方式，不要写远程 SSE/HTTP MCP 配置。
triggers:
  - "转 markdown"
  - "转换成 markdown"
  - "网页转 markdown"
  - "pdf转markdown"
  - "文档转markdown"
  - "markdownify"
  - "提取为 markdown"
mcp:
  command: "npx"
  args: ["-y", "@zcaceres/markdownify-mcp"]
---

# markdownify-mcp

## 定位
这是一个**内容转 Markdown**的 skill，不是天气 skill。

支持把这些内容转成 Markdown：
- 网页
- PDF
- 图片
- 音频
- YouTube
- DOCX
- XLSX
- PPTX

## 关键规则
### 1. 本机只走 stdio
当前宿主机**只支持 stdio 类型 MCP**。
所以这里的接入原则很简单：
- 可以：`command + args` 本地启动
- 不可以：`sse` / 远程 HTTP / `streamable_http`
- 不要再往 `config.json` 里塞远程 SSE 地址

### 2. 这是转换工具，不是通用抓取器
适合：
- “把这个网页转成 markdown”
- “把这个 PDF 提取成 markdown”
- “把这个 docx/pptx/xlsx 转 markdown”

不适合：
- 单纯查天气
- 地图/路线
- 结构化业务 API 查询

## 推荐本地 MCP 配置
如果后续真要注册到 MCP client，应该是这种 **stdio** 形式：

```json
{
  "mcp": {
    "clients": {
      "markdownify": {
        "name": "markdownify",
        "enabled": true,
        "transport": "stdio",
        "command": "npx",
        "args": ["-y", "@zcaceres/markdownify-mcp"],
        "env": {},
        "cwd": ""
      }
    }
  }
}
```

## 常见可用场景
### 网页转 Markdown
- 输入一个 URL
- 输出清洗后的 Markdown 文本

### PDF 转 Markdown
- 把 PDF 内容提取成便于总结、整理、笔记化的 Markdown

### Office 文档转 Markdown
- `docx-to-markdown`
- `xlsx-to-markdown`
- `pptx-to-markdown`

### 多媒体转 Markdown
- `image-to-markdown`
- `audio-to-markdown`
- `youtube-to-markdown`

## 可用工具（按 ModelScope 页面说明）
- `youtube-to-markdown`
- `pdf-to-markdown`
- `bing-search-to-markdown`
- `webpage-to-markdown`
- `image-to-markdown`
- `audio-to-markdown`
- `docx-to-markdown`
- `xlsx-to-markdown`
- `pptx-to-markdown`
- `get-markdown-file`

## 结论
这玩意儿该干的事只有一个：**把内容变成 Markdown**。
别再拿它伪装成天气能力，也别再配成 SSE 把本机搞挂。
