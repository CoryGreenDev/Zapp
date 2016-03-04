@echo off
REM There is an other version that is not open to the public, but will eventually be.
REM This isn't the final version
echo.
echo.
echo.
IF NOT EXIST assets goto first

:v
cls
echo Verifiying the HASH file.
echo Please wait.
IF NOT EXIST assets exit
cd assets
type hash.txt
IF hash.txt = KEY goto accept
goto fail



:main
color 1a
echo /#############################\
echo [         Zapp Console        ]
echo [        \File Editor!/       ]
type hash.txt
type user.txt
echo \#############################/
:command
set /p input1=
@echo on
if input1 equ GO goto go
if input1 equ MOVE goto move
if input1 equ DELETE goto delete
if input1 equ PATH goto path
if input1 equ CREATE goto create
goto incorrect

:incorrect
echo Incorrect syntax, make sure to read up on the console to beign usage.
goto command

:accept
@echo> VALID>hash.txt
type hash.txt
echo Runtime %date% %time%.
echo Enjoy user: %UserProfile%
@echo> %UserProfile%>user.txt
pause
cls
goto main

:first
echo Creating dependencies, please wait.
mkdir assets
cd assets
@echo>  >user.txt
@echo>  >pwd.txt
@echo>  >hash.txt
echo ---------------------------------
type hash.txt
echo ---------------------------------
echo.
echo If there was nothing in the box then the HASH file needs to be updated.
echo Enter your HASH from the email into this file and wait for validation on reopen.
echo Press any key to quit.
pause >nul
exit
