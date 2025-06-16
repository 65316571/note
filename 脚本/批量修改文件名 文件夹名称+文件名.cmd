@echo off
setlocal enabledelayedexpansion

for %%f in (*) do (
    if not "%%f"=="%~nx0" (
        set "filename=%%~nf"
        set "extension=%%~xf"
        for %%d in ("%%~dpf.") do set "current_folder=%%~nxd"
        ren "%%f" "!current_folder! - !filename!!extension!"
    )
)
echo OK!
pause