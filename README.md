# CoPaw Skills 集合 v2.0.1

> 🤖 专为 CoPaw 助手打造的专业技能库，覆盖学术研究、数据处理、生活服务、开发工具等八大领域，38个优化技能

[中文](README.md) | [English](README_en.md) | [Русский](README_ru.md)

---

## 📊 技能统计 (v2.0.1)

- **总技能数**: 38 个（全部优化完成 ✅）
- **核心能力领域**: 8 大领域
- **专业适配**: 生物技术 ⭐⭐⭐⭐⭐
- **语言支持**: 中文优先，多语言优化
- **优化状态**: 100% 良好标准（包含详细使用示例）

---

## 🎯 八大核心能力

### 1️⃣ 信息获取与搜索 ⭐⭐⭐⭐⭐
- **Tavily** - 实时网页搜索
- **Metaso** - AI 智能搜索（学术优化）
- **DeepWiki** - 维基百科查询
- **Fetch** - 网页内容提取
- **阿里云搜索** - 中文网页搜索优化
- **News** - 新闻资讯获取（权威来源）
- **Deep Research** - 深度调研入口

### 2️⃣ 学术研究与文献 ⭐⭐⭐⭐⭐
- **arXiv** - 论文搜索下载
- **BioMCP** - 生物信息学（基因、蛋白质、临床试验）
- **发现报告** - 行业研报搜索
- **Context7** - 实时技术文档
- **AgentScope** - AI Agent开发框架

### 3️⃣ 数据处理与可视化 ⭐⭐⭐⭐⭐
- **Chart** - 25+ 种图表生成
- **XLSX** - Excel 数据处理
- **DOCX** - Word 文档处理
- **PDF** - PDF 处理与 OCR
- **PPTX** - PPT 演示制作
- **Nano-PDF** - 自然语言PDF编辑

### 4️⃣ 多媒体与创意 ⭐⭐⭐⭐
- **Image Recognition** - 图片识别 OCR（109 种语言）
- **ModelScope** - AI 文生图
- **OpenAI Whisper** - 本地语音转文字
- **Markdownify** - 多格式转Markdown

### 5️⃣ 生活服务与工具 ⭐⭐⭐⭐⭐
- **12306** - 火车票查询
- **高德地图** - 地点搜索、路线规划
- **Cron** - 定时任务管理
- **Gog** - Google Workspace管理
- **Himalaya** - 邮箱管理
- **Personal OS** - 个人操作系统（OKR/GTD/PARA）

### 6️⃣ 开发与代码 ⭐⭐⭐⭐
- **GitHub** - 仓库管理、Issue/PR
- **Scrapling** - 专业网页爬虫
- **CLI Anything** - GUI软件命令行控制
- **Skill Creator** - 技能创建和优化
- **Skill Vetter** - 技能安全检查

### 7️⃣ 飞书生态 ⭐⭐⭐⭐⭐
- **Feishu** - 飞书扩展能力（消息、文档、日历、任务）
- **钉钉频道** - 钉钉频道接入

### 8️⃣ 腾讯云服务 ⭐⭐⭐⭐
- **腾讯翻译** - 机器翻译API
- **腾讯云API** - 云服务综合调用

---

## 🚀 快速开始

### 安装方法
```bash
# 克隆仓库
git clone https://github.com/caoronglin/copaw-skills.git
cd copaw-skills

# 安装依赖
pip install -r requirements.txt

# 配置环境变量
cp .env.example .env
# 编辑.env文件，填入你的API密钥
```

### 使用示例
```bash
# 使用飞书技能发送消息
python -m skills.feishu send_message --text "Hello, World!"

# 使用学术技能搜索论文
python -m skills.mcp_arxiv search --query "machine learning"

# 使用数据处理技能生成图表
python -m skills.mcp_chart create --type line --data "[[1,2],[2,4],[3,1]]"
```

---

## 📈 版本更新

### v2.0.1 (2026-03-12) - 技能优化升级
✅ **全部38个skills优化完成**
- 所有skills达到良好标准（包含详细使用示例）
- 新增实用示例和故障排除指南
- 优化技能结构和文档质量
- 统一技能触发词和描述格式

### v1.0.0 (2026-03-10) - 初始发布
- 26个核心skills
- 八大能力领域覆盖
- 完整的CI/CD工作流
- GitHub Actions自动化测试

---

## 🔧 技能优化详情

