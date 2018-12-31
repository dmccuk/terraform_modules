output "pub_ip_micro" {
value = "${module.ec2_micro.pub_ip_micro}"
}
output "pub_ip_small" {
value = "${module.ec2_small.pub_ip_small}"
}
output "pub_ip_med" {
value = "${module.ec2_med.pub_ip_med}"
}
