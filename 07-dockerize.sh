#!/bin/bash

read -r -d '' DOCKERFILE << EOM
FROM k33g/capsule-launcher:0.2.7
ADD hello.wasm ./
EXPOSE 8080
CMD ["/capsule", "-wasm=./hello.wasm", "-mode=http", "-httpPort=8080"]
EOM

echo "${DOCKERFILE}" > hello/Dockerfile

