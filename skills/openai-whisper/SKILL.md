---
name: openai-whisper
description: "本地语音转文字工具，基于OpenAI Whisper模型。无需API密钥，支持多种音频格式和语言识别。"
triggers:
  - "语音转文字"
  - "whisper"
  - "语音识别"
  - "转文字"
  - "音频转文字"
  - "语音转文本"
  - "字幕生成"
homepage: https://openai.com/research/whisper
metadata: {"clawdbot":{"emoji":"🎙️","requires":{"bins":["whisper"]},"install":[{"id":"brew","kind":"brew","formula":"openai-whisper","bins":["whisper"],"label":"Install OpenAI Whisper (brew)"}]}}
---


# Whisper - 本地语音转文字工具

使用 `whisper` 命令行工具在本地进行语音转文字，基于OpenAI Whisper模型。无需API密钥，支持多种音频格式和语言识别。

## 🚀 快速开始

### 基本转录
```bash
# 转录MP3文件
whisper audio.mp3 --model medium --output_format txt

# 转录M4A文件
whisper audio.m4a --model small --output_format srt

# 转录WAV文件
whisper audio.wav --model large --output_format vtt
```

### 指定输出目录
```bash
# 输出到当前目录
whisper audio.mp3 --output_dir .

# 输出到指定目录
whisper audio.mp3 --output_dir ./transcripts/

# 输出多个格式
whisper audio.mp3 --output_format txt,srt,vtt --output_dir ./output/
```

## 📝 功能详解

### 模型选择
```bash
# 小模型 - 速度快，准确度较低
whisper audio.mp3 --model tiny
whisper audio.mp3 --model base
whisper audio.mp3 --model small

# 中模型 - 平衡速度和准确度
whisper audio.mp3 --model medium

# 大模型 - 速度慢，准确度高
whisper audio.mp3 --model large
whisper audio.mp3 --model large-v1
whisper audio.mp3 --model large-v2
whisper audio.mp3 --model large-v3

# Turbo模型（默认）- 优化速度
whisper audio.mp3 --model turbo
```

### 输出格式
```bash
# 纯文本
whisper audio.mp3 --output_format txt

# 字幕文件
whisper audio.mp3 --output_format srt     # SubRip格式
whisper audio.mp3 --output_format vtt     # WebVTT格式
whisper audio.mp3 --output_format tsv     # 制表符分隔值

# JSON格式（包含时间戳和置信度）
whisper audio.mp3 --output_format json

# 所有格式
whisper audio.mp3 --output_format all
```

### 语言处理
```bash
# 自动检测语言
whisper audio.mp3

# 指定语言（提高准确度）
whisper audio.mp3 --language Chinese
whisper audio.mp3 --language English
whisper audio.mp3 --language Japanese
whisper audio.mp3 --language Korean
whisper audio.mp3 --language Spanish

# 翻译为英文
whisper audio.mp3 --task translate

# 指定语言并翻译
whisper audio.mp3 --language Chinese --task translate
```

## 🎯 实用示例

### 示例1：会议录音转录
```bash
# 高质量转录会议录音
whisper meeting_recording.mp3 \
  --model large \
  --language Chinese \
  --output_format txt,srt \
  --output_dir ./meeting_transcripts/

# 生成带时间戳的文本
whisper meeting.mp3 --output_format txt --word_timestamps True
```

### 示例2：播客节目处理
```bash
# 批量处理播客音频
for podcast in podcasts/*.mp3; do
  basename=$(basename "$podcast" .mp3)
  whisper "$podcast" \
    --model medium \
    --language English \
    --output_format txt,srt \
    --output_dir "transcripts/${basename}/"
done
```

### 示例3：视频字幕生成
```bash
# 从视频提取音频并生成字幕
ffmpeg -i video.mp4 -vn -acodec pcm_s16le -ar 16000 -ac 1 audio.wav
whisper audio.wav --model medium --output_format srt

# 直接处理视频文件（如果支持）
whisper video.mp4 --model small --output_format srt
```

### 示例4：多语言内容处理
```bash
#!/bin/bash
# 多语言音频处理脚本
AUDIO_FILE="$1"

# 检测语言
echo "检测音频语言..."
LANG_INFO=$(whisper "$AUDIO_FILE" --model tiny --output_format json | jq -r '.language')

echo "检测到的语言: $LANG_INFO"

# 根据语言选择处理方式
case "$LANG_INFO" in
  "zh"|"zh-cn"|"zh-tw")
    echo "中文内容，使用大模型..."
    whisper "$AUDIO_FILE" --model large --language Chinese --output_format txt,srt
    ;;
  "en")
    echo "英文内容，使用中模型并翻译..."
    whisper "$AUDIO_FILE" --model medium --language English --output_format txt,srt
    whisper "$AUDIO_FILE" --model medium --language English --task translate --output_format txt
    ;;
  *)
    echo "其他语言，使用自动检测..."
    whisper "$AUDIO_FILE" --model medium --output_format txt,srt
    ;;
esac
```

