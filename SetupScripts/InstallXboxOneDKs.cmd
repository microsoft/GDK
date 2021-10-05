@echo off

setlocal EnableDelayedExpansion

set _EXENAME=%~n0
set _EXENAMEANDPATH=%0
set _EXEPATH=%~dp0

if "%1" == "" goto USAGE

whoami /priv | findstr /c:"SeTakeOwnershipPriv"

IF NOT "%ERRORLEVEL%" == "0" (
    echo.
    echo ERROR: %0 must be run as Administrator
    echo.
    goto END
)

:LOOP
SET TEMPVAR=%~1
IF /I "%TEMPVAR:~0,5%"=="/gdk:" SET _GDKPATH=%TEMPVAR:~5%
IF /I "%TEMPVAR:~0,10%"=="/gdktools:" SET _GDKTOOLSPATH=%TEMPVAR:~10%
IF /I "%TEMPVAR:~0,6%"=="/pgdk:" SET _PGDKPATH=%TEMPVAR:~6%
IF /I "%TEMPVAR:~0,5%"=="/xdk:" SET _XDKPATH=%TEMPVAR:~5%
IF /I "%TEMPVAR:~0,10%"=="/xdktools:" SET _XDKTOOLSPATH=%TEMPVAR:~10%
IF /I "%TEMPVAR:~0,14%"=="/skipuninstall" SET _SKIPUNINSTALL=true
IF /I "%TEMPVAR:~0,2%"=="/u" SET _UNINSTALLONLY=true
IF /I "%TEMPVAR:~0,2%"=="/?" GOTO USAGE
SHIFT
IF NOT "%~1"=="" GOTO LOOP

echo Found the following command line parameters:
echo.
echo GDK path = %_GDKPATH%
echo GDK tools path = %_GDKTOOLSPATH%
echo PGDK path = %_PGDKPATH%
echo XDK path = %_XDKPATH%
echo XDK tools path = %_XDKTOOLSPATH%
echo Uninstall only = %_UNINSTALLONLY%
echo Skip uninstall = %_SKIPUNINSTALL%
echo.

IF "%_GDKPATH%%_GDKTOOLSPATH%%_PGDKPATH%%_XDKPATH%%_XDKTOOLSPATH%%_UNINSTALLONLY%%_SKIPUNINSTALL%"=="" goto USAGE

echo WARNING: %_EXENAME% is about to terminate all instances of Visual Studio and MSBuild (press Ctrl+C to abort)
pause

echo call taskkill /F /IM Microsoft.Durango.TransportProxy.exe
call taskkill /F /IM Microsoft.Durango.TransportProxy.exe

echo call taskkill /F /IM xbrdevicesrv.exe
call taskkill /F /IM xbrdevicesrv.exe

echo call taskkill /F /IM xbtplinksvc.exe
call taskkill /F /IM xbtplinksvc.exe

echo call taskkill /F /IM devenv.exe
call taskkill /F /IM devenv.exe

echo call taskkill /F /IM msbuild.exe
call taskkill /F /IM msbuild.exe

net stop msiserver

IF NOT "%_SKIPUNINSTALL%"=="" goto SKIPUNINSTALL

echo Uninstall any Xbox One development kits that are currently installed
for /F "delims=" %%G in ('dir /b /s "%programdata%\package cache\*G*dk.exe"') DO (
    echo.
    echo call "%%G" /uninstall /norestart /q
    echo.
    call "%%G" /uninstall /norestart /q

    set _EXITCODE=!errorlevel!

    if not "!_EXITCODE!" == "0" (
        if not "!_EXITCODE!" == "3010" (
            echo Process returned exit code !_EXITCODE!. See logs in %temp%\gdk for more details.
            goto END
        )
    )

    echo Uninstall completed successfully with exit code !_EXITCODE!
)
for /F "delims=" %%G in ('dir /b /s "%programdata%\package cache\*G*dkTools.exe"') DO (
    echo.
    echo call "%%G" /uninstall /norestart /q
    echo.
    call "%%G" /uninstall /norestart /q

    set _EXITCODE=!errorlevel!

    if not "!_EXITCODE!" == "0" (
        if not "!_EXITCODE!" == "3010" (
            echo Process returned exit code !_EXITCODE!. See logs in %temp%\gdktools for more details.
            goto END
        )
    )

    echo Uninstall completed successfully with exit code !_EXITCODE!
)

