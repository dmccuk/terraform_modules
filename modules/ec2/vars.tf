variable securitygroups {
  type = list
}
variable "instance_count" {}
variable "instance_type" {}
variable "key_name" {
  default = "ssh_key_dc"
}
variable "ami" {}
variable "name_prefix" {}
variable "provision_script" {}
variable "username" {
  default = "ubuntu"
}
