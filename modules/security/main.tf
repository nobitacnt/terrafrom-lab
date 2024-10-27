
resource "aws_security_group" "public_sg" {
  name   = "public_sg"
  description = "study public security group"
  vpc_id = var.vpc_id
  tags = {
    Name = "study-public-security-group"
  }
  ingress  {
    from_port       = 80
    to_port         = 80
    protocol        = var.protocol
    cidr_blocks     = ["0.0.0.0/0"]
  }

  ingress  {
    description     = "TLS from VPC"
    from_port       = 443
    to_port         = 443
    protocol        = var.protocol
    cidr_blocks     = ["0.0.0.0/0"]
  }

  ingress  {
    from_port       = 22
    to_port         = 22
    protocol        = var.protocol
    cidr_blocks     = ["0.0.0.0/0"]
  }

  egress  {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "private_sg" {
  name   = "private_sg"
  vpc_id = var.vpc_id
  description = "study private security group"
  tags = {
    Name = "study-private-security-group"
  }

  ingress  {
    from_port       = 80
    to_port         = 80
    protocol        = var.protocol
    security_groups = [aws_security_group.public_sg.id]
  }

  ingress  {
    from_port       = 3306
    to_port         = 3306
    protocol        = var.protocol
    security_groups = [aws_security_group.public_sg.id]
  }

  egress  {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

