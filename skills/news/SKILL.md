---
name: news
description: "Look up the latest news for the user from specified news sites. Provides authoritative URLs for politics, finance, society, world, tech, sports, and entertainment. Use browser_use to open each URL and snapshot to get content, then summarize for the user."
triggers:
  - "新闻"
  - "news"
  - "资讯"
  - "最新消息"
  - "时事"
metadata:
  {
    "copaw":
      {
        "emoji": "📰",
        "requires": {}
      }
  }
---


# News Reference

When the user asks for "latest news", "what's in the news today", or "news in category X", use the **browser_use** tool with the categories and URLs below: open the page, take a snapshot, then extract headlines and key points from the page content and reply to the user.

## Categories and Sources

| Category      | Source                    | URL |
|---------------|---------------------------|-----|
| **Politics**  | People's Daily · CPC News | https://cpc.people.com.cn/ |
| **Finance**   | China Economic Net        | http://www.ce.cn/ |
| **Society**   | China News · Society      | https://www.chinanews.com/society/ |
| **World**     | CGTN                      | https://www.cgtn.com/ |
| **Tech**      | Science and Technology Daily | https://www.stdaily.com/ |
| **Sports**    | CCTV Sports               | https://sports.cctv.com/ |
| **Entertainment** | Sina Entertainment   | https://ent.sina.com.cn/ |

## How to Use (browser_use)

1. **Clarify the user's need**: Determine which category or categories (politics / finance / society / world / tech / sports / entertainment), or pick 1–2 to fetch.
2. **Pick the URL**: Use the URL from the table for that category; for multiple categories, repeat the steps below for each URL.
3. **Open the page**: Call **browser_use** with:
   ```json
   {"action": "open", "url": "https://www.chinanews.com/society/"}
   ```
   Replace `url` with the corresponding URL from the table.
4. **Take a snapshot**: In the same session, call **browser_use** again:
   ```json
   {"action": "snapshot"}
   ```
   Extract headlines, dates, and summaries from the returned page content.
5. **Summarize the reply**: Organize a short list (headline + one or two sentences + source) by time or importance; if a site is unreachable or times out, say so and suggest another source.

## Notes

- Page structure may change when sites are updated; if extraction fails, say so and suggest the user open the link directly.
- When visiting multiple categories, run `open` for each URL, then `snapshot`, to avoid mixing content from different pages.
- You may include the original link in the reply so the user can open it.

---

## 🎯 实用示例

### 示例1：获取特定类别新闻
**用户请求**: "给我看看最新的科技新闻"

**操作步骤**:
```bash
# 1. 打开科技新闻网站
browser_use {"action": "open", "url": "https://www.stdaily.com/"}

# 2. 获取页面快照
browser_use {"action": "snapshot"}

# 3. 从快照内容中提取新闻标题和摘要
# 根据页面结构提取信息，例如：
# - 查找包含"h1", "h2", "h3"标签的新闻标题
# - 查找包含时间信息的元素
# - 提取新闻摘要或前几段内容
```

**预期输出格式**:
```
📰 科技新闻摘要 (来源: 科技日报)

1. **我国成功发射新一代通信卫星**
   时间: 2024-03-12 08:30
   摘要: 今日凌晨，我国在西昌卫星发射中心成功发射了新一代高通量通信卫星，将显著提升国内通信网络覆盖能力。
   链接: https://www.stdaily.com/article/12345

2. **人工智能助力医疗诊断取得新突破**
   时间: 2024-03-11 14:20
   摘要: 国内研究团队开发的新型AI医疗诊断系统，在肺癌早期筛查中准确率达到98.7%，比传统方法提高15%。
   链接: https://www.stdaily.com/article/12346

3. **新能源汽车电池技术获重要进展**
   时间: 2024-03-10 10:15
   摘要: 我国自主研发的固态电池技术实现量产突破，续航里程提升40%，充电时间缩短至15分钟。
   链接: https://www.stdaily.com/article/12347
```

### 示例2：获取多个类别新闻
**用户请求**: "看看今天的社会和财经新闻"

**操作步骤**:
```bash
# 1. 打开社会新闻网站
browser_use {"action": "open", "url": "https://www.chinanews.com/society/"}
browser_use {"action": "snapshot"}

# 2. 打开财经新闻网站  
browser_use {"action": "open", "url": "http://www.ce.cn/"}
browser_use {"action": "snapshot"}
```

### 示例3：自动化新闻摘要脚本
```bash
#!/bin/bash
# 每日新闻摘要自动化脚本
OUTPUT_FILE="daily_news_summary_$(date +%Y%m%d).md"

echo "# 📰 每日新闻摘要 $(date '+%Y年%m月%d日 %H:%M')" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# 定义新闻类别和URL
declare -A news_sources=(
    ["politics"]="https://cpc.people.com.cn/"
    ["finance"]="http://www.ce.cn/"
    ["society"]="https://www.chinanews.com/society/"
    ["world"]="https://www.cgtn.com/"
    ["tech"]="https://www.stdaily.com/"
    ["sports"]="https://sports.cctv.com/"
    ["entertainment"]="https://ent.sina.com.cn/"
)

# 获取新闻类别参数，默认为所有类别
categories=${1:-"politics finance society world tech sports entertainment"}

for category in $categories; do
    if [[ -n "${news_sources[$category]}" ]]; then
        url="${news_sources[$category]}"
        
        echo "## 🏷️ $(echo $category | tr 'a-z' 'A-Z') 新闻" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
        echo "**来源**: [$url]($url)" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
        
        # 这里可以集成实际的browser_use调用
        # 目前是概念性示例
        echo "1. **示例新闻标题 1**" >> "$OUTPUT_FILE"
        echo "   时间: $(date '+%Y-%m-%d %H:%M')" >> "$OUTPUT_FILE"
        echo "   摘要: 这是$category类别的第一条示例新闻摘要。" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
        
        echo "2. **示例新闻标题 2**" >> "$OUTPUT_FILE"
        echo "   时间: $(date '+%Y-%m-%d %H:%M' -d '1 hour ago')" >> "$OUTPUT_FILE"
        echo "   摘要: 这是$category类别的第二条示例新闻摘要。" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
        
        echo "---" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
        
        echo "已获取 $category 新闻"
    else
        echo "未知新闻类别: $category" >> "$OUTPUT_FILE"
    fi
done

echo "新闻摘要已保存到: $OUTPUT_FILE"
```

### 示例4：新闻关键词监控
```bash
#!/bin/bash
# 新闻关键词监控脚本
KEYWORDS=("人工智能" "新能源" "5G" "芯片" "生物技术")
OUTPUT_DIR="./news_monitor"

mkdir -p "$OUTPUT_DIR"

# 检查每个关键词相关的新闻
for keyword in "${KEYWORDS[@]}"; do
    echo "监控关键词: $keyword"
    
    # 这里可以集成实际的搜索功能
    # 目前是概念性示例
    SEARCH_RESULTS=(
        "科技日报报道$keyword最新进展"
        "$keyword产业政策发布"
        "$keyword国际合作项目启动"
    )
    
    if [ ${#SEARCH_RESULTS[@]} -gt 0 ]; then
        OUTPUT_FILE="$OUTPUT_DIR/${keyword}_news_$(date +%Y%m%d).txt"
        echo "# $keyword 相关新闻监控报告 $(date)" > "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
        
        for result in "${SEARCH_RESULTS[@]}"; do
            echo "- $result" >> "$OUTPUT_FILE"
        done
        
        echo "发现 $keyword 相关新闻: ${#SEARCH_RESULTS[@]} 条"
    else
        echo "未发现 $keyword 相关新闻"
    fi
done
```

### 示例5：新闻简报生成
```bash
#!/bin/bash
# 每日新闻简报生成脚本
BRIEFING_FILE="news_briefing_$(date +%Y%m%d).html"

cat > "$BRIEFING_FILE" << EOF
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>每日新闻简报 $(date '+%Y年%m月%d日')</title>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; margin: 20px; }
        h1 { color: #333; border-bottom: 2px solid #4CAF50; padding-bottom: 10px; }
        h2 { color: #4CAF50; margin-top: 30px; }
        .news-item { margin-bottom: 20px; padding: 15px; background: #f9f9f9; border-left: 4px solid #4CAF50; }
        .news-title { font-weight: bold; color: #333; margin-bottom: 5px; }
        .news-time { color: #666; font-size: 0.9em; }
        .news-summary { margin-top: 10px; }
        .news-link { display: inline-block; margin-top: 10px; color: #4CAF50; text-decoration: none; }
        .news-link:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <h1>📰 每日新闻简报</h1>
    <p>生成时间: $(date '+%Y年%m月%d日 %H:%M:%S')</p>
    
    <h2>📊 财经新闻</h2>
    <div class="news-item">
        <div class="news-title">上证指数今日上涨1.2%</div>
        <div class="news-time">2024-03-12 15:00</div>
        <div class="news-summary">A股市场今日表现强劲，上证指数收盘上涨1.2%，创业板指上涨2.3%。</div>
        <a class="news-link" href="http://www.ce.cn/">查看详情 →</a>
    </div>
    
    <h2>🔬 科技新闻</h2>
    <div class="news-item">
        <div class="news-title">我国量子计算研究取得新突破</div>
        <div class="news-time">2024-03-12 10:30</div>
        <div class="news-summary">中国科学院量子信息重点实验室宣布，在量子计算领域取得重要进展，实现更高精度的量子操控。</div>
        <a class="news-link" href="https://www.stdaily.com/">查看详情 →</a>
    </div>
    
    <h2>🌍 国际新闻</h2>
    <div class="news-item">
        <div class="news-title">联合国气候变化大会召开</div>
        <div class="news-time">2024-03-12 09:15</div>
        <div class="news-summary">第28届联合国气候变化大会在迪拜开幕，各国代表就全球气候治理展开讨论。</div>
        <a class="news-link" href="https://www.cgtn.com/">查看详情 →</a>
    </div>
    
    <footer style="margin-top: 50px; padding-top: 20px; border-top: 1px solid #ddd; color: #666; font-size: 0.9em;">
        <p>本简报由AI助手自动生成，数据来源于各权威新闻网站。</p>
        <p>更新时间: $(date '+%Y-%m-%d %H:%M:%S')</p>
    </footer>
</body>
</html>
EOF

echo "新闻简报已生成: $BRIEFING_FILE"
echo "请在浏览器中打开查看"
```

## ⚙️ 高级用法

### 新闻源管理
```bash
# 自定义新闻源配置文件
cat > ~/.news_sources.json << EOF
{
  "custom_sources": {
    "local_news": {
      "name": "本地新闻",
      "url": "https://local.news.com/",
      "category": "society",
      "language": "zh-CN"
    },
    "tech_blog": {
      "name": "技术博客",
      "url": "https://tech.blog.com/",
      "category": "tech", 
      "language": "en"
    }
  }
}
EOF
```

### 新闻过滤和排序
```bash
# 按时间过滤
# 可以提取新闻中的时间信息，只显示最近24小时的新闻

# 按重要性排序
# 可以根据标题长度、位置、包含关键词等判断新闻重要性

# 去重处理
# 同一新闻在不同网站出现时进行去重
```

### 集成其他工具
```bash
# 结合summarize工具生成新闻摘要
browser_use获取新闻页面 → 提取主要内容 → summarize生成摘要

# 结合feishu工具推送新闻简报
生成新闻简报 → 通过feishu发送到群聊或个人

# 结合cron工具定时获取新闻
设置定时任务，每天固定时间获取新闻摘要
```

## 🔧 故障排除

### 常见问题

**1. 网站无法访问**
```bash
# 检查网络连接
ping -c 3 www.chinanews.com

# 使用代理
export HTTP_PROXY="http://proxy:8080"

# 尝试备用网站
# 每个类别可以配置多个备用源
```

**2. 页面结构变化**
```bash
# 更新CSS选择器
# 如果页面结构变化，需要更新提取新闻的选择器

# 使用通用选择器
# 尽量使用更通用的选择器，如h1, h2, article等

# 备用提取方法
# 如果CSS选择器失败，可以尝试其他提取方法
```

**3. 内容提取失败**
```bash
# 增加等待时间
# 确保页面完全加载后再提取

# 简化提取逻辑
# 只提取必要信息，如标题、时间、链接

# 手动验证
# 在浏览器中打开页面，查看实际结构
```

**4. 性能问题**
```bash
# 限制获取数量
# 每次只获取3-5条最重要的新闻

# 缓存结果
# 相同URL在一定时间内不重复获取

# 并行处理优化
# 多个新闻源可以并行获取
```

## 📚 学习资源

### 相关技能
- **browser_use**: 浏览器自动化工具
- **summarize**: 内容摘要工具
- **feishu**: 消息推送工具
- **cron**: 定时任务工具

### 最佳实践
1. **尊重版权**: 仅提取必要信息，注明来源
2. **及时更新**: 定期检查和更新新闻源
3. **验证准确性**: 重要信息需要验证来源
4. **保护隐私**: 不记录用户浏览历史
5. **遵守法规**: 遵守相关法律法规

### 扩展功能建议
1. **个性化推荐**: 根据用户兴趣推荐新闻
2. **多语言支持**: 支持中英文等多种语言
3. **实时推送**: 重要新闻实时推送
4. **情感分析**: 分析新闻情感倾向
5. **趋势分析**: 分析新闻热点趋势

---

**提示**: news技能最适合快速获取各领域最新新闻摘要。对于深度分析或专题研究，建议结合其他信息获取工具。
