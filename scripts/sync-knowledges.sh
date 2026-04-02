#!/usr/bin/env bash
# sync-knowledges.sh — 将 ~/.openclaw/knowledges/ 内容
# 整体复制到 content/docs/knowledges/，支持多级目录。
# 每级子目录自动补 _index.md。

set -eo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_DIR="$HOME/.openclaw/knowledges"
TARGET_DIR="$PROJECT_DIR/content/docs/knowledges"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "⚠ $SOURCE_DIR 不存在，跳过"
    exit 0
fi

# 清空目标目录，整体重新复制
rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR"
cp -r "$SOURCE_DIR"/* "$TARGET_DIR/" 2>/dev/null || true

# 为每级目录补 _index.md
find "$TARGET_DIR" -type d | while IFS= read -r dir; do
    if [ ! -f "$dir/_index.md" ]; then
        dirname_base="$(basename "$dir")"
        cat > "$dir/_index.md" << EOF
---
title: $dirname_base
---
EOF
    fi
done

count=$(find "$TARGET_DIR" -name '*.md' -type f | wc -l | tr -d ' ')
echo "✓ 已同步 $count 个文件 ← $SOURCE_DIR"
echo "完成"
