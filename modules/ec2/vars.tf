variable securitygroups {
  type = "list"
}
variable "count" {}
variable "instance_type" {}
variable "key_name" {
  default = "ssh_key"
}
variable "ami" {}
variable "name_prefix" {}
variable "provision_script" {}