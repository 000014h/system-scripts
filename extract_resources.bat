@ECHO OFF

FOR /F "usebackq" %%i IN (`hostname`) DO SET PCNAME=%%i
REM @ECHO %PCNAME%
REM @ECHO %userdomain%
REM @ECHO %PROCESSOR_ARCHITECTURE%
REM @ECHO %username%
REM @ECHO %userdnsdomain%

IF EXIST %PCNAME%.txt del *.txt -y

REM SET /p name=name: 
SET /p description=description: 
SET /p tags=tags: 
SET osFamily=Microsoft Windows Server 2012 R2 Standard
SET osVersion=6.3.9600

@ECHO   ^<node >> %PCNAME%.txt
@ECHO     name="%PCNAME%" >> %PCNAME%.txt
@ECHO     connectionType="WINRM_NATIVE" >> %PCNAME%.txt
@ECHO     node-executor="overthere-winrm" >> %PCNAME%.txt
@ECHO     winrm-password-option="winrmPassword" >> %PCNAME%.txt
@ECHO     winrm-protocol="http" >> %PCNAME%.txt
@ECHO     winrm-auth-type="kerberos" >> %PCNAME%.txt
@ECHO     winrmPassword="12fjsepr!@" >> %PCNAME%.txt
@ECHO     username="rundeck@%userdnsdomain%" >> %PCNAME%.txt
@ECHO     description="%description%" >> %PCNAME%.txt
@ECHO     tags="%tags%" >> %PCNAME%.txt
@ECHO     hostname="%PCNAME%.%userdnsdomain%" >> %PCNAME%.txt
@ECHO     osArch="%PROCESSOR_ARCHITECTURE%" >> %PCNAME%.txt
@ECHO     osFamily="%osFamily%" >> %PCNAME%.txt
@ECHO     osVersion="%osVersion%"/^> >> %PCNAME%.txt

@ECHO Done.