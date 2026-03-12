---
name: pptx
description: PPT演示文稿处理：创建、编辑、读取.pptx文件。用户提到"PPT"、"幻灯片"、"演示"、"deck"、".pptx"时使用。
triggers:
  - "PPT"
  - "幻灯片"
  - "演示文稿"
  - ".pptx"
  - "pptx"
  - "presentation"
license: Proprietary
---


# PPTX Skill

## Runtime Dependencies

- Requires LibreOffice (`soffice`) for presentation-to-PDF conversion.
- Requires Poppler (`pdftoppm`) for PDF-to-image conversion used by thumbnail/visual workflows.
- If `pdftoppm` is unavailable, a Python fallback path may use `pdf2image`.
- On Windows, dependencies must be installed and available in `PATH`; if missing, report the dependency issue and stop (do not keep retrying).

## Quick Reference

| Task | Guide |
|------|-------|
| Read/analyze content | `python -m markitdown presentation.pptx` |
| Edit or create from template | Read [editing.md](editing.md) |
| Create from scratch | Read [pptxgenjs.md](pptxgenjs.md) |

---

## Reading Content

```bash
# Text extraction
python -m markitdown presentation.pptx

# Visual overview
python scripts/thumbnail.py presentation.pptx

# Raw XML
python scripts/office/unpack.py presentation.pptx unpacked/
```

---

## Editing Workflow

**Read [editing.md](editing.md) for full details.**

1. Analyze template with `thumbnail.py`
2. Unpack → manipulate slides → edit content → clean → pack

---

## Creating from Scratch

**Read [pptxgenjs.md](pptxgenjs.md) for full details.**

Use when no template or reference presentation is available.

---

## Design Ideas

**Don't create boring slides.** Plain bullets on a white background won't impress anyone. Consider ideas from this list for each slide.

### Before Starting

- **Pick a bold, content-informed color palette**: The palette should feel designed for THIS topic. If swapping your colors into a completely different presentation would still "work," you haven't made specific enough choices.
- **Dominance over equality**: One color should dominate (60-70% visual weight), with 1-2 supporting tones and one sharp accent. Never give all colors equal weight.
- **Dark/light contrast**: Dark backgrounds for title + conclusion slides, light for content ("sandwich" structure). Or commit to dark throughout for a premium feel.
- **Commit to a visual motif**: Pick ONE distinctive element and repeat it — rounded image frames, icons in colored circles, thick single-side borders. Carry it across every slide.

### Color Palettes

Choose colors that match your topic — don't default to generic blue. Use these palettes as inspiration:

| Theme | Primary | Secondary | Accent |
|-------|---------|-----------|--------|
| **Midnight Executive** | `1E2761` (navy) | `CADCFC` (ice blue) | `FFFFFF` (white) |
| **Forest & Moss** | `2C5F2D` (forest) | `97BC62` (moss) | `F5F5F5` (cream) |
| **Coral Energy** | `F96167` (coral) | `F9E795` (gold) | `2F3C7E` (navy) |
| **Warm Terracotta** | `B85042` (terracotta) | `E7E8D1` (sand) | `A7BEAE` (sage) |
| **Ocean Gradient** | `065A82` (deep blue) | `1C7293` (teal) | `21295C` (midnight) |
| **Charcoal Minimal** | `36454F` (charcoal) | `F2F2F2` (off-white) | `212121` (black) |
| **Teal Trust** | `028090` (teal) | `00A896` (seafoam) | `02C39A` (mint) |
| **Berry & Cream** | `6D2E46` (berry) | `A26769` (dusty rose) | `ECE2D0` (cream) |
| **Sage Calm** | `84B59F` (sage) | `69A297` (eucalyptus) | `50808E` (slate) |
| **Cherry Bold** | `990011` (cherry) | `FCF6F5` (off-white) | `2F3C7E` (navy) |

### For Each Slide

**Every slide needs a visual element** — image, chart, icon, or shape. Text-only slides are forgettable.

**Layout options:**
- Two-column (text left, illustration on right)
- Icon + text rows (icon in colored circle, bold header, description below)
- 2x2 or 2x3 grid (image on one side, grid of content blocks on other)
- Half-bleed image (full left or right side) with content overlay

**Data display:**
- Large stat callouts (big numbers 60-72pt with small labels below)
- Comparison columns (before/after, pros/cons, side-by-side options)
- Timeline or process flow (numbered steps, arrows)

**Visual polish:**
- Icons in small colored circles next to section headers
- Italic accent text for key stats or taglines

### Typography

**Choose an interesting font pairing** — don't default to Arial. Pick a header font with personality and pair it with a clean body font.

