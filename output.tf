output "public_ip" {
  value = module.ec2.instance_public_ip
}

output "private_ip" {
  value = module.ec2.instance_private_ip
}

output "vpc_ip" {
  value = module.networking.vpc_id
}