# qt-opencv-cuda
QT creator + OpenCV 2.4.10 + Cuda 7.5 (nvidia docker)

# Setup

## Prerequisites

1- Install Docker following the installation guide for your platform: https://docs.docker.com/engine/installation/

2- GPU Version Only: Install Nvidia drivers on your machine either from Nvidia directly or follow the instructions here

3- GPU Version Only: Install nvidia-docker: https://github.com/NVIDIA/nvidia-docker, following the instructions here. This will install a replacement for the docker CLI. It takes care of setting up the Nvidia host driver environment inside the Docker containers and a few other things.

## Obtaining the Docker image


You have 2 options to obtain the Docker image

## Option 1: Download the Docker image from Docker Hub

Docker Hub is a cloud based repository of pre-built images. You can download the image directly from here, which should be much faster than building it locally (a few minutes, based on your internet speed). Here is the automated build page for qt-opencv-cuda: https://hub.docker.com/r/amine2733/qt-opencv-cuda/. The image is automatically built based on the Dockerfile in the Github repo.

docker pull amine2733/qt-opencv-cuda

## Option 2: Build the Docker image locally

git clone https://github.com/belarbi2733/qt-opencv-cuda.git

cd qt-opencv-cuda

docker build -t qt .

# Running the Docker image as a Container :

cd qt-opencv-cuda

sh script1.sh

sudo script2.sh

### taper la commande suivante direct dans le terminal:

qt-docker

