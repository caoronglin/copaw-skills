---
name: nano-pdf
description: "使用自然语言指令编辑PDF文件的命令行工具。支持文本修改、格式调整、内容修复等功能。"
triggers:
  - "PDF编辑"
  - "nano-pdf"
  - "编辑PDF"
  - "PDF处理"
  - "PDF修改"
  - "PDF修复"
homepage: https://pypi.org/project/nano-pdf/
metadata: {"clawdbot":{"emoji":"📄","requires":{"bins":["nano-pdf"]},"install":[{"id":"uv","kind":"uv","package":"nano-pdf","bins":["nano-pdf"],"label":"Install nano-pdf (uv)"}]}}
---


# nano-pdf - 自然语言PDF编辑器

使用 `nano-pdf` 通过自然语言指令编辑PDF文件的特定页面。支持文本修改、格式调整、内容修复等操作。

## 🚀 快速开始

### 基本编辑
```bash
# 编辑第一页的标题
nano-pdf edit document.pdf 1 "将标题改为'第三季度报告'并修复副标题中的拼写错误"

# 编辑特定页面
nano-pdf edit report.pdf 5 "更新图表标题为'2024年销售趋势'"

# 编辑多个页面
nano-pdf edit presentation.pdf "1,3,5" "统一所有页面的页脚格式"
```

### 输出选项
```bash
# 指定输出文件
nano-pdf edit input.pdf 1 "修改标题" --output modified.pdf

# 覆盖原文件（谨慎使用）
nano-pdf edit document.pdf 1 "修复错误" --output document.pdf
```

## 📝 编辑功能

### 文本修改
```bash
# 修改特定文本
nano-pdf edit file.pdf 2 "将'张三'改为'李四'"

# 修复拼写错误
nano-pdf edit report.pdf 3 "修复'teh'为'the'，修复'recieve'为'receive'"

# 更新日期和时间
nano-pdf edit contract.pdf 1 "将日期从'2023-01-15'更新为'2024-03-12'"
```

### 格式调整
```bash
# 调整字体大小
nano-pdf edit presentation.pdf 4 "将标题字体放大到24pt"

# 修改颜色
nano-pdf edit brochure.pdf 2 "将公司名称改为蓝色"

# 对齐方式
nano-pdf edit document.pdf 3 "将段落左对齐"
```

### 内容添加和删除
```bash
# 添加内容
nano-pdf edit proposal.pdf 1 "在标题下方添加'机密文件'水印"

# 删除内容
nano-pdf edit draft.pdf 2 "删除第三段中的敏感信息"

# 替换内容
nano-pdf edit manual.pdf 5 "将旧版本号'v1.0'替换为新版本号'v2.1'"
```

## 🎯 实用示例

### 示例1：修复报告
```bash
# 修复报告中的多个问题
nano-pdf edit quarterly_report.pdf 1 \
  "将标题改为'2024年第一季度报告'，修复作者姓名拼写，更新日期为'2024-03-15'"
```

### 示例2：更新合同
```bash
# 批量更新合同信息
nano-pdf edit contract.pdf "1,3,5" \
  "将甲方公司名从'ABC公司'改为'XYZ集团'，更新签署日期"
```

### 示例3：标准化格式
```bash
# 统一演示文稿格式
nano-pdf edit presentation.pdf "all" \
  "统一所有页面的页眉页脚，将字体改为Arial，调整行间距为1.5倍"
```

## ⚙️ 高级功能

### 批量处理
```bash
# 处理多个文件
for file in *.pdf; do
  nano-pdf edit "$file" 1 "添加'草稿'水印" --output "draft_$file"
done

# 使用find命令批量处理
find . -name "*.pdf" -exec nano-pdf edit {} 1 "更新版本信息" --output {}.modified \;
```

### 脚本集成
```bash
#!/bin/bash
# 自动化PDF处理脚本
INPUT="$1"
PAGE="$2"
INSTRUCTION="$3"

if [ -f "$INPUT" ]; then
  OUTPUT="${INPUT%.pdf}_modified.pdf"
  nano-pdf edit "$INPUT" "$PAGE" "$INSTRUCTION" --output "$OUTPUT"
  echo "已生成: $OUTPUT"
else
  echo "文件不存在: $INPUT"
fi
```

### 与Python集成
```python
import subprocess
import os

def edit_pdf_with_nano(pdf_path, page, instruction, output_path=None):
    """使用nano-pdf编辑PDF文件"""
    cmd = ["nano-pdf", "edit", pdf_path, str(page), f'"{instruction}"']
    
    if output_path:
        cmd.extend(["--output", output_path])
    
    result = subprocess.run(cmd, capture_output=True, text=True)
    
    if result.returncode == 0:
        print("PDF编辑成功")
        return True
    else:
        print(f"编辑失败: {result.stderr}")
        return False

# 使用示例
edit_pdf_with_nano("report.pdf", 1, "更新标题为2024年度报告", "report_updated.pdf")
```

## 🚨 注意事项

### 页码处理
```bash
# 注意：页码可能是0-based或1-based
# 如果结果看起来差一页，尝试另一种编号方式

# 尝试1-based（大多数情况）
nano-pdf edit file.pdf 1 "编辑第一页"

# 如果不行，尝试0-based
nano-pdf edit file.pdf 0 "编辑第一页"
```

### 文件检查
```bash
# 编辑前备份原始文件
cp original.pdf original_backup.pdf

# 编辑后检查结果
# 可以使用其他PDF工具检查编辑效果
```

### 限制和约束
1. **复杂布局**：对于复杂表格和图表，编辑效果可能有限
2. **图像内容**：无法直接编辑PDF中的图像内容
3. **加密PDF**：需要先解密才能编辑
4. **扫描件**：扫描的PDF需要OCR后才能编辑

## 🔧 故障排除

### 常见问题
1. **命令未找到**：确保已安装nano-pdf
   ```bash
   pip install nano-pdf
   # 或
   uv add nano-pdf
   ```

2. **权限错误**：确保有文件读写权限
   ```bash
   chmod +r document.pdf
   ```

3. **输出文件已存在**：使用不同的输出文件名或删除现有文件
   ```bash
   nano-pdf edit input.pdf 1 "修改" --output new_output.pdf
   ```

4. **编辑效果不理想**：尝试更具体的指令或分步编辑
   ```bash
   # 分步编辑
   nano-pdf edit file.pdf 1 "修改标题"
   nano-pdf edit file.pdf 1 "调整字体"
   ```

## 📚 学习资源
```bash
# 查看帮助
nano-pdf --help
nano-pdf edit --help

# 查看版本
nano-pdf --version
```

**相关技能**：
- `pdf`: 全面的PDF处理工具（读取、合并、分割等）
- `docx`: Word文档处理
- `pptx`: PPT演示文稿处理

**替代方案**：
- Adobe Acrobat: 专业PDF编辑
- LibreOffice Draw: 开源PDF编辑
- PDFtk: 命令行PDF工具包
