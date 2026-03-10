#!/bin/bash
# CoPaw Skills 自动推送脚本
# 用法：./push.sh [commit_message]

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 配置
REPO_DIR="/mnt/workspace/.copaw/cache-2026-03-10/copaw-skills"
REMOTE="origin"
BRANCH="main"

# 切换到仓库目录
cd "$REPO_DIR"

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}  CoPaw Skills 自动推送脚本${NC}"
echo -e "${BLUE}================================${NC}"
echo ""

# 检查 Git 状态
echo -e "${YELLOW}📊 检查 Git 状态...${NC}"
git status --short

if [ -z "$(git status --short)" ]; then
    echo -e "${GREEN}✅ 没有需要提交的更改${NC}"
    exit 0
fi

echo ""

# 获取提交信息
if [ -n "$1" ]; then
    COMMIT_MSG="$1"
else
    echo -e "${YELLOW}📝 输入提交信息 (默认: 'Update skills'):${NC}"
    read -r COMMIT_MSG
    if [ -z "$COMMIT_MSG" ]; then
        COMMIT_MSG="Update skills"
    fi
fi

echo ""

# 添加所有更改
echo -e "${YELLOW}📦 添加所有更改...${NC}"
git add -A
echo -e "${GREEN}✅ 添加完成${NC}"
echo ""

# 提交
echo -e "${YELLOW}💾 提交更改...${NC}"
git commit -m "$COMMIT_MSG"
echo -e "${GREEN}✅ 提交完成${NC}"
echo ""

# 推送前检查
echo -e "${YELLOW}🔍 检查远程连接...${NC}"
if ! git remote -v | grep -q "$REMOTE"; then
    echo -e "${RED}❌ 远程仓库 $REMOTE 未配置${NC}"
    echo "请运行：git remote add origin <your-repo-url>"
    exit 1
fi
echo -e "${GREEN}✅ 远程连接正常${NC}"
echo ""

# 推送
echo -e "${YELLOW}🚀 推送到 GitHub...${NC}"
if git push "$REMOTE" "$BRANCH"; then
    echo -e "${GREEN}✅ 推送成功！${NC}"
    echo ""
    echo -e "${BLUE}================================${NC}"
    echo -e "${GREEN}🎉 完成！${NC}"
    echo -e "${BLUE}================================${NC}"
    echo ""
    echo "📝 提交信息：$COMMIT_MSG"
    echo "🔗 仓库地址：https://github.com/caoronglin/copaw-skills"
    echo "📊 查看提交：https://github.com/caoronglin/copaw-skills/commits/main"
else
    echo -e "${RED}❌ 推送失败${NC}"
    echo "请检查网络连接或手动推送"
    exit 1
fi
