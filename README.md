# docker_ros2_raspi

Dockerfile to build and run ROS2 dashing on Raspberry Pi 1/2/3/4/Zero

## Note
This repo has been validated in the following environment

- Raspbery Pi 3
- Raspbian buster lite February 2020
- Docker 19.03.8
- docker-compose 1.25.5
- iRobot Roomba 643

## Install
### Install dependencies
This repo requires
- docker
- docker-compose

Install docker

```
curl -sSL https://get.docker.com | sh
```

Install docker-compose
```
sudo pip3 install docker-compose
```

Add `~/.local/bin` to your $PATH
```
echo export PATH='$PATH:~/.local/bin' >> ~/.bashrc
source ~/.bashrc
```

### Clone this repo

```
git clone https://github.com/haradama/docker_ros2_raspi.git
cd docker_ros2_raspi
```

## Build and run
```
docker-sompose up -d
```