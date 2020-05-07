FROM ros:dashing

LABEL Maintainer "Masafumi Harada"

ENV ROS_DISTR dashing

RUN apt-get update -y && \
    apt-get upgrade -y && \
    git clone https://github.com/google/googletest.git /root/googletest && \
    mkdir -p /root/googletest/build && \
    cd /root/googletest/build && \
    cmake .. && \
    make && \
    make install && \
    cd /root && \
    rm -rf /root/googletest && \
    apt-get install -y --no-install-recommends \
    libboost-all-dev ros-${ROS_DISTR}-launch* ros-${ROS_DISTR}-joy* && \
    mkdir -p /root/create_ws/src

WORKDIR /root/create_ws

COPY ./startup.sh /root/create_ws/startup.sh
RUN chmod +x /root/create_ws/startup.sh && \
    git clone https://github.com/AutonomyLab/libcreate /root/create_ws/src/libcreate && \
    bash -c "source /opt/ros/${ROS_DISTR}/setup.bash && colcon build --symlink-install && . install/setup.bash" && \
    git clone -b ${ROS_DISTR} https://github.com/ros2/teleop_twist_joy /root/create_ws/src/teleop_twist_joy && \
    bash -c "source /opt/ros/${ROS_DISTR}/setup.bash && colcon build --symlink-install && . install/setup.bash" && \
    git clone -b ${ROS_DISTR}-devel https://github.com/Sadaku1993/create_autonomy /root/create_ws/src/create_autonomy && \
    bash -c "source /opt/ros/${ROS_DISTR}/setup.bash && colcon build --symlink-install && . install/setup.bash"

CMD ["/root/create_ws/startup.sh"]