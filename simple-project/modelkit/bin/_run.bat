@ECHO OFF
REM To use, drag and drop .idf input files onto this batch file.
%~d1
CD %~dp0
CALL modelkit-energyplus energyplus-run %1
PAUSE
