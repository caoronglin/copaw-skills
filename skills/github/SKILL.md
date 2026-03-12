---
name: github
description: "Interact with GitHub using the `gh` CLI. Use `gh issue`, `gh pr`, `gh run`, and `gh api` for issues, PRs, CI runs, and advanced queries."
triggers:
  - "GitHub"
  - "github"
  - "代码仓库"
  - "开源"
  - "pull request"
  - "issue"
  - "仓库"
  - "代码"
  - "CI/CD"
  - "工作流"
---


# GitHub Skill

使用 `gh` CLI 与 GitHub 交互。当不在 git 目录中时，始终指定 `--repo owner/repo`，或直接使用 URL。

## 🚀 快速开始

### 基本命令
```bash
# 查看仓库信息
gh repo view owner/repo

# 克隆仓库
gh repo clone owner/repo

# 创建新仓库
gh repo create my-new-repo --public --clone
```

### 身份验证
```bash
# 登录 GitHub
gh auth login

# 检查登录状态
gh auth status
```

## 📝 问题 (Issues)

### 创建和管理问题
```bash
# 创建新问题
gh issue create --title "Bug报告" --body "详细描述..." --repo owner/repo

# 列出问题
gh issue list --repo owner/repo --state all

# 查看特定问题
gh issue view 123 --repo owner/repo

# 添加评论
gh issue comment 123 --body "这是修复建议" --repo owner/repo
```

### 问题搜索和过滤
```bash
# 按标签过滤
gh issue list --repo owner/repo --label bug

# 按状态过滤
gh issue list --repo owner/repo --state open

# 按作者过滤
gh issue list --repo owner/repo --author username

# 按分配者过滤
gh issue list --repo owner/repo --assignee username
```

## 🔀 拉取请求 (Pull Requests)

### 创建和管理 PR
```bash
# 创建 PR
gh pr create --title "新功能" --body "详细说明..." --repo owner/repo

# 查看 PR
gh pr view 55 --repo owner/repo

# 列出 PR
gh pr list --repo owner/repo --state all

# 合并 PR
gh pr merge 55 --repo owner/repo --squash

# 检查 CI 状态
gh pr checks 55 --repo owner/repo
```

### PR 审查和评论
```bash
# 添加评论
gh pr comment 55 --body "很好的修改！" --repo owner/repo

# 请求更改
gh pr review 55 --repo owner/repo --request-changes --body "需要修复..."

# 批准 PR
gh pr review 55 --repo owner/repo --approve --body "已批准"
```

## 🏃 持续集成 (CI/CD)

### 查看工作流运行
```bash
# 列出工作流运行
gh run list --repo owner/repo

# 查看特定运行
gh run view <run-id> --repo owner/repo

# 查看失败运行的日志
gh run view <run-id> --repo owner/repo --log-failed

# 重新运行工作流
gh run rerun <run-id> --repo owner/repo
```

### 工作流状态
```bash
# 查看最近运行
gh run list --repo owner/repo --limit 10

# 按状态过滤
gh run list --repo owner/repo --status failure

# 按分支过滤
gh run list --repo owner/repo --branch main
```

## 🛠️ 仓库管理

### 分支操作
```bash
# 创建分支
gh repo create-branch new-feature --base main --repo owner/repo

# 切换分支
gh repo checkout feature-branch --repo owner/repo

# 删除分支
gh repo delete-branch old-feature --repo owner/repo
```

### 发布管理
```bash
# 创建发布
gh release create v1.0.0 --title "版本1.0.0" --notes "新功能..." --repo owner/repo

# 列出发布
gh release list --repo owner/repo

# 查看发布详情
gh release view v1.0.0 --repo owner/repo
```

## 🔧 高级查询 (gh api)

`gh api` 命令用于访问其他子命令无法获取的数据。

### 基本 API 调用
```bash
# 获取仓库信息
gh api repos/owner/repo

# 获取 PR 详情
gh api repos/owner/repo/pulls/55 --jq '.title, .state, .user.login'

# 获取问题详情
gh api repos/owner/repo/issues/123 --jq '.title, .body, .labels[].name'
```

### 使用 jq 处理 JSON
```bash
# 获取所有公开仓库
gh api user/repos --jq '.[] | select(.private == false) | .full_name'

# 获取最近的提交
gh api repos/owner/repo/commits --jq '.[0] | .commit.message, .author.login'

# 统计问题数量
gh api repos/owner/repo/issues --jq 'length'
```

## 📊 JSON 输出

大多数命令支持 `--json` 用于结构化输出。可以使用 `--jq` 进行过滤：

```bash
# 列出问题并格式化输出
gh issue list --repo owner/repo --json number,title,state,createdAt --jq '.[] | "\(.number): \(.title) [\(.state)]"'

# 列出 PR 并格式化
gh pr list --repo owner/repo --json number,title,author,state --jq '.[] | "PR #\(.number): \(.title) by \(.author.login)"'

# 获取工作流运行详情
gh run list --repo owner/repo --json databaseId,workflowName,status,conclusion --jq '.[] | "\(.databaseId): \(.workflowName) - \(.status)"'
```

## 🎯 实用示例

### 示例 1：检查未合并的 PR
```bash
gh pr list --repo owner/repo --state open --json number,title,createdAt --jq '.[] | "PR #\(.number): \(.title) (创建于: \(.createdAt))"'
```

### 示例 2：统计问题
```bash
# 统计开放问题
gh issue list --repo owner/repo --state open --json number | jq length

# 统计按标签分组的问题
gh issue list --repo owner/repo --state all --json labels | jq -r '.[].labels[].name' | sort | uniq -c
```

### 示例 3：自动化工作流
```bash
# 创建问题模板
gh issue create --repo owner/repo --title "Bug: $BUG_TITLE" --body-file bug_template.md

# 批量关闭旧问题
gh issue list --repo owner/repo --state open --json number,createdAt --jq '.[] | select(.createdAt < "2024-01-01") | .number' | xargs -I {} gh issue close {} --repo owner/repo
```

## ⚙️ 配置和提示

### 环境变量
```bash
# 设置默认仓库
export GH_REPO=owner/repo

# 设置输出格式
export GH_OUTPUT=json
```

### 实用提示
1. **使用 `--repo` 参数**：当不在 git 目录时，始终指定仓库
2. **善用 `--json` 和 `--jq`**：用于脚本和自动化
3. **使用 `--web` 打开网页**：`gh pr view 55 --web` 在浏览器中打开
4. **使用分页**：`--limit 100` 获取更多结果
5. **利用别名**：创建常用命令的别名

### 常见问题
**Q: 如何在没有 git 目录的情况下使用 gh？**
A: 始终使用 `--repo owner/repo` 参数指定仓库。

**Q: 如何批量处理问题？**
A: 结合 `gh issue list --json` 和 `jq` 进行过滤，然后使用 `xargs` 处理。

**Q: 如何查看命令的完整选项？**
A: 使用 `gh issue --help` 查看特定命令的帮助信息。

## 📚 学习资源
```bash
# 查看帮助
gh help
gh issue --help
gh pr --help

# 查看版本
gh --version
```

GitHub CLI 文档：https://cli.github.com/manual/
GitHub REST API 文档：https://docs.github.com/en/rest