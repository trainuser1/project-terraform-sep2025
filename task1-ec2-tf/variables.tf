variable "machine_ami" {
  default = "ami-020cba7c55df1f615"
}

variable "machine_type" {
  default = "t3.small"
}

variable "machine_subnet" {
  default = "subnet-04f5eb63024a50666"
}

variable "key_name" {
  default = "arif-862593774751-ec2-key"
}

variable "public_ip_flag" {
  default = "true"
}

variable "subnet_list" {
  default = ["sg-028a2607552513298"]
}

variable "ebs_volume_size" {
  default = 100
}

variable "ebs_device_name" {
  default = "/dev/sdz"
}

variable "ec2_region" {
  default = "us-east-1"
}

variable "no_of_machines"{
  default = 1
}

variable "meta_data" {
  default = "#!/bin/bash

# Base system update and configuration

yum install -y yum-utils sysstat wget mdadm unzip nc

amazon-linux-extras install docker -y
yum install -y docker

systemctl start docker
systemctl start sysstat.service

systemctl enable sysstat.service
systemctl enable docker.service"
}