resource "aws_instance" "web-server" {
  tags = {
    Name        = var.iname[count.index]
    Environment = var.ienv
  }
  ami               = var.iami[count.index]
  instance_type     = var.itype
  key_name          = var.ikey_name
  availability_zone = var.iavailability_zone
  count             = var.icount
  root_block_device {
    volume_size = var.ivolume
  }
}
