provider "aws" {
#  access_key = "${var.access_key}" # replaced by aws credentials
#  secret_key = "${var.secret_key}" # replaced by aws credentials
  shared_credentials_file = "/root/.aws/credentials"
  region     = "${var.region}"
}

module "ec2_micro" {
  source        = "../modules/ec2_micro"
  count         = "${var.count_micro}"
  ami           = "ami-0773391ae604c49a4"
  server_port   = "${var.server_port}"
  instance_type = "t2.micro"
  key_name      = "dmccuk"
  private_key_path = "${var.private_key_path}"
}
module "ec2_small" {
  source        = "../modules/ec2_small"
  count         = "${var.count_small}"
  ami           = "ami-0773391ae604c49a4"
  server_port   = "${var.server_port}"
  instance_type = "t2.small"
  key_name      = "dmccuk"
  private_key_path = "${var.private_key_path}"
}
module "ec2_med" {
  source        = "../modules/ec2_med"
  count         = "${var.count_med}"
  ami           = "ami-0773391ae604c49a4"
  server_port   = "${var.server_port}"
  instance_type = "t2.medium"
  key_name      = "dmccuk"
  private_key_path = "${var.private_key_path}"
}
