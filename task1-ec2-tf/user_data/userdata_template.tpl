#!/bin/bash

# Base system update and configuration


yum install -y yum-utils sysstat wget mdadm unzip nc

amazon-linux-extras install docker -y
yum install -y docker

systemctl start docker
systemctl start sysstat.service

systemctl enable sysstat.service
systemctl enable docker.service

