output "instance_hostname" {
  value = aws_instance.app_server.public_dns
}

output "instance_public_ip" {
  value = aws_instance.app_server.public_ip
}

output "root_block_device_name" {
  value = aws_instance.app_server.ebs_block_device
}