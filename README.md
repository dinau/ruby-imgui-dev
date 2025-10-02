<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Dev version: Yet another ImGui wrapper for Ruby](#dev-version-yet-another-imgui-wrapper-for-ruby)
  - [Purpouses](#purpouses)
  - [Prerequisites](#prerequisites)
  - [Install DLLs on Windows OS](#install-dlls-on-windows-os)
  - [Executing example programs](#executing-example-programs)
  - [Building DLLs yourself](#building-dlls-yourself)
  - [Screenshots](#screenshots)
    - [ImGui-Toggle / CImGui-Toggle](#imgui-toggle--cimgui-toggle)
    - [ImGui-Knobs / CImGui-Knobs](#imgui-knobs--cimgui-knobs)
    - [ImSpinner / CImSpinner](#imspinner--cimspinner)
    - [ImGuizmo / CImGuizmo](#imguizmo--cimguizmo)
    - [ImNodes / CImNodes](#imnodes--cimnodes)
    - [ImGuiFileDialog](#imguifiledialog)
    - [Iconfonts viewer](#iconfonts-viewer)
    - [Image loading](#image-loading)
    - [Show CJK fonts](#show-cjk-fonts)
  - [License](#license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### Dev. version: Yet another ImGui wrapper for Ruby 

---

Currently highly work in progress

![alt](https://github.com/dinau/igruby_examples/raw/main/img/imknobs.png)

#### Purpouses 

---
 
This project is based on and forked awesome work  
[Yet another ImGui wrapper for Ruby: vaiorabbit's ruby-imgui: imgui-bindings ](https://github.com/vaiorabbit/ruby-imgui).

The purpouses are   
- [x] Currently for only Windows OS
- `imgui.dll` may be divided to  
 
   | DLL                  | Backend FFI                                                                | Contents (CImGui +)                                    |
   | :------------------: | -----------------------:                                                   | ---:                                                   |
   | imgui.dll            | impl_glfw.rb<br>impl_opengl3.rb                                            | imgui_impl_glfw.cpp<br>imgui_impl_opengl3.cpp          |
   | imgui_sdl2.dll       | impl_sdl2.rb<br>impl_opengl3.rb<br>impl_sdlrender2.rb                      | imgui_impl_sdl2.cpp<br>imgui_impl_opengl3.cpp<br>so on |
   | imgui_sdl3.dll       | impl_sdl3.rb<br>impl_opengl3.rb<br>impl_sdlrenderer3.rb<br>impl_sdlgpu3.rb | imgui_impl_sdl3.cpp<br>imgui_impl_opengl3.cpp<br>so on |

- Status: Extra libraries included in `*.dll`,[^libc]  
   - [X] ImGuiColorTextEdit 
   - [X] ImGui_Toggle       
   - [X] ImGui-Knobs        
   - [X] ImGuizmo           
   - [X] ImSpinner          
   - [X] ImNodes            
   - [x] ImGuiFileDialog    
   - [ ] ImPlot             
   - [ ] ImPlot3D           


- [x] Enable CJK Input method IME flag `-D IMGUI_ENABLE_WIN32_DEFAULT_IME_FUNCTIONS` 
- [ ] Set `ImDrawIdx` to 32bit type for `ImPlot` / `ImPlot3D`

[imcolortextedit_demo]:https://github.com/dinau/igruby_examples/blob/main/glfw_opengl3_imcolortextedit/glfw_opengl3_imcolortextedit.rb
[imspinner_demo]:https://github.com/dinau/igruby_examples/blob/main/glfw_opengl3_imspinner/glfw_opengl3_imspinner.rb
[imknobs_demo]:https://github.com/dinau/igruby_examples/blob/main/glfw_opengl3_imknobs/glfw_opengl3_imknobs.rb
[imtoggle_demo]:https://github.com/dinau/igruby_examples/blob/main/glfw_opengl3_imtoggle/glfw_opengl3_imtoggle.rb
[imguizmo_demo]:https://github.com/dinau/igruby_examples/blob/main/glfw_opengl3_imguizmo/glfw_opengl3_imguizmo.rb
[imnodes_demo]:https://github.com/dinau/igruby_examples/blob/main/glfw_opengl3_imnodes/glfw_opengl3_imnodes.rb

[imcolortextedit_ffi]:https://github.com/dinau/igruby_examples/blob/main/libs/imcolortextedit.rb
[imspinner_ffi]:https://github.com/dinau/igruby_examples/blob/main/libs/imspinner.rb
[imknobs_ffi]:https://github.com/dinau/igruby_examples/blob/main/libs/imknobs.rb
[imtoggle_ffi]:https://github.com/dinau/igruby_examples/blob/main/libs/imtoggle.rb
[imguizmo_ffi]:https://github.com/dinau/igruby_examples/blob/main/libs/imguizmo.rb
[imnodes_ffi]:https://github.com/dinau/igruby_examples/blob/main/libs/imnodes.rb

[^libc]:See [libc](libc) folder

#### Prerequisites

---

- [x] WindowsOS 10 or later
- [ ] LinuxOS : N/A (Im not familiar with Ruby on Linux OS)
- Use RubyInstaller + **Devkit** 3.4.6 or later : https://rubyinstaller.org/downloads/  

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
```

   Folder structure,

   ```txt
   my_dev_folder
    |--- igruby_examples
    `--- ruby-imgui-dev
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

Note: Only supported under bundler enviroment at this moment 


#### Building DLLs by yourself

---

If you'd like to build Dlls by yourself, 


- Install Ruby Devkit or MSys/MinGW, at least

  ```sh
  pacman -S make mingw-w64-ucrt-x86_64-{cmake,gcc,clang,SDL2,sdl3,pkg-config,glfw,ninja} 
  ```

- Clang 21.1.1 : Default compiler
- (GCC 15.2.0)

- Build DLLs

   ```sh
   pwd
   ruby-imgui-dev
   cd imgui_dll
   make
   ```

#### Screenshots

---

See [igRuby example project](https://github.com/dinau/igruby_examples)

![alt](https://github.com/dinau/igruby_examples/raw/main/img/imtoggle.png)  
![alt](https://github.com/dinau/igruby_examples/raw/main/img/imknobs.png)  
![alt](https://github.com/dinau/igruby_examples/raw/main/img/imspinner.gif)  
![alt](https://github.com/dinau/igruby_examples/raw/main/img/imguizmo.png)  
![alt](https://github.com/dinau/igruby_examples/raw/main/img/imnodes.png)  
![alt](https://github.com/dinau/igruby_examples/raw/main/img/imguifiledialog.png)  
![alt](https://github.com/dinau/igruby_examples/raw/main/img/iconfont_viewer.png)  
![alt](https://github.com/dinau/igruby_examples/raw/main/img/glfw_opengl3.gif)  
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
