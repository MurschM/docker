set DISPLAY=192.168.1.36:0.0
docker pull ghcr.io/murschm/murschm/docker/dev-mm:latest
docker run --privileged -ti --net=host \
    -v /mnt/c/Users/Matthias/Matthias/HeizungsSteuerung_gen1:/home/docker/work \
    -v /dev:/dev \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    ghcr.io/murschm/murschm/docker/dev-mm:latest /bin/bash

    