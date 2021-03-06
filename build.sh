#!/usr/bin/env bash
#
# Usage:
#   build.sh movoin/devops-centos
#

BASE_PATH=$(pwd)
DOCKERFILE_PATH="${BASE_PATH}"

REPO_NAME=$1

echo ""
echo "Building image: '${REPO_NAME}'"
echo ""

######


echo "> Clean up"

echo ""

find ./ -type f | grep .DS_Store | awk '{system("rm -rf "$1)}'

echo ""


######


echo "> Running docker"

echo ""

docker build -t "${REPO_NAME}" ${DOCKERFILE_PATH}

echo ""

