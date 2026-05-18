locals {
  common_tags = {
    Environment = "prod"
    Owner       = "konda"
  }
}

resource "aws_instance" "web" {

  ami           = "ami-0c3e7068675ce729f"
  instance_type = "t2.micro"

  tags = local.common_tags
}

