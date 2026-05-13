output "instance_ip" {
  value = aws_instance.web-server.public_ip
}

output "instance_sg" {
  value = aws_instance.web-server.security_groups
}

