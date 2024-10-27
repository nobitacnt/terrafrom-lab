
output "vpc_id" {
  value = aws_vpc.study_vpc.id
}

output "public_subnet_ids" {
  value = [
    aws_subnet.study_subnet_public_1.id,
    aws_subnet.study_subnet_public_2.id,
  ]
}

output "private_subnet_ids" {
  value = [
    aws_subnet.study_subnet_private_1.id,
    aws_subnet.study_subnet_private_2.id,
  ]
}