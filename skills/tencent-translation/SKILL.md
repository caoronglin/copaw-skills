---
name: tencent-translation
description: 使用腾讯机器翻译 API 进行文本翻译，支持中英互译和多语言翻译服务。
triggers:
  - "翻译"
  - "腾讯翻译"
  - "中英翻译"
  - "英文翻译"
  - "中文翻译"
  - "翻译成英文"
  - "翻译成中文"
  - "tencent translation"
  - "machine translation"
---

# 腾讯机器翻译 (Tencent Machine Translation)

## 功能
- 中英互译
- 多语言翻译支持
- 快速准确的企业级翻译服务

## 使用方法

### 方式1：命令行
```bash
python3 /mnt/workspace/.copaw/active_skills/tencent-translation/translate.py "要翻译的文本" [目标语言]
```

### 方式2：在对话中触发
直接说"翻译 XXX"或"把 XXX 翻译成英文/中文"

## 参数说明
- `text`: 要翻译的文本
- `target_lang`: 目标语言（可选，默认 en）
  - `en` - 英文
  - `zh` - 中文
  - `ja` - 日语
  - `ko` - 韩语
  - `fr` - 法语
  - `de` - 德语
  - `es` - 西班牙语
  - `it` - 意大利语
  - `ru` - 俄语
  - `pt` - 葡萄牙语
  - `ar` - 阿拉伯语
  - `hi` - 印地语

## 示例
```
用户: 翻译 hello world
返回: 你好，世界

用户: 翻译 你好世界 成英文
返回: Hello World
```

## API 配置
需要在环境中配置：
- `TENCENT_SECRET_ID`: 腾讯云 SecretId
- `TENCENT_SECRET_KEY`: 腾讯云 SecretKey

## 腾讯机器翻译 API
- 文档：https://cloud.tencent.com/document/api/844/50476
- 控制台：https://console.cloud.tencent.com/tmt