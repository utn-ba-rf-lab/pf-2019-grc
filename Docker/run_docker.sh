#!/usr/bin/env bash
docker build -f Dockerfile --build-arg REBUILD=`date +%s` -t ubuntu:gnuradio_38 .
$USER =  $(whoami)
docker run --net=host \
	--env="DISPLAY" \
	--volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
	--privileged \
       	--device /dev/snd \
       	-v /home/$USER/gnuradio_38:/home/gnuradio/persistent \
       	--group-add=audio \
	-e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
       	-v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
	-v ~/.config/pulse/cookie:/root/.config/pulse/cookie \
	--group-add $(getent group audio | cut -d: -f3) \
	--device /dev/snd  \
	-it ubuntu:gnuradio_38 \
       	bash


