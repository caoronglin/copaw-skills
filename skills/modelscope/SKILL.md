---
name: modelscope
description: 魔搭ModelScope AI能力平台，支持文生图、模型搜索、模型推理。用户说"魔搭"、"modelscope"、"生成图片"、"文生图"时使用。
mcp:
  command: "uvx"
  args: ["modelscope-mcp-server"]
  env:
    MODELSCOPE_API_TOKEN: "${MODELSCOPE_API_TOKEN}"
---

# ModelScope技能（统一版）

魔搭官方MCP服务，整合模型搜索、图像生成、模型推理等AI能力。

## 🎯 核心能力

| 功能 | 说明 |
|------|------|
| 图像生成 | 文生图、图生图 |
| 模型搜索 | 搜索模型、数据集、应用 |
| 模型推理 | 调用各种AI模型 |
| 资源详情 | 获取资源详细信息 |

---

## 🎨 图像生成

### generate_image - 文生图

**参数：**

| 参数 | 类型 | 必填 | 说明 |
|------|------|------|------|
| prompt | string | ✅ | 文本描述（中英文均可） |
| model | string | ❌ | 模型名称，默认qwen-image |
| size | string | ❌ | 图像尺寸，如1024x1024 |
| style | string | ❌ | 艺术风格 |
| quality | string | ❌ | 图像质量 |

**示例：**
```json
{
  "prompt": "一只可爱的橘猫在草地上玩耍，阳光明媚，高清摄影风格",
  "size": "1024x1024",
  "style": "realistic"
}
```

**返回：** Base64编码的图像数据

### 提示词技巧

```python
# 好的提示词结构
prompt = f"{主体}，{环境}，{风格}，{质量要求}"

# 示例
"一座未来城市，高楼林立，霓虹灯闪烁，科幻电影风格，超高清"
```

### 风格选项

| 风格 | 说明 |
|------|------|
| realistic | 写实风格 |
| cartoon | 卡通风格 |
| artistic | 艺术风格 |
| watercolor | 水彩风格 |

---

## 🔍 资源搜索

### search_models - 搜索模型

**参数：**

| 参数 | 类型 | 必填 | 说明 |
|------|------|------|------|
| query | string | ✅ | 搜索关键词 |
| filter | object | ❌ | 过滤条件 |
| limit | int | ❌ | 返回数量 |

**示例：**
```json
{
  "query": "图像分类",
  "filter": {"task": "image-classification"},
  "limit": 10
}
```

### search_datasets - 搜索数据集

### search_studios - 搜索应用

### search_papers - 搜索论文

---

## 🚀 模型推理

### run_inference - 调用模型

**参数：**

| 参数 | 类型 | 必填 | 说明 |
|------|------|------|------|
| model_id | string | ✅ | 模型ID |
| input | object | ✅ | 输入数据 |
| parameters | object | ❌ | 推理参数 |

**示例：**
```json
{
  "model_id": "damo/nlp_structbert_sentence-similarity_chinese-base",
  "input": {
    "text1": "今天天气不错",
    "text2": "今天是个好天气"
  }
}
```

---

## 📋 资源详情

### get_model_detail - 模型详情

**参数：**
- `model_id`: 模型ID

**返回：**
- 模型描述、文件列表、使用示例、许可证

### get_dataset_detail - 数据集详情

---

## 🔧 配置

### 获取API Token
1. 访问 https://modelscope.cn/home
2. 登录账号
3. 个人中心 → 访问令牌
4. 创建或复制Token

### MCP配置
```json
{
  "mcpServers": {
    "modelscope": {
      "command": "uvx",
      "args": ["modelscope-mcp-server"],
      "env": {"MODELSCOPE_API_TOKEN": "your-token"}
    }
  }
}
```

---

## 💡 使用场景

### 1. 生成图片
```
用户：帮我画一只中国风水墨画的熊猫
操作：generate_image(prompt="水墨画风格的可爱熊猫，中国传统艺术")
```

### 2. 搜索模型
```
用户：找一些图像分类模型
操作：search_models(query="图像分类")
```

### 3. 模型推理
```
用户：分析这两句话的相似度
操作：run_inference(model_id="...", input={...})
```

---

## ⚠️ 注意事项

- API Token不要泄露
- 免费版每日2000次调用限制
- 部分模型需要特殊权限
- 遵守内容规范

---

## 📚 官方资源

- 官网：https://modelscope.cn
- GitHub：https://github.com/modelscope/modelscope-mcp-server
- 文档：https://modelscope.cn/docs

---
*ModelScope统一技能 v1.0 | 图像生成·模型搜索·推理*