@echo off

set CURRENTDIR="%cd%"

set CommonCompilerFlags=-MT -nologo -GR- -EHa- -EHsc -Od -Oi -WX -W4 -wd4201 -wd4100 -wd4189 -FC -Z7 -Bt -DDEBUG -I %CURRENTDIR%\win32 -I %CURRENTDIR%\external_libraries
set CommonLinkerFlags= -incremental:no -opt:ref user32.lib opengl32.lib gdi32.lib

IF NOT EXIST Build mkdir Build
pushd Build

DEL /F/Q/S *.* > NUL

REM cl %CommonCompilerFlags% -LD -Fe^
REM  ../engine/systems/render_system.cpp^
REM  /link %CommonLinkerFlags%

cl %CommonCompilerFlags%^
 ../win32/win32_lab7.cpp^
 /link %CommonLinkerFlags%

popd