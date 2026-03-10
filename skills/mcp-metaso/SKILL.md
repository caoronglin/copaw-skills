---
name: MCP 秘塔AI搜索
description: 秘塔AI搜索(metaso.cn)MCP服务，提供AI智能搜索能力，支持六种搜索类型（网页、文库、学术、图片、视频、播客）。当用户需要进行智能搜索、学术文献搜索、深度信息检索时使用此技能。
triggers:
  - "秘塔搜索"
  - "metaso"
  - "AI搜索"
  - "深度搜索"
  - "学术搜索"
mcp:
  type: remote
  url: "https://metaso.cn/api/mcp"
  headers:
    Authorization: "Bearer mk-F07EB47F7C11A0BBA1FBDE04619A9E00"
---

# 秘塔AI搜索 MCP 技能

基于 [秘塔AI搜索](https://metaso.cn/) 的 MCP 服务器，使用官方 FastMCP SDK 构建。支持六种搜索类型和网页内容解析，是中文AI智能搜索的最佳选择。

## 🚀 核心功能

### 🤖 AI 驱动搜索
- **智能理解**：基于大语言模型理解查询意图
- **深度整合**：自动整合多源信息生成答案
- **来源追溯**：所有信息来源清晰可查
- **无广告干扰**：纯净的搜索体验

### 📚 六种搜索类型

| 类型 | 工具参数 | 适用场景 |
|------|----------|----------|
| 🌐 网页搜索 | `webpage` | 一般信息搜索、新闻资讯 |
| 📄 文库搜索 | `document` | PDF文档、技术文档、报告 |
| 🎓 学术搜索 | `scholar` | 论文、期刊、学术文献 |
| 🖼️ 图片搜索 | `image` | 图片素材、图表 |
| 🎬 视频搜索 | `video` | 视频教程、纪录片 |
| 🎙️ 播客搜索 | `podcast` | 音频节目、播客 |

## 🔧 可用工具

### 1. `metaso_search` - 多维搜索工具

**参数说明：**

| 参数 | 类型 | 必填 | 说明 |
|------|------|------|------|
| `query` | string | ✅ | 搜索查询内容 |
| `scope` | string | ✅ | 搜索类型：webpage/document/scholar/image/video/podcast |

**搜索类型详解：**

#### 🌐 网页搜索 (webpage)
```
适用：一般信息查询、新闻资讯、百科知识
示例：metaso_search(query="人工智能最新进展", scope="webpage")
```

#### 📄 文库搜索 (document)
```
适用：PDF文档、技术报告、白皮书
示例：metaso_search(query="机器学习技术报告", scope="document")
```

#### 🎓 学术搜索 (scholar)
```
适用：学术论文、期刊文章、研究资料
示例：metaso_search(query="CRISPR基因编辑", scope="scholar")
```

#### 🖼️ 图片搜索 (image)
```
适用：图片素材、信息图表
示例：metaso_search(query="深度学习架构图", scope="image")
```

#### 🎬 视频搜索 (video)
```
适用：视频教程、纪录片、演讲
示例：metaso_search(query="Python教程", scope="video")
```

#### 🎙️ 播客搜索 (podcast)
```
适用：音频节目、播客访谈
示例：metaso_search(query="科技播客", scope="podcast")
```

### 2. `metaso_reader` - 网页内容解析

**参数说明：**

| 参数 | 类型 | 必填 | 说明 |
|------|------|------|------|
| `url` | string | ✅ | 要解析的网页URL |

**用途：**
- 解析网页正文内容
- 提取结构化信息
- 获取文章内容

**示例：**
```
metaso_reader(url="https://example.com/article")
```

## 💡 使用示例

### 学术研究
```
用户: "帮我搜索 CRISPR 基因编辑的最新研究"
操作: metaso_search(query="CRISPR基因编辑最新研究", scope="scholar")
```

### 技术文档
```
用户: "找一些 Transformer 架构的技术文档"
操作: metaso_search(query="Transformer架构技术文档", scope="document")
```

### 新闻资讯
```
用户: "搜索今天的人工智能新闻"
操作: metaso_search(query="人工智能新闻", scope="webpage")
```

### 视频学习
```
用户: "找一些 PyTorch 的视频教程"
操作: metaso_search(query="PyTorch教程", scope="video")
```

### 网页解析
```
用户: "帮我解析这个文章的内容"
操作: metaso_reader(url="https://...")
```

## 🎯 搜索策略建议

| 需求 | 推荐类型 | 组合工具 |
|------|----------|----------|
| 快速问答 | 网页搜索 | metaso → 无需其他 |
| 深度调研 | 文库+学术 | metaso(document) → metaso(scholar) |
| 学术论文 | 学术搜索 | metaso(scholar) → arxiv |
| 技术报告 | 文库搜索 | metaso(document) → fxbaogao |
| 学习资源 | 视频+网页 | metaso(video) → metaso(webpage) |

## 🔄 与其他工具组合

### 学术研究流程
```
1. metaso_search(scope="scholar") - 初步文献检索
2. arXiv - 下载论文原文
3. metaso_reader - 解析相关网页
```

### 深度报告流程
```
1. metaso_search(scope="document") - 搜索报告文档
2. fxbaogao - 行业研报补充
3. ali-web-ext - 网页内容提取
```

### 技术学习流程
```
1. metaso_search(scope="video") - 搜索视频教程
2. metaso_search(scope="webpage") - 搜索文字教程
3. metaso_reader - 解析教程内容
```

## 🔧 配置方式

### Claude Desktop 配置
```json
{
  "mcpServers": {
    "metaso": {
      "type": "http",
      "url": "https://metaso.cn/api/mcp",
      "headers": {
        "Authorization": "Bearer YOUR_API_KEY"
      }
    }
  }
}
```

### 本地运行
```bash
# 安装
pip install mcp-metaso

# 或使用 uv
uv pip install mcp-metaso

# 设置 API 密钥
export METASO_API_KEY=your_api_key

# 启动服务
python server.py
```

### DXT 扩展安装（Claude Desktop）
1. 下载 `mcp-metaso-1.1.0.dxt`
2. 双击安装
3. 立即使用

## ✨ 特点优势

### 中文优化
- ✅ 对中文查询深度优化
- ✅ 中文内容理解更准确
- ✅ 支持中文学术文献

### 结果质量
- ✅ 来源可追溯
- ✅ 无广告干扰
- ✅ 信息整合度高

### 多模态支持
- ✅ 文字、图片、视频、音频全覆盖
- ✅ 支持多种文档格式
- ✅ 自动内容解析

## 🎯 触发场景

当用户需要：
- "帮我搜索..."（优先考虑使用秘塔）
- "找一些学术论文..."
- "搜索技术文档..."
- "找视频教程..."
- "解析这个网页..."

## 📚 相关资源

- 官网：https://metaso.cn
- GitHub：https://github.com/HundunOnline/mcp-metaso
- Smithery：https://smithery.ai/server/@HundunOnline/mcp-metaso

---
*mcp-metaso v1.1.0 | MIT License | 支持6种搜索类型*