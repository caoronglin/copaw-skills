# Skill 创建完整指南

## 一、快速创建流程

### 步骤1：收集MCP信息

从MCP配置中提取关键信息：
```json
{
  "mcpServers": {
    "服务名": {
      "command": "命令",
      "args": ["参数"],
      "env": {
        "API_KEY": "your_key"
      }
    }
  }
}
```

### 步骤2：创建目录结构
```bash
active_skills/
└── mcp-[服务名]/
    └── SKILL.md
```

### 步骤3：使用模板创建SKILL.md

## 二、信息收集清单

### 必备信息
- [ ] 服务名称
- [ ] 核心功能描述
- [ ] 触发关键词（3-5个）
- [ ] 提供的工具列表
- [ ] 配置方式
- [ ] 官方文档链接

### 可选信息
- [ ] API文档
- [ ] GitHub仓库
- [ ] 使用示例
- [ ] 常见问题

## 三、信息来源优先级

1. **GitHub仓库** ⭐⭐⭐⭐⭐
   - README.md
   - 示例代码
   - Issues

2. **官方文档** ⭐⭐⭐⭐
   - API文档
   - 使用指南

3. **MCP市场** ⭐⭐⭐
   - ModelScope MCP广场
   - Smithery
   - MCP Registry

## 四、创建工具

### 方法1：使用搜索工具
```bash
tavily_search "MCP [服务名] official documentation"
```

### 方法2：提取GitHub内容
```bash
tavily_extract "https://github.com/xxx/xxx-mcp"
```

### 方法3：浏览器访问
```bash
browser_use open "https://官方网站"
browser_use snapshot
```

## 五、质量检查清单

### 内容完整性
- [ ] 功能说明完整（100+字）
- [ ] 所有工具已列出
- [ ] 参数表格完整
- [ ] 配置代码可用
- [ ] 使用场景≥5个

### 格式规范
- [ ] YAML头部正确
- [ ] Markdown格式统一
- [ ] 表格对齐
- [ ] 链接有效

### 实用性
- [ ] 使用场景真实
- [ ] 代码示例可运行
- [ ] FAQ解答实际问题

## 六、常见MCP配置类型

### 类型1：NPX命令型
```yaml
mcp:
  command: "npx"
  args: ["-y", "包名"]
```

### 类型2：UVX命令型
```yaml
mcp:
  command: "uvx"
  args: ["包名"]
```

### 类型3：远程服务型
```yaml
mcp:
  type: remote
  url: "https://api.service.com/mcp"
  headers:
    Authorization: "Bearer key"
```

### 类型4：Docker型
```yaml
mcp:
  command: "docker"
  args: ["run", "--rm", "-i", "image"]
```

## 七、触发关键词设计

### 原则
1. **用户视角**：用户会说什么
2. **功能导向**：体现核心功能
3. **避免歧义**：不与其他skill冲突

### 示例

| 服务类型 | 触发关键词 |
|---------|-----------|
| 搜索类 | 搜索、查找、查询 |
| 生成类 | 生成、创建、制作 |
| 分析类 | 分析、识别、理解 |
| 管理类 | 管理、配置、设置 |

## 八、使用场景设计

### 公式
```
用户需求 + 工具功能 = 使用场景
```

### 示例

**场景1：基础使用**
```
用户：帮我[执行某个操作]
助手：[调用对应工具]
```

**场景2：复杂场景**
```
用户：[复杂需求]
助手：[分析 → 选择工具 → 执行 → 返回结果]
```

**场景3：错误处理**
```
用户：[错误操作]
助手：[提示正确方法]
```

## 九、维护更新

### 定期检查
- 每月检查官方文档更新
- 验证链接有效性
- 补充新的使用场景

### 版本管理
```markdown
---
*更新时间: YYYY-MM-DD*
*版本: X.Y*
*变更说明: [变更内容]*
```

---
*创建时间: 2026-03-08*
*适用范围: MCP Skill 创建*