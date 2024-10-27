
resource "aws_instance" "study-instance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  tags = {
    Name = var.instance_tag_name
  }
  vpc_security_group_ids = var.ecs_security_group_ids
}

resource "aws_eip" "study-eip" {
  instance = aws_instance.study-instance.id
}