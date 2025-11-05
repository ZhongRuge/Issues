@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

REM 直接生成 issue-YYYYMMDD-HHMMSS.md 并根据 _TEMPLATE.md 替换占位符

REM 可选第一个参数作为标题
set INPUT_TITLE=%~1
if "%INPUT_TITLE%"=="" set INPUT_TITLE=未命名问题

for /f %%D in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd"') do set TODAY=%%D
set YYYY=%TODAY:~0,4%
set MM=%TODAY:~5,2%
set DD=%TODAY:~8,2%
for /f %%T in ('powershell -NoProfile -Command "Get-Date -Format HH-mm-ss"') do set TIMESTR=%%T
set HH=%TIMESTR:~0,2%
set MIN=%TIMESTR:~3,2%
set SEC=%TIMESTR:~6,2%

set BASE_DIR=%~dp0
set TARGET_DIR=%BASE_DIR%%YYYY%\%YYYY%-%MM%
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%"

REM 计算当日已存在文件数量: YYYY-MM-DD-XXX.md
set COUNT=0
for /f %%C in ('dir /b "%TARGET_DIR%\%YYYY%-%MM%-%DD%-*.md" ^| find /v /c ""') do set COUNT=%%C
set /a INDEX=COUNT+1
set INDEX_STR=000%INDEX%
set INDEX_STR=%INDEX_STR:~-3%

set FILE_NAME=%YYYY%-%MM%-%DD%-%INDEX_STR%.md
set FULL_PATH=%TARGET_DIR%\%FILE_NAME%
set TEMPLATE_PATH=%BASE_DIR%_TEMPLATE.md

if exist "%FULL_PATH%" (
  echo 文件已存在: %FULL_PATH%
  exit /b 1
)

REM 忽略模板文件，直接生成最小骨架
>"%FULL_PATH%" echo # %INPUT_TITLE%
>>"%FULL_PATH%" echo 日期：%YYYY%-%MM%-%DD%
>>"%FULL_PATH%" echo.
>>"%FULL_PATH%" echo 标签：``
>>"%FULL_PATH%" echo.
>>"%FULL_PATH%" echo ## 现象分析
>>"%FULL_PATH%" echo.
>>"%FULL_PATH%" echo ## 原因
>>"%FULL_PATH%" echo.
>>"%FULL_PATH%" echo ## 修复验证
>>"%FULL_PATH%" echo.

echo 已创建: %FULL_PATH%
echo 打开文件后替换“未命名问题”并填写各段内容。

endlocal
