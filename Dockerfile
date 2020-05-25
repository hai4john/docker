FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04

RUN apt-get update && apt-get install -y --no-install-recommends \
		openssh-server \
		net-tools \
		libopencv-dev \
		python3-dev \
		python3-pip \
		python3-setuptools && \
	pip3 install --upgrade pip && pip3 install --upgrade virtualenv 

RUN echo "dash dash/sh boolean false" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash