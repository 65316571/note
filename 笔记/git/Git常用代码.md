在日常使用Git时，有一些常见的代码操作是必备的。下面列举了一些常用的Git命令及其功能：

1. ###### **初始化一个Git仓库：**

```
git init
```

这个命令用于在当前目录下创建一个新的Git仓库。

1. **克隆一个现有的仓库：**

```
git clone <repository_url>
```

这个命令用于克隆（复制）一个远程仓库到本地。

1. **添加文件到暂存区：**

```
git add <file_name>
```

将文件的更改添加到Git的暂存区，准备提交。

1. **提交暂存区的文件到本地仓库：**

```
git commit -m "commit message"
```

将暂存区的文件提交到本地仓库，并附带一条提交消息。

1. **查看当前文件状态：**

```
git status
```

查看当前工作区的文件状态，包括已修改、已暂存、未跟踪等。

1. **查看提交日志：**

```
git log
```

查看当前分支的提交历史记录。

1. **创建新的分支：**

```
git branch <branch_name>
```

创建一个新的分支，但不会切换到该分支。

1. **切换到指定分支：**

```
git checkout <branch_name>
```

切换到指定的分支。

1. **创建并切换到新的分支：**

```
git checkout -b <new_branch_name>
```

这个命令等同于同时执行了 `git branch` 和 `git checkout` 命令，创建一个新的分支并切换到该分支。

1. **将本地分支推送到远程仓库：**

```
git push origin <branch_name>
```

将当前分支的更改推送到远程仓库。

1. **从远程仓库拉取更新：**

```
git pull
```

从远程仓库拉取最新的更改并合并到当前分支。

1. **合并指定分支到当前分支：**

```
git merge <branch_name>
```

将指定分支的更改合并到当前分支。

1. **解决合并冲突：** 在执行 `git merge` 合并分支时，如果出现冲突，需要手动解决冲突，然后执行 `git add` 和 `git commit` 完成合并。
2. **查看远程仓库信息：**

```
git remote -v
```

取项目别名。		

​			1.**取别名：**在输入git remote add添加远程仓库地址时，可以采用别名的形式，譬如：这里的origin+开源地址。

```
 git remote add origin https://gitee.com/haohaoAAA/ssm_erp.git
```

查看当前配置的远程仓库信息。

1. **查看帮助文档：**

```
git help
```

查看Git的帮助文档，可以查找关于Git命令的详细信息。