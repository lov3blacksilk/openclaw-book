#!/usr/bin/env bash
# sync-agents.sh — 扫描 ~/.openclaw/workspace* 目录，
# 将内容复制到 content/docs/agents/ 对应子目录。
#
# 命名规则：
#   workspace-xxx  →  content/docs/agents/xxx/
#   workspace      →  content/docs/agents/main/

set -eo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OPENCLAW_DIR="$HOME/.openclaw"
AGENTS_DIR="$PROJECT_DIR/content/docs/agents"
MARKER=".sync-agents"

if [ ! -d "$OPENCLAW_DIR" ]; then
    echo "⚠ $OPENCLAW_DIR 不存在，跳过"
    exit 0
fi

shopt -s nullglob
workspace_dirs=("$OPENCLAW_DIR"/workspace*)
shopt -u nullglob

if [ ${#workspace_dirs[@]} -eq 0 ]; then
    echo "⚠ 未找到 workspace* 目录，跳过"
    exit 0
fi

mkdir -p "$AGENTS_DIR"

# 清理已不存在对应 workspace 的 agent 目录
for agent_dir in "$AGENTS_DIR"/*/; do
    [ -d "$agent_dir" ] || continue
    [ -f "$agent_dir/$MARKER" ] || continue
    source_ws="$(cat "$agent_dir/$MARKER")"
    if [ ! -d "$source_ws" ]; then
        rm -rf "$agent_dir"
        echo "✗ $(basename "${agent_dir%/}") (已清理)"
    fi
done

for ws in "${workspace_dirs[@]}"; do
    [ -d "$ws" ] || continue

    dir_basename="$(basename "$ws")"
    if [[ "$dir_basename" == workspace-* ]]; then
        name="${dir_basename#workspace-}"
    else
        name="main"
    fi

    agent_dir="$AGENTS_DIR/$name"

    # 清空旧内容，重新复制
    rm -rf "$agent_dir"
    mkdir -p "$agent_dir"
    echo "$ws" > "$agent_dir/$MARKER"

    # 复制 *.md 文件
    cp "$ws"/*.md "$agent_dir/" 2>/dev/null || true

    # 确保有 _index.md
    if [ ! -f "$agent_dir/_index.md" ]; then
        cat > "$agent_dir/_index.md" << EOF
---
title: $name
---
EOF
    fi

    # 复制 memory/ 目录
    if [ -d "$ws/memory" ]; then
        cp -r "$ws/memory" "$agent_dir/memory"
        # 确保 memory 有 _index.md
        if [ ! -f "$agent_dir/memory/_index.md" ]; then
            cat > "$agent_dir/memory/_index.md" << EOF
---
title: ${name} memory
---
EOF
        fi
    fi

    echo "✓ $name ← $ws"
done

echo "完成"
