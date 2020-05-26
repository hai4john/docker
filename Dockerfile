FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
	    wget \
	    build-essential \
	    cmake \
	    git \
	    unzip \
	    pkg-config \
	    openssh-server \
	    net-tools \
	    python3-dev \
	    python3-pip \
	    python3-setuptools \
	    python3-opencv \
	    python3-numpy \
	    python3-pycurl \
	    libopencv-dev \
	    libjpeg-dev \
	    libpng-dev \
	    libtiff-dev \
	    zlib1g-dev && \
	pip3 install --upgrade pip && pip3 install --upgrade virtualenv

RUN mkdir -p ~/opencv cd ~/opencv && \
	wget https://github.com/opencv/opencv/archive/3.2.0.zip && \
	unzip 3.2.0.zip && \
	rm 3.2.0.zip && \
	mv opencv-3.2.0 OpenCV && \
	cd OpenCV && \
	mkdir build && \
	cd build && \
	cmake && \
	make -j4 && \
	make install && \
	ldconfig

RUN echo "dash dash/sh boolean false" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash
