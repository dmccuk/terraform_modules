output "pub_ip_jenkins" {
value = "${aws_instance.jenkins.*.public_ip}"
}
