FROM k33g/capsule-builder:0.0.2
COPY go.mod ./
COPY hello.go ./
RUN  go get -u ./...; go mod tidy; 
RUN tinygo build -o hello.wasm -target wasi hello.go

FROM k33g/capsule-launcher:0.2.7
COPY --from=0 /home/function/hello.wasm ./
EXPOSE 8080
CMD ["/capsule", "-wasm=./hello.wasm", "-mode=http", "-httpPort=8080"]
