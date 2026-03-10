# 🛠️ CoPaw Skills 维护指南

## 📋 目录

- [快速推送](#快速推送)
- [添加新 Skill](#添加新-skill)
- [更新现有 Skill](#更新现有-skill)
- [版本发布](#版本发布)
- [常见问题](#常见问题)

---

## 🚀 快速推送

### 方法 1：使用自动推送脚本（推荐）

```bash
cd /mnt/workspace/.copaw/cache-2026-03-10/copaw-skills

# 赋予执行权限（首次）
chmod +x push.sh

# 推送更改
./push.sh "更新说明"
```

### 方法 2：手动推送

```bash
cd /mnt/workspace/.copaw/cache-2026-03-10/copaw-skills

# 查看更改
git status

# 添加所有更改
git add -A

# 提交
git commit -m "更新说明"

# 推送
git push origin main
```

### 方法 3：对 AI 说

> "帮我把 copaw-skills 的更改推送到 GitHub"

AI 会自动执行推送流程。

---

## 📦 添加新 Skill

### 步骤 1：复制 Skill 到仓库

```bash
# 从 active_skills 复制
cp -r /mnt/workspace/.copaw/active_skills/新技能 \
      /mnt/workspace/.copaw/cache-2026-03-10/copaw-skills/skills/
```

### 步骤 2：安全检查

```bash
cd /mnt/workspace/.copaw/cache-2026-03-10/copaw-skills

# 检查是否有硬编码密钥
grep -r "sk-" skills/新技能 --include="*.py"
grep -r "ghp_" skills/新技能 --include="*.py"
grep -r "token" skills/新技能 --include="*.py"
```

### 步骤 3：更新文档

编辑 `README.md`，在 Skills 清单中添加新技能。

### 步骤 4：推送

```bash
./push.sh "Add new skill: 新技能名称"
```

---

## 🔄 更新现有 Skill

### 步骤 1：从工作区同步

```bash
# 复制更新后的文件
cp /mnt/workspace/.copaw/active_skills/技能名/SKILL.md \
   /mnt/workspace/.copaw/cache-2026-03-10/copaw-skills/skills/技能名/
```

### 步骤 2：验证更改

```bash
cd /mnt/workspace/.copaw/cache-2026-03-10/copaw-skills

# 查看差异
git diff skills/技能名/
```

### 步骤 3：推送

```bash
./push.sh "Update skill: 技能名 - 更新说明"
```

---

## 🏷️ 版本发布

### 创建新版本

```bash
# 1. 更新版本号（如果需要）
# 编辑相关文档

# 2. 提交所有更改
./push.sh "Prepare for release vX.X.X"

# 3. 创建 Git 标签
git tag -a "vX.X.X" -m "Release vX.X.X"

# 4. 推送标签
git push origin --tags

# 5. 创建 GitHub Release（用 curl 或网页）
```

### 使用 GitHub UI 创建 Release

1. 访问 https://github.com/caoronglin/copaw-skills/releases
2. 点击 "Draft a new release"
3. 选择标签或创建新标签
4. 填写版本说明
5. 点击 "Publish release"

### 使用 API 创建 Release

```bash
curl -X POST https://api.github.com/repos/caoronglin/copaw-skills/releases \
  -H "Authorization: token YOUR_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  -d '{
    "tag_name": "vX.X.X",
    "target_commitish": "main",
    "name": "vX.X.X - Release Title",
    "body": "Release notes...",
    "draft": false,
    "prerelease": false
  }'
```

---

## 📊 版本命名规范

遵循 [Semantic Versioning](https://semver.org/)：

- **MAJOR.MINOR.PATCH** (例如：1.0.0)
- **MAJOR**: 不兼容的 API 变更
- **MINOR**: 向后兼容的功能新增
- **PATCH**: 向后兼容的问题修复

### 示例

```
v1.0.0 - 初始发布
v1.0.1 - 修复 bug
v1.1.0 - 新增技能
v2.0.0 - 重大更新
```

---

## 🔍 常见问题

### Q1: 推送失败怎么办？

**A**: 检查以下几点：
1. 网络连接是否正常
2. Git 远程仓库配置是否正确
3. Token 是否有效
4. 是否有权限推送

```bash
# 检查远程配置
git remote -v

# 测试连接
git ls-remote origin

# 更新 token（如果需要）
git remote set-url origin https://caoronglin:NEW_TOKEN@github.com/caoronglin/copaw-skills.git
```

### Q2: 如何撤销提交？

**A**: 
```bash
# 撤销最后一次提交（保留更改）
git reset --soft HEAD~1

# 撤销最后一次提交（丢弃更改）
git reset --hard HEAD~1

# 已经推送？创建反向提交
git revert HEAD
git push origin main
```

### Q3: 如何合并多个小提交？

**A**:
```bash
# 交互式 rebase
git rebase -i HEAD~3

# 在编辑器中调整 commit 顺序，将 pick 改为 squash
```

### Q4: CI/CD 失败怎么办？

**A**: 
1. 访问 https://github.com/caoronglin/copaw-skills/actions
2. 点击失败的 workflow
3. 查看具体错误信息
4. 根据错误修复代码

常见错误：
- **语法错误**: 运行 `black .` 格式化代码
- **导入错误**: 检查 `requirements.txt` 是否包含所有依赖
- **测试失败**: 修复测试或更新测试期望

### Q5: 如何检查硬编码密钥？

**A**:
```bash
cd /mnt/workspace/.copaw/cache-2026-03-10/copaw-skills

# 搜索常见密钥模式
grep -r "sk-" skills/ --include="*.py"
grep -r "ghp_" skills/ --include="*.py"
grep -r "token.*=" skills/ --include="*.py"
grep -r "api_key.*=" skills/ --include="*.py"

# 应该都使用 os.getenv()
grep -r "os.getenv" skills/ --include="*.py"
```

---

## 📝 提交信息规范

遵循 [Conventional Commits](https://www.conventionalcommits.org/)：

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

### 类型 (Type)

- `feat`: 新功能
- `fix`: 修复 bug
- `docs`: 文档更新
- `style`: 代码格式（不影响功能）
- `refactor`: 重构
- `test`: 测试相关
- `chore`: 构建/工具/配置

### 示例

```
feat(skills): add new biomcp skill
fix(ci): resolve GitHub Actions timeout
docs(readme): update installation guide
refactor(weather): improve error handling
chore(deps): update requirements.txt
```

---

## 🔧 自动化脚本

### 定期同步脚本

创建 `sync.sh`：

```bash
#!/bin/bash
# 定期同步 active_skills 到仓库

SOURCE="/mnt/workspace/.copaw/active_skills"
DEST="/mnt/workspace/.copaw/cache-2026-03-10/copaw-skills/skills"

rsync -av --delete "$SOURCE/" "$DEST/"

cd "$DEST/.."
./push.sh "Sync skills from active_skills"
```

### 定时任务

```bash
# 每天凌晨 2 点同步
0 2 * * * /mnt/workspace/.copaw/cache-2026-03-10/copaw-skills/sync.sh
```

---

## 📈 维护清单

### 每周
- [ ] 检查是否有 skills 更新
- [ ] 查看 GitHub Issues
- [ ] 检查 CI/CD 状态

### 每月
- [ ] 更新依赖版本
- [ ] 检查安全漏洞
- [ ] 整理文档

### 每季度
- [ ] 发布新版本
- [ ] 清理旧版本标签
- [ ] 统计使用数据

---

## 🔗 有用链接

- **仓库**: https://github.com/caoronglin/copaw-skills
- **Actions**: https://github.com/caoronglin/copaw-skills/actions
- **Releases**: https://github.com/caoronglin/copaw-skills/releases
- **Issues**: https://github.com/caoronglin/copaw-skills/issues

---

**最后更新**: 2026-03-10  
**维护者**: CoPaw Team
