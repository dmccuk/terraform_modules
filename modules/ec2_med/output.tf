output "pub_ip_med" {
value = "${aws_instance.ec2_med.*.public_ip}"
}
