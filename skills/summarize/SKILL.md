---
name: summarize
description: "快速命令行工具，用于生成URL、本地文件和YouTube链接的摘要。支持网页、PDF、图像、音频等多种格式。"
triggers:
  - "摘要"
  - "summarize"
  - "总结"
  - "内容摘要"
  - "概括"
  - "内容总结"
  - "文章摘要"
  - "视频摘要"
homepage: https://summarize.sh
metadata: {"clawdbot":{"emoji":"🧾","requires":{"bins":["summarize"]},"install":[{"id":"brew","kind":"brew","formula":"steipete/tap/summarize","bins":["summarize"],"label":"Install summarize (brew)"}]}}
---


# Summarize - 内容摘要工具

快速命令行工具，用于生成URL、本地文件和YouTube链接的摘要。支持网页、PDF、图像、音频等多种格式。

## 🚀 快速开始

### 基本使用
```bash
# 摘要网页
summarize https://example.com/article

# 摘要本地文件
summarize document.pdf
summarize report.docx
summarize presentation.pptx

# 摘要YouTube视频
summarize https://www.youtube.com/watch?v=example

# 摘要图像文件
summarize image.jpg
```

### 输出控制
```bash
# 指定输出长度
summarize https://example.com --length short     # 简短摘要
summarize https://example.com --length medium    # 中等长度
summarize https://example.com --length long      # 详细摘要
summarize https://example.com --length xl        # 非常详细
summarize https://example.com --length xxl       # 最详细

# 指定字符数
summarize https://example.com --length 500       # 约500字符
summarize https://example.com --length 1000      # 约1000字符
```

## 📝 功能详解

### 网页摘要
```bash
# 基本网页摘要
summarize https://news.example.com/article123

# 使用高级提取（针对复杂网站）
summarize https://example.com --firecrawl always

# 仅提取内容不生成摘要
summarize https://example.com --extract-only

# 结构化输出
summarize https://example.com --json
```

### 文件摘要
```bash
# PDF文件
summarize document.pdf
summarize report.pdf --length long

# Word文档
summarize report.docx
summarize proposal.docx --json

# PowerPoint演示文稿
summarize presentation.pptx
summarize slides.pptx --length medium

# 图像文件（OCR提取）
summarize screenshot.png
summarize diagram.jpg --length short

# 音频文件（语音转文字后摘要）
summarize podcast.mp3
summarize interview.m4a --length medium
```

### YouTube视频摘要
```bash
# 基本视频摘要
summarize https://www.youtube.com/watch?v=dQw4w9WgXcQ

# 使用Apify服务（需要API密钥）
export APIFY_API_TOKEN=your_token
summarize https://youtube.com/video --youtube auto

# 指定视频特定部分
summarize https://youtube.com/video#t=60s,300s  # 摘要1-5分钟部分
```

## ⚙️ 配置选项

### 配置文件
创建 `~/.summarize/config.json`：
```json
{
  "model": "openai/gpt-5.2",
  "default_length": "medium",
  "output_format": "text",
  "language": "zh-CN",
  "timeout": 30
}
```

### 环境变量
```bash
# 模型配置
export SUMMARIZE_MODEL="openai/gpt-5.2"
export SUMMARIZE_MODEL="anthropic/claude-3.5-sonnet"
export SUMMARIZE_MODEL="google/gemini-3-flash-preview"

# 服务密钥
export FIRECRAWL_API_KEY="your_firecrawl_key"      # 用于受阻网站
export APIFY_API_TOKEN="your_apify_token"          # 用于YouTube

# 代理设置
export HTTP_PROXY="http://proxy.example.com:8080"
export HTTPS_PROXY="http://proxy.example.com:8080"
```

### 高级标志
```bash
# 令牌限制
summarize https://example.com --max-output-tokens 1000

# 语言设置
summarize https://example.com --language zh-CN     # 中文
summarize https://example.com --language en-US     # 英文
summarize https://example.com --language ja-JP     # 日文

# 超时设置
summarize https://example.com --timeout 60         # 60秒超时

# 详细输出
summarize https://example.com --verbose

# 调试模式
summarize https://example.com --debug
```

## 🎯 实用示例

### 示例1：新闻文章摘要
```bash
# 摘要多个新闻文章
summarize https://news.example.com/article1 --length short
summarize https://news.example.com/article2 --length medium
summarize https://news.example.com/article3 --length long

# 批量处理新闻URL
cat news_urls.txt | xargs -I {} summarize {} --length short
```

