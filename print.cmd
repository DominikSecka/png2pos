@echo off
cd %~dp0
png2pos -p -c -o "%~dpn1.bin" "%1"
print /D:"\\%COMPUTERNAME%\PRINTER" "%~dpn1.bin"
del "%~dpn1.bin"
pause
