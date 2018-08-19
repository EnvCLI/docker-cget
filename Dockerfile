############################################################
# Dockerfile
############################################################

# Set the base image
FROM ubuntu:18.10

############################################################
# Configuration
############################################################
ENV VERSION "0.1.6"
ENV LC_ALL "C.UTF-8"
ENV LANG "C.UTF-8"

############################################################
# Installation
############################################################

# System Packages
RUN apt-get update &&\
    apt-get install -y -qq build-essential cmake python python-pip

# Software
RUN echo "Installing Software ..." &&\
    # CGET
    pip install cget

RUN echo "CleanUp ..." &&\
    # APT
    apt-get clean autoclean &&\
    apt-get autoremove --yes &&\
    rm -rf /var/lib/{apt,dpkg,cache,log}/

############################################################
# Execution
############################################################
