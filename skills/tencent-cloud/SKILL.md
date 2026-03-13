---
name: tencent-cloud
description: 使用腾讯云 API 密钥调用腾讯云各种服务，包括翻译、CVM、COS等。
triggers:
  - "腾讯云"
  - "tencent cloud"
  - "腾讯翻译"
  - "tencent api"
  - "云服务"
  - "cloud service"
---

# 腾讯云 API (Tencent Cloud API)

## 环境变量
需在 `.env` 中配置：
```
TENCENT_SECRET_ID=your_tencent_secret_id_here
TENCENT_SECRET_KEY=your_tencent_secret_key_here
```

## 使用方法

### 命令行翻译
```bash
python3 /mnt/workspace/.copaw/active_skills/tencent-cloud/tencent_api.py translate <文本> [目标语言]
```

### 支持的语言
| 代码 | 语言 |
|------|------|
| zh | 中文 |
| en | 英文 |
| ja | 日语 |
| ko | 韩语 |
| fr | 法语 |
| de | 德语 |
| es | 西班牙语 |
| it | 意大利语 |
| ru | 俄语 |
| pt | 葡萄牙语 |
| ar | 阿拉伯语 |
| hi | 印地语 |

## 示例
```bash
# 英文翻译成中文
python3 tencent_api.py translate "hello world" zh
# 输出: 你好世界

# 中文翻译成英文
python3 tencent_api.py translate "酶工程" en
# 输出: enzyme engineering

# 日语翻译成中文
python3 tencent_api.py translate "こんにちは" zh
# 输出: 你好
```

## 官方文档
- 腾讯云官网：https://cloud.tencent.com
- 机器翻译 API：https://cloud.tencent.com/document/api/844/50476
- API 密钥管理：https://console.cloud.tencent.com/cam/capi