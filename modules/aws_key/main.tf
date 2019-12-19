data "external" "ssh" {
  program = ["bash", "${path.module}/../.scripts/ssh-gen.sh"]
}

resource "aws_key_pair" "sshkey" {
  key_name   = var.key_name
  public_key = file("${data.external.ssh.result.path}.pub")
}