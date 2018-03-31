@echo off
call ruby %WPM_HOME%\bin\shutdownArtia2c.rb
call redis-cli shutdown

