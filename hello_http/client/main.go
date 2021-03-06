package main

import (
	"fmt"
	pb "grpx-gateway-exercise/proto/hello_http" // 引入proto包

	"golang.org/x/net/context"
	"google.golang.org/grpc"
	"google.golang.org/grpc/grpclog"
)

const (
	// Address gRPC服务地址
	Address = "127.0.0.1:50052"
)

func main() {
	// 连接
	conn, err := grpc.Dial(Address, grpc.WithInsecure())

	if err != nil {
		grpclog.Fatalln(err)
	}

	defer conn.Close()

	// 初始化客户端
	c := pb.NewHelloHttpClient(conn)

	// 调用方法
	reqBody := new(pb.HelloHttpRequest)
	reqBody.Name = "Jaden gRPC"
	r, err := c.SayHello(context.Background(), reqBody)
	if err != nil {
		grpclog.Fatalln(err)
	}

fmt.Printf("msg: %s.\n", r.Message)
	grpclog.Println(r.Message)
}
