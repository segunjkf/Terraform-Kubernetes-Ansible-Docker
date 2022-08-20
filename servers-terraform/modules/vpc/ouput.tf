output "securit-group-id" {
  value = aws_security_group.allow_tls.id
}

output "subnet_id_number" {
  value = aws_subnet.main.id
}