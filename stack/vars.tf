variable "count" {
  default = 2
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

