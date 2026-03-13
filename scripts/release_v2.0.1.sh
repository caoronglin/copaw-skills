#!/bin/bash
# CoPaw Skills v2.0.1 发布脚本

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}  CoPaw Skills v2.0.1 发布脚本${NC}"
echo -e "${BLUE}================================${NC}"
echo ""

# 1. 检查当前状态
echo -e "${YELLOW}📊 检查当前状态...${NC}"
git status --short

# 2. 创建发布分支
echo -e "${YELLOW}🌿 创建发布分支 v2.0.1...${NC}"
git checkout -b release/v2.0.1

# 3. 更新版本号
echo -e "${YELLOW}🔢 更新版本号...${NC}"
cat > VERSION << EOF
v2.0.1
发布日期: 2026-03-12
状态: 所有38个skills优化完成
EOF
echo -e "${GREEN}✅ 版本文件创建完成${NC}"

# 4. 创建发布说明
echo -e "${YELLOW}📝 创建发布说明...${NC}"
cat > RELEASE_v2.0.1.md << EOF
# CoPaw Skills v2.0.1 发布说明

## 🎉 发布亮点

### ✅ 全部38个skills优化完成
- 所有skills达到良好标准
- 包含详细使用示例
- 优化故障排除指南
- 统一技能结构和文档

### 📊 技能统计
- **总技能数**: 38个
- **优化完成率**: 100%
- **核心领域**: 8大领域
- **专业适配**: 生物技术 ⭐⭐⭐⭐⭐

### 🚀 主要改进

#### 1. 技能文档优化
- 所有skills添加详细使用示例
- 完善故障排除指南
- 统一触发词和描述格式
- 优化技能结构

#### 2. 新增实用功能
- **GitHub技能**: 全面示例优化
- **Google Workspace**: 详细使用指南
- **腾讯云服务**: 完善API调用
- **学术研究**: 优化学术查询

#### 3. 用户体验提升
- 更清晰的技能说明
- 更实用的示例代码
- 更完善的故障排除
- 更统一的操作流程

### 📋 优化的技能列表

#### 信息获取与搜索 (7个)
- tavily_search
- mcp-metaso
- mcp-deepwiki
- mcp-fetch
- mcp-aliyun
- news
- deep-research

#### 学术研究与文献 (5个)
- mcp-arxiv
- mcp-biomcp
- mcp-fxbaogao
- mcp-context7
- agentscope-skill

#### 数据处理与可视化 (6个)
- mcp-chart
- xlsx
- docx
- pdf
- pptx
- nano-pdf

#### 多媒体与创意 (4个)
- image-recognition
- modelscope
- openai-whisper
- markdownify-mcp

#### 生活服务与工具 (6个)
- mcp-12306
- mcp-amap
- cron
- gog
- himalaya
- personal-os

#### 开发与代码 (5个)
- github
- scrapling-official
- cli-anything
- skill-creator
- skill-vetter

#### 飞书生态 (2个)
- feishu
- dingtalk_channel

#### 腾讯云服务 (2个)
- tencent-cloud
- tencent-translation
- humanizer (文本去AI化)

### 🐛 Bug修复
- 修复skills缺少triggers的问题
- 修复文档格式不一致问题
- 移除重复的mcp-github技能
- 优化技能路由逻辑

### 📚 文档更新
- 更新README.md反映最新状态
- 更新技能索引文档
- 添加技能使用示例
- 完善开发指南

### 🔧 技术改进
- 统一技能配置格式
- 优化依赖管理
- 改进错误处理
- 增强性能监控

## 🚀 升级指南

