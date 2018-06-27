#!/usr/bin/env bash
#
# Usage:
#   build.sh movoin/devops-centos 6
#

BASE_PATH=$(pwd)
DOCKERFILE_PATH="${BASE_PATH}/versions"

REPO_NAME=$1
TAG_NAME=$2

if [ "${TAG_NAME}"x == "x" ];then
	TAG_NAME="latest"
fi

if [ "${TAG_NAME}"x == "latestx" ];then
	DOCKERFILE_PATH="${DOCKERFILE_PATH}/6"
else
	DOCKERFILE_PATH="${DOCKERFILE_PATH}/${TAG_NAME}"
fi

echo ""
echo "Building image: '${REPO_NAME}:${TAG_NAME}'"
echo ""

echo "> Building localscripts"

######

TAR='tar'

[[ `uname` == 'Darwin' ]] && {
	which gtar > /dev/null && {
		TAR='gtar'
	} || {
		echo 'ERROR: GNU tar required for Mac. You may use homebrew to install them: brew install gnu-tar'
		exit 1
	}
}

cd "${BASE_PATH}/localscripts"
rm -f localscripts.tar
$TAR -jc --owner=0 --group=0 -f localscripts.tar *
cp localscripts.tar ${DOCKERFILE_PATH}/

######

echo "> Running docker"

echo ""

docker build -t "${REPO_NAME}:${TAG_NAME}" ${DOCKERFILE_PATH}

echo ""

rm -f "${BASE_PATH}/localscripts/localscripts.tar"
rm -f "${DOCKERFILE_PATH}/localscripts.tar"
