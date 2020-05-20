FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04

RUN python3-pip && pip install --upgrade pip && pip install --upgrade virtualenv 
