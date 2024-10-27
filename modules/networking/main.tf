
resource "aws_vpc" "study_vpc" {
  cidr_block = var.cidr_block
  enable_dns_hostnames = true
  tags = {
    Name = "study-vpc"
  }
}

resource "aws_subnet" "study_subnet_public_1" {
  vpc_id = aws_vpc.study_vpc.id
  cidr_block = var.cidr_block_public_subnets[0]
  availability_zone = var.zones.zone_1
  tags = {
    Name = "study_subnet_public_1"
  }
}

resource "aws_subnet" "study_subnet_public_2" {
  vpc_id = aws_vpc.study_vpc.id
  cidr_block = var.cidr_block_public_subnets[1]
  availability_zone = var.zones.zone_2
  tags = {
    Name = "study_subnet_public_2"
  }
}

resource "aws_subnet" "study_subnet_private_1" {
  vpc_id = aws_vpc.study_vpc.id
  cidr_block = var.cidr_block_private_subnets[0]
  availability_zone = var.zones.zone_1
  tags = {
    Name = "study_subnet_private_1"
  }
}

resource "aws_subnet" "study_subnet_private_2" {
  vpc_id = aws_vpc.study_vpc.id
  cidr_block = var.cidr_block_private_subnets[1]
  availability_zone = var.zones.zone_2
  tags = {
    Name = "study_subnet_private_2"
  }
}

resource "aws_internet_gateway" "study_internet_gateway" {
  vpc_id = aws_vpc.study_vpc.id
  tags = {
    Name = "study_internet_gateway"
  }
}

resource "aws_eip" "study_eip" {}

resource "aws_nat_gateway" "study_nat_gateway" {
  allocation_id = aws_eip.study_eip.id
  subnet_id     = aws_subnet.study_subnet_public_1.id

  tags = {
    Name = "study_nat_gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.study_internet_gateway]
}

resource "aws_route_table" "study_public_route_table" {
  vpc_id         = aws_vpc.study_vpc.id
  route {
    cidr_block = var.cidr_block_local
    gateway_id = aws_internet_gateway.study_internet_gateway.id
  }
  tags = {
    Name = "study_public_route_table"
  }
}

resource "aws_route_table" "study_private_route_table" {
  vpc_id         = aws_vpc.study_vpc.id
  route {
    cidr_block = var.cidr_block_local
    nat_gateway_id = aws_nat_gateway.study_nat_gateway.id
  }

  tags = {
    Name = "study_private_route_table"
  }
}

resource "aws_route_table_association" "study_route_table_association_public_subnet_1" {
  subnet_id      = aws_subnet.study_subnet_public_1.id
  route_table_id = aws_route_table.study_public_route_table.id
}

resource "aws_route_table_association" "study_route_table_association_public_subnet_2" {
  subnet_id      = aws_subnet.study_subnet_public_2.id
  route_table_id = aws_route_table.study_public_route_table.id
}

resource "aws_route_table_association" "study_route_table_association_private_subnet_1" {
  subnet_id      = aws_subnet.study_subnet_private_1.id
  route_table_id = aws_route_table.study_private_route_table.id
}

resource "aws_route_table_association" "study_route_table_association_private_subnet_2" {
  subnet_id      = aws_subnet.study_subnet_private_2.id
  route_table_id = aws_route_table.study_private_route_table.id
}