@ECHO OFF
FOR %%f IN (..\parameters\cases\*.pxv) DO CALL modelkit template-compose --files="%%f" --output="../runs/%%~nf/instance.idf" ../templates/root.pxt
FOR /D %%d IN (..\runs\*.*) DO COPY /Y _run.bat "%%d"
PAUSE
