@echo off

::essentials
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
title Super Cloud Clicker Smasher Bros TM
mode 120, 30

::variables
set green=[38;5;2m
set blue=[38;5;4m
set red=[38;5;1m
set white=[0m
set grey=[38;5;241m

::gui
timeout /t 1 /nobreak >nul
echo                                                    %grey% Made by mp3#9999%green%
echo                          ___                       ___ _             _    ___ _ _    _           
echo                         / __^|_  _ _ __  ___ _ _   / __^| ^|___ _  _ __^| ^|  / __^| (_)__^| ^|_____ _ _ 
echo                         \__ \ ^|^| ^| '_ \/ -_) '_^| ^| (__^| / _ \ ^|^| / _` ^| ^| (__^| ^| / _^| / / -_) '_^|
echo                         ^|___/\_,_^| .__/\___^|_^|    \___^|_\___/\_,_\__,_^|  \___^|_^|_\__^|_\_\___^|_^|  
echo                                  ^|_^|                                                        
echo                              ___               _              ___              _____ __  __ 
echo                             / __^|_ __  __ _ __^| ^|_  ___ _ _  ^| _ )_ _ ___ ___ ^|_   _^|  \/  ^|                  
echo                             \__ \ '  \/ _` (_-^< ' \/ -_) '_^| ^| _ \ '_/ _ (_-^<   ^| ^| ^| ^|\/^| ^|         
echo                             ^|___/_^|_^|_\__,_/__/_^|^|_\___^|_^|   ^|___/_^| \___/__/   ^|_^| ^|_^|  ^|_^|         %white%
echo.
echo.

::scanning for minecraft
tasklist /fi "ImageName eq Javaw.exe" /fo csv 2>nul | find /I "Javaw" >nul
if "%ERRORLEVEL%"=="0" echo                                                     %blue%Minecraft found.%white% & goto scan
if "%ERRORLEVEL%"=="1" echo                                                   %red%Minecraft not found.%white% & timeout /t 99999 /nobreak >nul

:scan
timeout /t 1 /nobreak >nul
echo.
echo                                                        Scanning... & timeout /t 6 /nobreak >nul & goto usn

:usn
fsutil usn readJournal C: csv > "%temp%\cloud.txt"
if not exist "%temp%\cloud.txt" goto error
findstr /b "0," "%temp%\cloud.txt"
if "%errorlevel%" == "0" goto found
if "%errorlevel%" == "1" goto powershell

:powershell
findstr /b /i "help" "%userprofile%\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt"
if not exist "%userprofile%\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" goto clean
if "%errorlevel%" == "0" goto found
if "%errorlevel%" == "1" goto clean

::clean scan
:clean
cls
echo                                                    %grey% Made by mp3#9999%green%
echo                          ___                       ___ _             _    ___ _ _    _           
echo                         / __^|_  _ _ __  ___ _ _   / __^| ^|___ _  _ __^| ^|  / __^| (_)__^| ^|_____ _ _ 
echo                         \__ \ ^|^| ^| '_ \/ -_) '_^| ^| (__^| / _ \ ^|^| / _` ^| ^| (__^| ^| / _^| / / -_) '_^|
echo                         ^|___/\_,_^| .__/\___^|_^|    \___^|_\___/\_,_\__,_^|  \___^|_^|_\__^|_\_\___^|_^|  
echo                                  ^|_^|                                                        
echo                              ___               _              ___              _____ __  __ 
echo                             / __^|_ __  __ _ __^| ^|_  ___ _ _  ^| _ )_ _ ___ ___ ^|_   _^|  \/  ^|                  
echo                             \__ \ '  \/ _` (_-^< ' \/ -_) '_^| ^| _ \ '_/ _ (_-^<   ^| ^| ^| ^|\/^| ^|         
echo                             ^|___/_^|_^|_\__,_/__/_^|^|_\___^|_^|   ^|___/_^| \___/__/   ^|_^| ^|_^|  ^|_^|         %white%
echo.
echo.
echo                                                     %blue%Minecraft found.
echo.
echo                                                      %red%Nothing found ^!%white%
del /f /q "%temp%\history.txt" >nul 2>&1
del /f /q "%temp%\cloud.txt" >nul 2>&1
timeout /t 99999 /nobreak >nul

::dirty scan
:found
cls
echo                                                    %grey% Made by mp3#9999%green%
echo                          ___                       ___ _             _    ___ _ _    _           
echo                         / __^|_  _ _ __  ___ _ _   / __^| ^|___ _  _ __^| ^|  / __^| (_)__^| ^|_____ _ _ 
echo                         \__ \ ^|^| ^| '_ \/ -_) '_^| ^| (__^| / _ \ ^|^| / _` ^| ^| (__^| ^| / _^| / / -_) '_^|
echo                         ^|___/\_,_^| .__/\___^|_^|    \___^|_\___/\_,_\__,_^|  \___^|_^|_\__^|_\_\___^|_^|  
echo                                  ^|_^|                                                        
echo                              ___               _              ___              _____ __  __ 
echo                             / __^|_ __  __ _ __^| ^|_  ___ _ _  ^| _ )_ _ ___ ___ ^|_   _^|  \/  ^|                  
echo                             \__ \ '  \/ _` (_-^< ' \/ -_) '_^| ^| _ \ '_/ _ (_-^<   ^| ^| ^| ^|\/^| ^|         
echo                             ^|___/_^|_^|_\__,_/__/_^|^|_\___^|_^|   ^|___/_^| \___/__/   ^|_^| ^|_^|  ^|_^|         %white%
echo.
echo.
echo                                                     %blue%Minecraft found.
echo.
echo                                                       %green%Cheat found ^!%white%
del /f /q "%temp%\history.txt" >nul 2>&1
del /f /q "%temp%\cloud.txt" >nul 2>&1
timeout /t 99999 /nobreak >nul

::error check
:error
set msgboxTitle=SCCSB
set msgboxBody=An error has occured, please disable antivirus.
set tmpmsgbox=%temp%\~tmpmsgbox.vbs
if exist "%tmpmsgbox%" del /f /q "%tmpmsgbox%"
echo msgbox "%msgboxBody%",0,"%msgboxTitle%">"%tmpmsgbox%"
wscript "%tmpmsgbox%"
exit /b













