variable "instance_type" {
  type = string
}

variable "instance_tag_name" {
  type = string
}

variable "region" {
  type = string
}

variable "image_ids" {
  type = map(string)
}

variable "keypair_path" {
  type = string
}

variable "keypair_name" {
  type = string
}

# networking
variable "cidr_block" {
  type = string
}

variable "cidr_block_public_subnets" {
  type = list(string)
}

variable "cidr_block_private_subnets" {
  type = list(string)
}

variable "zones" {
  type = map(string)
}


