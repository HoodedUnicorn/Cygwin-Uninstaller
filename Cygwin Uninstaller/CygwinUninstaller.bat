@ECHO OFF
REM Force Run as Administrators
openfiles > NUL 2>&1
IF NOT %ERRORLEVEL% EQU 0 @powershell start-process '%~0' -verb runas && EXIT

TITLE Cygwin Uninstaller
CHCP 65001 1>nul
CHOICE /M "Uninstall Cygwin"
IF ERRORLEVEL 2 EXIT

CHOICE /M "Delete Cygwin Download Cache"
SET "DeleteCache=0"
IF ERRORLEVEL 2 GOTO 2
SET "DeleteCache=1"

:2
SET "KEY=HKLM\SOFTWARE\Cygwin\Installations"
SET COUNT=0

SETLOCAL ENABLEDELAYEDEXPANSION

ECHO Cygwin installation Directorys:
ECHO.

FOR /F "tokens=1,2,*" %%A IN ('REG QUERY "%KEY%" 2^>NUL') DO (
    IF "%%B"=="REG_SZ" (
        SET /A COUNT+=1

        SET "TARGET=%%C"
        SET "TARGET=!TARGET:\??\=!"

        ECHO !COUNT!. !TARGET!

        IF %DeleteCache% EQU 1 (
            SET "LAST_CACHE="
            SET "FOUND="

            IF EXIST "!TARGET!\etc\setup\setup.rc" (
                FOR /F "usebackq delims=" %%D IN ("!TARGET!\etc\setup\setup.rc") DO (
                    IF "%%D"=="last-cache" (
                        SET "FOUND=1"
                    ) ELSE IF DEFINED FOUND (
                        SET "LAST_CACHE=%%D"
                        SET "LAST_CACHE=!LAST_CACHE:~1!"
                        SET "FOUND="
                    )
                )
            )

            IF DEFINED LAST_CACHE (
                ECHO Deleting Cygwin Download Cache: !LAST_CACHE!
                RD /S /Q "!LAST_CACHE!" > NUL 2>&1
            )
        )

        ECHO Deleting Cygwin installation: !TARGET!
        RD /S /Q "!TARGET!" > NUL 2>&1
        ECHO.
    )
)

IF !COUNT! EQU 0 (
    ECHO No Cygwin installations found.
)

ENDLOCAL

GOTO FINALIZE

:FINALIZE
RD /S /Q "%temp%\cygwin-setup" > NUL 2>&1
ECHO Deleting Cygwin shortcuts on the Desktop.
DEL /F /Q "%USERPROFILE%\Desktop\Cygwin64 Terminal.lnk" > NUL 2>&1
DEL /F /Q "%PUBLIC%\Desktop\Cygwin64 Terminal.lnk" > NUL 2>&1

ECHO Deleting Cygwin shortcuts on the Start Menu.
RD /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Cygwin" > NUL 2>&1
RD /S /Q "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Cygwin" > NUL 2>&1

ECHO Deleting Cygwin Registry nodes.
REG DELETE "HKEY_CURRENT_USER\Software\Cygwin" /F > NUL 2>&1
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Cygwin" /F > NUL 2>&1

ECHO done.
PAUSE
EXIT
