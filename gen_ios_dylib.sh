#!/bin/sh
export LANG=en_US.UTF-8
# ios device
export CFLAGS="-arch arm64 -miphoneos-version-min=9.0 -isysroot "$(xcrun -sdk iphoneos --show-sdk-path) 
export CGO_LDFLAGS="-arch arm64 -miphoneos-version-min=9.0 -isysroot "$(xcrun -sdk iphoneos --show-sdk-path)  
export CGO_ENABLED=1 
export GOARCH=arm64 
export GOOS=ios
export CC="clang $CFLAGS $CGO_LDFLAGS" 
go build -tags ios -ldflags=-w -trimpath -v -o ./ios/libopenimsdk.a -buildmode c-archive ./