# CoPaw Skills Collection v2.0.1

> 🤖 Professional skill library designed for CoPaw assistant, covering 8 major domains with 38 optimized skills

[中文](README.md) | [English](README_en.md) | [Русский](README_ru.md)

---

## 📊 Statistics (v2.0.1)

- **Total Skills**: 38 (All optimized ✅)
- **Core Domains**: 8 major domains
- **Professional Fit**: Biotechnology ⭐⭐⭐⭐⭐
- **Language Support**: Chinese-first, multi-language optimized
- **Optimization Status**: 100% good standard (with detailed usage examples)

---

## 🎯 8 Core Capabilities

### 1️⃣ Information & Search ⭐⭐⭐⭐⭐
- **Tavily** - Real-time web search
- **Metaso** - AI search (academic optimized)
- **DeepWiki** - Wikipedia queries
- **Fetch** - Web content extraction
- **Aliyun Search** - Chinese web search optimization
- **News** - News acquisition (authoritative sources)
- **Deep Research** - Deep research entry

### 2️⃣ Academic Research ⭐⭐⭐⭐⭐
- **arXiv** - Paper search & download
- **BioMCP** - Bioinformatics (genes, proteins, trials)
- **FXBaogao** - Industry research reports
- **Context7** - Real-time technical docs
- **AgentScope** - AI Agent development framework

### 3️⃣ Data Processing & Visualization ⭐⭐⭐⭐⭐
- **Chart** - 25+ chart types
- **XLSX** - Excel data processing
- **DOCX** - Word document processing
- **PDF** - PDF processing & OCR
- **PPTX** - PowerPoint presentation
- **Nano-PDF** - Natural language PDF editing

### 4️⃣ Multimedia & Creativity ⭐⭐⭐⭐
- **Image Recognition** - Image OCR (109 languages)
- **ModelScope** - AI text-to-image
- **OpenAI Whisper** - Local speech-to-text
- **Markdownify** - Multi-format to Markdown

### 5️⃣ Life Services & Tools ⭐⭐⭐⭐⭐
- **12306** - Train ticket queries
- **AMap** - Location search, route planning
- **Cron** - Scheduled task management
- **Gog** - Google Workspace management
- **Himalaya** - Email management
- **Personal OS** - Personal operating system (OKR/GTD/PARA)

### 6️⃣ Development & Code ⭐⭐⭐⭐
- **GitHub** - Repository management, Issues/PRs
- **Scrapling** - Professional web scraping
- **CLI Anything** - GUI software CLI control
- **Skill Creator** - Skill creation & optimization
- **Skill Vetter** - Security vetting

### 7️⃣ Feishu Ecosystem ⭐⭐⭐⭐⭐
- **Feishu** - Feishu extension (messages, docs, calendar, tasks)
- **DingTalk Channel** - DingTalk channel integration

### 8️⃣ Tencent Cloud Services ⭐⭐⭐⭐
- **Tencent Translation** - Machine translation API
- **Tencent Cloud API** - Cloud service integration

---

## 🚀 Quick Start

### Installation
```bash
# Clone repository
git clone https://github.com/caoronglin/copaw-skills.git
cd copaw-skills

# Install dependencies
pip install -r requirements.txt

# Configure environment variables
cp .env.example .env
# Edit .env file with your API keys
```

### Usage Examples
```bash
# Send message using Feishu skill
python -m skills.feishu send_message --text "Hello, World!"

# Search papers using academic skill
python -m skills.mcp_arxiv search --query "machine learning"

# Generate chart using data processing skill
python -m skills.mcp_chart create --type line --data "[[1,2],[2,4],[3,1]]"
```

---

## 📈 Version History

### v2.0.1 (2026-03-12) - Skills Optimization Upgrade
✅ **All 38 skills optimized**
- All skills meet good standards (with detailed usage examples)
- Added practical examples and troubleshooting guides
- Optimized skill structure and documentation quality
- Unified skill triggers and description format

### v1.0.0 (2026-03-10) - Initial Release
- 26 core skills
- 8 major capability domains coverage
- Complete CI/CD workflow
- GitHub Actions automated testing

---

## 🔧 Skills Optimization Details

