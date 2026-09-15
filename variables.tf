variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "techchallenge"
}

variable "environment" {
  type    = string
  default = "production"
}

variable "tf_state_bucket" {
  description = "Bucket S3 onde os states de todos os repositórios de infra ficam guardados (o mesmo bucket usado no infra-kubernetes)"
  type        = string
}

# --- Banco ---

variable "db_name" {
  description = "Nome do banco de dados (equivale a DB_DATABASE / MYSQL_DATABASE)"
  type        = string
  default     = "techchallenge"
}

variable "db_username" {
  description = "Usuário master do RDS. Use o mesmo valor que DB_USERNAME no configmap da aplicação."
  type        = string
  default     = "techchallenge"
}

variable "db_password" {
  description = "Senha do usuário master do RDS. Precisa ser IDÊNTICA ao var.db_password usado no repositório da aplicação (kubernetes_secret_v1.app_secret / DB_PASSWORD), já que reaproveitamos o mesmo usuário para simplificar."
  type        = string
  sensitive   = true
}

variable "instance_class" {
  description = "Classe da instância RDS. db.t3.micro é elegível ao free tier numa conta normal; no AWS Academy qualquer uma pequena serve."
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Armazenamento em GB"
  type        = number
  default     = 20
}

variable "engine_version" {
  type    = string
  default = "8.0"
}
