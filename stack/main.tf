provider "aws" {
  shared_credentials_file = "/root/.aws/credentials"
  region     = "${var.region}"
}

module "gitlab" {
  source        = "../modules/ec2"
  securitygroups = ["ssh", "gitlab"]
  key_name      = "${var.key_name}"
  count         = 1
  instance_type = "t2.micro"
  name_prefix   = "gitlab"
  ami           = "${var.ami}"
  provision_script = "files/standard.sh"
}