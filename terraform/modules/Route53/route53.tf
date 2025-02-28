resource "aws_route53_zone" "domain" {
  name = var.route53_domain
  tags = {
    Name = var.route53_domain
    Terraform = "True"
  }
}