terraform {
  required_version = ">= 1.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    # preencher via -backend-config no terraform init (bucket, key, region, dynamodb_table)
  }
}

provider "aws" {
  region = var.aws_region
}

# Lê os outputs do repositório infra-kubernetes (mesma conta, mesmo bucket de
# state, key diferente) para colocar o RDS dentro da mesma VPC do EKS.
data "terraform_remote_state" "cluster" {
  backend = "s3"

  config = {
    bucket = var.tf_state_bucket
    key    = "infra-kubernetes/terraform.tfstate"
    region = var.aws_region
  }
}
