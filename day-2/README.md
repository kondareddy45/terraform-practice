# Alias
In Terraform, alias is used to define multiple configurations of the same provider, allowing resources to be deployed across different regions or accounts using specific provider configurations.

# ---------------------------------
provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "west"
  region = "us-west-1"
}
# --------------------------------

resource "aws_instance" "east_server" {
  ami           = "ami-xxxx"
  instance_type = "t2.micro"
}

**resource "aws_instance" "west_server" {
  provider      = aws.west
  ami           = "ami-yyyy"
  instance_type = "t2.micro"
}**

---------------------------------------------------
