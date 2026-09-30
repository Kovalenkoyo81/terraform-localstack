variable "environment" {
  description = "Окружение"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR блок VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR блок подсети"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Зона доступности"
  type        = string
  default     = "us-east-1a"
}

variable "ssh_allowed_cidr" {
  description = "Откуда разрешён SSH"
  type        = string
  default     = "10.0.0.0/16"
}
