@echo off
mode con: cols=100 lines=30
title C6 Bank
cls


@ECHO OFF

:choice
set /P c=Do you want to install the requirements / Update them [Y/N]?
if /I "%c%" EQU "Y" goto :somewhere_else
if /I "%c%" EQU "N" goto :somewhere
goto :choice


:somewhere

python --version 2>&1 | findstr " 3.11" >nul
if %errorlevel% == 0 (
    echo python 3.11.x and up are not supported by empyrean. Please downgrade to python 3.10.x.
    pause
    exit
)

::fixed by K.Dot cause dif
git --version 2>&1>nul
if %errorlevel% == 9009 (
    echo git is either not installed or not added to path! You can install it here https://git-scm.com/download/win
    pause
    exit
)

py -3.10 -m pip uninstall -r interferences.txt



cls

if exist build rmdir /s /q build
py -3.10 builder.py

pause



:somewhere

python --version 2>&1 | findstr " 3.11" >nul
if %errorlevel% == 0 (
    echo python 3.11.x and up are not supported by empyrean. Please downgrade to python 3.10.x.
    pause
    exit
)

::fixed by K.Dot cause dif
git --version 2>&1>nul
if %errorlevel% == 9009 (
    echo git is either not installed or not added to path! You can install it here https://git-scm.com/download/win
    pause
    exit
)

py -3.10 -m pip uninstall -r interferences.txt
py -3.10 -m pip install --upgrade -r requirements.txt


cls

if exist build rmdir /s /q build
py -3.10 builder.py

pause