for /F "delims=" %%G in ('dir /b /s "%programdata%\package cache\*XdkTools*.exe"') DO (
    echo.
    echo call "%%G" /uninstall /norestart /q
    echo.
    call "%%G" /uninstall /norestart /q

    set _EXITCODE=!errorlevel!

    if not "!_EXITCODE!" == "0" (
        if not "!_EXITCODE!" == "3010" (
            echo Process returned exit code !_EXITCODE!. See logs in %temp%\xboxonesdktools for more details.
            goto END
        )
    )

    echo Uninstall completed successfully with exit code !_EXITCODE!
)
for /F "delims=" %%G in ('dir /b /s "%programdata%\package cache\Durango*dk*.exe"') DO (
    echo.
    echo call "%%G" /uninstall /norestart /q
    echo.
    call "%%G" /uninstall /norestart /q

    set _EXITCODE=!errorlevel!

    if not "!_EXITCODE!" == "0" (
        if not "!_EXITCODE!" == "3010" (
            echo Process returned exit code !_EXITCODE!. See logs in %temp%\durangoxdk for more details.
            goto END
        )
    )

    echo Uninstall completed successfully with exit code !_EXITCODE!
)
for /F "delims=" %%G in ('dir /b /s "%programdata%\package cache\XboxOne*DK*.exe"') DO (
    echo.
    echo call "%%G" /uninstall /norestart /q
    echo.
    call "%%G" /uninstall /norestart /q

    set _EXITCODE=!errorlevel!

    if not "!_EXITCODE!" == "0" (
        if not "!_EXITCODE!" == "3010" (
            echo Process returned exit code !_EXITCODE!. See logs in %temp%\xboxonesdk for more details.
            goto END
        )
    )

    echo Uninstall completed successfully with exit code !_EXITCODE!
)

net stop msiserver

:SKIPUNINSTALL

IF NOT "%_UNINSTALLONLY%"=="" goto END

echo Install Xbox One development kits

IF NOT "%_GDKPATH%"=="" (
    call:InstallDK "%_GDKPATH%"
)

IF NOT "%_GDKTOOLSPATH%"=="" (
    call:InstallDK "%_GDKTOOLSPATH%"
)

IF NOT "%_PGDKPATH%"=="" (
    call:InstallDK "%_PGDKPATH%"
)

IF NOT "%_XDKPATH%"=="" (
    call:InstallDK "%_XDKPATH%"
)

IF NOT "%_XDKTOOLSPATH%"=="" (
    call:InstallDK "%_XDKTOOLSPATH%"
)

goto END

:USAGE

ECHO ****************************************************************
ECHO   %_EXENAME% - Uninstalls and reinstalls Xbox One development kits
ECHO.
ECHO   Supported command line switches:
ECHO.
ECHO   /gdk:^<path to Gdk.exe^>
ECHO   /gdktools:^<path to GdkTools.exe^>
ECHO   /pgdk:^<path to Pgdk.exe^>
ECHO   /xdk:^<path to XboxOneXdk.exe^>
ECHO   /xdktools:^<path to XboxOneXdkTools.exe^>
ECHO.
ECHO   /u
ECHO.
ECHO   /skipuninstall
ECHO.
ECHO   Use /u to uninstall without doing any installs afterwards
ECHO.
ECHO   Use /skipuninstall to skip uninstalling before installing
ECHO.
ECHO   IMPORTANT NOTE: The script will kill the following processes in
ECHO       order to minimize the chances of a reboot being required
ECHO       after installs and uninstalls:
ECHO.
ECHO       devenv.exe
ECHO       msbuild.exe
ECHO       Microsoft.Durango.TransportProxy.exe
ECHO       xbrdevicesrv.exe
ECHO.
ECHO   Example: %_EXENAMEANDPATH% /gdk:c:\my_path\Gdk.exe /xdk:c:\my_path\XboxOneXdk.exe
ECHO   Example: %_EXENAMEANDPATH% /gdktools:c:\my_path\GdkTools.exe /skipuninstall
ECHO   Example: %_EXENAMEANDPATH% /u
ECHO.
ECHO ****************************************************************

goto END

REM InstallDK(installPath)
:InstallDK

  set InstallPath=%~1%

  echo.
  echo call "%InstallPath%" /norestart /q
  call "%InstallPath%" /norestart /q

  set _EXITCODE=!errorlevel!

  if not "!_EXITCODE!" == "0" (
      if not "!_EXITCODE!" == "3010" (
          echo.
          echo Process returned exit code !_EXITCODE!. See logs in %temp%\gdk, %temp%\gdktools, %temp%\pgdk, %temp%\xboxonesdk, and/or %temp%\xboxonesdktools for more details.
          goto EOF
      )
  )

  echo.
  echo Install completed successfully with exit code !_EXITCODE!

goto EOF

:END

echo.
endlocal
