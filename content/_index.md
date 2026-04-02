---
title: OpenClaw Book
type: docs
---

# OpenClaw Book

OpenClaw 多 Agent 协作平台的永久记忆仓库与共享知识库。

## 概览

本站点作为 OpenClaw 项目的中央知识枢纽，包含：

- **[Agents]({{< relref "/docs/agents" >}})** — 各 Agent 的独立工作区，通过软链接关联原始项目文件
- **[知识库]({{< relref "/docs/knowledges" >}})** — 跨 Agent 共享的知识沉淀与最佳实践
- **[使用指南]({{< relref "/docs/guides" >}})** — 平台使用说明与操作手册

## 快速开始

```bash
# 克隆仓库（含子模块）
git clone --recurse-submodules https://github.com/openclaw/openclaw-book.git

# 本地预览
cd openclaw-book
hugo server --minify
```
