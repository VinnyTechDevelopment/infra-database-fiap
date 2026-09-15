resource "aws_db_instance" "this" {
  identifier     = "${var.project_name}-db"
  engine         = "mysql"
  engine_version = var.engine_version

  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  storage_type      = "gp2"

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password
  port     = 3306

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  # Sem HA/replica de leitura por enquanto — é um projeto de estudo, não produção real
  multi_az = false

  # Sem Enhanced Monitoring / Performance Insights: essas features exigem uma
  # IAM role própria (monitoring_role_arn), o que o AWS Academy não permite
  # criar. Se algum dia sair do Academy, dá pra ligar essas duas.
  monitoring_interval          = 0
  performance_insights_enabled = false

  publicly_accessible = false
  skip_final_snapshot  = true # projeto de estudo — numa conta de produção, defina final_snapshot_identifier
  deletion_protection  = false

  backup_retention_period = 1

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}
