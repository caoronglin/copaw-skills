---
name: video-frames
description: "Extract frames or short clips from videos using ffmpeg. Supports extracting single frames, generating thumbnails, creating previews, and extracting clips from videos in various formats (MP4, AVI, MKV, MOV, etc.)."
triggers:
  - "video"
  - "视频"
  - "frame"
  - "帧"
  - "extract frame"
  - "提取视频帧"
  - "thumbnail"
  - "缩略图"
  - "ffmpeg"
  - "视频处理"
  - "clip"
  - "片段"
  - "screenshot"
  - "截图"
  - "preview"
  - "预览"
homepage: https://ffmpeg.org
metadata: {"clawdbot":{"emoji":"🎞️","requires":{"bins":["ffmpeg"]},"install":[{"id":"brew","kind":"brew","formula":"ffmpeg","bins":["ffmpeg"],"label":"Install ffmpeg (brew)"}]}}
---

# Video Frames - 视频帧提取技能

使用 ffmpeg 从视频中提取帧、生成缩略图或创建短视频片段。

## 🎯 核心功能

### 帧提取
- **单帧提取** - 从指定时间点提取单张图片
- **缩略图生成** - 自动生成视频缩略图
- **预览帧** - 创建视频预览图片序列
- **关键帧提取** - 提取视频关键帧

### 视频处理
- **片段提取** - 提取视频特定时间段的片段
- **格式转换** - 视频格式转换和压缩
- **分辨率调整** - 调整视频分辨率和质量
- **元数据提取** - 提取视频信息和元数据

## 🚀 快速开始

### 安装依赖
```bash
# Ubuntu/Debian
sudo apt-get update && sudo apt-get install -y ffmpeg

# CentOS/RHEL
sudo yum install -y ffmpeg

# macOS (使用Homebrew)
brew install ffmpeg

# 检查安装
ffmpeg -version
```

### 基础使用
```bash
# 提取第一帧
{baseDir}/scripts/frame.sh /path/to/video.mp4 --out /tmp/frame.jpg

# 指定时间点提取
{baseDir}/scripts/frame.sh /path/to/video.mp4 --time 00:00:10 --out /tmp/frame-10s.jpg

# 提取视频片段
{baseDir}/scripts/clip.sh /path/to/video.mp4 --start 00:00:05 --duration 10 --out /tmp/clip.mp4
```

## 📖 使用示例

### 中文示例
```bash
# 1. 从视频提取封面帧
{baseDir}/scripts/frame.sh /path/to/教学视频.mp4 --out 封面.jpg

# 2. 提取视频中间帧作为预览
{baseDir}/scripts/frame.sh /path/to/演示视频.mp4 --time 00:01:30 --out 预览.jpg

# 3. 生成缩略图网格（3x3）
{baseDir}/scripts/thumbnails.sh /path/to/完整视频.mp4 --grid 3x3 --out 缩略图网格.jpg

# 4. 提取视频关键片段
{baseDir}/scripts/clip.sh /path/to/会议录像.mp4 --start 00:10:00 --duration 300 --out 会议精华.mp4

# 5. 批量提取视频帧
for video in *.mp4; do
    {baseDir}/scripts/frame.sh "$video" --time 00:00:05 --out "${video%.mp4}-preview.jpg"
done
```

### 英文示例
```bash
# 1. Extract cover frame from video
{baseDir}/scripts/frame.sh /path/to/tutorial.mp4 --out cover.jpg

# 2. Extract frame at specific timestamp
{baseDir}/scripts/frame.sh /path/to/demo.mp4 --time 00:01:30 --out preview.jpg

# 3. Generate thumbnail grid (3x3)
{baseDir}/scripts/thumbnails.sh /path/to/full-video.mp4 --grid 3x3 --out thumbnail-grid.jpg

# 4. Extract important clip from video
{baseDir}/scripts/clip.sh /path/to/meeting-recording.mp4 --start 00:10:00 --duration 300 --out highlights.mp4

# 5. Batch extract frames from videos
for video in *.mp4; do
    {baseDir}/scripts/frame.sh "$video" --time 00:00:05 --out "${video%.mp4}-preview.jpg"
done
```

## 🔧 核心脚本

