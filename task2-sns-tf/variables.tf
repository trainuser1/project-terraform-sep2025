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

