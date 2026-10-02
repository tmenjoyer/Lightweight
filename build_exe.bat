@echo off
setlocal
cd /d "%~dp0"
echo === ScreenCaster - build ScreenCaster.exe ===

where python >nul 2>nul
if errorlevel 1 (
  echo Python 3.9+ was not found. Install it from https://www.python.org/downloads/
  echo ^(tick "Add python.exe to PATH" during setup^)
  pause & exit /b 1
)

python -m pip install --upgrade pyinstaller
if errorlevel 1 ( echo Could not install PyInstaller. & pause & exit /b 1 )

rem If ffmpeg.exe sits next to this script, bundle it inside the .exe.
set FFARG=
if exist "ffmpeg.exe" (
  echo Bundling ffmpeg.exe into the executable...
  set FFARG=--add-binary "ffmpeg.exe;."
) else (
  echo ffmpeg.exe not found here: the app will look for it next to the .exe or in PATH.
)

python -m PyInstaller --noconfirm --clean --onefile --windowed --name ScreenCaster --paths src %FFARG% src\app.py
if errorlevel 1 ( echo Build failed. & pause & exit /b 1 )

copy /y "dist\ScreenCaster.exe" "ScreenCaster.exe" >nul
echo.
echo Done! ScreenCaster.exe is in this folder.
pause
