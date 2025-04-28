@echo off
title Color Show
mode 800
powershell -command "& { [console]::WindowHeight = [console]::LargestWindowHeight; [console]::WindowWidth = [console]::LargestWindowWidth }"

:loop
rem Check if D is pressed
for /f "delims=" %%A in ('powershell -command "[console]::KeyAvailable -and ([console]::ReadKey($true).Key -eq 'D')"') do (
    if %%A==True exit
)

color 1F
cls
timeout /t 1 >nul
color 4F
cls
timeout /t 1 >nul
color 2F
cls
timeout /t 1 >nul
color 6F
cls
timeout /t 1 >nul
color 5F
cls
timeout /t 1 >nul
color 0F
cls
timeout /t 1 >nul
goto loop
