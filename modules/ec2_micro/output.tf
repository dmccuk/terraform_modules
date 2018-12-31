output "pub_ip_micro" {
value = "${aws_instance.ec2_micro.*.public_ip}"
}
