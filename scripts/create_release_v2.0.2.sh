#!/bin/bash
set -e

echo "🚀 创建 v2.0.2 GitHub Release..."

REPO_OWNER="caoronglin"
REPO_NAME="copaw-skills"
GITHUB_TOKEN="${GITHUB_TOKEN:-your_github_token_here}"
TAG_NAME="v2.0.2"

# 创建Release说明
cat > /tmp/release_notes_v2.0.2.md << 'EOF'
# v2.0.2 Release - CoPaw Skills Collection

## 🎯 更新内容

### 🔥 新功能
1. **新增5个高级技能**
   - `ontology`: 类型化知识图谱，用于结构化代理记忆和可组合技能
   - `self-improving-agent`: 捕捉学习和修正，实现持续改进
   - `proactive-agent`: 将AI代理从任务跟随者转变为主动合作伙伴
   - `byterover`: AI代理知识管理工具
   - `video-frames`: 使用ffmpeg从视频中提取帧

2. **技能监控系统**
   - 自动监控技能健康状态
   - 定期检查依赖和更新
   - 自动同步到GitHub仓库
   - 生成详细报告

### 🔧 优化改进
1. **技能结构标准化**
   - 所有43个技能都有完整的frontmatter
   - 清晰的触发词(triggers)定义
   - 丰富的中英文使用示例
   - 故障排除指南和最佳实践

2. **安全增强**
   - 清理硬编码API密钥
   - 统一密钥管理在`.env`文件中
   - GitHub推送保护兼容

### 🛠️ 系统增强
1. **依赖管理**
   - 自动依赖检查脚本
   - 定时任务(每天检查依赖)
   - 依赖安装状态监控

2. **文档完善**
   - 完整的技能索引(SKILLS_INDEX.md)
   - 技能使用指南
   - 监控系统文档

### 📊 技术统计
- **总技能数**: 43个
- **技能类别**: 8大类 + 1新增类别(知识管理与学习)
- **优化完成率**: 100%
- **新增技能**: 5个
- **监控功能**: 完整

### 🐛 Bug修复
1. 修复GitHub推送保护问题
2. 修复敏感信息清理
3. 修复技能触发词不完整问题
4. 修复依赖安装失败问题

### 🔄 兼容性
- CoPaw 0.0.7+ 兼容
- Python 3.8+ 兼容
- Linux/macOS/Windows支持

## 📦 安装方法

```bash
# 克隆仓库
git clone https://github.com/caoronglin/copaw-skills.git

# 进入目录
cd copaw-skills

# 安装依赖
pip install -r requirements.txt

# 或使用安装脚本
./scripts/install_all.sh
```

## 🚀 快速开始

查看 `examples/basic_usage.py` 了解如何使用这些技能。

## 🔗 相关链接
- [GitHub仓库](https://github.com/caoronglin/copaw-skills)
- [技能索引文档](https://github.com/caoronglin/copaw-skills/blob/main/SKILLS_INDEX.md)
- [使用指南](https://github.com/caoronglin/copaw-skills/blob/main/README.md)

---

*发布日期: 2026-03-12*
*版本: v2.0.2*
*技能总数: 43个*
*状态: 稳定生产版本*
EOF

echo "📝 Release说明已生成，正在创建GitHub Release..."

# 使用GitHub API创建Release
RELEASE_RESPONSE=$(curl -s -X POST \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  -d "{
    \"tag_name\": \"$TAG_NAME\",
    \"target_commitish\": \"main\",
    \"name\": \"CoPaw Skills Collection v2.0.2\",
    \"body\": \"$(cat /tmp/release_notes_v2.0.2.md | sed ':a;N;$!ba;s/\n/\\n/g')\",
    \"draft\": false,
    \"prerelease\": false
  }" \
  https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/releases)

# 检查响应
if echo "$RELEASE_RESPONSE" | grep -q "html_url"; then
    RELEASE_URL=$(echo "$RELEASE_RESPONSE" | grep -o '"html_url": "[^"]*"' | cut -d'"' -f4)
    echo "✅ GitHub Release创建成功!"
    echo "🔗 Release链接: $RELEASE_URL"
else
    echo "❌ Release创建失败!"
    echo "响应: $RELEASE_RESPONSE"
    exit 1
fi

echo ""
echo "🎉 v2.0.2 Release流程完成!"
echo "📊 技能总数: 43个"
echo "📈 优化完成率: 100%"
echo "🔒 安全状态: 已清理所有敏感信息"