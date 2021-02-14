#!/bin/zsh

SHARED_FOLDER=shared

if [ ! -d $SHARED_FOLDER ]; then
	mkdir -v "$(pwd)"/$SHARED_FOLDER
fi

docker run -it \
--mount type=bind,source="$(pwd)"/shared,target=/home/user \
custom_ubuntu /bin/bash
