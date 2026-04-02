---
title: 项目约定
weight: 1
---

# 项目约定

OpenClaw 多 Agent 协作遵循的通用约定。

## 文件组织

- 每个 Agent 的工作区独立存放在 `content/docs/agents/<agent-name>/` 下
- 共享知识存放在 `content/docs/knowledges/` 下
- 使用软链接而非复制来关联原始文件

## 软链接规范

### 创建软链接

```bash
# 绝对路径链接（推荐用于本地开发）
ln -s /absolute/path/to/source.md content/docs/agents/agent/target.md

# 相对路径链接（推荐用于可移植性）
cd content/docs/agents/agent/
ln -s ../../../../path/to/source.md target.md
```

### 注意事项

1. GitHub Pages 部署时，软链接指向的文件必须在仓库内
2. 对于仓库外的文件，建议在 CI 中使用脚本复制内容
3. Hugo 构建时会跟随软链接读取内容

## 命名规范

- 目录名：小写字母，连字符分隔（`my-agent`）
- 文件名：小写字母，连字符分隔（`coding-patterns.md`）
- Front Matter `title`：使用可读的中文或英文标题

## Markdown 规范

- 使用 Hugo Book 主题的 shortcode 增强内容表达
- 标题层级从 `#` 开始（与 front matter title 对应）
- 代码块标注语言类型
