---
name: deep-research
description: 深度调研入口，智能整合多源搜索和摘要能力。用户说"调研"、"研究"、"深度搜索"、"总结内容"时使用。
triggers:
  - "调研"
  - "研究"
  - "深度搜索"
  - "查一下"
  - "总结"
  - "摘要"
---

# 深度调研

统一调研入口，整合搜索、提取、摘要、验证能力。

## 核心能力

| 功能 | 工具 | 场景 |
|------|------|------|
| 多源搜索 | metaso, tavily, ali-web | 实时信息、学术文献 |
| 内容提取 | tavily_extract, fetch | 网页正文提取 |
| 交叉验证 | 多源对比 | 信息准确性验证 |
| 智能摘要 | 结构化输出 | 长文总结、报告生成 |

## 路由策略

```
网页内容 → tavily_extract / fetch
学术搜索 → metaso(scholar) / arxiv
行业报告 → fxbaogao
技术文档 → context7
文件摘要 → pdf/docx/xlsx/pptx skill
```

## 调研模式

| 模式 | 耗时 | 工具数 |
|------|------|--------|
| quick | 1-2分钟 | 单源 |
| standard | 3-5分钟 | 2-3源 |
| deep | 5-10分钟 | 全源+分析 |

## 使用示例

```
用户：调研CRISPR最新研究
→ deep_research(query="CRISPR", mode="deep", focus="academic")
→ 调用：metaso(scholar) + arxiv + 交叉验证

用户：总结这个网页
→ tavily_extract(url) → 结构化摘要

用户：分析新能源市场
→ fxbaogao + ali-web → 整合报告
```

## 整合工具

搜索：metaso, tavily, ali-web, arxiv, fxbaogao
提取：tavily_extract, fetch, ali-web-ext
文档：pdf, docx, xlsx, pptx, image-recognition
知识：context7, deepwiki

---
*深度调研 v2.0 | 搜索·提取·摘要·验证*