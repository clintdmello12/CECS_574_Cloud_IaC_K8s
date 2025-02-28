resource "aws_security_group" "eks_cluster_sg" {
  name        = "${var.vpc_name}-Cluster-SG"
  description = "Allow TCP inbound traffic"
  vpc_id = var.vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Terraform = "True"
    Name = "${var.vpc_name}-Cluster-SG"
  }
}