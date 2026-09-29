output "instance_id" {
  description = "ID созданного инстанса"
  value       = aws_instance.this.id
}

output "private_ip" {
  description = "Приватный IP инстанса"
  value       = aws_instance.this.private_ip
}
