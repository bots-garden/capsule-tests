# capsule-tests

## Install Capsule Builder

```bash
CAPSULE_BUILDER_VERSION="v0.0.0"
wget -O - https://raw.githubusercontent.com/bots-garden/capsule-function-builder/${CAPSULE_BUILDER_VERSION}/install-capsule-builder.sh | bash
```

### Test it

```bash
cabu help
```

## Generate a function project

```bash
cabu generate service-get hello-world
```

## Build the wasm function

```bash
cd hello-world
cabu build . hello-world.go hello-world.wasm
```

## Serve the function with the Capsule Docker image

```bash
docker run \
  -p 8080:8080 \
  -v $(pwd):/app --rm k33g/capsule-launcher:0.2.6 \
  /capsule \
  -wasm=./app/hello-world.wasm \
  -mode=http \
  -httpPort=8080
```

### Call it

```bash
curl http://localhost:8080
```

## Serve the function by installing the Capsule launcher executable

### Install

```bash
#CAPSULE_VERSION="v0.2.6"
CAPSULE_VERSION="main"
wget -O - https://raw.githubusercontent.com/bots-garden/capsule/${CAPSULE_VERSION}/install-capsule-launcher.sh| bash
```

or:

```bash
CAPSULE_VERSION="v0.2.6"
CAPSULE_PATH="$HOME/.local/bin"
CAPSULE_OS="linux"
CAPSULE_ARCH="amd64"
CAPSULE_MODULE="capsule"
wget https://github.com/bots-garden/capsule/releases/download/${CAPSULE_VERSION}/${CAPSULE_MODULE}-${CAPSULE_VERSION}-${CAPSULE_OS}-${CAPSULE_ARCH}.tar.gz
tar -zxf ${CAPSULE_MODULE}-${CAPSULE_VERSION}-${CAPSULE_OS}-${CAPSULE_ARCH}.tar.gz --directory ${CAPSULE_PATH}
rm ${CAPSULE_MODULE}-${CAPSULE_VERSION}-${CAPSULE_OS}-${CAPSULE_ARCH}.tar.gz
```

### Serve

```bash
capsule \
  -wasm=./hello-world/hello-world.wasm \
  -mode=http \
  -httpPort=8080
```

### Call it

```bash
curl http://localhost:8080
```


