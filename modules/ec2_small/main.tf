resource "aws_security_group" "ssh_ec2_small" {
  name = "ssh_ec2_small"

  # Inbound HTTP from anywhere
  ingress {
    from_port   = "${var.server_port}"
    to_port     = "${var.server_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound ssh from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound 5601 from anywhere
  ingress {
    from_port   = 5601
    to_port     = 5601
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound 3000 from anywhere
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound 5044 from anywhere
  ingress {
    from_port   = 5044
    to_port     = 5044
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound to anywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "external" "ssh" {
  program = ["bash", "${path.module}/../.scripts/ssh-gen.sh"]
}

resource "aws_key_pair" "sshkey" {
  key_name   = "${var.key_name}-ec2_small"
  public_key = "${file("${data.external.ssh.result.path}.pub")}"
}

resource "aws_instance" "ec2_small" {
  count         = "${var.count}"
  ami           = "${var.ami}"           #Ubuntu 16.04
  instance_type = "${var.instance_type}"

  tags {
    Name = "${format("Server_small-%01d",count.index+1)}"
  }

  security_groups = ["${aws_security_group.ssh_ec2_small.name}"]

  # key_name is your AWS keypair to allow you access
  key_name = "${aws_key_pair.sshkey.key_name}"

# Left in place but #'d out for future updates.
#  provisioner "file" {
#    source      = "files/scripts.sh"
#    destination = "/tmp/scripts.sh"
#  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -yq",
      "sudo DEBIAN_FRONTEND=noninteractive apt upgrade -yq",
      "sudo apt install wget curl git -yq"
    ]
  }

  # Setup user access via SSH
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file("${data.external.ssh.result.path}")}"
    timeout     = "2m"
    agent       = false
  }
}
