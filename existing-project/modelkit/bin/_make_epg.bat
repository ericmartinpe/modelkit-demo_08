@ECHO OFF
SET weather=USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.epw
REM.> ..\runs\all_cases.epg
FOR /D %%d IN (..\runs\*.*) DO @ECHO %%~fd\instance.idf,%~dp0..\weather\%weather%,%%~fd\instance-out,1 >> ..\runs\all_cases.epg
PAUSE
