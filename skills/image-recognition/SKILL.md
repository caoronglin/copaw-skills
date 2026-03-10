---
name: Image Recognition
description: 图片识别与图文理解，基于 PaddleOCR-VL 模型，支持识别图片中的文字、场景、物体等信息。支持109种语言，可输出JSON或Markdown格式。
triggers:
  - "识别图片"
  - "看图"
  - "图片识别"
  - "OCR"
  - "文字识别"
  - "图片内容"
mcp:
  command: "uvx"
  args: ["paddleocr-vl-mcp"]
  env:
    PADDLEOCR_API_KEY: "your_api_key"
---

# 图片识别 MCP 技能

## 功能说明

基于 PaddleOCR-VL 的图像识别服务：

- 📝 **文字识别**：提取图片中的文字内容
- 🌍 **多语言支持**：支持109种语言的OCR
- 📊 **结构化输出**：JSON或Markdown格式
- 📐 **版面分析**：识别文本、表格、公式、图表
- 🎯 **精确定位**：提供文字位置信息

## 核心模型

### PaddleOCR-VL 1.5
百度开源的视觉语言模型：
- **参数量**：0.9B（超轻量）
- **支持语言**：109种
- **识别能力**：文本、表格、公式、图表
- **输出格式**：JSON、Markdown

## 工具列表

### 1. extract_text - 文字提取

**功能**：从图片中提取文字内容

**参数说明**：

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| image | string | ✅ | 图片文件路径或URL |
| format | string | ❌ | 输出格式：json/markdown，默认markdown |
| language | string | ❌ | 语言代码，默认自动检测 |

**使用示例**：
```json
{
  "image": "/path/to/image.png",
  "format": "markdown",
  "language": "ch"
}
```

**返回信息**：
- 识别的文字内容
- 文字位置信息（JSON格式）
- 置信度分数

### 2. analyze_document - 文档分析

**功能**：分析文档图片的版面结构

**参数**：
- `image`: 文档图片
- `output_format`: 输出格式

**返回**：
- 文本区域
- 表格区域
- 图片区域
- 版面结构

### 3. extract_table - 表格提取

**功能**：从图片中提取表格数据

**参数**：
- `image`: 包含表格的图片

**返回**：
- 表格结构
- 单元格内容
- 表头识别

## 配置方式

### 获取API Key
1. 访问PaddleOCR服务提供商
2. 注册账号并获取API Key
3. 配置到环境变量

### MCP配置
```json
{
  "mcpServers": {
    "image-recognition": {
      "command": "uvx",
      "args": ["paddleocr-vl-mcp"],
      "env": {
        "PADDLEOCR_API_KEY": "your-api-key"
      }
    }
  }
}
```

## 使用场景

### 1. 文档数字化
```
用户：帮我把这份扫描文档转成文字
助手：[调用extract_text，返回Markdown格式]
```

### 2. 表格提取
```
用户：提取这张图片里的表格数据
助手：[调用extract_table，返回结构化数据]
```

### 3. 截图文字提取
```
用户：识别这张截图里的文字
助手：[调用extract_text]
```

### 4. 多语言识别
```
用户：识别这张日文图片的内容
助手：[设置language=ja进行识别]
```

## 支持的语言

### 主要语言
- 中文（简体、繁体）
- 英文
- 日文
- 韩文
- 法语、德语、西班牙语等

### 总计
支持 **109种语言** 的OCR识别

## 输出格式对比

### JSON格式
```json
{
  "text": "识别的文字",
  "bbox": [x1, y1, x2, y2],
  "confidence": 0.95
}
```
**适用场景**：需要精确位置信息、程序处理

### Markdown格式
```markdown
# 文档标题

正文内容...

| 列1 | 列2 |
|-----|-----|
| 数据 | 数据 |
```
**适用场景**：文档阅读、内容展示

## 触发时机
- 用户需要识别图片文字
- 文档数字化处理
- 表格数据提取
- 多语言文字识别

## 最佳实践

### 1. 选择合适的格式
```python
# 需要位置信息
extract_text(image, format="json")

# 只需要文本内容
extract_text(image, format="markdown")
```

### 2. 指定语言提高准确率
```python
# 中文文档
extract_text(image, language="ch")

# 日文文档
extract_text(image, language="ja")

# 混合语言（自动检测）
extract_text(image, language="auto")
```

### 3. 处理复杂文档
```python
# 先分析版面
layout = analyze_document(image)

# 再提取各区域内容
for region in layout.regions:
    if region.type == "table":
        extract_table(region)
    else:
        extract_text(region)
```

## 注意事项

⚠️ **重要提示**：
1. 图片质量影响识别准确率
2. 复杂排版可能需要后期校对
3. 手写文字识别准确率较低
4. 表格识别对格式要求较高

## 应用场景

| 场景 | 推荐工具 | 说明 |
|------|---------|------|
| 文档数字化 | extract_text | 扫描件转文字 |
| 表格录入 | extract_table | 图片表格转Excel |
| 截图提取 | extract_text | 快速获取截图文字 |
| 学术论文 | analyze_document | 识别公式图表 |

## 官方资源

- **模型**: PaddleOCR-VL 1.5
- **GitHub**: https://github.com/PaddlePaddle/PaddleOCR
- **文档**: https://github.com/PaddlePaddle/PaddleOCR/blob/main/doc/doc_ch/whl.md
- **支持**: 百度开源项目

## 常见问题

### Q: 识别准确率不高怎么办？
**A**: 
- 确保图片清晰
- 指定正确的语言
- 尝试不同的输出格式

### Q: 支持手写文字吗？
**A**: 支持，但准确率可能低于印刷体

### Q: 如何处理表格？
**A**: 使用extract_table工具，会自动识别表格结构

### Q: 可以识别公式吗？
**A**: 可以，PaddleOCR-VL支持公式识别

## 与其他工具配合

### 文档处理流程
```
pdf（提取页面）→ image-recognition（识别）→ 整理归档
```

### 数据录入流程
```
image-recognition（识别表格）→ xlsx（写入Excel）→ 数据分析
```

---
*更新时间: 2026-03-08*
*版本: 1.0*
*适用对象: 文档处理、数据提取、内容识别*