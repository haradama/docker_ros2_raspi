FROM ros:dashing

LABEL Maintainer "Masafumi Harada"

ENV ROS_DISTR dashing

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y libboost-all-dev && \
    apt-get install -y ros-${ROS_DISTR}-launch* ros-${ROS_DISTR}-joy* && \
    mkdir -p /root/create_ws/src
WORKDIR /root/create_ws

RUN git clone https://github.com/AutonomyLab/libcreate /root/create_ws/src/libcreate
RUN ["/bin/bash", "-c", " \
    source /opt/ros/${ROS_DISTR}/setup.bash \
    && colcon build --symlink-install \
    && . install/setup.bash \
    "]

RUN git clone -b ${ROS_DISTR} https://github.com/ros2/teleop_twist_joy /root/create_ws/src/teleop_twist_joy
RUN ["/bin/bash", "-c", " \
    source /opt/ros/${ROS_DISTR}/setup.bash \
    && colcon build --symlink-install \
    && . install/setup.bash \
    "]

RUN git clone -b ${ROS_DISTR}-devel https://github.com/Sadaku1993/create_autonomy /root/create_ws/src/create_autonomy
RUN ["/bin/bash", "-c", " \
    source /opt/ros/${ROS_DISTR}/setup.bash \
    && colcon build --symlink-install \
    && . install/setup.bash \
    "]

COPY ./startup.sh /root/create_ws/startup.sh
RUN chmod +x /root/create_ws/startup.sh

CMD ["/root/create_ws/startup.sh"]