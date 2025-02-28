resource "aws_ecr_repository" "frontend" {
  name                 = var.frontend_repo
  image_tag_mutability = "MUTABLE"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Terraform = "True"
  }
}


resource "aws_ecr_repository" "backend" {
  name                 = var.backend_repo
  image_tag_mutability = "MUTABLE"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Terraform = "True"
  }
}