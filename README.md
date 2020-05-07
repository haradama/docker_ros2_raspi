# docker_ros2_raspi

Dockerfile to build and run ROS2 dashing on Raspberry Pi 1/2/3/4/Zero

## Environment setup

### Install
#### Install dependencies
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

#### Clone this repo

```
git clone https://github.com/haradama/docker_ros2_raspi.git
```

#### Build and run
```
docker-sompose up -d
```