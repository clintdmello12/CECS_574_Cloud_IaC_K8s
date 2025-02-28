resource "aws_network_acl" "private_nacl" {
  vpc_id = aws_vpc.my-project.id

  egress {            
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.private1_cidr
    from_port  = 0
    to_port    = 0
  }

  egress {    
    protocol   = "tcp"
    rule_no    = 101
    action     = "allow"
    cidr_block = var.private2_cidr
    from_port  = 0
    to_port    = 0
  }


  egress {   
    protocol   = "tcp"
    rule_no    = 102
    action     = "allow"
    cidr_block = var.private3_cidr
    from_port  = 0
    to_port    = 0
  }


  ingress {
    protocol   = "tcp"
    rule_no    = 103
    action     = "allow"
    cidr_block = var.public1_cidr
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 104
    action     = "allow"
    cidr_block = var.public2_cidr
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 105
    action     = "allow"
    cidr_block = var.public3_cidr
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Terraform = "True"
    Name = "${var.vpc_name}-Private-NACL"
  }
}

resource "aws_network_acl_association" "pvt_subnet_asso1" {
  network_acl_id = aws_network_acl.private_nacl.id
  subnet_id      = aws_subnet.private1.id
}

resource "aws_network_acl_association" "pvt_subnet_asso2" {
  network_acl_id = aws_network_acl.private_nacl.id
  subnet_id      = aws_subnet.private2.id
}

resource "aws_network_acl_association" "pvt_subnet_asso3" {
  network_acl_id = aws_network_acl.private_nacl.id
  subnet_id      = aws_subnet.private3.id
}