@ECHO off

REM Paths
SET CYGROOT=%~0\..\Cygwin

REM Environment variables
SET PATH="%CYGROOT%\bin";%PATH%
SET CYGWIN=nodosfilewarning

REM Login credentials
SET USERNAME=vhs
SET HOME=/home/%USERNAME%
SET GROUP=None
SET GRP=
SET LC_ALL=fi_FI.utf8

"%CYGROOT%\bin\bash" "/linkitys.sh"
"%CYGROOT%\bin\bash" "/asenna.sh"
