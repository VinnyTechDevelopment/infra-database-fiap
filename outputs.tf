output "rds_endpoint" {
  description = "endpoint:porta do RDS"
  value       = aws_db_instance.this.endpoint
}

output "rds_address" {
  description = "Hostname do RDS, sem a porta (usar em DB_HOST)"
  value       = aws_db_instance.this.address
}

output "rds_port" {
  value = aws_db_instance.this.port
}

output "db_name" {
  value = aws_db_instance.this.db_name
}

output "security_group_id" {
  description = "Security group do RDS — a Lambda de auth (lambda-auth-cpf) também vai precisar liberar acesso via este SG ou via uma regra equivalente"
  value       = aws_security_group.rds.id
}
