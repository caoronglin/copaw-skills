---
name: markdownify-mcp
description: 转 Markdown 工具。仅当用户明确要把网页、PDF、图片、音频、YouTube、DOCX、XLSX、PPTX 等内容转换为 Markdown 时使用。优先采用本机可运行的 stdio 方式，不要写远程 SSE/HTTP MCP 配置。
triggers:
  - "转 markdown"
  - "转换成 markdown"
  - "网页转 markdown"
  - "pdf转markdown"
  - "文档转markdown"
  - "markdownify"
  - "提取为 markdown"
mcp:
  command: "npx"
  args: ["-y", "@zcaceres/markdownify-mcp"]
---

# markdownify-mcp

## 定位
这是一个**内容转 Markdown**的 skill，不是天气 skill。

支持把这些内容转成 Markdown：
- 网页
- PDF
- 图片
- 音频
- YouTube
- DOCX
- XLSX
- PPTX

## 关键规则
### 1. 本机只走 stdio
当前宿主机**只支持 stdio 类型 MCP**。
所以这里的接入原则很简单：
- 可以：`command + args` 本地启动
- 不可以：`sse` / 远程 HTTP / `streamable_http`
- 不要再往 `config.json` 里塞远程 SSE 地址

### 2. 这是转换工具，不是通用抓取器
适合：
- “把这个网页转成 markdown”
- “把这个 PDF 提取成 markdown”
- “把这个 docx/pptx/xlsx 转 markdown”

不适合：
- 单纯查天气
- 地图/路线
- 结构化业务 API 查询

## 推荐本地 MCP 配置
如果后续真要注册到 MCP client，应该是这种 **stdio** 形式：

```json
{
  "mcp": {
    "clients": {
      "markdownify": {
        "name": "markdownify",
        "enabled": true,
        "transport": "stdio",
        "command": "npx",
        "args": ["-y", "@zcaceres/markdownify-mcp"],
        "env": {},
        "cwd": ""
      }
    }
  }
}
```

## 常见可用场景
### 网页转 Markdown
- 输入一个 URL
- 输出清洗后的 Markdown 文本

### PDF 转 Markdown
- 把 PDF 内容提取成便于总结、整理、笔记化的 Markdown

### Office 文档转 Markdown
- `docx-to-markdown`
- `xlsx-to-markdown`
- `pptx-to-markdown`

### 多媒体转 Markdown
- `image-to-markdown`
- `audio-to-markdown`
- `youtube-to-markdown`

## 可用工具（按 ModelScope 页面说明）
- `youtube-to-markdown`
- `pdf-to-markdown`
- `bing-search-to-markdown`
- `webpage-to-markdown`
- `image-to-markdown`
- `audio-to-markdown`
- `docx-to-markdown`
- `xlsx-to-markdown`
- `pptx-to-markdown`
- `get-markdown-file`

## 结论
这玩意儿该干的事只有一个：**把内容变成 Markdown**。
别再拿它伪装成天气能力，也别再配成 SSE 把本机搞挂。

---

## 🎯 实用示例

### 示例1：网页转Markdown
```bash
# 转换网页为Markdown
npx -y @zcaceres/markdownify-mcp webpage-to-markdown --url https://example.com/article

# 指定输出文件
npx -y @zcaceres/markdownify-mcp webpage-to-markdown --url https://news.example.com --output article.md

# 转换多个网页
npx -y @zcaceres/markdownify-mcp webpage-to-markdown --urls https://site1.com,https://site2.com
```

### 示例2：PDF转Markdown
```bash
# 转换PDF文件
npx -y @zcaceres/markdownify-mcp pdf-to-markdown --input document.pdf

# 指定页面范围
npx -y @zcaceres/markdownify-mcp pdf-to-markdown --input report.pdf --pages 1-10

# 批量转换PDF
for pdf in *.pdf; do
  npx -y @zcaceres/markdownify-mcp pdf-to-markdown --input "$pdf" --output "${pdf%.pdf}.md"
done
```

### 示例3：Office文档转Markdown
```bash
# Word文档转Markdown
npx -y @zcaceres/markdownify-mcp docx-to-markdown --input report.docx

# Excel表格转Markdown
npx -y @zcaceres/markdownify-mcp xlsx-to-markdown --input data.xlsx --sheet "Sheet1"

# PowerPoint转Markdown
npx -y @zcaceres/markdownify-mcp pptx-to-markdown --input presentation.pptx
```

