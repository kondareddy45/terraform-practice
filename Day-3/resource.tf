locals {
  itype = {
    dev  = "t3.micro"
    test = "t3.small"
    prod = "c7i-flex.large"
  }
}

resource "aws_instance" "web-server" {

  ami               = "ami-0c3e7068675ce729f"
  instance_type     = local.itype[terraform.workspace]
  key_name          = "myppkfile"
  availability_zone = "us-west-1b"

  tags = {
    Name = "${terraform.workspace}-server"
  }

  root_block_device {
    volume_size = 10
  }
}
