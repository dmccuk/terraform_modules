data "external" "ssh" {
  program = ["bash", "${path.module}/../.scripts/ssh-gen.sh"]
}
resource "aws_instance" "ec2" {
  count         = "${var.count}"
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"

  tags {
    Name = "${format("${var.name_prefix}-%01d",count.index+1)}"
  }

  security_groups = ["${var.securitygroups}"]

  # key_name is your AWS keypair to allow you access
  key_name = "${var.key_name}"

  provisioner "file" {
    source      = "${var.provision_script}"
    destination = "/tmp/${basename(var.provision_script)}"
  }
  provisioner "remote-exec" {
        inline = [
          "chmod +x /tmp/${basename(var.provision_script)}",
          "sudo /tmp/${basename(var.provision_script)}"
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
