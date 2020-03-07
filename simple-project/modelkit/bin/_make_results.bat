@ECHO OFF
CALL modelkit-energyplus energyplus-sql --query=../results/results.txt --output=../results/results.csv ..\runs\**\instance-out.sql
PAUSE
