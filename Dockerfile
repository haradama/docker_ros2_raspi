FROM ros:dashing

LABEL Maintainer "Masafumi Harada"

WORKDIR /root

RUN ["/bin/bash", "-c", " \
    source /opt/ros/dashing/setup.bash \
    && ros2 pkg create create_ws \
    "]

WORKDIR /root/create_ws

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y tmux && \
    git clone https://github.com/AutonomyLab/libcreate /root/create_ws/src/libcreate && \
    git clone https://github.com/Sadaku1993/create_autonomy /root/create_ws/src/create_autonomy && \
    chmod a+rw /dev/ttyUSB0

RUN ["/bin/bash", "-c", " \
    source /opt/ros/dashing/setup.bash \
    && colcon build \
    "]

ENTRYPOINT tmux