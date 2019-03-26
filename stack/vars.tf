variable "count_micro" {
  default = 1
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
  default = "eu-west-1"
}
variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default = 80
}

variable "key_name" {
  default = "dmccuk"
}
variable "ami" { # Ubuntu 16.04
  default = "ami-0773391ae604c49a4"
}
