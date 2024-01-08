#!/bin/bash

# Allow X server connection
xhost +local:*

# Disallow X server connection
# xhost -local:*

docker run \
    -it \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --rm \
    --name stdr_simulator \
    sim_image