### 示例5：批量处理工作流
```bash
#!/bin/bash
# 批量音频转录工作流
INPUT_DIR="./raw_audio"
OUTPUT_DIR="./transcripts"
LOG_FILE="./transcription.log"

mkdir -p "$OUTPUT_DIR"

echo "=== 批量转录开始 $(date) ===" > "$LOG_FILE"

find "$INPUT_DIR" -type f \( -name "*.mp3" -o -name "*.wav" -o -name "*.m4a" -o -name "*.flac" \) | while read audio_file; do
  BASENAME=$(basename "$audio_file")
  FILENAME="${BASENAME%.*}"
  
  echo "处理: $BASENAME" | tee -a "$LOG_FILE"
  
  # 创建输出子目录
  mkdir -p "$OUTPUT_DIR/$FILENAME"
  
  # 转录音频
  whisper "$audio_file" \
    --model medium \
    --output_format txt,srt,json \
    --output_dir "$OUTPUT_DIR/$FILENAME" \
    --verbose 2>&1 | tee -a "$LOG_FILE"
  
  echo "完成: $BASENAME" | tee -a "$LOG_FILE"
  echo "---" | tee -a "$LOG_FILE"
done

echo "=== 批量转录结束 $(date) ===" >> "$LOG_FILE"
echo "所有音频处理完成！结果保存在: $OUTPUT_DIR"
```

## ⚙️ 高级选项

### 性能优化
```bash
# 使用GPU加速（如果可用）
whisper audio.mp3 --device cuda

# 使用CPU（默认）
whisper audio.mp3 --device cpu

# 指定线程数
whisper audio.mp3 --threads 4

# 批处理大小
whisper audio.mp3 --batch_size 16
```

### 处理控制
```bash
# 指定时间范围
whisper audio.mp3 --start_at 60 --stop_at 300  # 处理1-5分钟部分

# 温度控制（影响随机性）
whisper audio.mp3 --temperature 0.0  # 确定性最高
whisper audio.mp3 --temperature 0.2  # 推荐值
whisper audio.mp3 --temperature 1.0  # 随机性最高

# 词级时间戳
whisper audio.mp3 --word_timestamps True

# 抑制重复
whisper audio.mp3 --suppress_repetitions True
```

### 输出控制
```bash
# 输出文件名前缀
whisper audio.mp3 --output_name "transcript"

# 详细输出
whisper audio.mp3 --verbose True

# 进度显示
whisper audio.mp3 --progress True

# 无进度显示（用于脚本）
whisper audio.mp3 --progress False
```

## 🔧 故障排除

### 常见问题

**1. 模型下载失败**
```bash
# 手动设置模型缓存目录
export WHISPER_CACHE_DIR="/path/to/cache"

# 使用国内镜像（如果可用）
# 设置环境变量或手动下载模型
```

**2. 内存不足**
```bash
# 使用更小的模型
whisper audio.mp3 --model tiny

# 分块处理长音频
whisper audio.mp3 --chunk_length 30  # 30秒分块
```

**3. 音频格式不支持**
```bash
# 使用ffmpeg转换格式
ffmpeg -i input.avi -vn -acodec pcm_s16le -ar 16000 -ac 1 output.wav

# 批量转换
for file in *.m4a; do
  ffmpeg -i "$file" -vn -acodec pcm_s16le -ar 16000 -ac 1 "${file%.m4a}.wav"
done
```

**4. 识别准确度低**
```bash
# 指定正确的语言
whisper audio.mp3 --language Chinese

# 使用更大的模型
whisper audio.mp3 --model large

# 预处理音频（降噪、归一化）
# 使用音频编辑软件预处理
```

### 调试技巧
```bash
# 查看版本信息
whisper --version

# 列出可用模型
whisper --list_models

# 测试模型下载
whisper --test_models

# 详细日志
whisper audio.mp3 --verbose True --debug True
```

## 📚 学习资源

### 命令参考
```bash
# 查看完整帮助
whisper --help

# 查看模型信息
whisper --model_info medium

# 检查系统兼容性
whisper --check_system
```

### 相关技能
- **summarize**: 文本摘要工具（可用于转录后摘要）
- **openai-whisper-api**: OpenAI Whisper API版本
- **ffmpeg**: 音频视频处理工具
- **audio-processing**: 音频处理相关工具

### 最佳实践
1. **选择合适的模型**: 根据需求平衡速度和准确度
2. **指定语言**: 明确指定语言可提高准确度
3. **预处理音频**: 确保音频质量良好
4. **批量处理优化**: 使用脚本自动化处理流程
5. **结果验证**: 重要内容需要人工检查

### 性能优化
```bash
# 并行处理多个文件
parallel whisper {} --model small ::: *.mp3

# 使用GPU加速
whisper audio.mp3 --device cuda --model medium

# 预处理音频格式
for audio in *.mp3; do
  ffmpeg -i "$audio" -ar 16000 -ac 1 "${audio%.mp3}_16k.wav"
done
```

---

**提示**: Whisper是非常强大的本地语音识别工具，但对于专业用途或极高准确度要求，建议结合人工校对或使用专业语音识别服务。
