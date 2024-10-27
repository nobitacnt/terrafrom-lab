instance_tag_name = "instance-study"
instance_type = "t2.micro"
region        = "ap-southeast-1"
image_ids     = {
  "ap-southeast-1" : "ami-0ad522a4a529e7aa8"
  "ap-northeast-1" : "ami-047126e50991d067b"
}
keypair_path = "./keypair/udemy.pub"
keypair_name = "keypair-study"

#networking
cidr_block = "10.0.0.0/16"
cidr_block_public_subnets = [
  "10.0.0.0/20",
  "10.0.16.0/20"
]
cidr_block_private_subnets = [
  "10.0.128.0/20",
  "10.0.144.0/20"
]
zones = {
  zone_1: "ap-southeast-1a",
  zone_2: "ap-southeast-1b",
}
