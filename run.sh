set DISPLAY=192.168.1.36:0.0
docker run --privileged -ti \
    -e DISPLAY=%DISPLAY% \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /c/Users/Public:/home/docker/work \
    dev_mm:latest /bin/bash
