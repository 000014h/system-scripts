@echo off
FOR /F "usebackq" %%i IN (`hostname`) DO SET PCNAME=%%i
REM @echo %PCNAME%
REM @echo %userdomain%
REM @echo %PROCESSOR_ARCHITECTURE%
REM @echo %username%
REM @echo %userdnsdomain%

set /p name=name: 
set /p description=description: 
set /p tags=tags: 
set os=WINDOWS_NT

@echo off
@echo ^<node name="%name%" description="%description%" tags="%tags%" hostname="%PCNAME%" osArch="%PROCESSOR_ARCHITECTURE%" osFamily="%os%" username="%username%@%userdnsdomain%"/^>

@echo ^<node name="%name%" description="%description%" tags="%tags%" hostname="%PCNAME%" osArch="%PROCESSOR_ARCHITECTURE%" osFamily="%os%" username="%username%@%userdnsdomain%"/^> > output_resources.txt