provider "aws" {
  shared_credentials_file = "/root/.aws/credentials"
  region     = "${var.region}"
}

module "ec2_micro" {
  source        = "../modules/ec2"
  securitygroups = ["ssh", "standard"]
  key_name      = "${var.key_name}"
  count         = "${var.count_micro}"
  instance_type = "t2.micro"
  name_prefix   = "gitlab"
  ami           = "${var.ami}"
  provision_script = "files/standard.sh"
}

output "ec2_micro_public_ip" {
  value = "${module.ec2_micro.public_ip}"
}

module "ec2_small" {
  source        = "../modules/ec2"
  securitygroups = ["ssh", "standard"]
  key_name      = "${var.key_name}"
  count         = "${var.count_small}"
  instance_type = "t2.small"
  name_prefix   = "gitlab"
  ami           = "${var.ami}"
  provision_script = "files/standard.sh"
}

output "ec2_small_public_ip" {
  value = "${module.ec2_small.public_ip}"
}

module "ec2_med" {
  source        = "../modules/ec2"
  securitygroups = ["ssh", "standard"]
  key_name      = "${var.key_name}"
  count         = "${var.count_med}"
  instance_type = "t2.medium"
  name_prefix   = "gitlab"
  ami           = "${var.ami}"
  provision_script = "files/standard.sh"
}

output "ec2_med_public_ip" {
  value = "${module.ec2_med.public_ip}"
}

module "gitlab" {
  source        = "../modules/ec2"
  securitygroups = ["ssh", "gitlab"]
  key_name      = "${var.key_name}"
  count         = "${var.count_gitlab}"
  instance_type = "t2.micro"
  name_prefix   = "gitlab"
  ami           = "${var.ami}"
  provision_script = "files/standard.sh"
}

output "gitlab_public_ip" {
  value = "${module.gitlab.public_ip}"
}


module "jenkins" {
  source        = "../modules/ec2"
  securitygroups = ["ssh", "jenkins"]
  key_name      = "${var.key_name}"
  count         = "${var.count_jenkins}"
  instance_type = "t2.micro"
  name_prefix   = "gitlab"
  ami           = "${var.ami}"
  provision_script = "files/standard.sh"
}

output "jenkins_public_ip" {
  value = "${module.jenkins.public_ip}"
}