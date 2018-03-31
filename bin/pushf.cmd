@setlocal ENABLEDELAYEDEXPANSION
@echo off
if not "%WPM-STACK%" == "" (set stack=%WPM-STACK%) else (set stack=%2)
redis-cli -x lpush %stack% < %1
