@echo off
start /min "REDIS-SERVER" redis-server %WPM_HOME%\app\redis\bin\redis.windows.conf
start /min "ARIA2C-SERVER" aria2c --enable-rpc --rpc-allow-origin-all