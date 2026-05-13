resource "aws_instance" "web-server" {
  tags = {
    Name = "web-server"
  }
  ami                    = "ami-0a59ec92177ec3fad"
  instance_type          = "t3.micro"
  key_name               = "BOI_new_keypair"
  vpc_security_group_ids = [aws_security_group.mysg.id]

  root_block_device {
    volume_size = 10
  }
}

resource "aws_instance" "app-server" {
   provider               = "aws.west"
  tags = {
    Name = "app-server"
  }
  ami                    = "ami-0a59ec92177ec3fad"
  instance_type          = "t3.micro"
  key_name               = "BOI_new_keypair"
  vpc_security_group_ids = [aws_security_group.mysg.id]

  root_block_device {
    volume_size = 10
  }
}
