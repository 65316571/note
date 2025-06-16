<#
.SYNOPSIS
GitHub 强制拉取脚本（不保留本地更改）
.DESCRIPTION
自动克隆或强制拉取远程仓库，完全覆盖本地更改
#>

# 设置控制台编码为UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# 配置参数
$REPO_PATH = "C:\Data\Me\资源\weekly"
$GIT_REPO_URL = "https://github.com/ruanyf/weekly.git"

try {
    # 检查并进入仓库目录
    if (Test-Path -Path $REPO_PATH) {
        Set-Location -Path $REPO_PATH
        
        # 验证是否是Git仓库
        if (Test-Path -Path ".git" -PathType Container) {
            Write-Host "正在强制拉取远程更改（覆盖本地）..." -ForegroundColor Cyan
            
            # 执行Git操作
            git fetch --all
            git reset --hard origin/master
            git clean -fd -q
            
            if ($LASTEXITCODE -eq 0) {
                Write-Host "拉取成功！本地已与远程完全同步。" -ForegroundColor Green
            } else {
                Write-Host "拉取失败！请检查Git状态。" -ForegroundColor Red
            }
        } else {
            Write-Host "错误：目录存在但不是Git仓库" -ForegroundColor Red
            Write-Host "请手动删除 $REPO_PATH 后重试" -ForegroundColor Yellow
        }
    } else {
        Write-Host "仓库不存在，正在克隆..." -ForegroundColor Cyan
        
        # 创建父目录（如果不存在）
        $parentDir = Split-Path -Path $REPO_PATH -Parent
        if (!(Test-Path -Path $parentDir)) {
            New-Item -ItemType Directory -Path $parentDir | Out-Null
        }
        
        git clone $GIT_REPO_URL $REPO_PATH
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "克隆成功！" -ForegroundColor Green
        } else {
            Write-Host "克隆失败！请检查网络或仓库地址。" -ForegroundColor Red
        }
    }
} catch {
    Write-Host "发生错误: $_" -ForegroundColor Red
} finally {
    # 兼容性更好的暂停方式
    if ($Host.Name -eq "ConsoleHost") {
        Write-Host "按任意键继续..." -NoNewline
        $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    } else {
        Write-Host "操作完成，窗口将在5秒后关闭..."
        Start-Sleep -Seconds 5
    }
}