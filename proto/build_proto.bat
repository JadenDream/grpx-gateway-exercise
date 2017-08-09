
set THEPATH=D:\Eclipse_Workspace\go_grpc_helloworld2\src\proto
set GOOGLEAPIS=%GOPATH%\src\github.com\googleapis\googleapis
set DESCRIPTORPROTO=%PROTOBUFPATH%\google\protobuf\descriptor.proto

REM ½sÄ¶
protoc -I %THEPATH% --go_out=plugins=grpc:. %THEPATH%\test\test.proto

protoc -I %THEPATH% --go_out=plugins=grpc:. %THEPATH%\hello\hello.proto

REM ½sÄ¶ Google api
protoc -I %THEPATH% -I %PROTOBUFPATH%\include --go_out=plugins=grpc:. %THEPATH%\google\api\*.proto

protoc -I %THEPATH% -I %PROTOBUFPATH%\include --go_out=plugins=grpc:. %THEPATH%\hello_http\*.proto

protoc -I %THEPATH% -I %PROTOBUFPATH%\include --grpc-gateway_out=logtostderr=true:. %THEPATH%\hello_http\hello_http.proto

pause
