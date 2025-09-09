#!/bin/bash
NDK_PATH=/Applications/Unity/Hub/Editor/2022.3.41f1/PlaybackEngines/AndroidPlayer/NDK
SO_NAME=libopenimsdk
OUT_PATH=android/
export CGO_ENABLED=1
mkdir -p $OUT_PATH/armeabi-v7a $OUT_PATH/arm64-v8a $OUT_PATH/x86 $OUT_PATH/x86_64
export GOOS=android

# armeabi-v7a
export GOARCH=arm
export CC=$NDK_PATH/toolchains/llvm/prebuilt/darwin-x86_64/bin/armv7a-linux-androideabi16-clang
go build -buildmode=c-shared -trimpath -ldflags="-s -w" -o $OUT_PATH/armeabi-v7a/$SO_NAME.so ./

# arm64-v8a
export GOARCH=arm64
export CC=$NDK_PATH/toolchains/llvm/prebuilt/darwin-x86_64/bin/aarch64-linux-android21-clang
go build -buildmode=c-shared -trimpath -ldflags="-s -w" -o $OUT_PATH/arm64-v8a/$SO_NAME.so ./

# x86
export GOARCH=386
export CC=$NDK_PATH/toolchains/llvm/prebuilt/darwin-x86_64/bin/i686-linux-android16-clang
go build -buildmode=c-shared -trimpath -ldflags="-s -w" -o $OUT_PATH/x86/$SO_NAME.so ./

# x86_64
export GOARCH=amd64
export CC=$NDK_PATH/toolchains/llvm/prebuilt/darwin-x86_64/bin/x86_64-linux-android21-clang
go build -buildmode=c-shared -trimpath -ldflags="-s -w" -o $OUT_PATH/x86_64/$SO_NAME.so ./