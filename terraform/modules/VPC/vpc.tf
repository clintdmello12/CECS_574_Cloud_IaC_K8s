resource "aws_vpc" "my-project" {
  cidr_block       = var.vpc_cidr_blocks
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
    Terraform = "True"
  }
}

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.my-project.id
  cidr_block = var.public1_cidr
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-public1"
    Terraform = "True"
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.my-project.id
  cidr_block = var.public2_cidr
  availability_zone = "${var.region}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-public2"
    Terraform = "True"
  }
}

resource "aws_subnet" "public3" {
  vpc_id     = aws_vpc.my-project.id
  cidr_block = var.public3_cidr
  availability_zone = "${var.region}c"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-public3"
    Terraform = "True"
  }
}


resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.my-project.id
  cidr_block = var.private1_cidr
  availability_zone = "${var.region}a"

  tags = {
    Name = "${var.vpc_name}-private1"
    Terraform = "True"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.my-project.id
  cidr_block = var.private2_cidr
  availability_zone = "${var.region}b"

  tags = {
    Name = "${var.vpc_name}-private2"
    Terraform = "True"
  }
}

resource "aws_subnet" "private3" {
  vpc_id     = aws_vpc.my-project.id
  cidr_block = var.private3_cidr
  availability_zone = "${var.region}c"

  tags = {
    Name = "${var.vpc_name}-private3"
    Terraform = "True"
  }
}

resource "aws_internet_gateway" "project_igw" {
  vpc_id = aws_vpc.my-project.id
  tags = {
    Name = "${var.vpc_name}-igw"
    Terraform = "True"
  }
}