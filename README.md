# 作品集维护指南

这是使用 Astro 和 Markdown/MDX 构建的静态作品集，不需要数据库或后台服务。

## 本地运行

1. 安装 Node.js 22 或更高版本。
2. 在此目录运行 `npm ci`，然后运行 `npm run dev`，打开终端给出的本地地址。
3. 修改后运行 `npm run check` 和 `npm run build`；运行 `npm run preview` 检查生产版本。

## 增加或调整项目

- 每个项目在 `src/content/projects/` 中对应一个 `.md` 或 `.mdx` 文件。复制任一文件并改名，即可创建项目。文件名构成项目网址。
- 编辑开头 `---` 之间的字段：`title`、`category`、`period`、`order`、`summary`、`role`、`focus`、`lead`、`cover`、`coverAlt`、`credits`、`links`。`order` 越小越靠前。设置 `draft: true` 隐藏首页及详情页。
- 在 `public/images/项目名/` 放置图片，`cover` 写为 `images/项目名/文件名.jpg`。没有封面时写 `cover: null`。正文使用 Markdown，可自由组织段落和图片。访问图片时使用部署的基础路径；尽量使用经过压缩的图片。
- 视频文件不要直接提交到 Git；将视频放到合适的外部托管服务，加入 `links` 或使用支持的平台嵌入。未经确认请勿放入不能公开的素材。
- 内容与源码放在公开仓库时，`draft: true` 仅阻止网站构建展示，并不保密；不要把不能公开的内容提交到仓库。

## 发布

当前现有 GitHub 用户主页仓库已有内容，**不要覆盖该仓库**。为本站创建一个新的公开仓库，将源码推送到该仓库；在仓库 Settings → Pages 中将构建来源设置为 GitHub Actions。提交工作分支并通过拉取请求预览和检查；合并到 `main` 后，工作流构建并部署。工作流会适配项目仓库子路径。PR 会运行构建检查，但不会自动创建可访问的预览地址；请先用本地预览检查。

`main` 的每次推送都会发布，需由仓库设置限制直接推送才能强制执行审核流程。回退可通过恢复到先前正常提交后重新发布。现有 Sites 第一版在单独的站点和本地 `graphics-portfolio` 仓库的 `ver1` 标签中。
