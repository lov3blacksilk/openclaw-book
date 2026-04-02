---
title: 示例 Agent
weight: 10
---

# 示例 Agent 工作区

这是一个示例 Agent 工作区，展示工作区的基本结构。

## 项目信息

| 属性 | 值 |
|------|-----|
| Agent 名称 | example-agent |
| 项目路径 | `/path/to/project` |
| 创建时间 | 2026-04-01 |

## 关联文件

此工作区下的文件通过软链接关联到原始项目：

```
content/docs/workspaces/example-agent/
├── _index.md          # 工作区首页（本文件）
├── memory.md -> /path/to/project/.claude/memory/MEMORY.md
└── notes.md -> /path/to/project/docs/notes.md
```

{{< hint info >}}
**提示**：将此目录作为模板，为新 Agent 创建工作区。实际使用中请替换上方路径为真实项目路径。
{{< /hint >}}
