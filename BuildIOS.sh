#!/bin/sh
rm -rf lib/IOS

mkdir -p lib/IOS
mkdir -p build_temp

cd build_temp
cmake -DCMAKE_TOOLCHAIN_FILE=../toolchains/ios.toolchain.cmake -DPLATFORM=OS64 -DBUILD_SHARED_LIBS=OFF -Dprotobuf_BUILD_TESTS=OFF -Dprotobuf_BUILD_CONFORMANCE=OFF -Dprotobuf_BUILD_EXAMPLES=OFF -Dprotobuf_BUILD_PROTOC_BINARIES=OFF -Dprotobuf_MSVC_STATIC_RUNTIME=OFF -Dprotobuf_DISABLE_RTTI=ON -G "Unix Makefiles" ../source/cmake
make
cp ./libprotobuf.a ../lib/IOS/libprotobuf.a
cd ..
rm -rf build_temp