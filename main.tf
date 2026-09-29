module "app_server" {
  source        = "./modules/ec2"
  instance_type = "t3.micro"
  environment   = var.environment
  app_name      = "myapp"
}

module "app_db" {
  source      = "./modules/rds"
  db_name     = "myappdb"
  environment = var.environment
}

output "server_id" {
  value = module.app_server.instance_id
}

output "server_ip" {
  value = module.app_server.private_ip
}

output "db_endpoint" {
  value = module.app_db.db_endpoint
}
