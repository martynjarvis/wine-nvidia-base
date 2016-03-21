# wine-nvidia-base
Run wine with nvidia drivers in a docker container.

Disable x11 access control with:

    xhost +

Then run with:

    docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix wine-nvidia-base
