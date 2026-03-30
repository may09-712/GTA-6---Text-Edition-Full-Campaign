@echo off
title GTA 6 - Text Edition Full Campaign
color 0a
cls
setlocal EnableDelayedExpansion

:: ======================
:: Main Menu
:: ======================
:menu
cls
echo ==============================
echo       GTA 6 - Text Edition
echo       Full Campaign
echo ==============================
echo.
echo 1. Mission 1 - Steal the Car
echo 2. Mission 2 - Bank Heist
echo 3. Mission 3 - Drug Deal
echo 4. Mission 4 - Escape from Police
echo 5. Mission 5 - Final Heist
echo 6. Exit
echo.
set /p choice="Choose a mission: "

if "%choice%"=="1" goto mission1
if "%choice%"=="2" goto mission2
if "%choice%"=="3" goto mission3
if "%choice%"=="4" goto mission4
if "%choice%"=="5" goto mission5
if "%choice%"=="6" exit
goto menu

:: ======================
:: Mission 1 - Steal the Car
:: ======================
:mission1
cls
echo Mission 1: Steal the Car
ping localhost -n 2 >nul
echo You see a shiny car parked on the street.
ping localhost -n 1 >nul

:: ASCII Car
echo.
echo   ______
echo  /|_||_\`.__
echo (   _    _ _\
echo =`-(_)--(_)-'
echo.

ping localhost -n 2 >nul
echo Do you:
echo 1. Hotwire the car
echo 2. Wait for the owner
set /p choice="Choice: "

if "%choice%"=="1" (
    echo You hotwire the car!
    ping localhost -n 2 >nul
    goto police_chase1
) else (
    echo The owner returned and caught you! Mission failed.
    pause
    goto menu
)

:: ======================
:: Police Chase 1
:: ======================
:police_chase1
cls
echo The cops are chasing you!
for /l %%x in (1,1,6) do (
    color 0c
    echo ! POLICE SIRENS !
    ping localhost -n 1 >nul
    color 0a
    ping localhost -n 1 >nul
)

:: City Map Navigation (ASCII)
:map1
cls
echo City Map:
echo [S] Start -> [1] Left Street -> [2] Right Avenue -> [3] Main Road -> [E] Escape
set /p dir="Choose direction (1/2/3): "

set /a outcome=%random% %% 3
if "%dir%"=="1" (
    if !outcome!==0 (
        echo You turned Left Street and lost the cops!
        ping localhost -n 2 >nul
        goto explosion1
    ) else (
        echo Roadblock! Caught by cops!
        pause
        goto menu
    )
) else if "%dir%"=="2" (
    if !outcome!==1 (
        echo You took Right Avenue and escaped!
        ping localhost -n 2 >nul
        goto explosion1
    ) else (
        echo Alley trap! Caught by cops!
        pause
        goto menu
    )
) else if "%dir%"=="3" (
    echo Straight Main Road! High speed chase!
    ping localhost -n 2 >nul
    set /a chase=%random% %% 2
    if !chase!==0 (
        echo You outran the cops!
    ) else (
        echo You crashed! Caught by cops!
        pause
        goto menu
    )
) else (
    echo Invalid choice!
    goto map1
)

:: Explosion ASCII VFX
:explosion1
cls
echo BOOM!!!
echo   _.-^^---....,,--
echo _--                  --_
echo <                        >
echo |                         |
echo  \._                   _./
echo     ```--. . , ; .--'''
echo           | |   |
echo        .-=||  | |=-.
echo        `-=#$%&%$#=-'
echo           | ;  :|
echo  _____.,-#%&$@%#&#~,._____
ping localhost -n 2 >nul

echo Mission 1 Complete!
pause
goto menu

:: ======================
:: Mission 2 - Bank Heist
:: ======================
:mission2
cls
echo Mission 2: Bank Heist
ping localhost -n 2 >nul
echo You are outside the bank. Do you:
echo 1. Go in stealthily
echo 2. Go in guns blazing
set /p choice="Choice: "

if "%choice%"=="1" (
    echo You sneak in quietly...
    ping localhost -n 2 >nul
    echo You grab the money and escape undetected!
) else (
    echo Guns blazing!
    for /l %%x in (1,1,4) do (
        color 0c
        echo *GUNFIRE!*
        ping localhost -n 1 >nul
        color 0a
        ping localhost -n 1 >nul
    )
    set /a chance=%random% %% 2
    if !chance!==0 (
        echo You escaped the police!
    ) else (
        echo Caught by cops! Mission failed.
        pause
        goto menu
    )
)

:: Explosion VFX
cls
echo BOOM!!!
echo        _.-^^---....,,--
echo    _--                  --_
echo   <                        >
echo   |                         |
echo    \._                   _./
echo        ```--. . , ; .--'''
echo              | |   |
echo           .-=||  | |=-.
echo           `-=#$%&%$#=-'
echo              | ;  :|
echo   _____.,-#%&$@%#&#~,._____
ping localhost -n 2 >nul

echo Mission 2 Complete!
pause
goto menu

:: ======================
:: Mission 3 - Drug Deal
:: ======================
:mission3
cls
echo Mission 3: Drug Deal
ping localhost -n 2 >nul
echo You meet the dealer at the docks. Do you:
echo 1. Take the deal quietly
echo 2. Try to rob the dealer
set /p choice="Choice: "

if "%choice%"=="1" (
    echo Deal successful! You got the package.
) else (
    set /a outcome=%random% %% 2
    if !outcome!==0 (
        echo You robbed the dealer and escaped with the drugs!
    ) else (
        echo Dealer called reinforcements! Caught!
        pause
        goto menu
    )
)

ping localhost -n 2 >nul
goto explosion1

:: ======================
:: Mission 4 - Escape from Police
:: ======================
:mission4
cls
echo Mission 4: Escape from Police
ping localhost -n 2 >nul
echo Police spotted you! Navigate the city:
goto map1

:: ======================
:: Mission 5 - Final Heist
:: ======================
:mission5
cls
echo Mission 5: Final Heist
ping localhost -n 2 >nul
echo You are at the high-security vault. Do you:
echo 1. Hack the security
echo 2. Use explosives
set /p choice="Choice: "

if "%choice%"=="1" (
    set /a success=%random% %% 2
    if !success!==0 (
        echo Hack successful! You stole the treasure!
    ) else (
        echo Hack failed! Security alerted! Caught!
        pause
        goto menu
    )
) else (
    echo You used explosives!
    for /l %%x in (1,1,4) do (
        color 0c
        echo *BOOM!*
        ping localhost -n 1 >nul
        color 0a
        ping localhost -n 1 >nul
    )
)

ping localhost -n 2 >nul
goto explosion1