| Header Font | Body Font |
|-------------|-----------|
| Georgia | Calibri |
| Arial Black | Arial |
| Calibri | Calibri Light |
| Cambria | Calibri |
| Trebuchet MS | Calibri |
| Impact | Arial |
| Palatino | Garamond |
| Consolas | Calibri |

| Element | Size |
|---------|------|
| Slide title | 36-44pt bold |
| Section header | 20-24pt bold |
| Body text | 14-16pt |
| Captions | 10-12pt muted |

### Spacing

- 0.5" minimum margins
- 0.3-0.5" between content blocks
- Leave breathing room—don't fill every inch

### Avoid (Common Mistakes)

- **Don't repeat the same layout** — vary columns, cards, and callouts across slides
- **Don't center body text** — left-align paragraphs and lists; center only titles
- **Don't skimp on size contrast** — titles need 36pt+ to stand out from 14-16pt body
- **Don't default to blue** — pick colors that reflect the specific topic
- **Don't mix spacing randomly** — choose 0.3" or 0.5" gaps and use consistently
- **Don't style one slide and leave the rest plain** — commit fully or keep it simple throughout
- **Don't create text-only slides** — add images, icons, charts, or visual elements; avoid plain title + bullets
- **Don't forget text box padding** — when aligning lines or shapes with text edges, set `margin: 0` on the text box or offset the shape to account for padding
- **Don't use low-contrast elements** — icons AND text need strong contrast against the background; avoid light text on light backgrounds or dark text on dark backgrounds
- **NEVER use accent lines under titles** — these are a hallmark of AI-generated slides; use whitespace or background color instead

---

## QA (Required)

**Assume there are problems. Your job is to find them.**

Your first render is almost never correct. Approach QA as a bug hunt, not a confirmation step. If you found zero issues on first inspection, you weren't looking hard enough.

### Content QA

```bash
python -m markitdown output.pptx
```

Check for missing content, typos, wrong order.

**When using templates, check for leftover placeholder text:**

```bash
python -m markitdown output.pptx | grep -iE "xxxx|lorem|ipsum|this.*(page|slide).*layout"
```

If grep returns results, fix them before declaring success.

### Visual QA

**⚠️ USE SUBAGENTS** — even for 2-3 slides. You've been staring at the code and will see what you expect, not what's there. Subagents have fresh eyes.