### Optimized 38 Skills List
| Skill Name | Description | Optimization |
|------------|-------------|--------------|
| agentscope-skill | AI Agent framework | Enhanced examples |
| cli-anything | GUI software CLI | Added practical cases |
| cron | Scheduled tasks | Optimized troubleshooting |
| deep-research | Deep research | Improved routing logic |
| dingtalk_channel | DingTalk integration | Added configuration guide |
| docx | Word processing | Enriched examples |
| feishu | Feishu extensions | Optimized routing decisions |
| github | GitHub interaction | Comprehensive examples |
| gog | Google Workspace | Detailed usage guide |
| himalaya | Email management | Enhanced configuration |
| humanizer | Text de-AI-fication | Added practical examples |
| image-recognition | Image recognition | Optimized multi-language |
| markdownify-mcp | Convert to Markdown | Enriched format support |
| mcp-12306 | Train tickets | Optimized queries |
| mcp-aliyun | Alibaba Cloud search | Improved Chinese optimization |
| mcp-amap | AMap services | Enhanced functionality examples |
| mcp-arxiv | Paper search | Optimized academic queries |
| mcp-biomcp | Bioinformatics | Enhanced professional queries |
| mcp-chart | Chart generation | Added chart types |
| mcp-context7 | Technical docs | Optimized document retrieval |
| mcp-deepwiki | Wikipedia | Enhanced query functions |
| mcp-fetch | Web extraction | Optimized content scraping |
| mcp-fxbaogao | Industry reports | Enriched search examples |
| mcp-metaso | AI search | Optimized search types |
| modelscope | AI text-to-image | Enhanced generation examples |
| nano-pdf | PDF editing | Enriched editing functions |
| news | News acquisition | Improved source management |
| openai-whisper | Speech-to-text | Optimized transcription examples |
| pdf | PDF processing | Enhanced processing functions |
| personal-os | Personal OS | Improved system management |
| pptx | PowerPoint | Optimized conversion functions |
| scrapling-official | Web scraping | Enhanced anti-scraping strategies |
| skill-creator | Skill creation | Optimized creation process |
| skill-vetter | Security vetting | Enhanced security policies |
| summarize | Content summarization | Added summary types |
| tencent-cloud | Tencent Cloud API | Enhanced service calls |
| tencent-translation | Tencent translation | Optimized translation examples |
| xlsx | Excel processing | Enhanced data processing |

### Skill Quality Standards
All skills now meet the following standards:
- ✅ Complete frontmatter
- ✅ Clear triggers
- ✅ Detailed description
- ✅ Rich usage examples
- ✅ Clear structure and sections
- ✅ Practical troubleshooting guides
- ✅ Best practice recommendations

---

## 🛠️ Development Guide

### Skill Structure
```
skill-name/
├── SKILL.md          # Skill documentation (required)
├── __init__.py       # Python package initialization
├── main.py           # Main program file
├── config.json       # Configuration file (optional)
└── README.md         # Additional documentation (optional)
```

### Creating New Skills
```bash
# Use skill-creator tool
python -m skills.skill_creator create --name "new-skill"

# Or create manually
mkdir -p skills/new-skill
touch skills/new-skill/SKILL.md
```

### Testing Skills
```bash
# Run skill tests
python -m pytest skills/tests/

# Check skill quality
python scripts/check_skills.py
```

---

## 🤝 Contribution Guide

### Contribution Process
1. Fork this repository
2. Create feature branch (`git checkout -b feature/new-skill`)
3. Commit changes (`git commit -m 'Add new skill'`)
4. Push branch (`git push origin feature/new-skill`)
5. Create Pull Request

### Skill Specifications
- Each skill must have complete `SKILL.md` documentation
- Include detailed usage examples and troubleshooting
- Follow unified code style
- Pass all tests

### Code Review
All submissions will pass through:
- ✅ Skill documentation completeness
- ✅ Code quality check
- ✅ Functional tests passed
- ✅ Security check
- ✅ Performance benchmark

---

## 📚 Documentation Resources

### Core Documentation
- [Skill Development Guide](DEVELOP.md) - How to develop and test skills
- [Deployment Guide](DEPLOY.md) - Deployment and release process
- [API Reference](API.md) - Skill API documentation
- [Troubleshooting](TROUBLESHOOTING.md) - Common issues and solutions

### Learning Resources
- [Example Skills](examples/) - Skill implementation examples
- [Best Practices](BEST_PRACTICES.md) - Development best practices
- [Performance Optimization](PERFORMANCE.md) - Performance tuning guide

### Related Projects
- [CoPaw Official Docs](https://copaw.ai/docs)
- [MCP Protocol](https://modelcontextprotocol.io/)
- [AI Agent Development](https://agentscope.io/)

---

## 📄 License

This project is licensed under MIT License - see [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

Thanks to all contributors and users! Special thanks to:

- **CoPaw Team** - Providing excellent AI assistant platform
- **Skill Developer Community** - Contributing and maintaining various skills
- **Open Source Contributors** - Providing foundational tools and libraries
- **Test Users** - Providing valuable feedback and suggestions

---

## 📞 Contact

- **GitHub Issues**: [Report issues or suggestions](https://github.com/caoronglin/copaw-skills/issues)
- **Discord**: [Join community discussion](https://discord.gg/copaw)
- **Email**: caoronglin@example.com

---

**✨ Make AI assistants more powerful, make life simpler!**