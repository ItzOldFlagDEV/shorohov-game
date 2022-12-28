color 5
cls

@echo off

title building options

goto SystemSelect

:SystemSelect
color 5
cls
set /p menu="Select system (windows; linux; android): "
       if %menu%==windows goto windowsIs32bit
       if %menu%==linux goto linuxIs32bit
       if %menu%==android goto androidReq

:windowsIs32bit
cls
set /p menu1="Select bit count (32 or 64): "
       if %menu1%==32 goto windowsBuild32
       if %menu1%==64 goto windowsBuild64

:windowsBuild32
cls
lime build windows -release -32
goto reCompile

:windowsBuild64
cls
lime build windows -release
goto reCompile

:linuxIs32bit
cls
set /p menu2="Select bit count (32 or 64): "
       if %menu2%==32 goto linuxBuild32
       if %menu2%==64 goto linuxBuild64

:linuxBuild32
cls
lime build linux -release -32
goto reCompile

:linuxBuild64
cls
lime build linux -release
goto reCompile

:androidReq
color 4
cls
set /p menu3="Did you have instaled lime android setup? (Y or N): "
       if %menu3%==Y goto androidBuild
       if %menu3%==N goto SystemSelect

:androidBuild
color 5
cls
lime build android -final
goto reCompile

:reCompile
set /p menu4="Game is builded, would you like made an another build? (Y or N): "
       if %menu4%==Y goto SystemSelect cls
       if %menu4%==N exit