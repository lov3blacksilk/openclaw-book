---
title: 软链接使用指南
weight: 2
---

# 软链接使用指南

如何通过软链接将各 Agent 项目的文件集成到知识库中。

## 基本原理

```
openclaw-book/
└── content/docs/
    ├── agents/
    │   └── agent-a/
    │       ├── _index.md
    │       └── memory.md  →  ~/.claude/projects/<project>/memory/MEMORY.md
    └── knowledges/
        └── patterns.md    →  /path/to/shared/patterns.md
```

软链接让知识库始终反映各项目的最新状态，无需手动同步。

## 操作步骤

### 1. 链接 Agent 记忆文件

```bash
# 链接 Claude Code 项目的记忆文件
ln -s ~/.claude/projects/<project-path>/memory/MEMORY.md \
  content/docs/agents/<agent>/memory.md
```

### 2. 链接项目文档

```bash
# 链接项目中的文档目录
ln -s /path/to/project/docs/architecture.md \
  content/docs/agents/<agent>/architecture.md
```

### 3. 链接共享知识

```bash
# 多个 Agent 共享的知识文件
ln -s /path/to/shared/knowledge/best-practices.md \
  content/docs/knowledges/best-practices.md
```

## GitHub Pages 部署注意

> [!WARNING]
> **注意**：GitHub Actions 构建时无法访问本地文件系统的软链接目标。
>
> 对于需要部署到 GitHub Pages 的内容，有两种策略：
>
> 1. **仓库内软链接**：确保链接目标在仓库内（使用相对路径）
> 2. **CI 复制脚本**：在构建前将外部文件复制进来
>
> ```yaml
> # .github/workflows/deploy.yml 中的复制步骤
> - name: Resolve symlinks
>   run: |
>     find content/ -type l | while read link; do
>       target=$(readlink "$link")
>       if [ -f "$target" ]; then
>         cp "$target" "$link.tmp"
>         rm "$link"
>         mv "$link.tmp" "$link"
>       fi
>     done
> ```
