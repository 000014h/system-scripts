@ECHO OFF

FOR /F "usebackq" %%i IN (`hostname`) DO SET PCNAME=%%i
REM @ECHO %PCNAME%
REM @ECHO %userdomain%
REM @ECHO %PROCESSOR_ARCHITECTURE%
REM @ECHO %username%
REM @ECHO %userdnsdomain%

IF EXIST %PCNAME%.json del *.json -y

REM SET /p name=name:  
SET /p description=description: 
SET /p tags=tags: 
SET osFamily=Microsoft Windows Server 2012 R2 Standard
SET osVersion=6.3.9600

@ECHO ^{ >> %PCNAME%.json
@ECHO     "connectionType": "WINRM_NATIVE", >> %PCNAME%.json
@ECHO     "description": "%description%", >> %PCNAME%.json
@ECHO     "hostname": "%PCNAME%.%userdnsdomain%", >> %PCNAME%.json
@ECHO     "name": "%PCNAME%", >> %PCNAME%.json
@ECHO     "node-executor": "overthere-winrm", >> %PCNAME%.json
@ECHO     "osArch": "%PROCESSOR_ARCHITECTURE%", >> %PCNAME%.json
@ECHO     "osFamily": "%osFamily%", >> %PCNAME%.json
@ECHO     "osVersion": "%osVersion%", >> %PCNAME%.json
@ECHO     "tags": "%tags%", >> %PCNAME%.json
@ECHO     "username": "rundeck@%userdnsdomain%", >> %PCNAME%.json
@ECHO     "winrm-password-option": "winrmPassword", >> %PCNAME%.json
@ECHO     "winrm-protocol": "http", >> %PCNAME%.json
@ECHO     "winrm-auth-type": "kerberos", >> %PCNAME%.json
@ECHO     "winrmPassword": "12fjsepr!@" >> %PCNAME%.json
@ECHO ^} >>  %PCNAME%.json

@ECHO Done.