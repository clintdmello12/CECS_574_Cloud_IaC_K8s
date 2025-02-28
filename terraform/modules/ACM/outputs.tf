output "dns_name" {
  value = aws_acm_certificate.cert.domain_name
}
output "alter_dns" {
  value = aws_acm_certificate.cert.subject_alternative_names
}