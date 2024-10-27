variable "instance_tag_name" {
  type = string
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "region" {
  type = string
}

variable "key_name" {
  type = string
}

variable "ecs_security_group_ids" {
  type = list(string)
}

variable "subnet_id" {
  type = string
}