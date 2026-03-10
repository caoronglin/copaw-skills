---
name: MCP BioMCP
description: 生物信息学工具，整合基因查询、NCBI搜索、蛋白质分析、临床试验等功能。整合PubMed、ClinicalTrials.gov、MyGene.info、NCBI等权威数据源。当用户需要查询基因信息、搜索NCBI、蛋白质信息、生物文献时使用此技能。
triggers:
  - "基因"
  - "NCBI"
  - "蛋白质"
  - "生物信息"
  - "PubMed"
  - "临床实验"
  - "基因变异"
mcp:
  command: "uvx"
  args: ["--with", "biomcp-python", "biomcp", "serve"]
---

# BioMCP 生物信息学技能（整合版）

整合 BioMCP + NCBI 基因搜索，一站式生物信息学服务。

## 🧬 核心功能

### 基因信息查询
- **NCBI Gene**：基因详情、序列信息、基因组位置
- **MyGene.info**：基因批量查询、注释信息
- **UniProt**：蛋白质序列、结构、功能

### 变异分析
- **ClinVar**：致病性变异、临床意义
- **gnomAD**：变异频率、人群分布
- **疾病关联**：疾病-基因关系

### 文献检索
- **PubMed**：生物医学文献搜索
- **文献关联**：基因相关文献

### 临床试验
- **ClinicalTrials.gov**：临床试验查询
- **疾病相关试验**：按疾病/基因筛选

## 🔧 工具对比

| 功能 | BioMCP | NCBI搜索 |
|------|--------|----------|
| 基因查询 | ✅ MyGene.info | ✅ NCBI Gene |
| 蛋白质 | ✅ UniProt | ✅ NCBI Protein |
| 文献 | ✅ PubMed | ✅ PubMed |
| 变异 | ✅ ClinVar/gnomAD | ❌ |
| 临床试验 | ✅ ClinicalTrials | ❌ |
| 序列信息 | ✅ | ✅ 更详细 |

**最佳实践：**
- 快速基因查询 → BioMCP（MyGene.info）
- 详细基因信息 → NCBI Gene
- 变异分析 → BioMCP（ClinVar/gnomAD）
- 临床试验 → BioMCP

## 💡 使用示例

### 1. 查询基因信息
```
用户: "查一下TP53基因"
操作: BioMCP搜索 "TP53" 或 NCBI Gene搜索
```

### 2. 变异分析
```
用户: "TP53的致病突变有哪些"
操作: BioMCP查询 ClinVar 变异
```

### 3. 搜索文献
```
用户: "找几篇关于CRISPR的论文"
操作: PubMed搜索 "CRISPR"
```

### 4. 临床试验
```
用户: "乳腺癌相关的临床试验"
操作: ClinicalTrials查询 "breast cancer"
```

## 📊 支持的数据源

| 数据源 | 类型 | 内容 |
|--------|------|------|
| NCBI Gene | 基因数据库 | 基因信息、序列 |
| NCBI Protein | 蛋白质数据库 | 蛋白质序列、结构 |
| PubMed | 文献数据库 | 生物医学文献 |
| ClinVar | 变异数据库 | 致病性变异 |
| gnomAD | 变异数据库 | 人群变异频率 |
| ClinicalTrials.gov | 临床试验 | 全球临床试验 |
| MyGene.info | 基因API | 快速基因查询 |
| UniProt | 蛋白质数据库 | 蛋白质注释 |

## 🎯 触发场景

- 用户询问基因、蛋白质信息
- 需要查询生物医学文献
- 需要分析基因变异
- 需要查找临床试验
- 生物信息学相关需求

## 🌐 相关资源

- BioMCP: https://github.com/modelcontextprotocol/servers/tree/main/src/biomcp
- NCBI: https://www.ncbi.nlm.nih.gov
- MyGene.info: https://mygene.info
- ClinVar: https://www.ncbi.nlm.nih.gov/clinvar

---
*BioMCP + NCBI | 一站式生物信息学服务*