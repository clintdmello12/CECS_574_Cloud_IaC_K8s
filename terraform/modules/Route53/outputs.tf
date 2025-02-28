output "domain_name" {
  value = aws_route53_zone.domain.name
}

output "domain_id" {
  value = aws_route53_zone.domain.id
}

output "domain_zone_id" {
  value = aws_route53_zone.domain.zone_id
}