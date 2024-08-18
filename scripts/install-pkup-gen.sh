#!/bin/sh

OS_TYPE="$(uname)"
OS_ARCH="$(uname -m)"

get_kyma_file_name() {

    local _VERSION=$1
    local _OS_TYPE=$2
    local _OS_ARCH=$3

    [ "$_OS_TYPE" = "Linux"   ] && [ "$_OS_ARCH" = "x86_64" ] && echo "pkup-gen_${_VERSION}_linux_amd64.tar.gz" ||
    [ "$_OS_TYPE" = "Linux"   ] && [ "$_OS_ARCH" = "aarch64"  ] && echo "pkup-gen_${_VERSION}_linux_arm64.tar.gz" ||
    [ "$_OS_TYPE" = "Darwin"  ] && [ "$_OS_ARCH" = "x86_64" ] && echo "pkup-gen_${_VERSION}_darwin_amd64.tar.gz" ||
    [ "$_OS_TYPE" = "Darwin"  ] && [ "$_OS_ARCH" = "arm64"  ] && echo "pkup-gen_${_VERSION}_darwin_arm64.tar.gz"
}

echo looking for files for ${OS_TYPE} - ${OS_ARCH}
VERSION="$(git ls-remote --tags https://github.com/pPrecel/pkup-gen | cut -d/ -f3- | tail -n1)"
FILE_NAME="$(get_kyma_file_name ${VERSION} ${OS_TYPE} ${OS_ARCH})"

mkdir -p ./bin

echo downloading ${FILE_NAME} to bin
curl -L --silent "https://github.com/pPrecel/pkup-gen/releases/download/${VERSION}/${FILE_NAME}" > bin/${FILE_NAME}

echo unpacking to bin/pkup
tar -xf bin/${FILE_NAME} -C bin

echo removing bin/${FILE_NAME}
rm bin/${FILE_NAME}