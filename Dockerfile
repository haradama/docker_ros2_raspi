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
    git clone -b dashing-devel https://github.com/Sadaku1993/create_autonomy /root/create_ws/src/create_autonomy

RUN ["/bin/bash", "-c", " \
    source /opt/ros/dashing/setup.bash \
    && colcon build \
    "]

COPY ./startup.sh /root/create_ws/startup.sh
RUN chmod +x /root/create_ws/startup.sh

CMD ["/root/create_ws/startup.sh"]