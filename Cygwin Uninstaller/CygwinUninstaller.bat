@echo off
echo Running script as administrator
 /user:Administrator cmd /c "echo Deleting Cygwin shortcuts on the Desktop & del /f /q \"%USERPROFILE%\Desktop\Cygwin64.lnk\" & echo Deleting Cygwin shortcuts on the Start Menu & del /f /q \"%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Cygwin*\" & echo Deleting registry node Software\\Cygnus Solutions & reg delete \"HKEY_LOCAL_MACHINE\SOFTWARE\Cygnus Solutions\" /f & reg delete \"HKEY_CURRENT_USER\SOFTWARE\Cygnus Solutions\" /f & rd /s /q C:\\cygwin & echo Deleting files created in the setup temporary directory & del /f /q %temp%\\cygwin-setup* & echo Done"
pause


