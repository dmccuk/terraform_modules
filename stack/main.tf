provider "aws" {
#  access_key = "${var.access_key}" # replaced by aws credentials
#  secret_key = "${var.secret_key}" # replaced by aws credentials
  shared_credentials_file = "/root/.aws/credentials"
  region     = "${var.region}"
}

module "elk" {
  source        = "../modules/elk"
  count         = "${var.count}"
  ami           = "ami-0773391ae604c49a4"
  server_port   = "${var.server_port}"
  instance_type = "t2.medium"
  key_name      = "dmccuk"
  private_key_path = "/root/dmccuk.pem"
}

