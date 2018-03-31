@setlocal ENABLEDELAYEDEXPANSION
@echo off
pushd %~dp0
cd ..
set WPM_HOME=%cd%
set WPM-STACK=WPM-DEFAULT
popd

set path=%path%;%WPM_HOME%\bin
for /D %%A in (%WPM_HOME%\app\*.) do (
  @echo off
  set path=%%~dpnA;%%~dpnA\bin;!path!
)

set STACK_ROOT=%WPM_HOME%\stack
cmd /k cd /d %WPM_HOME%

