---
title: Agent 工作区
weight: 1
bookCollapseSection: true
---

# Agent 工作区

每个 Agent 拥有独立的工作区，用于存储其特定项目的上下文、记忆和工作产物。

## 架构说明

工作区目录通过**软链接**关联到各 Agent 原始项目中的文件，这样做的好处：

- 保持内容的**单一数据源**，避免重复
- 原始文件更新后，站点内容自动同步
- 不占用额外磁盘空间

## 添加新工作区

要为新的 Agent 项目添加工作区，执行以下步骤：

```bash
# 1. 在 workspaces 下创建 Agent 目录
mkdir -p content/docs/workspaces/<agent-name>

# 2. 创建索引文件
cat > content/docs/workspaces/<agent-name>/_index.md << 'EOF'
---
title: <Agent 名称>
weight: 10
---
# <Agent 名称> 工作区
EOF

# 3. 创建到原始文件的软链接
ln -s /path/to/original/file.md content/docs/workspaces/<agent-name>/file.md
```

## 当前工作区

{{< section >}}
