# CoPaw Skills 集合

> 🤖 专为 CoPaw 助手打造的专业技能库，覆盖学术研究、数据处理、生活服务、开发工具等八大领域

[中文](README.md) | [English](README_en.md) | [Русский](README_ru.md)

---

## 📊 技能统计

- **总技能数**: 26 个
- **核心能力领域**: 8 大领域
- **专业适配**: 生物技术 ⭐⭐⭐⭐⭐
- **语言支持**: 中文优先，多语言优化

---

## 🎯 八大核心能力

### 1️⃣ 信息获取与搜索 ⭐⭐⭐⭐⭐
- **Tavily** - 实时网页搜索
- **Metaso** - AI 智能搜索（学术优化）
- **DeepWiki** - 维基百科查询
- **Fetch** - 网页内容提取

### 2️⃣ 学术研究与文献 ⭐⭐⭐⭐⭐
- **arXiv** - 论文搜索下载
- **BioMCP** - 生物信息学（基因、蛋白质、临床试验）
- **发现报告** - 行业研报搜索
- **Context7** - 实时技术文档

### 3️⃣ 数据处理与可视化 ⭐⭐⭐⭐⭐
- **Chart** - 25+ 种图表生成
- **XLSX** - Excel 数据处理
- **DOCX** - Word 文档处理
- **PDF** - PDF 处理与 OCR

### 4️⃣ 多媒体与创意 ⭐⭐⭐⭐
- **Image Recognition** - 图片识别 OCR（109 种语言）
- **ModelScope** - AI 文生图
- **PPTX** - PPT 演示制作

### 5️⃣ 生活服务与工具 ⭐⭐⭐⭐⭐
- **12306** - 火车票查询
- **高德地图** - 地点搜索、路线规划
- **Cron** - 定时任务管理

### 6️⃣ 开发与代码 ⭐⭐⭐⭐
- **GitHub** - 仓库管理、Issue/PR
- **Scrapling** - 专业网页爬虫
- **Markdownify** - 多格式转 Markdown

### 7️⃣ 飞书集成 ⭐⭐⭐⭐⭐
- **Feishu** - 消息、文档、日历、待办

### 8️⃣ 知识管理与思考 ⭐⭐⭐⭐⭐
- **Personal-OS** - 个人操作系统（OKR+GTD+PARA）
- **News** - 新闻资讯获取
- **Deep Research** - 深度调研

---

## 🚀 快速开始

### 方式一：自动创建（推荐）

对你的 AI 助手说：

```
帮我创建 CoPaw skills 配置，需要以下技能：
- 文档处理：docx, xlsx, pptx, pdf
- 学术研究：arxiv, biomcp, fxbaogao
- 数据可视化：chart
- 生活服务：12306, amap
- 开发工具：github, scrapling

使用 stdio 类型的 MCP 配置，密钥从环境变量读取。
```

### 方式二：手动配置

#### 1. 安装依赖

```bash
# 安装 UV（Python 包管理器）
curl -LsSf https://astral.sh/uv/install.sh | sh

# 安装技能依赖
cd copaw-skills
uv pip install -r requirements.txt
```

#### 2. 配置环境变量

创建 `.env` 文件：

```bash
# 和风天气
QWEATHER_API_KEY=your_key_here

# Tavily 搜索
TAVILY_API_KEY=your_key_here

# 高德地图
AMAP_API_KEY=your_key_here

# GitHub
GITHUB_TOKEN=ghp_your_token_here

# 魔搭 ModelScope
MODELSCOPE_API_TOKEN=your_token_here

# 飞书（可选）
FEISHU_APP_ID=your_app_id
FEISHU_APP_SECRET=your_app_secret
```

#### 3. 添加到配置文件

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
      }
      // ... 其他技能配置
    }
  }
}
```

---

## 📁 目录结构

```
copaw-skills/
├── README.md              # 中文说明
├── README_en.md           # 英文说明
├── README_ru.md           # 俄文说明
├── requirements.txt       # Python 依赖
├── skills/                # 技能集合
│   ├── docx/              # Word 处理
│   ├── xlsx/              # Excel 处理
│   ├── pptx/              # PPT 处理
│   ├── pdf/               # PDF 处理
│   ├── mcp-chart/         # 图表生成
│   ├── mcp-arxiv/         # 论文搜索
│   ├── mcp-biomcp/        # 生物信息学
│   ├── mcp-12306/         # 火车票
│   ├── mcp-amap/          # 高德地图
│   └── ...                # 更多技能
├── examples/              # 使用示例
│   ├── weather_push.py    # 天气推送示例
│   └── paper_search.py    # 论文搜索示例
└── .github/               # GitHub 配置
    └── workflows/         # CI/CD
```

---

## 💡 使用场景

### 学术研究
```python
# 搜索 arXiv 论文
arxiv.search(query="CRISPR gene editing")

# 查询基因信息
biomcp.search_gene("TP53")

# 获取行业报告
fxbaogao.search("新能源汽车市场")
```

### 数据处理
```python
# 生成图表
chart.create_line_chart(data, title="温度趋势")

# 处理 Excel
xlsx.read_excel("data.xlsx", sheet="Sheet1")

# 创建 Word 报告
docx.create_document("报告.docx", content)
```

### 生活服务
```python
# 查询火车票
train.search(from="北京", to="杨凌", date="2026-03-15")

# 查询天气
amap.get_weather(location="杨凌")

# 创建定时任务
cron.create_task("每天 8:00 提醒我跑步")
```

---

## ⚠️ 安全提示

1. **密钥管理**
   - ✅ 使用环境变量存储密钥
   - ✅ 不要将 `.env` 提交到 Git
   - ✅ 定期更换 Token

2. **权限控制**
   - ✅ 只授予最小必要权限
   - ✅ 使用 Fine-grained Token
   - ✅ 设置 Token 过期时间

3. **隐私保护**
   - ✅ 不上传敏感数据
   - ✅ 本地处理优先
   - ✅ 定期清理缓存

---

## 🤝 贡献指南

### 添加新技能

1. 在 `skills/` 目录创建技能文件夹
2. 编写 `SKILL.md` 说明文档
3. 创建 `tool.json` 定义工具接口
4. 提交 Pull Request

### 技能模板

```markdown
---
name: 技能名称
description: 简短描述
mcp:
  command: 启动命令
  args: [参数列表]
  env:
    KEY: ${环境变量}
---

# 技能说明

## 功能
- 功能 1
- 功能 2

## 使用示例
示例代码
```

---

## 📚 相关资源

- [CoPaw 官方文档](https://github.com/copaw-ai/copaw)
- [MCP 协议规范](https://modelcontextprotocol.io/)
- [技能开发指南](docs/skill-development.md)
- [常见问题 FAQ](docs/faq.md)

---

## 📄 许可证

MIT License - 详见 [LICENSE](LICENSE)

---

## 👥 维护者

- **作者**: CoPaw Team
- **主要贡献者**: 薛麟麒 (@caoronglin)
- **专业适配**: 西北农林科技大学生命学院

---

*最后更新：2026-03-10 | 版本：1.0.0*
