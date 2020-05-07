# docker_ros2_roomba

Dockerfile to build and run ROS2 dashing on roomba

## Note
This repo has been validated in the following environment.

- Raspbery Pi 3
- Raspbian buster lite February 2020
- Docker 19.03.8
- DSD TECH SH-U09C USB
- iRobot Roomba 643

This dockerfile clones the following repository. Please follow the respective terms of use.

- https://github.com/AutonomyLab/libcreate
- https://github.com/Sadaku1993/create_autonomy 

## Install
### Install dependencies
This repo requires
- docker

Install docker

```
curl -sSL https://get.docker.com | sh
```

Add `~/.local/bin` to your $PATH
```
echo export PATH='$PATH:~/.local/bin' >> ~/.bashrc
source ~/.bashrc
```

### Clone this repo

```
git clone https://github.com/haradama/docker_ros2_roomba.git
cd docker_ros2_roomba
docker build -t ros2_roomba:latest .
```

## Build and run
```
docker run -it --device=/dev/ttyUSB0:/dev/ttyUSB0 ros2_roomba:latest /bin/bash
```