--nimcache:build # Store intermediate files close by in the ./build dir.

if defined(emscripten):
  # This path will only run if -d:emscripten is passed to nim.

  --os:linux # Emscripten pretends to be linux.
  --cpu:wasm32 # Emscripten is 32bits.
  --cc:clang # Emscripten is very close to clang, so we ill replace it.
  --app:lib
  --d:danger
  --clang.exe:emcc  # Replace C
  --clang.linkerexe:emcc # Replace C linker
  --clang.cpp.exe:emcc # Replace C++
  --clang.cpp.linkerexe:emcc # Replace C++ linker.

  when compileOption("threads"):
    # We can have a pool size to populate and be available on page run
    # --passL:"-sPTHREAD_POOL_SIZE=2"
    discard

  --listCmd # List what commands we are running so that we can debug them.

  --mm:orc
  --d:useMalloc
  --d:nimAllocPagesViaMalloc
  --exceptions:goto # Goto exceptions are friendlier with crazy platforms.
  --define:noSignalHandler # Emscripten doesn't support signal handlers.

  # Pass this to Emscripten linker to generate html file scaffold for us.
  switch("passL", "-Os -flto -o out/example1/example1.js -sEXPORT_NAME=nim -sMODULARIZE -sEXPORTED_RUNTIME_METHODS=ccall,cwrap -sEXPORTED_FUNCTIONS=_nimAdd")
