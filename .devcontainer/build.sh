#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROS_VERSION=${ROS_VERSION:-noetic}
PX4_VERSION=${PX4_VERSION:-main}

NAME="ubuntu"
while getopts ":u:" opt; do
    case $opt in
        u)
            NAME="${OPTARG}"
            ;;
        :)
            ;;
        /?)
            exit 1
            ;;
    esac
done
USER_GID=1000
USER_UID=1000

if [ "$NAME" = "ubuntu" ]; then
    TAG="${ROS_VERSION}-x86_64-full"
else
    TAG="${ROS_VERSION}-x86_64-full-local"
fi
docker build \
    --build-arg ROS_VERSION=${ROS_VERSION} \
    --build-arg PX4_VERSION=${PX4_VERSION} \
    --build-arg USERNAME=${NAME} \
    --build-arg USER_UID=${USER_UID} \
    --build-arg GROUPNAME=${NAME} \
    --build-arg USER_GID=${USER_GID} \
    -t px4-sim:${TAG} \
    -f "${SCRIPT_DIR}/Dockerfile.ubuntu" \
    .