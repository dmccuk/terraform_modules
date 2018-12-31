output "pub_ip_small" {
value = "${aws_instance.ec2_small.*.public_ip}"
}
