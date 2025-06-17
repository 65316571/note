| 命令         | 作用说明                                                                       |
| ---------- | -------------------------------------------------------------------------- |
| `clean`    | 清除 Hexo 生成的缓存文件和 `public/` 目录，适用于重新部署前                                     |
| `config`   | 获取或设置 Hexo 的配置参数                                                           |
| `deploy`   | 部署网站到远程仓库（比如 GitHub Pages）                                                 |
| `generate` | 生成静态页面（输出到 `public/` 目录）                                                   |
| `help`     | 查看命令帮助信息                                                                   |
| `init`     | 初始化一个新的 Hexo 项目目录                                                          |
| `list`     | 列出网站中的信息（如文章、标签等）                                                          |
| `migrate`  | 从其他博客系统迁移数据（如 WordPress）                                                   |
| `new`      | 创建一篇新的文章                                                                   |
| `publish`  | 将草稿（在 `_drafts` 文件夹中）发布到正式文章目录 `_posts`                                    |
| `render`   | 使用 Hexo 渲染器插件手动渲染文件                                                        |
| `server`   | 启动本地服务器预览站点（默认地址 [http://localhost:4000）](http://localhost:4000%EF%BC%89/) |
| `version`  | 查看当前 Hexo 的版本信息                                                            |

部署到远程使用这三个命令同步过去
```
hexo -clean
hexo -generate
hexo -deploy
```