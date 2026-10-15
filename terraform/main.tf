resource "aws_vpc" "gym-tracker-vpc" {
  cidr_block           = var.vpc-cider
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name    = "${var.project-name}-vpc"
    project = var.project-name
  }
}

resource "aws_subnet" "gym-tracker-subnet" {
  vpc_id                  = aws_vpc.gym-tracker-vpc.id
  cidr_block              = var.public-subnet-cider
  availability_zone       = var.availability-zone
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project-name}-public-subnet"
  }
}

resource "aws_internet_gateway" "gym-tracker-igw" {
  vpc_id = aws_vpc.gym-tracker-vpc.id

  tags = {
    Name = "${var.project-name}-igw"
  }
}

resource "aws_route_table" "gym-tracker-rt" {
  vpc_id = aws_vpc.gym-tracker-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gym-tracker-igw.id
  }

  tags = {
    Name = "${var.project-name}-route-table"
  }
}



resource "aws-route_table_association" "gym-tracker-rt-assoc" {
  subnet_id      = aws_subnet.gym-tracker-subnet.id
  route_table_id = aws_route-table.gym-tracker-rt.id
}