@ECHO off

REM Paths
SET CYGROOT=%cd%\Cygwin
SET CYGDRIVE=%~d0

REM Installer
START "Cygwin Installer" /B "%CYGROOT%\Cygwin.exe" ^
--no-shortcuts ^
--disable-buggy-antivirus ^
--root %CYGROOT%\ ^
--local-package-dir %CYGDRIVE%\Packages\ ^
-K http://cygwinports.org/ports.gpg
