

<h1>
    <center>nvm教程：</center>
</h1>

### 1、什么是nvm、nodejs、npm的关系？

- node是一个基于Chrome V8引擎的JavaScript运行环境，它可以让JavaScript代码在浏览器之外运行，实现服务器端、命令行工具等功能。
- npm是node的包管理工具，它可以让你安装、更新、卸载和管理node的第三方模块，也可以发布自己开发的模块到npm仓库。
- nvm是node的版本管理工具，它可以让你在同一台电脑上安装和切换不同版本的node和npm，也可以根据项目的需要指定使用特定版本的node和npm。

​		你可以把node想象成一辆汽车，npm想象成汽车的零件商店，nvm想象成汽车的保养工具。你可以用nvm来安装和切换不同型号的汽车（node），也可以用nvm来检查和调整汽车的性能（npm）。你可以用npm来购买和安装汽车的零件（模块），也可以用npm来卸载和更新汽车的零件（模块）。你可以用node来驾驶汽车（运行代码），也可以用node来开发汽车（编写代码）。

### 2、npm常用命令：

nvm是一个用于管理 Node.js 版本的工具，它可以让你在同一台电脑上安装和切换不同版本的 Node.js，以便你可以轻松地在项目之间切换或测试不同的 Node.js 版本。

- `nvm -v`：查看 nvm 的版本。
- `nvm list`：查看已安装的所有 Node.js 版本，*表示当前使用的 Node.js 版本。
- `nvm ls-remote`：查看远程可用的所有 Node.js 版本。
- `nvm install <version>`：安装指定版本的 Node.js，例如 `nvm install 14.17.0` 将安装 Node.js 14.17.0 版本。
- `nvm use <version>`：切换到指定版本的 Node.js，例如 `nvm use 14.17.0` 将切换到 Node.js 14.17.0 版本。
- `nvm uninstall <version>`：卸载指定版本的 Node.js，例如 `nvm uninstall 14.17.0` 将卸载 Node.js 14.17.0 版本。
- `nvm alias <name> <version>`：为指定版本的 Node.js 创建一个别名，例如 `nvm alias default 14.17.0` 将把 Node.js 14.17.0 版本设置为默认版本。
- `nvm unalias <name>`：删除指定的别名，例如 `nvm unalias default` 将删除默认版本的别名。
- `nvm current`：显示当前正在使用的 Node.js 版本。
- `nvm run <version> <script>`：在指定版本的 Node.js 环境下运行特定的脚本，例如 `nvm run 14.17.0 app.js` 将在 Node.js 14.17.0 环境下运行 app.js 文件。

- `npm -v`：查看npm的版本。
- `npm -l`：查看npm的命令列表。
- `npm help`：查看npm的帮助文档。
- `npm config`：查看或修改npm的配置。
- `npm init`：在项目中引导创建一个package.json文件。
- `npm install`：安装模块，可以指定模块名、版本、标签、范围、仓库地址等。
- `npm uninstall`：卸载模块，可以指定模块名、版本、标签、范围等。
- `npm update`：更新模块，可以指定模块名、版本、标签、范围等。
- `npm outdated`：检查模块是否已经过时，可以指定模块名、版本、标签、范围等。
- `npm ls`：查看安装的模块，可以指定模块名、版本、标签、范围等。
- `npm link`：引用模块，可以指定模块名、版本、标签、范围等。
- `npm run`：执行脚本，可以指定脚本名或者使用预定义的脚本名，如start、test、build等。
- `npm search`：搜索模块，可以指定模块名、关键词、正则表达式等。

### 3、nvm常用命令：

nvm是一个用于管理 Node.js 版本的工具，它可以让你在同一台电脑上安装和切换不同版本的 Node.js，以便你可以轻松地在项目之间切换或测试不同的 Node.js 版本。

以下是 nvm 的一些常用命令：

- `nvm -v`：查看 nvm 的版本。
- `nvm list`：查看已安装的所有 Node.js 版本，*表示当前使用的 Node.js 版本。
- `nvm ls-remote`：查看远程可用的所有 Node.js 版本。
- `nvm install <version>`：安装指定版本的 Node.js，例如 `nvm install 14.17.0` 将安装 Node.js 14.17.0 版本。
- `nvm use <version>`：切换到指定版本的 Node.js，例如 `nvm use 14.17.0` 将切换到 Node.js 14.17.0 版本。
- `nvm uninstall <version>`：卸载指定版本的 Node.js，例如 `nvm uninstall 14.17.0` 将卸载 Node.js 14.17.0 版本。
- `nvm alias <name> <version>`：为指定版本的 Node.js 创建一个别名，例如 `nvm alias default 14.17.0` 将把 Node.js 14.17.0 版本设置为默认版本。
- `nvm unalias <name>`：删除指定的别名，例如 `nvm unalias default` 将删除默认版本的别名。
- `nvm current`：显示当前正在使用的 Node.js 版本。
- `nvm run <version> <script>`：在指定版本的 Node.js 环境下运行特定的脚本，例如 `nvm run 14.17.0 app.js` 将在 Node.js 14.17.0 环境下运行 app.js 文件。

### 4、node.js常用命令：

Node.js 是一个基于 Chrome V8 引擎的 JavaScript 运行环境，它可以让 JavaScript 代码在浏览器之外运行，实现服务器端、命令行工具等功能。

Node.js 的常用命令有以下几种：

- `node -v`：查看 Node.js 的版本。
- `node -h`：查看 Node.js 的帮助信息。
- `node file.js`：执行 file.js 文件中的 JavaScript 代码。
- `node`：进入 Node.js 的交互式解释器，可以输入和执行 JavaScript 代码。
- `node --inspect file.js`：使用检查器来调试 file.js 文件中的 JavaScript 代码。
- `node --eval "script"`：执行 script 中的 JavaScript 代码。
- `node --check file.js`：检查 file.js 文件中的 JavaScript 代码是否有语法错误。

### 5、nvm安装教程：

a.先去Github或是官网下载对应的安装包：[nvm (github.com)](https://github.com/coreybutler/nvm-windows)或是[nvm官网 (uihtm.com)](https://nvm.uihtm.com/)

b.安装时可以参考这篇文章（[nvm安装教程](https://blog.csdn.net/jiangjunyuan168/article/details/134216065)）

c.安装后配置文件地址（找到nvm包下setting.txt文件插入到后面即可）

```
node_mirror: https://npmmirror.com/mirrors/node/
npm_mirror: https://registry.npmmirror.com/mirrors/npm/
```

