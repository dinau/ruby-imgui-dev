cmake_minimum_required(VERSION 3.5)
Project(imgui)

set (CMAKE_CXX_STANDARD 26)

# Remove debug info
add_link_options("-Wl,-s")

#set(CMAKE_SHARED_LINKER_FLAGS "-static-libgcc -static-libstdc++")
#target_compile_options(imgui PRIVATE -static-libgcc -static-libstdc++)

#-----------------
# Silent warnings
#-----------------
# for gcc 15.2.0
add_compile_options(-Wno-deprecated-enum-enum-conversion)
add_compile_options(-Wno-deprecated-declarations)
# for clang 21.1.1
add_compile_options(-Wno-enum-enum-conversion)
add_compile_options(-Wno-return-type-c-linkage)
add_compile_options(-Wno-format)


include_directories( ${CMAKE_CURRENT_LIST_DIR}/cimgui )
include_directories( ${CMAKE_CURRENT_LIST_DIR}/cimgui/imgui )
include_directories( ${CMAKE_CURRENT_LIST_DIR}/cimgui/imgui/backends )

include_directories(.)

# This line must be deleted for extra libraries.
# Because some of extra libraries use obsolete functions.
#add_definitions("-DIMGUI_DISABLE_OBSOLETE_FUNCTIONS=1")

set(IMGUI_SOURCES
  ${CMAKE_CURRENT_LIST_DIR}/cimgui/cimgui.cpp
	${CMAKE_CURRENT_LIST_DIR}/cimgui/imgui/imgui.cpp
	${CMAKE_CURRENT_LIST_DIR}/cimgui/imgui/imgui_draw.cpp
	${CMAKE_CURRENT_LIST_DIR}/cimgui/imgui/imgui_demo.cpp
	${CMAKE_CURRENT_LIST_DIR}/cimgui/imgui/imgui_tables.cpp
	${CMAKE_CURRENT_LIST_DIR}/cimgui/imgui/imgui_widgets.cpp
  #${CMAKE_CURRENT_LIST_DIR}/cimgui_internal.cpp

)

#--------------------------
# Extra libraries includes
#--------------------------
# cimCTE
include_directories( ${CMAKE_CURRENT_LIST_DIR}/../libc/CTE)

# ImSpinner
include_directories( ${CMAKE_CURRENT_LIST_DIR}/../libc/imspinner)

# ImGui-Knobs
include_directories( ${CMAKE_CURRENT_LIST_DIR}/../libc/cimgui-knobs)
include_directories( ${CMAKE_CURRENT_LIST_DIR}/../libc/cimgui-knobs/libs/imgui-knobs)

# ImGui Toggle
include_directories( ${CMAKE_CURRENT_LIST_DIR}/../libc/cimgui_toggle)
include_directories( ${CMAKE_CURRENT_LIST_DIR}/../libc/cimgui_toggle/imgui_toggle)

# ImNodes
include_directories( ${CMAKE_CURRENT_LIST_DIR}/../imnodes_dll/ImNodes)

