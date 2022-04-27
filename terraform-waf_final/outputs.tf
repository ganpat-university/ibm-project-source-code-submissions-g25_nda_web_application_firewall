output "Ec2_public_ip"{
value = "${aws_instance.AnilP-instance.public_ip}"
}
