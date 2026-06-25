@echo off
title ChatGPT's Burp Clone 0.1
color 0A

:menu
cls
echo ==================================
echo     ChatGPT's Burp Clone 0.1
echo ==================================
echo.
echo 1. Fetch HTTP Headers
echo 2. Download Page Source
echo 3. DNS Lookup
echo 4. Exit
echo.

set /p choice=Select option:

if "%choice%"=="1" goto headers
if "%choice%"=="2" goto source
if "%choice%"=="3" goto dns
if "%choice%"=="4" exit
goto menu

:headers
cls
set /p url=Enter URL:
powershell -Command "try { (Invoke-WebRequest '%url%' -Method Head).Headers } catch { $_ }"
pause
goto menu

:source
cls
set /p url=Enter URL:
powershell -Command "try { (Invoke-WebRequest '%url%').Content | Out-File page.html } catch { $_ }"
echo Saved as page.html
pause
goto menu

:dns
cls
set /p host=Enter hostname:
nslookup %host%
pause
goto menu
