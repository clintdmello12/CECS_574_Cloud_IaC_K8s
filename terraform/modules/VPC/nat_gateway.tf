resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_ip.id
  subnet_id     = aws_subnet.public1.id

  tags = {
    Name = "${var.vpc_name}-NAT"
    Terraform = "True"
  }
  depends_on = [aws_internet_gateway.project_igw]
}

resource "aws_eip" "nat_ip" {
  network_border_group = var.region
}

resource "aws_default_route_table" "nat_attach" {
  default_route_table_id = aws_vpc.my-project.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }


  tags = {
    Terraform = "True"
  }
}