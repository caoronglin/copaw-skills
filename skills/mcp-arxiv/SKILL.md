---
name: MCP arXiv 论文
description: arXiv 论文搜索、下载、元数据查询工具。支持自然语言搜索、关键词检索、论文下载等功能，为AI助手提供学术文献获取能力。
triggers:
  - "论文搜索"
  - "arxiv"
  - "学术文献"
  - "下载论文"
  - "学术论文"
  - "研究论文"
mcp:
  command: "uvx"
  args: ["arxiv-mcp-server"]
---

# arXiv 论文搜索 MCP 技能

## 功能说明

arXiv MCP Server 提供 arXiv 学术论文的搜索和获取功能：

- 📄 **论文搜索**：自然语言或关键词搜索论文
- 📥 **论文下载**：下载论文 PDF 文件
- 📊 **元数据查询**：获取论文标题、摘要、作者等信息
- 💾 **本地管理**：管理下载的论文文件

## 工具列表

### 1. search_papers - 论文搜索

**功能**：搜索 arXiv 论文

**参数说明**：

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| query | string | ✅ | 搜索关键词或自然语言描述 |
| max_results | integer | ❌ | 最大返回数量，默认 10 |
| sort_by | string | ❌ | 排序方式（relevance/date） |

**使用示例**：
```json
{
  "query": "CRISPR gene editing",
  "max_results": 5,
  "sort_by": "date"
}
```

### 2. download_paper - 论文下载

**功能**：下载指定论文的 PDF

**参数**：
- `arxiv_id`: 论文的 arXiv ID
- `save_path`: 保存路径（可选）

**返回**：下载成功的文件路径

### 3. get_paper_info - 论文信息

**功能**：获取论文的详细元数据

**参数**：
- `arxiv_id`: 论文的 arXiv ID

**返回字段**：
- 标题、作者、摘要
- 发表日期、最后更新
- 分类标签、引用信息

## 配置方式

### 方式一：NPX 运行
```json
{
  "mcpServers": {
    "arxiv": {
      "command": "npx",
      "args": ["-y", "arxiv-mcp-server"]
    }
  }
}
```

### 方式二：UV 安装
```bash
uv tool install arxiv-mcp-server
```

### 方式三：Smithery 自动安装
```bash
npx -y @smithery/cli install arxiv-mcp-server --client claude
```

## 使用场景

### 1. 快速搜索论文
```
用户：帮我找几篇关于 CRISPR 的最新论文
助手：[调用 search_papers 搜索]
```

### 2. 下载论文
```
用户：下载这篇论文 2301.00001
助手：[调用 download_paper 下载 PDF]
```

### 3. 查看论文摘要
```
用户：这篇论文讲什么？arXiv ID 是 2201.12345
助手：[调用 get_paper_info 获取摘要]
```

## 论文存储管理

### 配置存储路径
通过环境变量配置：
```json
{
  "mcpServers": {
    "arxiv": {
      "command": "npx",
      "args": ["-y", "arxiv-mcp-server"],
      "env": {
        "ARXIV_STORAGE_PATH": "/path/to/papers"
      }
    }
  }
}
```

**默认路径**：`~/.arxiv-mcp-server/papers`

### 存储结构
```
papers/
├── 2301.00001.pdf
├── 2301.00002.pdf
└── metadata/
    ├── 2301.00001.json
    └── 2301.00002.json
```

## 触发时机
- 用户需要搜索学术论文
- 需要下载 arXiv 论文
- 查询论文的元数据信息
- 学术研究需要文献支持

## 最佳实践

### 1. 精确搜索
```python
# 使用具体的关键词
search_papers("transformer attention mechanism")

# 使用作者名 + 主题
search_papers("Bengio deep learning")
```

### 2. 批量下载
```python
# 先搜索获取 ID 列表
papers = search_papers("quantum computing", max_results=10)

# 批量下载
for paper in papers:
    download_paper(paper.arxiv_id)
```

### 3. 论文管理
```
下载 → 阅读 → 归档 → 删除
```

## 注意事项

⚠️ **重要提示**：
1. 遵守 arXiv 的使用条款，避免频繁请求
2. 论文仅供学术研究使用
3. 尊重作者的版权
4. 下载的论文请妥善保管

## 与其他工具配合

### 学术研究流程
```
arxiv（搜索论文） → biomcp（查询基因/变异） → 总结分析
```

### 文献综述
```
arxiv → metaso（研究模式） → 整理笔记
```

## 支持的论文来源

| 来源 | 说明 |
|------|------|
| arXiv | 主要支持 |
| PubMed | 部分支持 |
| bioRxiv | 部分支持 |
| Sci-Hub | 可选支持 |

## 官方资源

- **GitHub**: https://github.com/openags/paper-search-mcp
- **arXiv官网**: https://arxiv.org
- **许可证**: MIT License

## 常见问题

### Q: arXiv ID 格式是什么？
**A**: 格式为 `YYMM.NNNNN`，例如：`2301.00001`

### Q: 可以搜索中文论文吗？
**A**: 主要支持英文论文，建议使用英文关键词

### Q: 下载的论文存在哪里？
**A**: 默认在 `~/.arxiv-mcp-server/papers`，可通过环境变量修改

---
*更新时间: 2026-03-08*
*版本: 1.0*
*适用对象: 学术研究者、学生*