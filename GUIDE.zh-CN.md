# 作品集网站维护指南

本文面向维护者及协作 Agent。开发仓库为 `D:\Agent\Portfolio\portfolio-release`；网站为 [GitHub Pages](https://frostdawnnico.github.io/portfolio/)，源码仓库为 [FrostDawnNico/portfolio](https://github.com/FrostDawnNico/portfolio)。工作区的 `素材/` 保存项目原始资料，`备份/` 保存历史版本和归档。除非明确要求，不修改或覆盖备份。

## 本地开发和验证

GitHub Actions 使用 Node.js 22。在 PowerShell 中：

```powershell
cd D:\Agent\Portfolio\portfolio-release
npm ci
npm run dev
npm run check
npm run build
```

`npm ci` 用于首次安装或重新安装依赖；开发预览地址以终端输出为准，使用 Ctrl+C 停止。根据改动检查桌面、移动端及相关交互，并报告未验证的场景。

若受限环境阻止 Astro 写入用户配置目录，可先设置 `$env:APPDATA = 'D:\Agent\Portfolio\portfolio-release\.local-config'` 和 `$env:ASTRO_TELEMETRY_DISABLED = '1'`。依赖、缓存和构建产物不属于网站源码。

## 修改项目和媒体

`src/content/projects/` 中每个 Markdown 文件对应一个项目，文件名决定详情页路径，重命名可能使旧链接失效。字段定义以 `src/content.config.ts` 为准，首页分组和排序以 `src/pages/index.astro` 为准：

- `group` 为 `research`、`engineering`、`game` 或 `graphics`；`groupOrder` 控制组内顺序，数字越小越靠前。`order` 控制项目集合的整体顺序。
- `title`、`category`、`period`、`summary`、`role`、`focus`、`lead` 描述项目；`credits` 记录署名。
- `cover`、`coverAlt` 对应封面和描述；`heroCover`、`heroAlt`、`imageNote` 可用于详情页。预览视频使用可选的 `previewVideo`、`previewCover` 和 `previewCoverAlt`；`paperUrl` 可指定论文网址。
- `links` 是标题与网址的列表；`draft: true` 会在构建时隐藏项目，但公开仓库中的文件仍可被查看。

新增项目时参考现有内容和 schema，填写所需字段，并检查首页卡片与详情页。网站公开资源放在 `public/`，字段路径参考现有项目。工作区素材是原始资料，不应未经核实直接公开；检查素材权限、隐私及文件体积后再选取网站使用的版本。

## 实现入口

- `src/pages/index.astro`：首页、项目分组和超立方体；`src/pages/projects/[id].astro`：项目详情。
- `src/layouts/Base.astro`、`src/styles/site.css`：公共结构和样式。
- `src/components/Seascape.astro`、`src/seascape.glsl`：首页海景；`src/components/OceanControls.astro`：海景交互。

## 调整配色

主题颜色集中在 `src/styles/theme.css`：`--ink`、`--muted` 控制文字；`--aqua-*` 控制链接、标签、交互状态及轮廓；`--mint` 和 `--lemon-bright` 是强调色。`--surface-media-rgb` 使用空格分隔的 0–255 数值，同时控制图片留白、视频背景、详情页占位及半透明 About 背景；其他 `--surface-*` 控制页面和控件背景。

超立方体使用 `--cube-line`、`--cube-point` 和 `--lemon-bright`；海景使用 `--sea-base` 与 `--sea-highlight`，备用渐变使用 `--sea-fallback-*`。这些供画布或海景读取的颜色须写成六位十六进制，如 `#207e93`，修改后刷新页面。配色调整后检查文字对比度、图片留白、动态海景和移动端效果。

海景支持旋钮和键盘控制，并处理减少动态效果及 WebGL 不可用的情况。涉及相关功能时，应检查交互、移动端布局和性能。

## 发布与恢复

先检查当前分支、远程状态和工作区改动，保留已有工作；修改后执行适当检查并审阅差异。

`.github/workflows/pages.yml` 在推送 `main` 时构建并部署；推送其他工作分支本身不触发该部署。指向 `main` 的 pull request 运行构建检查，不部署；手动运行工作流也可以部署。发布后检查 GitHub Actions 结果和线上页面，推送成功本身不等于部署成功。

`备份/` 中的版本可供恢复参考。第二版基准提交为 `ae3b750f38da1a32e9858c5a43e83fdfbe3e436f`；恢复前核对目标和已有改动，采用可追溯的方式。

## 海景来源

海景改编自 Alexander Alekseev（TDM，2014）的 [Seascape](https://www.shadertoy.com/view/Ms2SD1)。所用[源码副本](https://gist.github.com/matthewjberger/868a0c2596cbb2ba1e72bfdc64dfb6f1)标注 [CC BY-NC-SA 3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/)，原 Shadertoy 页面许可此前未能直接核实。网站当前为非商业求学作品集；修改海景时保留署名、许可信息及改编源码链接。用途或许可状态变化时应重新核实。