### frame.sh - 帧提取脚本
```bash
#!/bin/bash
# 提取视频帧

VIDEO="$1"
OUTPUT="$2"
TIME="${3:-00:00:00}"

# 基本帧提取
ffmpeg -i "$VIDEO" -ss "$TIME" -vframes 1 -q:v 2 "$OUTPUT" 2>/dev/null

# 带缩放和优化的帧提取
# ffmpeg -i "$VIDEO" -ss "$TIME" -vframes 1 -vf "scale='min(1280,iw)':-1" -q:v 2 "$OUTPUT" 2>/dev/null
```

### clip.sh - 片段提取脚本
```bash
#!/bin/bash
# 提取视频片段

VIDEO="$1"
START="$2"
DURATION="$3"
OUTPUT="$4"

# 提取片段
ffmpeg -i "$VIDEO" -ss "$START" -t "$DURATION" -c copy "$OUTPUT" 2>/dev/null

# 带重编码的片段提取
# ffmpeg -i "$VIDEO" -ss "$START" -t "$DURATION" -c:v libx264 -c:a aac "$OUTPUT" 2>/dev/null
```

### thumbnails.sh - 缩略图生成脚本
```bash
#!/bin/bash
# 生成缩略图网格

VIDEO="$1"
GRID="$2"  # 格式: 3x3
OUTPUT="$3"

# 计算总帧数和间隔
TOTAL_FRAMES=9  # 3x3网格
VIDEO_DURATION=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$VIDEO")
INTERVAL=$(echo "$VIDEO_DURATION / ($TOTAL_FRAMES + 1)" | bc)

# 生成缩略图
for i in $(seq 1 $TOTAL_FRAMES); do
    TIME=$(echo "$INTERVAL * $i" | bc)
    ffmpeg -i "$VIDEO" -ss "$TIME" -vframes 1 -q:v 2 "temp_$i.jpg" 2>/dev/null
done

# 合并为网格
montage temp_*.jpg -tile "$GRID" -geometry +0+0 "$OUTPUT"
rm temp_*.jpg
```

## 🛠️ 高级功能

### 关键帧提取
```bash
# 提取所有关键帧
{baseDir}/scripts/keyframes.sh /path/to/video.mp4 --out keyframes/

# 提取关键帧并生成摘要
{baseDir}/scripts/keyframes.sh /path/to/video.mp4 --summary --out video-summary/
```

### 视频分析
```bash
# 获取视频信息
{baseDir}/scripts/info.sh /path/to/video.mp4

# 分析视频场景变化
{baseDir}/scripts/scene-detect.sh /path/to/video.mp4 --out scenes.json

# 检测视频中的文本和字幕
{baseDir}/scripts/subtitle-detect.sh /path/to/video.mp4 --out subtitles.txt
```

### 批量处理
```bash
# 批量提取所有视频的预览帧
{baseDir}/scripts/batch-process.sh /path/to/videos/ --action frame --time 00:00:05

# 批量生成缩略图
{baseDir}/scripts/batch-process.sh /path/to/videos/ --action thumbnail --grid 2x2

# 批量提取片段
{baseDir}/scripts/batch-process.sh /path/to/videos/ --action clip --start 00:00:00 --duration 10
```

## 📁 文件结构

```
video-frames/
├── SKILL.md                    # 技能说明文档
├── _meta.json                  # 元数据
├── scripts/
│   ├── frame.sh                # 帧提取脚本
│   ├── clip.sh                 # 片段提取脚本
│   ├── thumbnails.sh           # 缩略图脚本
│   ├── keyframes.sh            # 关键帧提取
│   ├── info.sh                 # 视频信息提取
│   ├── scene-detect.sh         # 场景检测
│   ├── subtitle-detect.sh      # 字幕检测
│   ├── batch-process.sh        # 批量处理
│   └── utils.sh                # 工具函数
├── examples/
│   ├── basic-examples/         # 基础示例
│   ├── advanced-examples/      # 高级示例
│   └── batch-examples/         # 批量处理示例
└── references/
    ├── ffmpeg-guide.md         # ffmpeg使用指南
    ├── video-formats.md        # 视频格式参考
    └── optimization-tips.md    # 优化技巧
```

## ⚠️ 故障排除

### 常见问题

1. **ffmpeg未安装**
   ```bash
   # 检查是否安装
   which ffmpeg
   
   # 安装ffmpeg
   # Ubuntu/Debian
   sudo apt-get update && sudo apt-get install -y ffmpeg
   
   # CentOS/RHEL
   sudo yum install -y ffmpeg
   
   # macOS
   brew install ffmpeg
   ```

