#How to gRPC on Swift Projects

This file aims to guide you to gRPC implementation on your swift project.


##Installing the Protobuf Compiler 


* Open Terminal and download official protobuffer compiler

`$ curl -LOk https://github.com/protocolbuffers/protobuf/releases/download/v3.5.1/protoc-3.5.1-osx-x86_64.zip
`

* Unzip and cd to directory

`$ unzip protoc-3.5.1-osx-x86_64.zip -d proto_buffer && cd proto_buffer`

* Copy files to paths inside your machine

<pre>$ sudo cp bin/protoc /usr/local/bin </br>$ sudo cp -R include/google/protobuf/ /usr/local/include/google/protobuf</pre>

* Protobuf compiler is now ready to use

## Installing Swift Compilers

We need to get  *.pb.swift file to run grpc on swift. Now,We will create this file.

* Open Terminal and clone apple's protobuf repo on github

`$ git clone https://github.com/apple/swift-protobuf`

* cd to clone and execute following on Terminal

`$ swift build -c release`

* You can find the protoc-gen-swift binary file under the .build/realase. Copy this to /usr/local/bin

We also need *.grpc.swift file

* Now clone another grpc repo for swift

`$ git clone https://github.com/grpc/grpc-swift`

* cd to clone and execute the following

`$ swift build -c release`

* You can find the protoc-gen-grpc-swift binary file under the .build/realase. Copy this to /usr/local/bin

## Compiling .proto file

You are ready to create .pb.swift and .grpc.swift file using tge swift compilers  we just installed

* Navigate to the path that your proto file exists and run the following command in terminal

<pre>$ protoc --swift_out=. your.proto </br>$ protoc --grpc-swift_out=. your.proto</pre>

There are 2 files that the compiler will create inside the directory, your.pb.swift and your.grpc.swift. Now we need to copy the files to our Xcode project. Make sure to check Copy Items if Needed.
