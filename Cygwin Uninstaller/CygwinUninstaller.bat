@echo off
echo Running script as administrator

echo Deleting Cygwin shortcuts on the Desktop
del /f /q "Users\Public\Public Desktop\Cygwin64 Terminal.lnk"
pause

echo Deleting Cygwin shortcuts on the Start Menu
del /f /q "Windows\Start Menu\Programs\Cygwin*"
pause

echo Deleting registry node Software\Cygnus Solutions
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Cygwin" /f
pause

echo Deleting Cygwin installation directory
rd /s /q "C:\cygwin"
pause

echo Deleting files created in the setup temporary directory
del /f /q "%temp%\cygwin-setup*"
pause

echo Done
pause
