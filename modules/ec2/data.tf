locals {
  # Map for Image owner and ami default user name
  lookup_owners = {
    # AWS Owner Id for canonical
    "099720109477" = "ubuntu"
    # AWS Owner Id for CentOS
    "679593333241" = "centos"
    # AWS Owner Id for Amazon
    "137112412989" = "ec2-user"
    # AWS Owner id for Redhat
    "309956199498" = "ec2-user"
    # AWS Owner id for Debian
    "379101102735" = "admin"
  }
}

data "aws_ami" "ami_id" {
  owners           = keys(local.lookup_owners)

  filter {
    name   = "image-id"
    values = [var.ami]
  }
}