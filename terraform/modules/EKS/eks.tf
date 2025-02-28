resource "aws_eks_cluster" "project_cluster" {
  name     = "${var.vpc_name}-cluster"
  role_arn = aws_iam_role.cluster_role.arn

  vpc_config {
    subnet_ids = [var.private_subnet, var.private_subnet2, var.private_subnet3, var.public_subnet, var.public_subnet2, var.public_subnet3]
    endpoint_private_access = true
  }
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
  ]
  tags = {
    Terraform = "True"
  }
}