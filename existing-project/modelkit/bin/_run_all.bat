@ECHO OFF
FOR /D %%d IN (..\runs\*.*) DO CALL modelkit-energyplus energyplus-run "%%d/instance.idf"
PAUSE
