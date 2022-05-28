provider "aws" {
  region = var.region
}

module "my_aws_key" {
  source = "../modules/aws_key"
}

module "sg_gitlab" {
  source = "../modules/security_groups/gitlab"
}

module "sg_jenkins" {
  source = "../modules/security_groups/jenkins"
}

module "sg_ssh" {
  source = "../modules/security_groups/ssh"
}

module "sg_standard" {
  source = "../modules/security_groups/standard"
}

module "ec2_micro" {
  source           = "../modules/ec2"
  securitygroups   = [module.sg_ssh.sg_name, module.sg_standard.sg_name, module.sg_gitlab.sg_name]
  instance_count   = var.count_micro
  instance_type    = "t2.micro"
  name_prefix      = "micro"
  ami              = var.ami
  provision_script = "files/standard.sh"
}

output "ec2_micro_public_ip" {
  value = module.ec2_micro.public_ip
}

module "ec2_small" {
  source           = "../modules/ec2"
  securitygroups   = [module.sg_ssh.sg_name, module.sg_standard.sg_name]
  instance_count   = var.count_small
  instance_type    = "t2.small"
  name_prefix      = "small"
  ami              = var.ami
  provision_script = "files/standard.sh"
}

output "ec2_small_public_ip" {
  value = module.ec2_small.public_ip
}

module "ec2_med" {
  source           = "../modules/ec2"
  securitygroups   = [module.sg_ssh.sg_name, module.sg_standard.sg_name]
  instance_count   = var.count_med
  instance_type    = "t2.medium"
  name_prefix      = "med"
  ami              = var.ami
  provision_script = "files/standard.sh"
}

output "ec2_med_public_ip" {
  value = module.ec2_med.public_ip
}

module "gitlab" {
  source           = "../modules/ec2"
  securitygroups   = [module.sg_ssh.sg_name, module.sg_gitlab.sg_name]
  instance_count   = var.count_gitlab
  instance_type    = "t2.medium"
  name_prefix      = "gitlab"
  ami              = var.ami
  provision_script = "files/gitlab_install.sh"
}

output "gitlab_public_ip" {
  value = module.gitlab.public_ip
}


module "jenkins" {
  source           = "../modules/ec2"
  securitygroups   = [module.sg_ssh.sg_name, module.sg_jenkins.sg_name]
  instance_count   = var.count_jenkins
  instance_type    = "t2.micro"
  name_prefix      = "jenkins"
  ami              = var.ami
  provision_script = "files/jenkins_install.sh"
}

output "jenkins_public_ip" {
  value = module.jenkins.public_ip
}
