
variable "environment" {
  description = "Окружение: dev, staging, prod"
  type        = string
  default     = "dev"
}


variable "clusters_nodes" {
  type    = list(string)
  default = ["node-0", "node-1", "node-2"]
}
