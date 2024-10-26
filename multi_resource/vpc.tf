resource "aws_vpc" "my_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "my_personal_vpc"
  }
}

resource "aws_subnet" "my_pub_subnet_1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "pub-subnet-1"
  }
}

resource "aws_subnet" "my_pub_subnet_2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "pub-subnet-2"
  }
}

resource "aws_subnet" "my_pub_subnet_3" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "pub-subnet-3"
  }
}

resource "aws_subnet" "my_priv_subnet_1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "priv-subnet-1"
  }
}

resource "aws_subnet" "my_priv_subnet_2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "priv-subnet-2"
  }
}

resource "aws_subnet" "my_priv_subnet_3" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "priv-subnet-3"
  }
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "my-personal-internet-gateway"
  }
}

resource "aws_route_table" "my_pub_RT" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "my-public-route-table"
  }
}

resource "aws_route_table_association" "my_route_1a" {
  subnet_id      = aws_subnet.my_pub_subnet_1.id
  route_table_id = aws_route_table.my_pub_RT.id
}

resource "aws_route_table_association" "my_route_2a" {
  subnet_id      = aws_subnet.my_pub_subnet_2.id
  route_table_id = aws_route_table.my_pub_RT.id
}

resource "aws_route_table_association" "my_route_3a" {
  subnet_id      = aws_subnet.my_pub_subnet_3.id
  route_table_id = aws_route_table.my_pub_RT.id
}