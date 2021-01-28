#!/bin/bash

DOCKER_USER=fenying
DOCKER_REPO=crontab

if [[ -z "$1" ]]; then

    echo 'ERR: Please specify a tag to build.'
    exit;
fi;

SCRIPT_ROOT=$(cd $(dirname $0); pwd)

DF_ROOT=$SCRIPT_ROOT/src/$1

if [[ ! -d "$DF_ROOT" ]]; then

    echo "ERR: No such an image tag '$1'.";
    exit;
fi;

if [[ ! -f "$DF_ROOT/dockerfile" ]]; then

    echo "ERR: No such an image tag '$1'.";
    exit;
fi;

cd $DF_ROOT;

IMG_FULL_NAME=$DOCKER_USER/$DOCKER_REPO:$1

if ! docker build -t $IMG_FULL_NAME .; then
    echo "ERR: Failed to build tag '$1'.";
    exit;
fi;

if ! docker push $IMG_FULL_NAME; then
    echo "ERR: Failed to push tag '$1'.";
    exit;
fi;
