#!/bin/zsh

SHARED_FOLDER=shared

if [ ! -d $SHARED_FOLDER ]; then
	mkdir -v "$(pwd)"/$SHARED_FOLDER
fi

docker run -it \
--mount type=bind,source="$(pwd)"/$SHARED_FOLDER,target=/home/user/$SHARED_FOLDER/ \
custom_ubuntu /bin/bash