@echo off

rem Environment setting
set NDK=D:\Android\NDK
set NDK_MAKE=%NDK%\prebuilt\windows-x86_64\bin\make.exe
set NDK_TOOLCHAIN=%NDK%\build\cmake\android.toolchain.cmake
set NDK_COMMON_PARAM=-G "MinGW Makefiles" -DCMAKE_BUILD_TYPE="Release" -DCMAKE_TOOLCHAIN_FILE=%NDK_TOOLCHAIN% -DANDROID_NDK=%NDK% -DCMAKE_MAKE_PROGRAM=%NDK_MAKE% -Dprotobuf_DISABLE_RTTI=ON -DANDROID_STL=c++_shared

rem Clean old build
rmdir /S /Q lib\Android
mkdir lib\Android
mkdir lib\Android\ARMv7
mkdir lib\Android\ARM64

rem ARMv7
mkdir build_temp
cd build_temp
cmake ../source/cmake %NDK_COMMON_PARAM% -DANDROID_NATIVE_API_LEVEL="android-19" -DANDROID_ABI="armeabi-v7a"
%NDK_MAKE% libprotobuf
copy libprotobuf.a ..\lib\Android\ARMv7
cd ..
rmdir /S /Q build_temp

rem ARM64
mkdir build_temp
cd build_temp
cmake ../source/cmake %NDK_COMMON_PARAM% -DANDROID_NATIVE_API_LEVEL="android-21" -DANDROID_ABI="arm64-v8a"
%NDK_MAKE% libprotobuf
copy libprotobuf.a ..\lib\Android\ARM64
cd ..
rmdir /S /Q build_temp