Convert slides to images (see [Converting to Images](#converting-to-images)), then use this prompt:

```
Visually inspect these slides. Assume there are issues — find them.

Look for:
- Overlapping elements (text through shapes, lines through words, stacked elements)
- Text overflow or cut off at edges/box boundaries
- Decorative lines positioned for single-line text but title wrapped to two lines
- Source citations or footers colliding with content above
- Elements too close (< 0.3" gaps) or cards/sections nearly touching
- Uneven gaps (large empty area in one place, cramped in another)
- Insufficient margin from slide edges (< 0.5")
- Columns or similar elements not aligned consistently
- Low-contrast text (e.g., light gray text on cream-colored background)
- Low-contrast icons (e.g., dark icons on dark backgrounds without a contrasting circle)
- Text boxes too narrow causing excessive wrapping
- Leftover placeholder content

For each slide, list issues or areas of concern, even if minor.

Read and analyze these images:
1. /path/to/slide-01.jpg (Expected: [brief description])
2. /path/to/slide-02.jpg (Expected: [brief description])

Report ALL issues found, including minor ones.
```

### Verification Loop

1. Generate slides → Convert to images → Inspect
2. **List issues found** (if none found, look again more critically)
3. Fix issues
4. **Re-verify affected slides** — one fix often creates another problem
5. Repeat until a full pass reveals no new issues

**Do not declare success until you've completed at least one fix-and-verify cycle.**

---

## Converting to Images

Convert presentations to individual slide images for visual inspection:

```bash
python scripts/office/soffice.py --headless --convert-to pdf output.pptx
pdftoppm -jpeg -r 150 output.pdf slide
```

This creates `slide-01.jpg`, `slide-02.jpg`, etc.

To re-render specific slides after fixes:

```bash
pdftoppm -jpeg -r 150 -f N -l N output.pdf slide-fixed
```

---

## Dependencies

- `pip install "markitdown[pptx]"` - text extraction
- `pip install Pillow` - thumbnail grids
- `npm install -g pptxgenjs` - creating from scratch
- LibreOffice (`soffice`) - PDF conversion (auto-configured for sandboxed environments via `scripts/office/soffice.py`)
- Poppler (`pdftoppm`) - PDF to images

---

## 🎯 实用示例

### 示例1：基本处理流程
```bash
# 1. 提取文本内容
python -m markitdown presentation.pptx --output presentation.md

# 2. 生成缩略图预览
python scripts/thumbnail.py presentation.pptx --output thumbnails/

# 3. 转换为PDF
python scripts/office/soffice.py --headless --convert-to pdf presentation.pptx

# 4. 生成图像用于检查
pdftoppm -jpeg -r 150 presentation.pdf slide
```

### 示例2：创建新演示文稿
```bash
# 从模板创建
# 1. 分析模板结构
python scripts/thumbnail.py template.pptx

# 2. 编辑内容
# 编辑markdown文件，然后使用pptxgenjs生成

# 3. 使用pptxgenjs创建
pptxgenjs create --title "新产品发布" --slides 10 --output new_presentation.pptx
```

### 示例3：批量处理
```bash
# 批量转换所有PPT为PDF
for ppt in *.pptx; do
    python scripts/office/soffice.py --headless --convert-to pdf "$ppt"
done

# 批量提取文本
find . -name "*.pptx" -exec python -m markitdown {} --output {}.md \;
```

### 示例4：质量检查流程
```bash
#!/bin/bash
# QA检查脚本
PPT_FILE="$1"

echo "=== PPT质量检查: $PPT_FILE ==="

# 1. 检查内容
echo "1. 检查内容完整性..."
python -m markitdown "$PPT_FILE" | grep -iE "xxxx|lorem|ipsum|placeholder" && echo "发现占位符内容！"

# 2. 生成缩略图
echo "2. 生成缩略图..."
python scripts/thumbnail.py "$PPT_FILE" --output /tmp/thumbnails/

# 3. 转换为PDF
echo "3. 转换为PDF..."
python scripts/office/soffice.py --headless --convert-to pdf "$PPT_FILE"

# 4. 生成幻灯片图像
PPT_PDF="${PPT_FILE%.pptx}.pdf"
echo "4. 生成幻灯片图像..."
pdftoppm -jpeg -r 150 "$PPT_PDF" /tmp/slides/slide

echo "检查完成！请查看/tmp/slides/中的图像进行视觉检查"
```

### 示例5：自动化工作流
```bash
#!/bin/bash
# 自动化PPT处理工作流
INPUT_DIR="./raw_ppts"
OUTPUT_DIR="./processed"
REPORT_DIR="./reports"

mkdir -p "$OUTPUT_DIR" "$REPORT_DIR"

for ppt in "$INPUT_DIR"/*.pptx; do
    BASENAME=$(basename "$ppt" .pptx)
    echo "处理: $BASENAME"
    
    # 提取文本
    python -m markitdown "$ppt" --output "$OUTPUT_DIR/${BASENAME}.md"
    
    # 生成缩略图
    python scripts/thumbnail.py "$ppt" --output "$OUTPUT_DIR/thumbnails/${BASENAME}/"
    
    # 转换为PDF
    python scripts/office/soffice.py --headless --convert-to pdf "$ppt" --output "$OUTPUT_DIR/${BASENAME}.pdf"
    
    # 生成报告
    echo "=== $BASENAME ===" >> "$REPORT_DIR/summary.txt"
    python -m markitdown "$ppt" --stats >> "$REPORT_DIR/summary.txt"
    echo "" >> "$REPORT_DIR/summary.txt"
done

echo "所有文件处理完成！"
```

## 📚 学习资源

### 命令参考
```bash
# markitdown文本提取
python -m markitdown --help

# 缩略图生成
python scripts/thumbnail.py --help

# LibreOffice转换
python scripts/office/soffice.py --help
```

### 相关技能
- **docx**: Word文档处理
- **xlsx**: Excel表格处理  
- **pdf**: PDF文件处理
- **markdownify-mcp**: 内容转换工具

### 最佳实践
1. **保持备份**: 处理前备份原始文件
2. **分步处理**: 复杂操作分步进行
3. **视觉检查**: 务必生成图像进行视觉检查
4. **版本控制**: 重要修改使用git管理
5. **模板复用**: 创建和维护高质量的模板

### 故障排除
```bash
# 检查依赖
python scripts/office/soffice.py --check-deps

# 调试模式
python -m markitdown --verbose presentation.pptx

# 清理缓存
rm -rf /tmp/soffice_*
```

---

**提示**: 对于复杂的PPT编辑任务，建议使用专业的PPT编辑软件（如Microsoft PowerPoint或Google Slides）进行主要编辑，然后使用本工具进行批量处理和自动化任务。
