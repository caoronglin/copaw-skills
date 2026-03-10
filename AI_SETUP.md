# 🤖 AI 快速创建指令

对你的 AI 助手说以下内容，即可自动创建 CoPaw Skills 配置：

---

## 中文指令

```
帮我创建 CoPaw skills 配置，需要以下技能：

**文档处理**：
- docx (Word 文档)
- xlsx (Excel 表格)
- pptx (PPT 演示)
- pdf (PDF 处理)

**学术研究**：
- arxiv (论文搜索)
- biomcp (生物信息学)
- fxbaogao (行业报告)
- context7 (技术文档)

**数据可视化**：
- mcp-chart (图表生成)

**生活服务**：
- mcp-12306 (火车票)
- mcp-amap (高德地图)

**开发工具**：
- mcp-github (GitHub)
- scrapling (网页爬虫)
- markdownify-mcp (转 Markdown)

**知识管理**：
- deep-research (深度调研)
- personal-os (个人系统)

配置要求：
1. 使用 stdio 类型的 MCP 配置
2. 所有密钥从环境变量读取（不要硬编码）
3. 在 .env 文件中配置示例
4. 创建 requirements.txt
```

---

## English Instruction

```
Help me create CoPaw skills configuration with:

**Documents**: docx, xlsx, pptx, pdf
**Academic**: arxiv, biomcp, fxbaogao, context7
**Visualization**: mcp-chart
**Life**: mcp-12306, mcp-amap
**Dev**: mcp-github, scrapling, markdownify-mcp
**Knowledge**: deep-research, personal-os

Requirements:
1. Use stdio MCP transport
2. Read secrets from environment variables
3. Create .env.example
4. Create requirements.txt
```

---

## Русский

```
Помоги создать конфигурацию навыков CoPaw:

**Документы**: docx, xlsx, pptx, pdf
**Наука**: arxiv, biomcp, fxbaogao, context7
**Визуализация**: mcp-chart
**Быт**: mcp-12306, mcp-amap
**Разработка**: mcp-github, scrapling
**Знания**: deep-research, personal-os

Требования:
1. Используй stdio MCP
2. Секреты из переменных окружения
3. Создай .env.example
4. Создай requirements.txt
```

---

## 配置示例输出

AI 应该生成类似这样的配置：

```json
{
  "mcp": {
    "clients": {
      "mcp-chart": {
        "command": "npx",
        "args": ["-y", "@modelcontextprotocol/server-chart"],
        "transport": "stdio",
        "env": {}
      },
      "mcp-arxiv": {
        "command": "uvx",
        "args": ["arxiv-mcp-server"],
        "transport": "stdio",
        "env": {}
      },
      "mcp-biomcp": {
        "command": "uvx",
        "args": ["biomcp-server"],
        "transport": "stdio",
        "env": {}
      }
    }
  }
}
```

以及 `.env.example`：

```bash
# Search
TAVILY_API_KEY=your_key

# Maps
AMAP_API_KEY=your_key

# GitHub
GITHUB_TOKEN=ghp_your_token

# Weather
QWEATHER_API_KEY=your_key
```
