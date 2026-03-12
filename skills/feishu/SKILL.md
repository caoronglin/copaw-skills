---
name: feishu
description: 飞书扩展能力：发消息、创建待办、操作文档、管理日程、知识库、多维表格。用户说"发飞书"、"创建待办"、"创建日程"、"操作文档"时使用。
triggers:
  - "飞书"
  - "发飞书"
  - "飞书待办"
  - "飞书日程"
  - "飞书文档"
  - "飞书日历"
---

# 飞书扩展

飞书业务扩展能力总入口，负责消息发送、待办、文档、日历等操作。

## 六大能力

| 能力 | 场景 | API |
|------|------|-----|
| 消息发送 | 发文本/卡片通知 | `im/v1/messages` |
| 待办任务 | 创建任务、设置负责人 | `task/v2/tasks` |
| 文档操作 | 创建/编辑文档 | `docx/v1/documents` |
| 日历日程 | 创建会议、日程提醒 | `calendar/v4` |
| 知识库 | Wiki空间、节点管理 | `wiki/v2` |
| 多维表格 | Bitable数据操作 | `bitable/v1` |

## 快速使用

```
发飞书消息 → 调用消息API
创建飞书待办 → 调用task/v2，设置members.assignee
创建飞书日程 → 调用calendar/v4，需要calendar_id
操作飞书文档 → 调用docx API，注意type=docx
```

## 关键配置

环境变量（从.env读取）：
- `FEISHU_APP_ID`
- `FEISHU_APP_SECRET`
- `FEISHU_USER_OPEN_ID`

## 待办分组

创建任务后调用 `add_tasklist` 设置分组：
```json
POST /task/v2/tasks/{task_guid}/add_tasklist
{"tasklist_guid": "my_tasks", "section_guid": "xxx"}
```

## 文档权限

添加权限用 `type=docx`（新版文档）：
```python
POST /drive/v1/permissions/{doc_id}/members/batch_create
params = {"type": "docx"}
```

## 日历注意

- 不能用 `primary`，需先获取 `calendar_id`
- 用户日历ID示例：`feishu.cn_xx...@group.calendar.feishu.cn`

## 工具脚本

- `scripts/feishu_utils.py` - 底层工具函数
- `scripts/feishu_send.sh` - 快速发送

---
*飞书扩展 v3.0 | 消息·待办·文档·日历·知识库·多维表格*