### 示例4：多媒体转Markdown
```bash
# 图像转Markdown（OCR提取）
npx -y @zcaceres/markdownify-mcp image-to-markdown --input screenshot.png

# 音频转Markdown（语音转文字）
npx -y @zcaceres/markdownify-mcp audio-to-markdown --input podcast.mp3

# YouTube视频转Markdown
npx -y @zcaceres/markdownify-mcp youtube-to-markdown --url https://youtube.com/watch?v=example
```

### 示例5：批量处理工作流
```bash
#!/bin/bash
# 批量内容转Markdown脚本
INPUT_DIR="./raw_content"
OUTPUT_DIR="./markdown_output"

mkdir -p "$OUTPUT_DIR"

# 处理PDF文件
find "$INPUT_DIR" -name "*.pdf" | while read pdf; do
  basename=$(basename "$pdf" .pdf)
  echo "处理PDF: $basename"
  npx -y @zcaceres/markdownify-mcp pdf-to-markdown --input "$pdf" --output "$OUTPUT_DIR/${basename}.md"
done

# 处理Word文档
find "$INPUT_DIR" -name "*.docx" | while read docx; do
  basename=$(basename "$docx" .docx)
  echo "处理Word: $basename"
  npx -y @zcaceres/markdownify-mcp docx-to-markdown --input "$docx" --output "$OUTPUT_DIR/${basename}.md"
done

# 处理网页URL
if [ -f "$INPUT_DIR/urls.txt" ]; then
  count=1
  while read url; do
    if [ -n "$url" ]; then
      echo "处理网页: $url"
      npx -y @zcaceres/markdownify-mcp webpage-to-markdown --url "$url" --output "$OUTPUT_DIR/webpage_${count}.md"
      ((count++))
    fi
  done < "$INPUT_DIR/urls.txt"
fi

echo "转换完成！结果保存在: $OUTPUT_DIR"
```

### 示例6：研究资料整理
```bash
#!/bin/bash
# 研究资料转Markdown整理
RESEARCH_DIR="./research"
OUTPUT_DIR="./organized_research"

mkdir -p "$OUTPUT_DIR"

# 创建主索引文件
INDEX_FILE="$OUTPUT_DIR/README.md"
echo "# 研究资料索引" > "$INDEX_FILE"
echo "" >> "$INDEX_FILE"
echo "## 文件列表" >> "$INDEX_FILE"
echo "" >> "$INDEX_FILE"

# 处理各种格式文件
process_file() {
  local file="$1"
  local basename=$(basename "$file")
  local extension="${file##*.}"
  local name="${basename%.*}"
  
  echo "处理: $basename"
  
  case "$extension" in
    pdf)
      npx -y @zcaceres/markdownify-mcp pdf-to-markdown --input "$file" --output "$OUTPUT_DIR/${name}.md"
      echo "- [${name}.md](${name}.md) (PDF转Markdown)" >> "$INDEX_FILE"
      ;;
    docx)
      npx -y @zcaceres/markdownify-mcp docx-to-markdown --input "$file" --output "$OUTPUT_DIR/${name}.md"
      echo "- [${name}.md](${name}.md) (Word转Markdown)" >> "$INDEX_FILE"
      ;;
    pptx)
      npx -y @zcaceres/markdownify-mcp pptx-to-markdown --input "$file" --output "$OUTPUT_DIR/${name}.md"
      echo "- [${name}.md](${name}.md) (PPT转Markdown)" >> "$INDEX_FILE"
      ;;
    jpg|jpeg|png)
      npx -y @zcaceres/markdownify-mcp image-to-markdown --input "$file" --output "$OUTPUT_DIR/${name}.md"
      echo "- [${name}.md](${name}.md) (图片OCR转Markdown)" >> "$INDEX_FILE"
      ;;
    *)
      echo "跳过不支持格式: $extension"
      ;;
  esac
}

# 处理所有文件
find "$RESEARCH_DIR" -type f \( -name "*.pdf" -o -name "*.docx" -o -name "*.pptx" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) | while read file; do
  process_file "$file"
done

echo "" >> "$INDEX_FILE"
echo "## 处理说明" >> "$INDEX_FILE"
echo "" >> "$INDEX_FILE"
echo "- 所有文件已转换为Markdown格式" >> "$INDEX_FILE"
echo "- 支持全文搜索和编辑" >> "$INDEX_FILE"
echo "- 转换时间: $(date)" >> "$INDEX_FILE"

echo "研究资料整理完成！索引文件: $INDEX_FILE"
```

