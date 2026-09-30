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


variable "subnet_id" {
  description = "ID подсети для размещения инстанса"
  type        = string
  default     = null
}

variable "security_group_ids" {
  description = "Список ID security groups"
  type        = list(string)
  default     = []
}