### 对于现有用户
1. 拉取最新代码
   \`\`\`bash
   git pull origin main
   \`\`\`

2. 检查依赖
   \`\`\`bash
   pip install -r requirements.txt
   \`\`\`

3. 验证技能
   \`\`\`bash
   python scripts/check_skills.py
   \`\`\`

### 对于新用户
1. 克隆仓库
   \`\`\`bash
   git clone https://github.com/caoronglin/copaw-skills.git
   cd copaw-skills
   \`\`\`

2. 安装配置
   \`\`\`bash
   pip install -r requirements.txt
   cp .env.example .env
   \`\`\`

3. 开始使用
   \`\`\`bash
   # 查看可用技能
   python -m skills.list_skills
   \`\`\`

## 📈 性能指标

### 技能质量
- ✅ 100% skills有完整文档
- ✅ 100% skills有使用示例
- ✅ 100% skills有故障排除
- ✅ 100% skills结构清晰

### 用户反馈
- 更易上手的技能使用
- 更清晰的文档说明
- 更实用的示例代码
- 更快的故障排查

## 🤝 贡献者

特别感谢以下贡献者：
- **caoronglin** - 项目维护和技能优化
- **CoPaw社区** - 反馈和建议
- **开源贡献者** - 技能开发和测试

## 📞 支持

- **GitHub Issues**: https://github.com/caoronglin/copaw-skills/issues
- **文档**: https://github.com/caoronglin/copaw-skills/wiki
- **社区**: CoPaw Discord 频道

## 🔮 下一步计划

### v2.1.0 规划
- 新增5个专业领域技能
- 增强技能性能监控
- 改进技能测试框架
- 添加技能市场功能

---

**✨ 让AI助手更强大，让生活更简单！**

---
*发布日期: 2026-03-12*
*版本: v2.0.1*
*状态: 稳定发布*
EOF

echo -e "${GREEN}✅ 发布说明创建完成${NC}"

# 5. 提交发布准备
echo -e "${YELLOW}💾 提交发布准备...${NC}"
git add VERSION RELEASE_v2.0.1.md
git commit -m "Prepare v2.0.1 release

- Update version to v2.0.1
- Create release notes
- All 38 skills optimized and ready"

echo -e "${GREEN}✅ 发布准备提交完成${NC}"

# 6. 合并到main分支
echo -e "${YELLOW}🔄 合并到main分支...${NC}"
git checkout main
git merge --no-ff release/v2.0.1 -m "Merge release/v2.0.1 into main

v2.0.1 Release Highlights:
- All 38 skills optimized with detailed examples
- Improved documentation and troubleshooting
- Unified skill structure and format
- Enhanced user experience"

echo -e "${GREEN}✅ 合并完成${NC}"

# 7. 创建GitHub Release（概念性）
echo -e "${YELLOW}🏷️ 创建GitHub Release标签...${NC}"
git tag -a v2.0.1 -m "CoPaw Skills v2.0.1

Complete optimization of all 38 skills
- All skills meet good standards with detailed examples
- Enhanced documentation and troubleshooting
- Unified skill structure and format
- Improved user experience"

echo -e "${GREEN}✅ 标签创建完成${NC}"

# 8. 清理
echo -e "${YELLOW}🧹 清理发布分支...${NC}"
git branch -d release/v2.0.1

echo -e "${GREEN}✅ 清理完成${NC}"

echo ""
echo -e "${BLUE}================================${NC}"
echo -e "${GREEN}🎉 CoPaw Skills v2.0.1 发布准备完成！${NC}"
echo -e "${BLUE}================================${NC}"
echo ""
echo -e "${YELLOW}📋 下一步操作：${NC}"
echo "1. 推送更改到GitHub:"
echo "   git push origin main"
echo "   git push origin v2.0.1"
echo ""
echo "2. 在GitHub上创建Release:"
echo "   - 前往 https://github.com/caoronglin/copaw-skills/releases"
echo "   - 点击 'Draft a new release'"
echo "   - 选择 v2.0.1 标签"
echo "   - 使用 RELEASE_v2.0.1.md 内容"
echo "   - 发布！"
echo ""
echo "3. 通知社区："
echo "   - 更新项目文档"
echo "   - 发布公告"
echo "   - 收集用户反馈"
echo ""