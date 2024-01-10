set PROTO_PATH=.\include\google\protobuf
set PROTO2CPP_OUT_PATH=.\out1
set ​PROTOC_PATH=.\bin

cd %​PROTOC_PATH%
​
dir ..\%PROTO_PATH%\*.proto /b  > protolist.txt
​
for /f "delims=." %%i in (protolist.txt) do protoc --cpp_out=..\%PROTO2CPP_OUT_PATH% --proto_path=..\%PROTO_PATH% ..\%PROTO_PATH%\%%i.proto 

pause