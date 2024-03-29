#!/bin/sh

while read ARCH && read TARGET ; do
    bindgen wrapper.h -o src/ffi_$ARCH.rs \
        --blocklist-item 'JNI\w+' \
        --blocklist-item 'C?_?JNIEnv' \
        --blocklist-item '_?JavaVM' \
        --blocklist-item '_?j\w+' \
        -- \
        --sysroot="${ANDROID_NDK_ROOT}"/toolchains/llvm/prebuilt/darwin-x86_64/sysroot --target=$TARGET
done << EOF
arm
arm-linux-androideabi
aarch64
aarch64-linux-android
i686
i686-linux-android
x86_64
x86_64-linux-android
EOF
