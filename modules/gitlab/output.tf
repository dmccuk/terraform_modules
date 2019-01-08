output "pub_ip_gitlab" {
value = "${aws_instance.gitlab.*.public_ip}"
}
