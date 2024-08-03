require "vendor/premake-ninja/ninja"

workspace "Fractals"
    architecture "x64"
    configurations { "Debug" }
    location "build"

project "Fractals"
    language "C++"
    targetdir "build/bin/%{cfg.buildcfg}"

    include "vendor/glfw/premake5.lua"

    files { "src/*.cpp",
     "src/Core/*.cpp",
     "src/Gui/*.cpp",
     "src/Fractals/*.cpp",
     "vendor/imgui/backends/imgui_impl_opengl3.cpp",
     "vendor/imgui/backends/imgui_impl_glfw.cpp",
     "vendor/imgui/*.cpp",
     "vendor/glad/glad/glad.cpp", 
     "src/Tools/*.cpp", 
     "src/Figure/*.cpp"
    }

    includedirs { "src/Core",
     "src/Gui",
     "src/Fractals",
     "vendor/glad", 
     "vendor/glfw/include", 
     "vendor/glm",
     "vendor/imgui/backends", 
     "vendor/imgui",
     "vendor/nlohmann/include", 
     "src/Tools", 
     "src/Figure/"
    } 

    libdirs { "vendor/lib" }
    links { "glfw3dll" }
    defines { "GLFW_INCLUDE_NONE" }

    filter "configurations:Debug"
        kind "ConsoleApp"
        cppdialect "C++20"
        defines { "DEBUG" }
        symbols "On"
        linkoptions { "-fuse-ld=lld -g -Wl" }

    filter "configurations:Release"
        defines { "Release" }
        optimize "On"