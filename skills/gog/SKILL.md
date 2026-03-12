---
name: gog
description: "Google Workspace CLI for Gmail, Calendar, Drive, Contacts, Sheets, and Docs. 提供对Google Workspace服务的命令行访问。"
triggers:
  - "Google"
  - "谷歌"
  - "Gmail"
  - "Google Calendar"
  - "Google Drive"
  - "Google Sheets"
  - "Google Docs"
  - "谷歌日历"
  - "谷歌邮箱"
homepage: https://gogcli.sh
metadata: {"clawdbot":{"emoji":"🎮","requires":{"bins":["gog"]},"install":[{"id":"brew","kind":"brew","formula":"steipete/tap/gogcli","bins":["gog"],"label":"Install gog (brew)"}]}}
---


# Google Workspace CLI (gog)

使用 `gog` 命令行工具管理 Gmail、日历、云盘、通讯录、表格和文档。需要 OAuth 2.0 授权设置。

## 🚀 快速开始

### 1. 首次设置
```bash
# 初始化配置
gog auth login

# 选择Google账户
gog auth login --account your@gmail.com

# 设置默认账户环境变量
export GOG_ACCOUNT=your@gmail.com
```

### 2. 验证登录状态
```bash
# 查看当前账户
gog auth status

# 列出已授权的账户
gog auth list
```

## 📧 Gmail 邮箱管理

### 邮箱操作
```bash
# 列出最近邮件
gog mail list --limit 10

# 搜索邮件
gog mail list --query "subject:重要 from:boss"

# 阅读邮件
gog mail cat <message-id>

# 发送邮件
gog mail send --to recipient@example.com --subject "测试邮件" --body "邮件内容"

# 带有附件的邮件
gog mail send --to recipient@example.com --subject "带附件" --body "请看附件" --attach /path/to/file.pdf
```

### 邮件批量操作
```bash
# 标记为已读
gog mail mark-read <message-id>

# 移动到标签/文件夹
gog mail move <message-id> --to INBOX/Important

# 删除邮件
gog mail delete <message-id>
```

## 📅 日历管理

### 事件操作
```bash
# 列出未来事件
gog calendar events --limit 10

# 创建事件
gog calendar create --summary "团队会议" --start "2024-03-15T10:00:00" --end "2024-03-15T11:00:00" --attendees "user1@example.com,user2@example.com"

# 查看特定事件
gog calendar cat <event-id>

# 更新事件
gog calendar update <event-id> --description "更新的会议说明"

# 删除事件
gog calendar delete <event-id>
```

### 日历查询
```bash
# 指定时间范围
gog calendar events --start "2024-03-01" --end "2024-03-31"

# 按日历名称过滤
gog calendar events --calendar primary

# 格式化输出
gog calendar events --limit 5 --format json
```

## 📁 Google Drive 云盘

### 文件操作
```bash
# 列出文件
gog drive list --limit 20

# 搜索文件
gog drive list --query "name contains '报告'"

# 查看文件详情
gog drive cat <file-id>

# 下载文件
gog drive download <file-id> --out /local/path/file.pdf

# 上传文件
gog drive upload /local/file.pdf --name "上传的文件.pdf"

# 创建文件夹
gog drive mkdir "新文件夹名称"
```

### 文件权限管理
```bash
# 分享文件
gog drive share <file-id> --role reader --type user --email user@example.com

# 列出文件权限
gog drive permissions <file-id>
```

## 📊 Google Sheets 表格

### 表格操作
```bash
# 列出表格
gog sheets list

# 创建新表格
gog sheets create --title "新表格"

# 查看表格数据
gog sheets cat <sheet-id>

# 更新单元格
gog sheets update <sheet-id> --range "A1:B10" --values-json '[["数据1","数据2"],["数据3","数据4"]]'

# 获取表格元数据
gog sheets metadata <sheet-id> --json
```

### 数据操作示例
```bash
# 添加数据到表格
gog sheets append <sheet-id> --range "Sheet1!A:A" --values-json '["新行数据1","新行数据2"]'

# 读取特定范围
gog sheets values <sheet-id> --range "Sheet1!A1:C10" --json
```

## 📝 Google Docs 文档

### 文档操作
```bash
# 列出文档
gog docs list

# 创建新文档
gog docs create --title "新文档"

# 查看文档内容
gog docs cat <doc-id>

# 导出文档
gog docs export <doc-id> --format txt --out /tmp/doc.txt
gog docs export <doc-id> --format pdf --out /tmp/doc.pdf
gog docs export <doc-id> --format html --out /tmp/doc.html

# 复制文档
gog docs copy <doc-id> --title "文档副本"
```

## 📇 通讯录管理

### 联系人操作
```bash
# 列出联系人
gog contacts list

# 搜索联系人
gog contacts list --query "张三"

# 添加联系人
gog contacts create --name "李四" --email "lisi@example.com" --phone "+861234567890"

# 更新联系人
gog contacts update <contact-id> --company "ABC公司"
```

## ⚙️ 配置与实用提示

### 环境变量
```bash
# 设置默认账户
export GOG_ACCOUNT=your@gmail.com

# 设置默认输出格式
export GOG_FORMAT=json

# 禁用交互提示（用于脚本）
export GOG_NO_INPUT=1
```

### 实用技巧
1. **批量处理**：使用 `--json` 输出结合 `jq` 处理
2. **自动化脚本**：设置 `--no-input` 避免交互提示
3. **数据格式化**：使用 `--values-json` 传递结构化数据
4. **身份验证缓存**：登录后凭据会缓存，无需重复登录

### 常见用例
```bash
# 自动化邮件发送
echo "邮件内容" | gog mail send --to list@example.com --subject "每日报告" --body -

# 批量导出日历事件
gog calendar events --start "2024-01-01" --end "2024-12-31" --format json > calendar_events.json

# 同步文件夹到云端
find /local/path -name "*.pdf" | xargs -I {} gog drive upload {} --name "$(basename {})"
```

## 🚨 注意事项

1. **OAuth 授权**：首次使用需要浏览器完成授权流程
2. **敏感操作确认**：发送邮件、创建事件等操作会请求确认
3. **API 限制**：Google API 有调用频率限制
4. **文件大小限制**：Drive 上传有文件大小限制
5. **文档编辑限制**：gog 不支持文档内联编辑，仅支持导出/复制

## 📚 学习资源
```bash
# 查看帮助
gog --help
gog mail --help
gog calendar --help

# 查看版本
gog version
```

**官方文档**：
- gog CLI: https://gogcli.sh
- Google Workspace API: https://developers.google.com/workspace

**相关技能**：
- `himalaya`: 其他邮箱的 IMAP/SMTP 管理
- `feishu`: 飞书工作空间管理
- `personal-os`: 个人操作系统集成