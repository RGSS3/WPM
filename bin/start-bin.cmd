@echo off
setlocal
pushd %WPM_HOME%\bin
ruby %*
popd