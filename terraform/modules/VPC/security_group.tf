resource "aws_security_group" "public_ec2_sg" {
  name        = var.public_security_group_name
  description = "Allow TCP inbound traffic"
  vpc_id = aws_vpc.my-project.id

  ingress {
    description      = "Apt 75 WiFI HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.cidr_blocks]
  }

  ingress {
    description      = "Apt 75 SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.cidr_blocks]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.vpc_name}-Public_SG"
  }
}


resource "aws_security_group" "private_ec2_sg" {
  name        = var.private_security_group_name
  description = "Allow TCP inbound traffic"
  vpc_id = aws_vpc.my-project.id

  ingress {
    description      = "Public SG"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    security_groups = [aws_security_group.public_ec2_sg.id]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.vpc_name}-Private_SG"
    Terraform = "True"
  }
}