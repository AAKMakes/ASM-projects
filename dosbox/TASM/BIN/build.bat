@ECHO OFF
tasm %1
tlink %1
echo Press a key to run...
pause > nul
%1