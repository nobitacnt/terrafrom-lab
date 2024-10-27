variable "cidr_block" {
  type = string
}

variable "cidr_block_local" {
  type = string
  default = "0.0.0.0/0"
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
