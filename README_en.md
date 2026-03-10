# CoPaw Skills Collection

> 🤖 Professional skill library designed for CoPaw assistant, covering 8 major domains: academic research, data processing, life services, and development tools

[中文](README.md) | [English](README_en.md) | [Русский](README_ru.md)

---

## 📊 Statistics

- **Total Skills**: 26
- **Core Domains**: 8
- **Professional Fit**: Biotechnology ⭐⭐⭐⭐⭐
- **Language Support**: Chinese-first, multi-language optimized

---

## 🎯 8 Core Capabilities

### 1️⃣ Information & Search ⭐⭐⭐⭐⭐
- **Tavily** - Real-time web search
- **Metaso** - AI search (academic optimized)
- **DeepWiki** - Wikipedia queries
- **Fetch** - Web content extraction

### 2️⃣ Academic Research ⭐⭐⭐⭐⭐
- **arXiv** - Paper search & download
- **BioMCP** - Bioinformatics (genes, proteins, trials)
- **FXBaogao** - Industry research reports
- **Context7** - Real-time technical docs

### 3️⃣ Data Processing ⭐⭐⭐⭐⭐
- **Chart** - 25+ chart types
- **XLSX** - Excel data processing
- **DOCX** - Word document handling
- **PDF** - PDF processing & OCR

### 4️⃣ Multimedia & Creative ⭐⭐⭐⭐
- **Image Recognition** - OCR (109 languages)
- **ModelScope** - AI text-to-image
- **PPTX** - Presentation creation

### 5️⃣ Life Services ⭐⭐⭐⭐⭐
- **12306** - Train ticket search
- **Amap** - Location search, routing
- **Cron** - Scheduled tasks

### 6️⃣ Development Tools ⭐⭐⭐⭐
- **GitHub** - Repo management, Issues/PRs
- **Scrapling** - Professional web scraping
- **Markdownify** - Multi-format to Markdown

### 7️⃣ Feishu Integration ⭐⭐⭐⭐⭐
- **Feishu** - Messages, docs, calendar, tasks

### 8️⃣ Knowledge Management ⭐⭐⭐⭐⭐
- **Personal-OS** - Personal OS (OKR+GTD+PARA)
- **News** - News aggregation
- **Deep Research** - In-depth research

---

## 🚀 Quick Start

### Method 1: Auto Creation (Recommended)

Tell your AI assistant:

```
Help me create CoPaw skills configuration with:
- Document: docx, xlsx, pptx, pdf
- Academic: arxiv, biomcp, fxbaogao
- Visualization: chart
- Life: 12306, amap
- Dev: github, scrapling

Use stdio MCP config, read secrets from env vars.
```

### Method 2: Manual Config

#### 1. Install Dependencies

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
cd copaw-skills
uv pip install -r requirements.txt
```

#### 2. Configure Environment

Create `.env`:

```bash
# Weather
QWEATHER_API_KEY=your_key

# Search
TAVILY_API_KEY=your_key

# Maps
AMAP_API_KEY=your_key

# GitHub
GITHUB_TOKEN=ghp_your_token

# ModelScope
MODELSCOPE_API_TOKEN=your_token
```

---

## 📁 Structure

```
copaw-skills/
├── README.md
├── README_en.md
├── README_ru.md
├── requirements.txt
├── skills/
│   ├── docx/
│   ├── xlsx/
│   ├── mcp-chart/
│   └── ...
├── examples/
└── .github/
```

---

## 💡 Use Cases

### Academic
```python
arxiv.search(query="CRISPR")
biomcp.search_gene("TP53")
fxbaogao.search("EV market")
```

### Data
```python
chart.create_line_chart(data)
xlsx.read_excel("data.xlsx")
docx.create_document("report.docx")
```

### Life
```python
train.search(from="Beijing", to="Yangling")
amap.get_weather(location="Yangling")
cron.create_task("Daily 8AM run")
```

---

## ⚠️ Security

1. **Secrets**
   - ✅ Use env vars
   - ✅ Don't commit `.env`
   - ✅ Rotate tokens

2. **Permissions**
   - ✅ Minimum required
   - ✅ Fine-grained tokens
   - ✅ Set expiration

---

## 🤝 Contributing

### Add New Skill

1. Create folder in `skills/`
2. Write `SKILL.md`
3. Create `tool.json`
4. Submit PR

---

## 📚 Resources

- [CoPaw Docs](https://github.com/copaw-ai/copaw)
- [MCP Spec](https://modelcontextprotocol.io/)
- [Dev Guide](docs/skill-development.md)

---

## 📄 License

MIT License - See [LICENSE](LICENSE)

---

*Last updated: 2026-03-10 | Version: 1.0.0*
