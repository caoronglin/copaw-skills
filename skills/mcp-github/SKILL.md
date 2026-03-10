---
name: MCP GitHub
description: GitHub官方MCP服务，提供仓库搜索、文件读取、Issue管理、PR操作、代码搜索等GitHub全功能操作。当用户需要搜索GitHub仓库、查看代码、管理Issue/PR、搜索代码实现时使用此技能。
triggers:
  - "GitHub"
  - "仓库"
  - "Issue"
  - "PR"
  - "代码搜索"
  - "grep"
mcp:
  type: local
  command: ["docker", "run", "-i", "--rm", "-e", "GITHUB_PERSONAL_ACCESS_TOKEN", "ghcr.io/github/github-mcp-server"]
---

# GitHub MCP 技能（整合版）

整合GitHub官方操作 + 代码搜索能力，一站式GitHub服务。

## 🚀 核心功能

### 📦 仓库操作
- 搜索仓库、查看仓库信息
- 读取文件内容、目录结构
- Fork、Star、Watch操作

### 🔍 代码搜索（gh_grep）
- **跨仓库搜索**：搜索数百万GitHub仓库中的代码
- **实现查找**：找函数实现、API使用示例
- **语言过滤**：Python, JavaScript, Java, Go等100+语言
- **高级过滤**：按仓库、语言、文件路径筛选

### 🐛 Issue管理
- 创建、查看、更新、关闭Issue
- 添加标签、分配负责人
- 评论和互动

### 🔀 PR操作
- 创建、查看、合并Pull Request
- 代码审查、评论
- 冲突解决

### 📁 文件操作
- 读取仓库文件内容
- 创建、更新、删除文件
- 目录浏览

## 🔧 工具对比

| 功能 | GitHub官方API | gh_grep代码搜索 |
|------|--------------|----------------|
| 仓库操作 | ✅ | ❌ |
| Issue/PR | ✅ | ❌ |
| 单仓库代码 | ✅ | ❌ |
| 跨仓库搜索 | ❌ | ✅ |
| 实现查找 | ❌ | ✅ |

**最佳实践：**
- 查看特定仓库 → 用GitHub官方工具
- 搜索代码实现 → 用gh_grep
- 找API使用示例 → 用gh_grep

## 💡 使用示例

### 1. 搜索代码实现
```
用户: "找一下Python的HTTP请求实现"
操作: gh_grep搜索 "requests.get" 语言:Python
```

### 2. 查看仓库文件
```
用户: "看看某个仓库的README"
操作: get_file_contents(owner, repo, "README.md")
```

### 3. 搜索特定仓库的代码
```
用户: "在tensorflow仓库里搜convolution"
操作: gh_grep搜索 "convolution" 仓库:tensorflow/tensorflow
```

### 4. 管理Issue
```
用户: "帮我创建一个Issue"
操作: create_issue(owner, repo, title, body)
```

## 📋 触发场景

- 用户提到GitHub、仓库、Issue、PR
- 需要搜索代码实现、API使用示例
- 需要查看或操作GitHub仓库

## 🌐 相关资源

- GitHub MCP: https://github.com/github/github-mcp-server
- grep.app: https://grep.app
- MCP端点: https://mcp.grep.app

---
*GitHub MCP + gh_grep | 一站式GitHub服务*