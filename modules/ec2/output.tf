output "instance_public_ip" {
  value = aws_eip.study-eip.public_ip
}

output "instance_private_ip" {
  value = aws_eip.study-eip.private_ip
}
