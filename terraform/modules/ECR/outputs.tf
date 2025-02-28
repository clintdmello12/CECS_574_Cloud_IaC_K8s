output "frontend_repo_name" {
  value = aws_ecr_repository.frontend.name
}

output "backend_repo_name" {
  value = aws_ecr_repository.backend.name
}