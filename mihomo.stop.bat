@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

SET PROCESS_NAME=mihomo.exe

tasklist | findstr "%PROCESS_NAME%"

if ERRORLEVEL 1 (
    echo Mihomo is not running.
) else (
    taskkill /F /T /im %PROCESS_NAME%
)

timeout /t 2

tasklist | findstr "%PROCESS_NAME%"

if ERRORLEVEL 1 (
    echo Mihomo stopped.
) else (
    echo Error occurred, pls try again with admin permission.
)

pause
