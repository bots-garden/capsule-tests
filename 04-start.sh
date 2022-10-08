#!/bin/bash
docker run \
  -p 8080:8080 \
  -v $(pwd)/hello:/app --rm k33g/capsule-launcher:0.2.7 \
  /capsule \
  -wasm=./app/hello.wasm \
  -mode=http \
  -httpPort=8080

