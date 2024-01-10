#!/bin/sh
rm -rf lib/Mac

mkdir -p lib/Mac
mkdir -p build_temp

cd build_temp

cmake -DBUILD_SHARED_LIBS=OFF -Dprotobuf_BUILD_TESTS=OFF -Dprotobuf_BUILD_CONFORMANCE=OFF -Dprotobuf_BUILD_EXAMPLES=OFF -Dprotobuf_BUILD_PROTOC_BINARIES=OFF -Dprotobuf_DISABLE_RTTI=ON -DCMAKE_OSX_DEPLOYMENT_TARGET=10.14 -G "Unix Makefiles" ../source/cmake
make
cd ..
cp build_temp/libprotobuf.a lib/Mac/libprotobuf.a
rm -rf build_temp
