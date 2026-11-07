# 作品集网站维护指南

网站源码位于 `D:\Agent\Portfolio\portfolio-release`，线上地址为 [作品集](https://frostdawnnico.github.io/portfolio/)，源码仓库为 [GitHub](https://github.com/FrostDawnNico/portfolio)。`素材/` 保存原始资料，`备份/` 保存历史版本；未经明确要求，不公开或修改原始素材，也不覆盖或删除备份。

## 开发和检查

GitHub Actions 使用 Node.js 22。首次运行或重新安装依赖后，在开发仓库执行：

```powershell
npm ci
npm run dev
npm run check
npm run build
```

预览地址以终端输出为准。重复启动前先检查端口是否已有本站预览；停止运行中的预览使用 Ctrl+C。受限环境阻止 Astro 写入用户配置目录时，可设置 `$env:APPDATA` 到仓库内的 `.local-config`，并设置 `$env:ASTRO_TELEMETRY_DISABLED = '1'`。依赖、缓存和构建产物不属于源码。

修改后检查桌面和手机布局、相关链接和交互；涉及动画时检查键盘、触屏及减少动态效果。报告未完成的检查。

## 项目内容和媒体

`src/content/projects/` 中每个 Markdown 文件对应一个项目；文件名决定详情页路径，重命名可能使旧链接失效。字段定义见 `src/content.config.ts`：

- `group` 为 `research`、`engineering`、`game` 或 `graphics`；`groupOrder` 控制组内顺序，`order` 控制整体顺序及详情页编号。
- `title`、`category`、`period`、`summary`、`role`、`focus`、`lead` 描述项目；`credits` 记录署名。
- `cover`、`coverAlt` 是封面和替代文字；`heroCover`、`heroAlt`、`imageNote` 可用于详情页。`previewVideo`、`previewCover`、`previewCoverAlt` 用于首页预览；`paperUrl` 可指定论文网址。
- `links` 是标题与网址的列表；`draft: true` 会在网站构建时隐藏项目，但公开仓库中的文件仍可查看。

首页分组标题和说明在 `src/pages/index.astro`；导航菜单对应分组在 `src/layouts/Base.astro`。新增或修改项目时参考已有文件，并检查卡片及详情页。网站资源放在 `public/`；从素材选图前核实公开权限、隐私和文件体积。

## 代码与配色

- `src/pages/index.astro`：首页分组、超立方体与卡片预览；`src/pages/projects/[id].astro`：项目详情。
- `src/layouts/Base.astro`、`src/styles/site.css`：公共结构与样式。
- `src/components/Seascape.astro`、`src/components/OceanControls.astro`、`src/seascape.glsl`：海景及其控件。
- `src/styles/theme.css`：主题配色。`--ink`、`--muted` 控制文字，`--aqua-*` 控制交互，`--surface-*` 控制背景；超立方体和海景读取的颜色需为六位十六进制。

海景支持旋钮与键盘控制，并提供减少动态效果和 WebGL 不可用时的处理。更改配色或动画后检查对比度、动态效果和移动端性能。

## 备份与发布

检查分支、远程状态和未提交改动，保留现有工作；检查与构建通过后审阅差异。创建新版本备份时使用尚不存在的 `备份/portfolio-vN/`，保存对应提交的源码，不包含 `.git`、依赖、缓存和构建产物；记录提交标识及验证结果，不覆盖旧备份。

`.github/workflows/pages.yml` 在推送 `main` 时构建和部署；其他分支推送不触发部署。面向 `main` 的 pull request 只运行构建检查；也可手动运行工作流。发布后核对 GitHub Actions 和线上页面，推送成功不代表部署成功。

历史备份可供恢复参考。第二版基准提交为 `ae3b750f38da1a32e9858c5a43e83fdfbe3e436f`；恢复前核对目标与已有改动，并保留可追溯记录。

## 海景来源

海景改编自 Alexander Alekseev（TDM，2014）的 [Seascape](https://www.shadertoy.com/view/Ms2SD1)。所用[源码副本](https://gist.github.com/matthewjberger/868a0c2596cbb2ba1e72bfdc64dfb6f1)标注 [CC BY-NC-SA 3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/)，原 Shadertoy 页面许可此前未能直接核实。网站当前为非商业求学作品集；修改海景时保留署名、许可信息及改编源码链接。用途或许可状态变化时应重新核实。
