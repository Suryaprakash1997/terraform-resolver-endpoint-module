output "resolver_endpoint_id" {
  value = aws_route53_resolver_endpoint.resolver_endpoint.id
}

output "security_group_ids" {
  value = aws_security_group.resolver_sg.id
}

output "resolver_endpoint_ips" {
  value = aws_route53_resolver_endpoint.resolver_endpoint.ip_address[*].ip
}