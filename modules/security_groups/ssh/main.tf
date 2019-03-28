resource "aws_security_group" "ssh" {
  name = "ssh"
  # Inbound HTTP from anywhere
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}