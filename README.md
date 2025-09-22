<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Dev version: Yet another ImGui wrapper for Ruby](#dev-version-yet-another-imgui-wrapper-for-ruby)
  - [Purpouses](#purpouses)
  - [Prerequisites](#prerequisites)
  - [Executing example programs](#executing-example-programs)
  - [Building libraries](#building-libraries)
  - [Gallery](#gallery)
  - [License](#license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### Dev version: Yet another ImGui wrapper for Ruby 

---

Currently highly work in progress

![alt](https://github.com/dinau/igruby_examples/raw/main/img/glfw_opengl3_imknobs.png)

#### Purpouses 

---
 
This project is based on and forked awesome work  
[Yet another ImGui wrapper for Ruby: vaiorabbit's ruby-imgui: imgui-bindings ](https://github.com/vaiorabbit/ruby-imgui).

The purpouses are   
- [x] Currently for only Windows OS
- [x] Adds raw `*.cpp` backend drivers to `imgui.dll` e.g.,  
   - [x] imgui/backends/[imgui_impl_glfw.cpp, imgui_impl_opengl3.cpp].  
- [ ] `imgui.dll` may be divided to  
   - [ ] imgui_glfw_opengl3.dll
   - [ ] imgui_sdl2_opengl3.dll
   - [ ] imgui_sdl2_renderer.dll 
   - [ ] imgui_sdl3_self.dll (include renderer, sdlgpu3) 
   - so on
- [x] Adds extra libraries to `imgui.dll` e.g.,
   - [x] ImSpinner
   - [x] ImKnobs
   - [ ] ImNodes
   - [ ] ImGuizmo
   - [ ] ImToggle
   - [ ] ImPlot
   - [ ] ImPlot3D
   - so on
- [x] Enable CJK Input method IME flag `-D IMGUI_ENABLE_WIN32_DEFAULT_IME_FUNCTIONS` 
- [ ] Set `ImDrawIdx` to 32bit type for `ImPlot` / `ImPlot3D`

#### Prerequisites

---

- [x] WindowsOS 10 or later
- [ ] LinuxOS : N/A (Im not familiar with Ruby on Linux OS)
- Use Ruby 3.4.5 or later : https://rubyinstaller.org/downloads/  
  Ok: without Devkit

#### Executing example programs

---

First to avoid confusion, uninstall `imgui-bindings`

```sh
gem uninstall imgui-bindings
```

Download files,

```sh
pwd 
my_dev_folder
git clone --recursive https://github.com/dinau/ruby-imgui-dev
git clone             https://github.com/dinau/igruby_examples
```

Install libraries with bundle,

```sh
cd igruby_examples
bundle install 
```

Execute one of examples,

```sh
pwd 
igruby_examples
cd glfw_opengl3     
r.bat           # or double click glfw_oepngl3.rbw in Windows file explorer
```

Note: Currnetly under bundler enviroment only 


#### Building libraries

---

- Install Ruby Devkit or MSys/MinGW, at least

  ```sh
  pacman -S make mingw-w64-x86_64-{gcc,SDL2,pkg-config,glfw} 
  ```
- GCC 15.2.0

WIP: Same as original


#### Gallery

---

ImKnobs 

![alt](https://github.com/dinau/igruby_examples/raw/main/img/glfw_opengl3_imknobs.png)

ImSpinner 

![alt](https://github.com/dinau/igruby_examples/raw/main/img/glfw_opengl3_imSpinner.gif)

Iconfonts viewer

![alt](https://github.com/dinau/igruby_examples/raw/main/img/glfw_opengl3_iconfont_viewer.png)

Image view

![alt](https://github.com/dinau/igruby_examples/raw/main/img/glfw_opengl3.png)  

Show CJK fonts

![alt](https://github.com/dinau/igruby_examples/raw/main/img/glfw_opengl3_jp.png)


#### License 

---

All shared libraries found in `lib` directory are built on top of these products and are available under the terms of the MIT License.
*   cimgui ( https://github.com/cimgui/cimgui )
    *   https://github.com/cimgui/cimgui/blob/master/LICENSE
*   Dear ImGui ( https://github.com/ocornut/imgui )
    *   https://github.com/ocornut/imgui/blob/master/LICENSE.txt
*   ImNodes ( https://github.com/rokups/ImNodes )
    *   https://github.com/rokups/ImNodes/blob/master/LICENSE

All ruby codes here are available under the terms of the zlib/libpng License ( http://opensource.org/licenses/Zlib ).

```text
Ruby-Imgui : Yet another ImGui wrapper for Ruby
Copyright (c) 2019-2025 vaiorabbit <http://twitter.com/vaiorabbit>

This software is provided 'as-is', without any express or implied
warranty. In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

    1. The origin of this software must not be misrepresented; you must not
    claim that you wrote the original software. If you use this software
    in a product, an acknowledgment in the product documentation would be
    appreciated but is not required.

    2. Altered source versions must be plainly marked as such, and must not be
    misrepresented as being the original software.

    3. This notice may not be removed or altered from any source
    distribution.
```
