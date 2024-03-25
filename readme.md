# experimenting with nim and emscripten

these instructions are tested on ubuntu linux 22.04

## Prerequisites

- install emscripten following

## build example

run

```bash
nim c -d:emscripten example1.nim
```

the compilation will replace example1.js, example1.wasm and example1.worker.js

## start

run `bun bun-server.ts` for serving files, since special headers are needed to enable SharedArrayBuffer required by emscripten.
