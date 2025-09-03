
provider "aws" {
  region = "us-east-1"
}

module "get_vpc_outputs" {
  source = "../modules/vpc_module"

}

resource "aws_instance" "app_server" {
  ami           = var.machine_ami
  instance_type = var.machine_type
  key_name      = var.key_name
  subnet_id     = module.get_vpc_outputs.subnet_id_01

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
    Name = "learn-terraform"
  }
}


