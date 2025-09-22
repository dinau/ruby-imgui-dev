@echo off

rm -fr build
mkdir build
cd build

rem set CC=gcc
rem set CXX=g++
set CC=clang
set CXX=clang++

cmake -G "MSYS Makefiles" -D CMAKE_BUILD_TYPE=Release -D BUILD_SHARED_LIBS=ON -D CMAKE_C_COMPILER=%CC% -D CMAKE_CXX_COMPILER=%CXX% ..
make
strip imgui.dll
cp -fr imgui.dll ../../lib/
cd ..