## ⚙️ 配置选项

### 环境变量
```bash
# 设置代理（如果需要）
export HTTP_PROXY="http://proxy.example.com:8080"
export HTTPS_PROXY="http://proxy.example.com:8080"

# 设置输出目录
export MARKDOWNIFY_OUTPUT_DIR="./output"

# 设置语言（OCR和语音识别）
export LANGUAGE="zh-CN"
```

### 高级参数
```bash
# 网页转换选项
npx -y @zcaceres/markdownify-mcp webpage-to-markdown \
  --url https://example.com \
  --timeout 30 \
  --user-agent "Mozilla/5.0" \
  --include-images

# PDF转换选项
npx -y @zcaceres/markdownify-mcp pdf-to-markdown \
  --input document.pdf \
  --ocr true \
  --language chi_sim \
  --dpi 300

# 图像转换选项
npx -y @zcaceres/markdownify-mcp image-to-markdown \
  --input photo.jpg \
  --language eng+chi_sim \
  --preserve-layout
```

## 🔧 故障排除

### 常见问题

**1. npx命令找不到**
```bash
# 检查Node.js安装
node --version

# 如果未安装Node.js
# Ubuntu/Debian: sudo apt install nodejs npm
# macOS: brew install node
# Windows: 下载Node.js安装包
```

**2. 转换失败或超时**
```bash
# 增加超时时间
npx -y @zcaceres/markdownify-mcp webpage-to-markdown --url https://example.com --timeout 60

# 使用代理
export HTTP_PROXY="http://proxy:8080"
npx -y @zcaceres/markdownify-mcp webpage-to-markdown --url https://example.com

# 简化输出
npx -y @zcaceres/markdownify-mcp webpage-to-markdown --url https://example.com --simple
```

**3. 大文件处理失败**
```bash
# 分块处理PDF
npx -y @zcaceres/markdownify-mcp pdf-to-markdown --input large.pdf --chunk-size 10

# 降低图像质量
npx -y @zcaceres/markdownify-mcp image-to-markdown --input large.jpg --quality 50

# 使用更多内存
export NODE_OPTIONS="--max-old-space-size=4096"
npx -y @zcaceres/markdownify-mcp pdf-to-markdown --input large.pdf
```

**4. 中文内容识别问题**
```bash
# 指定中文语言
npx -y @zcaceres/markdownify-mcp pdf-to-markdown --input chinese.pdf --language chi_sim

npx -y @zcaceres/markdownify-mcp image-to-markdown --input chinese.jpg --language chi_sim

# 使用中文OCR引擎
export TESSDATA_PREFIX="/usr/share/tesseract-ocr/4.00/tessdata"
```

## 📚 学习资源

### 相关技能
- **summarize**: 内容摘要工具（可用于转换后摘要）
- **pdf**: PDF处理工具（提取、合并、分割等）
- **docx/xlsx/pptx**: Office文档处理工具
- **image-recognition**: 图像识别和OCR

### 最佳实践
1. **预处理文件**: 确保文件格式正确且可读
2. **分批处理**: 大文件或大量文件时分批处理
3. **检查输出**: 转换后检查Markdown格式是否正确
4. **后续处理**: 可使用其他工具进一步处理Markdown文件
5. **版本控制**: 转换后的Markdown文件适合用Git管理

### 性能优化
```bash
# 并行处理多个文件
parallel 'npx -y @zcaceres/markdownify-mcp pdf-to-markdown --input {} --output {.}.md' ::: *.pdf

# 使用缓存（如果支持）
npx -y @zcaceres/markdownify-mcp webpage-to-markdown --url https://example.com --cache

# 预处理大文件
pdftoppm large.pdf -jpeg -r 150 | xargs -I {} npx -y @zcaceres/markdownify-mcp image-to-markdown --input {}
```

---

**提示**: markdownify-mcp是一个强大的内容转换工具，特别适合将各种格式的资料整理成统一的Markdown格式，便于后续搜索、编辑和版本控制。
