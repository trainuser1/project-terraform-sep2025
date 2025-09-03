
module "get_vpc_outputs" {
  source = "../modules/vpc_module"

  vpc_cidr = "192.168.0.0/16"
  sub-01-cidr = "192.168.16.0/24"
  sub-02-cidr = "192.168.32.0/24"
  vpc_name_prefix = "tf-vpc-192"
  vpc-region = "us-east-1"
  subnet_name_prefix_01 = "192-sub-01"
  subnet_name_prefix_02 = "192-sub-02"
}

module "get_vpc_outputs_2" {
  source = "../modules/vpc_module"

  vpc_cidr = "172.172.0.0/16"
  sub-01-cidr = "172.172.16.0/24"
  sub-02-cidr = "172.172.32.0/24"
  vpc_name_prefix = "tf-vpc-172"
  vpc-region = "us-east-1"
  subnet_name_prefix_01 = "172-sub-01"
  subnet_name_prefix_02 = "172-sub-02"
}


resource "aws_instance" "app_server" {
  count         = var.no_of_machines
  ami           = var.machine_ami
  instance_type = var.machine_type
  key_name      = var.key_name
  subnet_id     = module.get_vpc_outputs.subnet_id_01
  region = var.ec2_region
  user_data = var.meta_data

  associate_public_ip_address = var.public_ip_flag

  vpc_security_group_ids = [module.get_vpc_outputs.vpc_sg]

  ebs_block_device {
    device_name           = var.ebs_device_name
    volume_type           = "io2"
    iops                  = "256"
    volume_size           = var.ebs_volume_size
    delete_on_termination = true
  }
  root_block_device {
    volume_type           = "gp3"
    volume_size           = 20
    delete_on_termination = true
  }

  tags = {
    Name = "learn-terraform-${count.index}"
  }
}


