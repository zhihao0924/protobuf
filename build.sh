# 生成php 代码
rm -rf ./php/*
touch ./php/README.md
protoc --php_out=./php  --grpc_out=generate_server:./php \
       --proto_path=./proto --plugin=protoc-gen-grpc=/opt/homebrew/bin/grpc_php_plugin \
        ./proto/**/*.proto

# 生成golang 代码
rm -rf ./golang/*
touch ./golang/README.md
protoc --go_out=./golang --go-grpc_out=./golang \
        --proto_path=./proto --go_opt=paths=source_relative \
        --go-grpc_opt=paths=source_relative --grpc-gateway_out=./golang \
        --grpc-gateway_opt logtostderr=true --grpc-gateway_opt paths=source_relative \
        --grpc-gateway_opt generate_unbound_methods=true ./proto/**/*.proto