### 优化的38个skills列表
| 技能名称 | 描述 | 优化内容 |
|----------|------|----------|
| agentscope-skill | AI Agent开发框架 | 完善使用示例 |
| cli-anything | GUI软件命令行控制 | 添加实用案例 |
| cron | 定时任务管理 | 优化故障排除 |
| deep-research | 深度调研入口 | 完善路由逻辑 |
| dingtalk_channel | 钉钉频道接入 | 添加配置指南 |
| docx | Word文档处理 | 丰富使用示例 |
| feishu | 飞书扩展能力 | 优化路由决策 |
| github | GitHub交互 | 全面示例优化 |
| gog | Google Workspace | 详细使用指南 |
| himalaya | 邮箱管理 | 完善配置说明 |
| humanizer | 文本去AI化 | 添加实用示例 |
| image-recognition | 图片识别 | 优化多语言支持 |
| markdownify-mcp | 转Markdown | 丰富格式支持 |
| mcp-12306 | 火车票查询 | 优化查询示例 |
| mcp-aliyun | 阿里云搜索 | 完善中文优化 |
| mcp-amap | 高德地图 | 丰富功能示例 |
| mcp-arxiv | 论文搜索 | 优化学术查询 |
| mcp-biomcp | 生物信息学 | 完善专业查询 |
| mcp-chart | 图表生成 | 丰富图表类型 |
| mcp-context7 | 技术文档 | 优化文档检索 |
| mcp-deepwiki | 维基百科 | 完善查询功能 |
| mcp-fetch | 网页提取 | 优化内容抓取 |
| mcp-fxbaogao | 行业研报 | 丰富搜索示例 |
| mcp-metaso | AI智能搜索 | 优化搜索类型 |
| modelscope | AI文生图 | 完善生成示例 |
| nano-pdf | PDF编辑 | 丰富编辑功能 |
| news | 新闻获取 | 完善来源管理 |
| openai-whisper | 语音转文字 | 优化转录示例 |
| pdf | PDF处理 | 丰富处理功能 |
| personal-os | 个人OS | 完善系统管理 |
| pptx | PPT处理 | 优化转换功能 |
| scrapling-official | 网页爬虫 | 完善反爬策略 |
| skill-creator | 技能创建 | 优化创建流程 |
| skill-vetter | 安全检查 | 完善安全策略 |
| summarize | 内容摘要 | 丰富摘要类型 |
| tencent-cloud | 腾讯云API | 完善服务调用 |
| tencent-translation | 腾讯翻译 | 优化翻译示例 |
| xlsx | Excel处理 | 丰富数据处理 |

### 技能质量标准
所有skills现在都符合以下标准：
- ✅ 完整的前言（frontmatter）
- ✅ 清晰的触发词（triggers）
- ✅ 详细的描述（description）
- ✅ 丰富的使用示例
- ✅ 清晰的结构和分段
- ✅ 实用的故障排除指南
- ✅ 最佳实践建议

---

## 🛠️ 开发指南

### 技能结构
```
skill-name/
├── SKILL.md          # 技能说明文档（必须）
├── __init__.py       # Python包初始化
├── main.py           # 主程序文件
├── config.json       # 配置文件（可选）
└── README.md         # 补充说明（可选）
```

### 创建新技能
```bash
# 使用skill-creator工具
python -m skills.skill_creator create --name "new-skill"

# 或者手动创建
mkdir -p skills/new-skill
touch skills/new-skill/SKILL.md
```

### 测试技能
```bash
# 运行技能测试
python -m pytest skills/tests/

# 检查技能质量
python scripts/check_skills.py
```

---

## 🤝 贡献指南

### 贡献流程
1. Fork 本仓库
2. 创建功能分支 (`git checkout -b feature/new-skill`)
3. 提交更改 (`git commit -m 'Add new skill'`)
4. 推送分支 (`git push origin feature/new-skill`)
5. 创建 Pull Request

### 技能规范
- 每个技能必须有完整的 `SKILL.md` 文档
- 包含详细的使用示例和故障排除
- 遵循统一的代码风格
- 通过所有测试

### 代码审查
所有提交将通过以下检查：
- ✅ 技能文档完整性
- ✅ 代码质量检查
- ✅ 功能测试通过
- ✅ 安全性检查
- ✅ 性能基准测试

---

## 📚 文档资源

### 核心文档
- [技能开发指南](DEVELOP.md) - 如何开发和测试技能
- [部署指南](DEPLOY.md) - 部署和发布流程
- [API参考](API.md) - 技能API文档
- [故障排除](TROUBLESHOOTING.md) - 常见问题和解决方案

### 学习资源
- [示例技能](examples/) - 技能实现示例
- [最佳实践](BEST_PRACTICES.md) - 开发最佳实践
- [性能优化](PERFORMANCE.md) - 性能调优指南

### 相关项目
- [CoPaw 官方文档](https://copaw.ai/docs)
- [MCP 协议规范](https://modelcontextprotocol.io/)
- [AI Agent 开发指南](https://agentscope.io/)

---

## 📄 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

---

## 🙏 致谢

感谢所有贡献者和用户的支持！特别感谢：

- **CoPaw 团队** - 提供优秀的AI助手平台
- **技能开发者社区** - 贡献和维护各种技能
- **开源项目贡献者** - 提供基础工具和库
- **测试用户** - 提供宝贵的反馈和建议

---

## 📞 联系方式

- **GitHub Issues**: [报告问题或建议](https://github.com/caoronglin/copaw-skills/issues)
- **Discord**: [加入社区讨论](https://discord.gg/copaw)
- **Email**: caoronglin@example.com

---

**✨ 让AI助手更强大，让生活更简单！**