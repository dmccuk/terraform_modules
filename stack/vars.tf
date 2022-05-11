variable "count_micro" {
  default = 0
}
variable "count_small" {
  default = 0
}
variable "count_med" {
  default = 0
}
variable "count_gitlab" {
  default = 0
}
variable "count_jenkins" {
  default = 0
}

#variable "access_key" {} # replaced by aws credentials
#variable "secret_key" {} # replaced by aws credentials
variable "region" {
  default = "eu-west-2"
}
variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default     = 80
}

# If you choose to build with Centos or Ubuntu AMI images
# make sure you update the default user in this file:
# ../modules/ec2/vars.tf

variable "ami" {
  default = "ami-093762347983f511b"
}
