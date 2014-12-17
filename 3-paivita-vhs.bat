@ECHO off

REM Paths
SET CYGROOT=%cd%\Cygwin
SET CYGDRIVE=%~d0

REM Environment variables
SET PATH="%CYGROOT%\bin";%PATH%
SET CYGWIN=nodosfilewarning

REM Login credentials
SET USERNAME=vhs
SET HOME=/home/%USERNAME%
SET GROUP=None
SET GRP=
SET LC_ALL=fi_FI.utf8

"%CYGROOT%\bin\bash" "-c" "cd /home/vhs/vhs && git pull"
PAUSE
