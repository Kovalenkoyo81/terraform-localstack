output "db_endpoint" {
  description = "ARN таблицы"
  value       = aws_dynamodb_table.this.arn
}

output "db_name" {
  description = "Имя таблицы"
  value       = aws_dynamodb_table.this.name
}
