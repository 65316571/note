```shell
进入本地常用Git路径
cd C:/Data/Object/Git

# 1. 备份当前代码（非常重要，防止误操作丢失）
cp -r ./ ./backup_code

# 2. 创建一个无历史的新分支（这里以 new-main 命名）
git checkout --orphan new-main

# 3. 添加所有文件
git add .

# 4. 提交，作为新的第一条 commit
git commit -m "重置历史，初始提交"

# 5. 强制推送到远程 main 分支（覆盖远程历史）
git push origin new-main:main --force

# 6. 切换回 main 分支（可选，或者删除本地 main 重新命名）
git checkout main

# 7. 删除本地旧分支 main
git branch -D main

# 8. 重命名 new-main 为 main
git branch -m new-main main

# 9. 强制推送新的 main（确认）
git push origin main --force
```

