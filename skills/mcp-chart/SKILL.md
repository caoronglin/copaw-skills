---
name: MCP 图表生成
description: 数据可视化工具，生成各种类型的图表（折线图、柱状图、饼图等）。基于AntV图表库，支持25+种图表类型，适用于数据分析、报告生成等场景。
triggers:
  - "生成图表"
  - "画图"
  - "数据可视化"
  - "折线图"
  - "柱状图"
  - "饼图"
  - "图表"
mcp:
  command: "npx"
  args: ["-y", "@antv/mcp-server-chart"]
---

# 图表生成 MCP 技能

## 功能说明

MCP Server Chart 是基于 AntV 的数据可视化 MCP 服务：

- 📊 **25+图表类型**：折线图、柱状图、饼图、雷达图等
- 📈 **数据分析**：支持数据分析和可视化
- 🎨 **自定义样式**：丰富的配置选项
- 🗺️ **地图可视化**：支持中国地区地图（需配置）
- 💾 **多种输出**：支持PNG、SVG等格式

## 支持的图表类型

### 基础图表
| 图表类型 | 工具名称 | 用途 |
|---------|---------|------|
| 折线图 | generate_line_chart | 趋势展示 |
| 柱状图 | generate_column_chart | 对比分析 |
| 条形图 | generate_bar_chart | 横向对比 |
| 饼图 | generate_pie_chart | 占比分析 |
| 面积图 | generate_area_chart | 趋势面积 |
| 散点图 | generate_scatter_chart | 相关性分析 |

### 高级图表
| 图表类型 | 工具名称 | 用途 |
|---------|---------|------|
| 雷达图 | generate_radar_chart | 多维对比 |
| 热力图 | generate_heatmap_chart | 密度展示 |
| 漏斗图 | generate_funnel_chart | 转化分析 |
| 箱线图 | generate_box_plot_chart | 分布分析 |
| 双轴图 | generate_dual_axes_chart | 双指标对比 |
| 瀑布图 | generate_waterfall_chart | 增减分析 |

### 特殊图表
| 图表类型 | 工具名称 | 用途 |
|---------|---------|------|
| 思维导图 | generate_mind_map | 结构展示 |
| 鱼骨图 | generate_fishbone_diagram | 因果分析 |
| 流程图 | generate_flow_chart | 流程展示 |
| 桑基图 | generate_sankey_chart | 流向分析 |

## 工具使用示例

### 1. generate_line_chart - 折线图

**功能**：生成折线图，展示数据趋势

**参数说明**：

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| data | array | ✅ | 数据数组 |
| title | string | ❌ | 图表标题 |
| xField | string | ✅ | X轴字段名 |
| yField | string | ✅ | Y轴字段名 |
| smooth | boolean | ❌ | 是否平滑曲线 |

**数据格式**：
```json
{
  "data": [
    {"month": "1月", "value": 100},
    {"month": "2月", "value": 120},
    {"month": "3月", "value": 150}
  ],
  "xField": "month",
  "yField": "value",
  "title": "月度销售趋势",
  "smooth": true
}
```

### 2. generate_column_chart - 柱状图

**功能**：生成柱状图，对比不同类别

**参数**：
- `data`: 数据数组
- `xField`: X轴字段
- `yField`: Y轴字段
- `groupField`: 分组字段（可选）
- `stackField`: 堆叠字段（可选）

### 3. generate_pie_chart - 饼图

**功能**：生成饼图，展示占比关系

**参数**：
- `data`: 数据数组
- `angleField`: 角度字段（数值）
- `colorField`: 颜色字段（分类）
- `innerRadius`: 内半径（环形图）

## 配置方式

### 基础配置
```json
{
  "mcpServers": {
    "chart": {
      "command": "npx",
      "args": ["-y", "@antv/mcp-server-chart"]
    }
  }
}
```

### 禁用特定工具
```json
{
  "mcpServers": {
    "chart": {
      "command": "npx",
      "args": ["-y", "@antv/mcp-server-chart"],
      "env": {
        "DISABLED_TOOLS": "generate_fishbone_diagram,generate_mind_map"
      }
    }
  }
}
```

### 自定义服务URL
```json
{
  "env": {
    "VIS_REQUEST_SERVER": "https://your-server.com/api/chart"
  }
}
```

## 使用场景

### 1. 数据趋势分析
```
用户：帮我画一个销售趋势折线图
助手：[调用 generate_line_chart]
```

### 2. 类别对比
```
用户：对比各部门的业绩
助手：[调用 generate_column_chart]
```

### 3. 占比分析
```
用户：展示各产品的市场份额
助手：[调用 generate_pie_chart]
```

### 4. 多维分析
```
用户：分析各城市的多维度指标
助手：[调用 generate_radar_chart]
```

## 触发时机
- 需要数据可视化
- 生成报告图表
- 数据分析展示
- 对比分析场景

## 最佳实践

### 1. 选择合适的图表类型
```
趋势 → 折线图、面积图
对比 → 柱状图、条形图
占比 → 饼图、环形图
多维 → 雷达图
相关 → 散点图
```

### 2. 数据准备
```python
# 数据格式统一
data = [
  {"category": "A", "value": 100},
  {"category": "B", "value": 200}
]
```

### 3. 样式优化
```json
{
  "smooth": true,  // 平滑曲线
  "groupField": "type",  // 分组显示
  "color": ["#5B8FF9", "#5AD8A6"]  // 自定义颜色
}
```

## 注意事项

⚠️ **重要提示**：
1. 地图可视化需配置高德地图服务
2. 默认使用免费在线服务，大量使用建议私有部署
3. 复杂图表可能需要更多配置
4. 数据格式需符合要求

## 地图配置（可选）

### 配置高德地图
```json
{
  "env": {
    "SERVICE_ID": "your_amap_service_id"
  }
}
```

**注意**：地图功能仅支持中国地区

## 官方资源

- **GitHub**: https://github.com/antvis/mcp-server-chart
- **AntV官网**: https://antv.vision
- **文档**: https://github.com/antvis/mcp-server-chart#readme
- **许可证**: MIT License

## 常见问题

### Q: 图表中文乱码？
**A**: 确保数据使用UTF-8编码

### Q: 如何保存图表？
**A**: 图表会生成图片链接，可直接下载保存

### Q: 支持实时更新吗？
**A**: 不支持，每次调用生成新的静态图表

---
*更新时间: 2026-03-08*
*版本: 1.0*