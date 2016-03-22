# wine-nvidia-base
Run wine with nvidia drivers in a docker container.

Run with:

    docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix wine-nvidia-base


To disable x11 access control there is a reckless approach:

    xhost +  # remember to run `xhost -` once finished

or a slightly less reckless approach:

    # First try to run container, then...
    export containerId='docker ps -l -q'
    xhost +local:`docker inspect --format='{{ .Config.Hostname }}' $containerId`
    docker start $containerId

or better approaches described here: http://wiki.ros.org/docker/Tutorials/GUI
