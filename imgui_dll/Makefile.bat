rm -fr build
mkdir build
cd build

cmake -G "MSYS Makefiles" -D CMAKE_BUILD_TYPE=Release -D BUILD_SHARED_LIBS=ON -D CMAKE_C_COMPILER=gcc ..
make
cd ..
