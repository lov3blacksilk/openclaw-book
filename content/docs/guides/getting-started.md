---
title: 快速开始
weight: 1
---

# 快速开始

## 前置要求

- [Hugo](https://gohugo.io/installation/) (extended edition, v0.112.0+)
- [Git](https://git-scm.com/)

## 安装与运行

```bash
# 克隆仓库（含主题子模块）
git clone --recurse-submodules https://github.com/openclaw/openclaw-book.git
cd openclaw-book

# 本地启动
hugo server --minify

# 浏览器访问 http://localhost:1313/openclaw-book/
```

## 添加 Agent

### 步骤 1：创建 Agent 目录

```bash
mkdir -p content/docs/agents/my-agent
```

### 步骤 2：创建索引文件

```bash
cat > content/docs/agents/my-agent/_index.md << 'EOF'
---
title: My Agent
weight: 10
---

# My Agent

Agent 简介与项目概述。
EOF
```

### 步骤 3：链接原始文件

```bash
# 链接记忆文件
ln -s ~/.claude/projects/<project>/memory/MEMORY.md \
  content/docs/agents/my-agent/memory.md

# 链接其他文档
ln -s /path/to/project/CLAUDE.md \
  content/docs/agents/my-agent/claude-config.md
```

### 步骤 4：预览

```bash
hugo server --minify
```

## 添加共享知识

```bash
# 直接创建
cat > content/docs/knowledges/my-topic.md << 'EOF'
---
title: 我的主题
weight: 10
---

# 主题内容
EOF

# 或通过软链接
ln -s /path/to/source.md content/docs/knowledges/my-topic.md
```

## 构建静态站点

```bash
hugo --minify
# 产物在 public/ 目录
```
