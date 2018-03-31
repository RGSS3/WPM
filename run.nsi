InstallDir "F:\wpm"
Page directory
Page instfiles

OutFile "build\wpm.exe"
Section
   SetOutPath $INSTDIR
   File /r /x app /x build *
   SetOutPath $INSTDIR\packages
   ExecWait "nsis.exe /S /D=$INSTDIR\app\nsis"
   ExecWait "ruby.exe /SILENT /DIR=$INSTDIR\app\ruby"
   ExecWait "stack.exe /S /D=$INSTDIR\app\stack"
   ExecWait "$INSTDIR\bin\7za.exe x -y -o$INSTDIR\app\redis redis.7z"
   ExecWait "$INSTDIR\bin\7za.exe x -y -o$INSTDIR\app\stack stack.7z"
SectionEnd