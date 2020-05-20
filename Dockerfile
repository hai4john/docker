FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04

RUN apt-get update && apt-get install -y --no-install-recommends \
		python3-pip \
		python3-setuptools && \
	pip3 install --upgrade pip && pip3 install --upgrade virtualenv 