### 示例2：学术论文摘要
```bash
# 摘要PDF论文
summarize paper.pdf --length long

# 结构化输出论文信息
summarize research_paper.pdf --json | jq '.title, .authors, .summary'

# 批量处理论文文件夹
find ./papers -name "*.pdf" -exec summarize {} --length medium \;
```

### 示例3：会议记录整理
```bash
# 摘要会议录音
summarize meeting_recording.mp3 --length medium

# 结合多个文件
summarize meeting_notes.docx meeting_recording.mp3 --output meeting_summary.txt

# 生成结构化会议纪要
summarize meeting.mp3 --json --output meeting.json
```

### 示例4：自动化工作流
```bash
#!/bin/bash
# 每日新闻摘要脚本
NEWS_URLS=(
  "https://news.example.com/headline1"
  "https://news.example.com/headline2"
  "https://news.example.com/headline3"
)

OUTPUT_FILE="daily_news_summary_$(date +%Y%m%d).txt"

echo "=== 每日新闻摘要 $(date) ===" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

for url in "${NEWS_URLS[@]}"; do
  echo "处理: $url"
  summarize "$url" --length short >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"
  echo "---" >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"
done

echo "摘要已保存到: $OUTPUT_FILE"
```

### 示例5：研究资料整理
```bash
#!/bin/bash
# 研究资料摘要脚本
RESEARCH_DIR="./research_materials"
OUTPUT_DIR="./summaries"

mkdir -p "$OUTPUT_DIR"

# 处理PDF文件
find "$RESEARCH_DIR" -name "*.pdf" | while read pdf; do
  basename=$(basename "$pdf" .pdf)
  echo "处理PDF: $basename"
  summarize "$pdf" --length medium --output "$OUTPUT_DIR/${basename}_summary.txt"
done

# 处理网页书签
if [ -f "$RESEARCH_DIR/bookmarks.txt" ]; then
  while read url; do
    if [ -n "$url" ]; then
      domain=$(echo "$url" | sed -e 's|^[^/]*//||' -e 's|/.*$||')
      safe_name=$(echo "$domain" | tr './' '_')
      echo "处理网页: $domain"
      summarize "$url" --length short --output "$OUTPUT_DIR/web_${safe_name}_summary.txt"
    fi
  done < "$RESEARCH_DIR/bookmarks.txt"
fi
```

## 🔧 故障排除

### 常见问题

**1. 网站访问失败**
```bash
# 使用Firecrawl服务
export FIRECRAWL_API_KEY="your_key"
summarize https://blocked-site.com --firecrawl always

# 使用代理
export HTTP_PROXY="http://proxy:8080"
summarize https://example.com
```

**2. YouTube视频处理失败**
```bash
# 设置Apify API密钥
export APIFY_API_TOKEN="your_apify_token"
summarize https://youtube.com/video --youtube auto

# 使用备用方法
summarize https://youtube.com/video --youtube always
```

**3. 大文件处理超时**
```bash
# 增加超时时间
summarize large_document.pdf --timeout 120

# 减少输出长度
summarize large_document.pdf --length short

# 分块处理（如果支持）
summarize large_document.pdf --chunk-size 1000
```

**4. 内存不足**
```bash
# 使用更小的模型
export SUMMARIZE_MODEL="openai/gpt-4o-mini"
summarize document.pdf

# 处理前压缩文件
pdftoppm -jpeg document.pdf | summarize -
```

### 调试技巧
```bash
# 启用详细输出
summarize https://example.com --verbose

# 启用调试模式
summarize https://example.com --debug

# 查看处理步骤
summarize https://example.com --trace
```

## 📚 学习资源

### 命令参考
```bash
# 查看完整帮助
summarize --help

# 查看版本信息
summarize --version

# 列出支持的格式
summarize --formats
```

### 相关技能
- **news**: 新闻获取和摘要
- **markdownify-mcp**: 内容转换工具
- **pdf**: PDF文件处理
- **openai-whisper**: 语音转文字

### 最佳实践
1. **选择合适长度**: 根据需求选择short/medium/long
2. **使用结构化输出**: 脚本处理时使用--json格式
3. **配置API密钥**: 需要时设置FIRECRAWL和APIFY密钥
4. **批量处理优化**: 使用xargs或脚本批量处理
5. **错误处理**: 添加适当的错误处理和重试机制

### 性能优化
```bash
# 并行处理多个文件
parallel summarize {} --length short ::: *.pdf

# 使用缓存（如果支持）
summarize https://example.com --cache

# 预处理大文件
pdftotext large.pdf - | summarize - --length medium
```

---

**提示**: summarize工具非常适合快速获取内容概要，但对于需要深度分析或精确提取的任务，建议结合其他工具（如专门的PDF解析器、网页爬虫等）使用。