# Хранилище для remote state основного проекта: бакет и таблица блокировок.
#
# Стейт этой конфигурации локальный (bootstrap/terraform.tfstate, не в git):
# бакет нельзя описывать стейтом, который лежит в этом же бакете.
# Если локальный стейт потерян — ресурсы возвращаются через terraform import.

terraform {
  required_version = ">= 1.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true

  endpoints {
    s3       = "http://localstack.10.8.0.1.nip.io"
    dynamodb = "http://localstack.10.8.0.1.nip.io"
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state"
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform_locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
