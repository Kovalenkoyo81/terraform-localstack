variable "instance_type" {
  description = "Тип инстанса"
  type        = string
  default     = "t3.micro"
}

variable "environment" {
  description = "Окружение"
  type        = string
}

variable "app_name" {
  description = "Название приложения"
  type        = string
}