# ImGui_Toggle
file(GLOB CIMTOGGLE_SRCS ${CMAKE_CURRENT_LIST_DIR}/../libc/cimgui_toggle/*.cpp)
file(GLOB IMTOGGLE_SRCS  ${CMAKE_CURRENT_LIST_DIR}/../libc/cimgui_toggle/imgui_toggle/*.cpp)

# ImGuiColorTextEdit
file(GLOB IMCOLORTEXTEDIT_SRCS ${CMAKE_CURRENT_LIST_DIR}/../libc/cimCTE/ImGuiColorTextEdit/*.cpp)
include_directories( ${CMAKE_CURRENT_LIST_DIR}/../libc/cimCTE)
include_directories( ${CMAKE_CURRENT_LIST_DIR}/../libc/cimCTE/ImGuiColorTextEdit)
include_directories( ${CMAKE_CURRENT_LIST_DIR}/../libc/cimCTE/ImGuiColorTextEdit/vendor/regex/include)

# ImGuiFileDialog
add_definitions(-DUSE_THUMBNAILS)
add_definitions(-DCUSTOM_IMGUIFILEDIALOG_CONFIG=\"customIconFont.h\")
include_directories( ${CMAKE_CURRENT_LIST_DIR}../../libc/CImGuiFileDialog)
include_directories( ${CMAKE_CURRENT_LIST_DIR}../../libc/CImGuiFileDialog/libs/ImGuiFileDialog)
include_directories( ${CMAKE_CURRENT_LIST_DIR}../../libc/fonticon)

# ImGuizmo
file(GLOB IMGUIZMO_SRCS ${CMAKE_CURRENT_LIST_DIR}/../libc/cimguizmo/ImGuiZmo/*.cpp)

# ImNodes
add_compile_definitions(IMNODES_NAMESPACE=imnodes)

# ImPlot
file(GLOB IMPLOT_SRCS ${CMAKE_CURRENT_LIST_DIR}/../libc/cimplot/implot/*.cpp)
include_directories( ${CMAKE_CURRENT_LIST_DIR}../../libc/cimplot)
include_directories( ${CMAKE_CURRENT_LIST_DIR}../../libc/cimplot/implot)
#add_compile_definitions(ImDrawIdx=\"unsigned int\")

# ImPlot3D
file(GLOB IMPLOT3D_SRCS ${CMAKE_CURRENT_LIST_DIR}/../libc/cimplot3d/implot3d/*.cpp)
include_directories( ${CMAKE_CURRENT_LIST_DIR}../../libc/cimplot3d)
include_directories( ${CMAKE_CURRENT_LIST_DIR}../../libc/cimplot3d/implot3d)

#-----------------
# Extra libraries
#-----------------
set(EXRA_LIBS_SOURCES
  # cimCTE / ImGuiColorTextEdit
  ${IMCOLORTEXTEDIT_SRCS}
  ${CMAKE_CURRENT_LIST_DIR}/../libc/cimCTE/cimCTE.cpp

  # ImGui_Toggle
  ${CIMTOGGLE_SRCS}
  ${IMTOGGLE_SRCS}

  # ImGuiFileDialog
  ${CMAKE_CURRENT_LIST_DIR}/../libc/CImGuiFileDialog/libs/ImGuiFileDialog/ImGuiFileDialog.cpp

  # ImSpinner
  ${CMAKE_CURRENT_LIST_DIR}/../libc/imspinner/cimspinner.cpp

  # ImGui-Knobs
  ${CMAKE_CURRENT_LIST_DIR}/../libc/cimgui-knobs/cimgui-knobs.cpp
  ${CMAKE_CURRENT_LIST_DIR}/../libc/cimgui-knobs/imgui-knobs.cpp

  # ImGuizmo
  ${IMGUIZMO_SRCS}
  ${CMAKE_CURRENT_LIST_DIR}/../libc/cimguizmo/cimguizmo.cpp

  # ImNodes
  ${CMAKE_CURRENT_LIST_DIR}/../libc/cimnodes/cimnodes.cpp
  ${CMAKE_CURRENT_LIST_DIR}/../libc/cimnodes/imnodes//imnodes.cpp

  # ImPlot
  ${IMPLOT_SRCS}
  ${CMAKE_CURRENT_LIST_DIR}/../libc/cimplot/cimplot.cpp

  # ImPlot3D
  ${IMPLOT3D_SRCS}
  ${CMAKE_CURRENT_LIST_DIR}/../libc/cimplot3d/cimplot3d.cpp
)

# Backend drivers
set(IMPL_GLFW_OPENGL3
	${CMAKE_CURRENT_LIST_DIR}/cimgui/imgui/backends/imgui_impl_glfw.cpp
	${CMAKE_CURRENT_LIST_DIR}/cimgui/imgui/backends/imgui_impl_opengl3.cpp
	${CMAKE_CURRENT_LIST_DIR}/../libc/tools.c
)
set(IMPL_SDL2
  ${CMAKE_CURRENT_LIST_DIR}/cimgui/imgui/backends/imgui_impl_sdl2.cpp
	${CMAKE_CURRENT_LIST_DIR}/cimgui/imgui/backends/imgui_impl_opengl3.cpp
	${CMAKE_CURRENT_LIST_DIR}/cimgui/imgui/backends/imgui_impl_sdlrenderer2.cpp
  #${CMAKE_CURRENT_LIST_DIR}/cimgui/imgui/backends/imgui_impl_vulkan.cpp
	${CMAKE_CURRENT_LIST_DIR}/../libc/tools.c
)
set(IMPL_SDL3
  ${CMAKE_CURRENT_LIST_DIR}/cimgui/imgui/backends/imgui_impl_sdl3.cpp
	${CMAKE_CURRENT_LIST_DIR}/cimgui/imgui/backends/imgui_impl_opengl3.cpp
	${CMAKE_CURRENT_LIST_DIR}/cimgui/imgui/backends/imgui_impl_sdlrenderer3.cpp
	${CMAKE_CURRENT_LIST_DIR}/cimgui/imgui/backends/imgui_impl_sdlgpu3.cpp
  #${CMAKE_CURRENT_LIST_DIR}/cimgui/imgui/backends/imgui_impl_vulkan.cpp
	${CMAKE_CURRENT_LIST_DIR}/../libc/tools.c
)


set(IMGUI_LIBRARIES )

# For " Policy CMP0042 is not set: MACOSX_RPATH is enabled by default."
if (APPLE)
    set(CMAKE_MACOSX_RPATH ON)
endif (APPLE)

add_definitions("-DIMGUI_ENABLE_WIN32_DEFAULT_IME_FUNCTIONS")
if (WIN32)
    add_definitions("-DIMGUI_IMPL_API=extern \"C\" __declspec\(dllexport\)")
    add_definitions("-DCIMSPINNER_API=extern \"C\" __declspec\(dllexport\)") # for ImSpinner
    add_definitions("-DIGFD_API=__declspec\(dllexport\)")                    # for ImGuiFileDialog
else(WIN32)
    add_definitions("-DIMGUI_IMPL_API=extern \"C\" ")
    add_definitions("-DCIMSPINNER_API=extern \"C\" ") # for ImSpinner
    add_definitions("-DIGFD_API=extern \"C\" ")       # for ImGuiFileDialog
endif(WIN32)

#set(IMGUI_STATIC "no" CACHE STRING "Build as a static library")


#add library and link
#if (IMGUI_STATIC)
#    add_library(imgui STATIC ${IMGUI_SOURCES})
#else (IMGUI_STATIC)
add_library(imgui SHARED ${IMGUI_SOURCES} ${EXRA_LIBS_SOURCES} ${IMPL_GLFW_OPENGL3})
    if (WIN32)
        #target_link_libraries(imgui imm32)
      # Export all original ImGui symbols to support other libraries (e.g. ImNodes)
      # Note that these settings below didn't work as I expeced on Windows/MSys2 environment.
      set(WINDOWS_EXPORT_ALL_SYMBOLS ON)
      #  set(CMAKE_SUPPORT_WINDOWS_EXPORT_ALL_SYMBOLS 1)
      # So I add linker option 'export-all-symbols' explicitly.
      #set (CMAKE_SHARED_LINKER_FLAGS "-Wl,--export-all-symbols")
    endif(WIN32)
    #endif (IMGUI_STATIC)

add_library(imgui_sdl2 SHARED ${IMGUI_SOURCES} ${EXRA_LIBS_SOURCES} ${IMPL_SDL2})
add_library(imgui_sdl3 SHARED ${IMGUI_SOURCES} ${EXRA_LIBS_SOURCES} ${IMPL_SDL3})


# Generate imgui*.dll but libimgui*.dll
set_target_properties(imgui PROPERTIES PREFIX "")
set_target_properties(imgui_sdl2 PROPERTIES PREFIX "")
set_target_properties(imgui_sdl3 PROPERTIES PREFIX "")

if (APPLE)
    set_target_properties(imgui PROPERTIES
        XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY ""
	)
endif (APPLE)

find_package(PkgConfig REQUIRED)
#find_package(glfw3 3.4 REQUIRED)

find_package(SDL2 REQUIRED)
find_package(SDL3 REQUIRED)

# Use glfw3.dll: GLWF + OpenGL
target_link_libraries(imgui PRIVATE glfw3.dll.a imm32)
# Use SDL2/3.dll
target_link_libraries(imgui_sdl2 PRIVATE imm32 SDL2::SDL2)
target_link_libraries(imgui_sdl3 PRIVATE imm32 SDL3::SDL3)


#install
install(TARGETS imgui
                imgui_sdl2
                imgui_sdl3
                RUNTIME DESTINATION  .
                LIBRARY DESTINATION  .
                ARCHIVE DESTINATION  .
              )
