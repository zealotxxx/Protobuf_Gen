@echo off

set UE=D:\UE_5.0

rmdir /S /Q build_temp
rmdir /S /Q lib\Linux

mkdir build_temp
mkdir lib\Linux

cd build_temp
cmake -DBUILD_SHARED_LIBS=OFF -Dprotobuf_BUILD_TESTS=OFF -Dprotobuf_BUILD_CONFORMANCE=OFF -Dprotobuf_BUILD_EXAMPLES=OFF -Dprotobuf_BUILD_PROTOC_BINARIES=OFF -DARCHITECTURE_TRIPLE=x86_64-unknown-linux-gnu -DCMAKE_TOOLCHAIN_FILE=..\toolchains\linux.toolchain.cmake -Dprotobuf_DISABLE_RTTI=ON -DUE=%UE% -DCMAKE_MAKE_PROGRAM=%UE%/Engine/Extras/ThirdPartyNotUE/GNU_Make/make-3.81/bin/make.exe -G "Unix Makefiles" ..\source\cmake
cd ..
cmake --build build_temp --config Release -v
move build_temp\libprotobuf.a lib\Linux
rmdir /S /Q build_temp
