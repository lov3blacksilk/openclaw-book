---
title: 部署指南
weight: 2
---

# 部署到 GitHub Pages

## 自动部署

本项目已配置 GitHub Actions，推送到 `master` 分支时自动构建并部署。

### 工作流程

1. 推送代码到 `master` 分支
2. GitHub Actions 自动触发构建
3. Hugo 构建静态文件
4. 部署到 GitHub Pages

### 首次配置

1. 在 GitHub 仓库的 **Settings > Pages** 中：
   - Source 选择 **GitHub Actions**

2. 确保仓库的 Actions 权限已开启

3. 推送代码即可触发自动部署

## 手动部署

```bash
# 构建
hugo --minify

# public/ 目录即为静态站点产物
# 可手动部署到任何静态托管服务
```

## 自定义域名

如需使用自定义域名，在 `static/` 目录下创建 `CNAME` 文件：

```bash
echo "your-domain.com" > static/CNAME
```

并在 `hugo.yaml` 中更新 `baseURL`。
