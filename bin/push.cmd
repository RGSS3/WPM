@setlocal ENABLEDELAYEDEXPANSION
@echo off
if not "%WPM-STACK%" == "" (set stack=%WPM-STACK%) else (set stack=%2)
redis-cli lpush %stack% %1
