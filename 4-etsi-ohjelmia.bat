@ECHO off

REM Paths
SET CYGROOT=%~0\..\Cygwin

REM Environment variables
SET PATH="%CYGROOT%\bin";"%CYGROOT%\usr\local\bin";%PATH%
SET CYGWIN=nodosfilewarning

REM Login credentials
SET USERNAME=vhs
SET HOME=/home/%USERNAME%
SET GROUP=None
SET GRP=
SET LC_ALL=fi_FI.utf8

REM Start the terminal
START "Cygwin Terminal" /B "%CYGROOT%\bin\mintty.exe" "/bin/bash" "--norc" "/home/vhs/vhs/vhs.sh" "i"
