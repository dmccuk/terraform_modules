variable "count_micro" {
  default = 2
}
variable "count_small" {
  default = 1
}
variable "count_med" {
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

variable "private_key_path" {
  default = "/root/dmccuk.pem"
}
