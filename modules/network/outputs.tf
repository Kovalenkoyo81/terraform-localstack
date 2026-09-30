output "vpc_id" {
  description = "ID созданного VPC"
  value       = aws_vpc.this.id
}

output "subnet_id" {
  description = "ID подсети"
  value       = aws_subnet.this.id
}

output "security_group_id" {
  description = "ID security group для приложений"
  value       = aws_security_group.this.id
}

output "vpc_cidr" {
  description = "CIDR блок VPC"
  value       = aws_vpc.this.cidr_block
}
