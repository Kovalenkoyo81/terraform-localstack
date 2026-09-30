module "app_server" {
  source        = "./modules/ec2"
  instance_type = "t3.micro"
  environment   = var.environment
  app_name      = "myapp"
}

module "worker" {
 source        = "./modules/ec2"
 instance_type = "t3.small"
 environment   = var.environment
 app_name      = "worker"
 subnet_id = module.network.subnet_id
 security_group_ids = [module.network.security_group_id]
}

module "cluster" {
  source        = "./modules/ec2"
  for_each         = toset(var.clusters_nodes)
  instance_type = "t3.micro"
  environment   = var.environment
  app_name      = each.value
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

output "worker_id" {
value = module.worker.instance_id
}

output "cluster_ids" {
  value = {for name, module_instance in  module.cluster : name=> module_instance.instance_id}
}


module "network" {
  source      = "./modules/network"
  environment = var.environment
}

output "vpc_id" {
  value = module.network.vpc_id
}

output "subnet_id" {
  value = module.network.subnet_id
}
