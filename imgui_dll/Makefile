NINJA = true
CLANG = true

TARGETS += imgui.dll
TARGETS += imgui_sdl2.dll
TARGETS += imgui_sdl3.dll

ifeq ($(NINJA),true)
	BUILD_SYSTEM = "Ninja"
	BUILD_CMD = ninja
else
	BUILD_SYSTEM = "MSYS Makefiles"
	BUILD_CMD = make
endif

ifeq ($(CLANG),true)
	CC =  clang
	CXX = clang++
else
	CC=gcc
	CXX=g++
endif

CMAKE_OPTIONS += -D CMAKE_BUILD_TYPE=Release
CMAKE_OPTIONS += -D BUILD_SHARED_LIBS=ON
CMAKE_OPTIONS += -D CMAKE_C_COMPILER=$(CC)
CMAKE_OPTIONS += -D CMAKE_CXX_COMPILER=$(CXX)

all: clean
	@mkdir build
	@(cd build; cmake .. -G $(BUILD_SYSTEM) $(CMAKE_OPTIONS); \
	           $(BUILD_CMD); \
	           cp -f $(TARGETS) ../../lib \
	)

clean:
	@rm -fr build
