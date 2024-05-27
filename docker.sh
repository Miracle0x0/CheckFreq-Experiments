#!/usr/bin/env bash

HTTP_PROXY=${HTTP_PROXY:-$http_proxy}
HTTPS_PROXY=${HTTPS_PROXY:-$https_proxy}

docker run --gpus=all \
           --ipc=host \
           --env HTTP_PROXY=${HTTP_PROXY} \
           --env HTTPS_PROXY=${HTTPS_PROXY} \
           --mount src=/,target=/datadrive,type=bind \
           -it \
           --network=host \
           --privileged nvidia/dali:py36_cu10.run