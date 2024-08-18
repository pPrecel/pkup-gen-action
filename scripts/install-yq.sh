#!/bin/sh

OS_TYPE="$(uname)"
OS_ARCH="$(uname -m)"

get_yq_file_name() {

    local _OS_TYPE=$1
    local _OS_ARCH=$2

    [ "$_OS_TYPE" = "Linux"   ] && [ "$_OS_ARCH" = "x86_64" ] && echo "yq_linux_amd64" ||
    [ "$_OS_TYPE" = "Linux"   ] && [ "$_OS_ARCH" = "aarch64"  ] && echo "yq_linux_arm64" ||
    [ "$_OS_TYPE" = "Darwin"  ] && [ "$_OS_ARCH" = "x86_64" ] && echo "yq_darwin_amd64" ||
    [ "$_OS_TYPE" = "Darwin"  ] && [ "$_OS_ARCH" = "arm64"  ] && echo "yq_darwin_arm64"
}

echo looking for files for ${OS_TYPE} - ${OS_ARCH}
FILE_NAME="$(get_yq_file_name ${OS_TYPE} ${OS_ARCH})"

mkdir -p ./bin

echo downloading ${FILE_NAME} to bin/pkup-gen
curl -L --silent "https://github.com/mikefarah/yq/releases/latest/download/${FILE_NAME}" > bin/yq
chmod +x bin/yq
