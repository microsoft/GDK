@echo off

setlocal

set SCRIPTNAME=%~n0

if "%1"=="" goto USAGE
if "%2"=="" goto USAGE

if not exist "%1" (
    echo **** ERROR: Path '%1' does not exist. Exiting now.
    goto END
)

for /F "delims=" %%G in ('dir /b /s "%1\*.msi"') DO (
    msiexec.exe /a "%%G" TARGETDIR="%~f2" /qb
)

goto END

:USAGE

echo ****************************************************************
echo   %SCRIPTNAME% - Recursively create administrative install points for all MSIs in a folder
echo.
echo   USAGE: %SCRIPTNAME% ^<MSI source folder^> ^<target directory^>
echo.
echo   Example: %SCRIPTNAME% c:\GDK c:\extracted_gdk
echo ****************************************************************


:END

endlocal
