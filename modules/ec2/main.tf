resource "aws_instance" "this" {
  ami                    = "ami-00000000"
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name        = "${var.app_name}-server"
    Environment = var.environment
  }
}
