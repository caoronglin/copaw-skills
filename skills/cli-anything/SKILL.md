---
name: cli-anything
description: CLI-Anything 插件 —— 为任何 GUI 软件自动生成 Agent-Native 的命令行接口。当用户需要让 AI Agent 控制专业软件（如 GIMP、Blender、LibreOffice 等）时使用。
triggers:
  - "为软件生成 CLI"
  - "让 Agent 控制软件"
  - "cli-anything"
  - "agent-native"
  - "自动化软件操作"
  - "生成命令行接口"
---

# CLI-Anything 🛠️

## 定位
**让任何软件都能被 AI Agent 通过命令行控制。**

现在的软件都是给人用的（GUI 界面、鼠标点击），但 AI Agent 用着很痛苦。CLI-Anything 就是把这个 gap bridged 掉。

## 核心能力

### 能做什么
1. **自动分析代码库** → 生成完整的 CLI 命令行接口
2. **7 阶段自动化流水线** → 从代码分析到测试到发布全包
3. **调用真实软件后端** → 不是玩具实现，是真调用 Blender、GIMP、LibreOffice 这些

### 已支持的软件（1,436+ 测试通过）

| 软件 | 领域 | 生成的 CLI |
|------|------|-----------|
| GIMP | 图像编辑 | `cli-anything-gimp` |
| Blender | 3D 建模 | `cli-anything-blender` |
| LibreOffice | 办公套件 | `cli-anything-libreoffice` |
| OBS Studio | 直播录制 | `cli-anything-obs-studio` |
| Audacity | 音频处理 | `cli-anything-audacity` |
| Kdenlive/Shotcut | 视频编辑 | `cli-anything-kdenlive` |
| Inkscape | 矢量图形 | `cli-anything-inkscape` |
| Draw.io | 流程图 | `cli-anything-drawio` |

## 安装位置

```
/mnt/workspace/.copaw/active_skills/cli-anything/plugin/
```

## 使用方式

### 作为 Claude Code 插件
```bash
# 插件已安装在 active_skills/cli-anything/plugin/
# 在 Claude Code 中使用时：
/cli-anything <software-path-or-repo>
```

### 典型用法
```bash
# 为本地软件生成 CLI
/cli-anything /home/user/gimp

# 为 GitHub 仓库生成 CLI
/cli-anything https://github.com/blender/blender

# 细化现有 CLI
/cli-anything:refine /home/user/gimp

# 运行测试
/cli-anything:test /home/user/gimp

# 验证质量
/cli-anything:validate /home/user/gimp
```

### 生成的 CLI 用法
```bash
# 进入 REPL 模式
cli-anything-blender

# Agent 控制示例
blender> scene new --name ProductShot
blender> object add-mesh --type cube
blender> render execute --output render.png
```

## 7 阶段流水线

1. **Codebase Analysis** - 分析目标软件架构
2. **CLI Architecture Design** - 设计 CLI 结构
3. **Implementation** - 实现核心模块
4. **Test Planning** - 规划测试
5. **Test Implementation** - 编写并运行测试
6. **Documentation** - 生成文档
7. **PyPI Publishing** - 打包发布

## 关键特性

- ✅ **Stateful Session Management** - 支持 undo/redo
- ✅ **Dual Output Modes** - 人类可读 + JSON 机器可读
- ✅ **REPL Mode** - 交互式命令行
- ✅ **Comprehensive Testing** - 1,436+ 测试通过
- ✅ **PyPI Distribution** - 可发布到 PyPI

## 何时使用

✅ 适合：
- 让 AI Agent 控制专业软件（GIMP、Blender 等）
- 为 GUI 应用生成自动化接口
- 批量处理图像/视频/音频/3D 文件
- 创建可重复的工作流程

❌ 不适合：
- 纯二进制、无文档格式的应用
- 需要实时 GPU/显示交互的应用
- 简单任务（直接用现有 CLI 工具就行）

## 依赖

- Python 3.10+
- click（已安装）
- pytest（已安装）

## 仓库

- GitHub: https://github.com/HKUDS/CLI-Anything
- 本地副本：`/mnt/workspace/.copaw/external_skills/CLI-Anything/`

## 注意事项

1. 这不是一个直接提供功能的 skill，而是一个**工具生成工具**
2. 需要目标软件的源代码或仓库
3. 生成过程可能需要 10-15 分钟（取决于软件复杂度）
4. 生成的 CLI 需要单独 `pip install` 到系统 PATH
