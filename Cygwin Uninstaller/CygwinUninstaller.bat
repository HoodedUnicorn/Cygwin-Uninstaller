@echo off
echo Running script as administrator

echo Deleting Cygwin shortcuts on the Desktop !
set CYGWIN_DSK="Users\Public\Desktop\Cygwin64 Terminal.lnk"
if exist %CYGWIN_DSK% (
    echo Deleting Cygwin Start Menu Program: %CYGWIN_DSK%
    del /f /q %CYGWIN_DSK%
) else (
    echo Cygwin Start Menu Program does not exist: %CYGWIN_DSK%
)
pause

echo Deleting Cygwin shortcuts on the Start Menu
set CYGWIN_STM="Windows\Start Menu\Programs\Cygwin\Cygwin64 Terminal.lnk"
if exist %CYGWIN_STM% (
    echo Deleting Cygwin Start Menu Program: %CYGWIN_STM%
    del /f /q %CYGWIN_STM%
) else (
    echo Cygwin Start Menu Program does not exist: %CYGWIN_STM%
)
pause

echo Deleting registry node Software\Cygwin
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Cygwin" /f
pause

echo Deleting Cygwin installation directory
set CYGWIN_DIR=C:\cygwin
if exist %CYGWIN_DIR% (
    echo Deleting Cygwin directory: %CYGWIN_DIR%
    rd /s /q %CYGWIN_DIR%
) else (
    echo Cygwin directory does not exist: %CYGWIN_DIR%
)
pause

set CYGWIN_TEMP=%temp%\cygwin-setup*
if exist %CYGWIN_TEMP% (
    echo Deleting Cygwin directory: %CYGWIN_TEMP%
    del /f /q %CYGWIN_TEMP%
) else (
    echo Cygwin temporary directory does not exist: %CYGWIN_TEMP%
)
pause

echo Done
pause
