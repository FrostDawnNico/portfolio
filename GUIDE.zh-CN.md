# 作品集：内容更新与发布指南

本指南适用于 [作品集网站](https://frostdawnnico.github.io/portfolio/) 和 [GitHub 仓库](https://github.com/FrostDawnNico/portfolio)。本地项目目录：`D:\Agent\Portfolio\portfolio-v2`。网站使用 Astro 生成静态页面，无需数据库或常驻服务器。

## 一、首次准备与本地预览

1. 安装 Node.js 22 或更高版本，并在 PowerShell 中进入项目目录：

   ```powershell
   cd D:\Agent\Portfolio\portfolio-v2
   npm ci
   npm run dev
   ```

2. 在浏览器打开终端显示的地址，通常是 `http://localhost:4321/`。修改文件后页面一般会自动刷新；停止预览时在终端按 `Ctrl+C`。以后依赖没变时通常不必重复运行 `npm ci`。
3. 如果预览不正确，可重启预览服务。预览服务仅在本机运行，与公开网站无关。

## 二、修改项目内容

项目内容保存在 `src/content/projects/`，每个 `.md` 文件对应一个项目；例如 `battle.md` 是 Battle Cap。文件名前缀决定项目详情网址，改名可能导致已有外部链接失效。

用编辑器打开文件。开头两个 `---` 之间是项目信息，下面是 Markdown 正文：

```yaml
---
title: "Battle Cap"
category: "GAME DEVELOPMENT · TECHNICAL ART"
period: "2023—2024"
order: 3
summary: "Technical art for a multiplayer party game."
role: "Technical art intern · Team project"
focus: "Game development / Technical art"
lead: "Bringing playful visual ideas into a working game."
cover: "images/battle/cover.jpg"
coverAlt: "Battle Cap illustrated cover art"
heroCover: "images/battle/hero.jpg"
heroAlt: "Battle Cap boats racing through a naval battle"
credits: "A collaborative game by MechAlmond Productions."
draft: false
links: [{"label":"Watch official gameplay","url":"https://www.bilibili.com/video/BV1BRKoeMExG/"}]
---

## The challenge

在这里写英文项目介绍。
```

- `order` 越小越靠前。调整排序时修改相关项目的数字，避免重复；首页和详情页编号都会随之更新。
- `title`、`summary` 分别用于标题和首页简介；`role`、`focus`、`lead`、`credits` 用于说明职责、方向、概述和署名。`category`、`period` 显示项目分类和时间。
- `cover` 是首页封面，`coverAlt` 是图片文字描述。`heroCover` 和 `heroAlt` 是可选的详情页主图及描述；不填时沿用 `cover` 和 `coverAlt`。
- `links` 放论文、代码或视频的标题和完整网址；没有链接可写 `links: []`。字段内容中有英文双引号时要转义为 `\"`。
- 将 `draft: true` 可在构建时隐藏首页卡片和详情页；公开 GitHub 仓库里的草稿文件仍然可被任何人查看，不能用于保存保密内容。
- `imageNote` 是可选的详情页图片说明；其他字段及格式可参考现有项目。

## 三、添加项目与媒体

1. 复制一个现有 `.md` 文件，按项目另存到 `src/content/projects/`，使用小写英文、数字和连字符命名，例如 `my-new-project.md`。
2. 修改所有字段和正文，并为 `order` 选择不重复的数字。项目独有的章节可直接用 Markdown 自由编排。
3. 将图片放入 `public/images/my-new-project/`，在字段中填写 `images/my-new-project/cover.jpg`，不带开头斜杠。例如 `cover: "images/my-new-project/cover.jpg"`。
4. 要在正文插入图片，可使用 `![图片说明](../../images/my-new-project/detail.jpg)`；此相对路径适配现有 `/portfolio/projects/项目名/` 页面结构。更改网址结构后需重新检查。
5. 建议先压缩大图。大视频不要直接提交到 Git：先上传到合适的视频托管平台，再把公开链接加入 `links`。未获授权的团队资产或不适合公开的内容不要提交。
6. 本地预览并检查新增卡片、详情页和媒体后，再按下面的流程发布。

## 四、修改个人介绍和首页

- 姓名、昵称、首页介绍和超立方体：`src/pages/index.astro`。
- 导航、页脚和联系方式：`src/layouts/Base.astro`。
- 配色、字体、布局和响应式样式：`src/styles/site.css`。
- 这些文件包含代码；文字尽量保留原有引号和标签，修改后检查预览。项目内容优先通过 Markdown 修改。

## 五、手动发布

仓库中的 `main` 是正式发布分支；推送或合并到 `main` 会自动运行 GitHub Actions 并发布，无需手动上传 `dist/`。当前工作分支为 `work/content`。在编辑前，先保存本地工作，并确保没有未提交的修改：

```powershell
cd D:\Agent\Portfolio\portfolio-v2
git status
git fetch origin
git switch work/content
git pull --ff-only origin main
```

如果 `git pull --ff-only` 因分支有未合并提交而失败，先查看 `git status`，不要强制覆盖；可以让我协助处理。接着：

1. 修改文件，在本地预览确认。
2. 运行 `npm run check` 和 `npm run build`，确认都成功。
3. 查看 `git status` 和 `git diff`，确认只有你想公开的内容，然后执行：

   ```powershell
   git add --all
   git commit -m "Update portfolio content"
   git push -u origin work/content
   ```

   首次推送可能需要你使用 GitHub 官方登录流程授权。不要把密码或访问令牌写进文件、命令或聊天。
4. 打开 [仓库 Pull requests](https://github.com/FrostDawnNico/portfolio/pulls)，从 `work/content` 向 `main` 创建 Pull Request，检查改动和 Actions 状态。PR 只构建检查，不会自动生成可访问的预览网址；请先本地预览。
5. 选择 **Create a merge commit** 合并到 `main`。随后在 [Actions](https://github.com/FrostDawnNico/portfolio/actions) 查看最新的 **Build and deploy** 是否成功，并打开公开网站检查。合并后同步工作分支：

   ```powershell
   git switch work/content
   git pull --ff-only origin main
   ```

如果选择 squash 或 rebase 合并，同步步骤可能需要额外处理；默认采用 merge commit。若构建失败，打开 Actions 中失败的步骤查看日志，修复后再次提交并推送。直接推送到 `main` 也会发布，因此建议始终通过工作分支和 PR。

## 六、回退与备份

在 GitHub 的提交记录或 Pull Request 页面找到需要撤销的改动，使用 **Revert** 创建反向提交，再合并到 `main`；Actions 会重新部署。避免对公开分支强制推送。回退后检查网站，必要时强制刷新浏览器缓存。

第一版另存于 `D:\Agent\Portfolio\graphics-portfolio`，并保留 `ver1` 标签；它不是当前 GitHub Pages 网站。当前网站的所有源码也在公开 GitHub 仓库中。