2. **视频格式不支持**
   ```bash
   # 检查视频信息
   ffprobe /path/to/video.mp4
   
   # 转换视频格式
   ffmpeg -i input.avi -c:v libx264 -c:a aac output.mp4
   ```

3. **帧提取质量差**
   ```bash
   # 提高提取质量
   ffmpeg -i video.mp4 -ss 00:00:10 -vframes 1 -q:v 1 high-quality.jpg
   
   # 使用精确搜索模式
   ffmpeg -i video.mp4 -ss 00:00:10 -vframes 1 -accurate_seek -q:v 2 accurate.jpg
   ```

### 调试模式
```bash
# 启用详细输出
export FFMPEG_VERBOSE=1

# 运行脚本
./scripts/frame.sh video.mp4 --out test.jpg --debug

# 查看ffmpeg日志
tail -f ffmpeg.log
```

## 🔄 与其他技能集成

### 与image-recognition技能集成
```bash
# 提取视频帧并进行图像识别
{baseDir}/scripts/frame.sh video.mp4 --time 00:00:10 --out frame.jpg
python3 -m image_recognition recognize frame.jpg --output analysis.json

# 批量提取并识别
{baseDir}/scripts/batch-process.sh videos/ --action frame --interval 30 | \
  xargs -I {} python3 -m image_recognition recognize {} --output {}.json
```

### 与飞书技能集成
```bash
# 提取视频预览并发送到飞书
{baseDir}/scripts/frame.sh presentation.mp4 --time 00:02:00 --out preview.jpg
python3 -c "
import requests
# 发送图片到飞书
print('发送视频预览到飞书')
"

# 生成视频摘要并分享
{baseDir}/scripts/thumbnails.sh tutorial.mp4 --grid 2x2 --out summary.jpg
# 发送到飞书群组
```

### 与self-improving-agent集成
```bash
# 记录视频处理经验
cat >> .learnings/LEARNINGS.md << 'EOF'
## [LRN-202603121-001] 视频帧提取

**记录时间**: 2026-03-12T16:30:00Z
**优先级**: 中
**状态**: 已验证
**领域**: 多媒体

### 总结
使用ffmpeg提取视频帧的最佳实践

### 详细
1. 使用-ss参数进行精确时间定位
2. 使用-q:v 2平衡质量和文件大小
3. 批量处理时使用并行处理提高效率
4. 关键帧提取使用-seek精确模式
EOF
```

## 📊 性能优化

### 提取优化
```bash
# 使用硬件加速（如果可用）
ffmpeg -hwaccel cuda -i video.mp4 -ss 00:00:10 -vframes 1 frame.jpg

# 优化内存使用
ffmpeg -i video.mp4 -ss 00:00:10 -vframes 1 -threads 2 frame.jpg

# 批量处理优化
parallel -j 4 ffmpeg -i {} -ss 00:00:05 -vframes 1 {.}.jpg ::: *.mp4
```

### 质量设置
```bash
# 高质量提取（大文件）
ffmpeg -i video.mp4 -ss 00:00:10 -vframes 1 -q:v 1 high-quality.jpg

# 中等质量（推荐）
ffmpeg -i video.mp4 -ss 00:00:10 -vframes 1 -q:v 2 medium-quality.jpg

# 低质量（快速预览）
ffmpeg -i video.mp4 -ss 00:00:10 -vframes 1 -q:v 5 low-quality.jpg
```

## 🎯 最佳实践

### 帧提取
1. **精确时间** - 使用-ss参数进行精确时间定位
2. **质量平衡** - 根据用途选择适当的质量级别
3. **格式选择** - JPEG用于预览，PNG用于精确分析
4. **错误处理** - 检查视频是否存在，格式是否支持

### 批量处理
1. **并行处理** - 使用GNU parallel提高处理速度
2. **内存管理** - 控制同时处理的视频数量
3. **进度跟踪** - 显示处理进度和预估时间
4. **结果验证** - 验证提取的帧是否正确

## 🔮 未来计划

### v2.0.0 计划功能
- AI驱动的智能帧选择
- 视频内容分析摘要
- 自动字幕生成
- 人脸和物体检测
- 视频风格转换

### 短期改进
- 更多视频格式支持
- 更好的错误处理和恢复
- GPU加速处理
- 云存储集成
- 移动设备优化

---

**✨ 从视频中提取精彩瞬间，让内容创作更简单！**