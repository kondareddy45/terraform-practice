resource "aws_security_group" "mysg" {

  name = "mysg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "mykey" {
    key_name = "mykey"
    public_key = file("~/.ssh/id_rsa.pub")
}
resource "aws_instance" "web" {
  tags = {
    Name = "terraform-server"
  }
  ami           = "ami-0c3e7068675ce729f"
  instance_type = "t3.micro"
  key_name = aws_key_pair.mykey.key_name
  vpc_security_group_ids = [aws_security_group.mysg.id]
  provisioner "remote-exec" {
    connection {
        type = "ssh"
        user = "ec2-user"
        private_key = file("~/.ssh/id_rsa")
        host = self.public_ip
    }
    inline = [
        "sudo yum update -y",
        "sudo yum install httpd -y",
        "sudo systemctl start httpd"
    ]
  }

}
